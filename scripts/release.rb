#!/usr/bin/env ruby

require 'rubygems'

require 'bundler'
require 'bundler/setup'

require 'byebug'
require 'git'
require 'net/http'
require 'json'

def fetch_github_data(pull_request_url)
  uri = URI(pull_request_url)
  pull_request_response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    req = Net::HTTP::Get.new(uri)
    req['Accept'] = 'application/vnd.github.v3+json'

    http.request(req)
  end
  JSON.parse(pull_request_response.body)
end

root_folder = File.expand_path('..', __dir__)
g = Git.open(root_folder)

last_tag = g.describe(nil, tags: true, abbrev: 0)

merged_pull_requests = g.log.between(last_tag, 'master').grep('Merge pull request')

prs = merged_pull_requests.take(2).map do |commit|
  pull_request_id = commit.message.match('Merge pull request #(\d+) from.*').captures.first
  pull_request = fetch_github_data("https://api.github.com/repos/sendgrid/ruby-http-client/pulls/#{pull_request_id}")
  user_data = fetch_github_data(pull_request['user']['url'])

  { pr_number:  pull_request['number'],
    pr_title:   pull_request['title'],
    user_login: user_data['login'],
    user_url:   user_data['url'],
    user_name:  user_data['name'] }
end

byebug
puts 'Exit'
