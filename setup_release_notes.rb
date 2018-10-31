require 'github_api'

change_log_path = ENV['CHANGELOG_PATH'] || 'CHANGELOG.md'

last_change_log_entry = File.read(change_log_path)
                            .split(/\d\.\d\.\d/)[1]
                            .split("\n")[1..-2]
                            .join("\n")

github = Github.new
last_release = github.repos.releases.list('sendgrid', 'ruby-http-client').body[0]

github.repos.releases.update('sendgrid', 'ruby-http-client', last_release['id'], body: last_change_log_entry)
