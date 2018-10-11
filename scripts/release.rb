#!/usr/bin/env ruby

require 'git'
require 'net/http'
require 'json'
require 'date'

def extract_pull_request_number(commit)
  commit.message.match('Merge pull request #(\d+) from.*').captures.first
end

def fetch_pull_request_data(pull_request_number)
  pull_request = fetch_github_data("https://api.github.com/repos/sendgrid/ruby-http-client/pulls/#{pull_request_number}")
  user_data = fetch_github_data(pull_request['user']['url'])

  { number: pull_request['number'],
    title: pull_request['title'],
    user_url: user_data['url'],
    user_login: user_data['login'],
    user_name: user_data['name'] }
end

def fetch_github_data(pull_request_url)
  uri = URI(pull_request_url)
  pull_request_response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    req = Net::HTTP::Get.new(uri)
    req['Accept'] = 'application/vnd.github.v3+json'

    http.request(req)
  end
  raise("Response error #{pull_request_response.msg}") unless pull_request_response.is_a?(Net::HTTPSuccess)

  JSON.parse(pull_request_response.body)
end

def update_changelog(file_path, prs, version_number)
  prs_entries = prs.map(&method(:changelog_entry))
  version_header = "## [#{version_number}] - #{Date.today} \n### Added\n"

  replace(file_path, /^##/) { |match| "#{version_header + prs_entries.join("\n")}\n\n#{match}" }
end

def changelog_entry(pr_data)
  "- ##{pr_data[:number]} #{pr_data[:title]}\n" \
  "- Thanks to [#{pr_data[:user_name] || pr_data[:user_login]}](#{pr_data[:user_url]}) for the pull request!"
end

def replace(file_path, regexp, *args, &block)
  content = File.read(file_path).sub(regexp, *args, &block)
  File.open(file_path, 'wb') { |file| file.write(content) }
end

version_number = ARGV[0] || raise('No version number was passed')
root_folder = File.expand_path('..', __dir__)
g = Git.open(root_folder)
file_path = 'CHANGELOG.md'

last_tag = g.describe(nil, tags: true, abbrev: 0)

merged_pull_requests = g.log.between(last_tag, 'master').grep('Merge pull request')

prs = merged_pull_requests
      .map(&method(:extract_pull_request_number))
      .map(&method(:fetch_pull_request_data))

update_changelog(file_path, prs, version_number)

puts "Changelog updated, the new version is #{version_number}"
