#!/usr/bin/env ruby

require 'rubygems'

require 'bundler'
require 'bundler/setup'

require 'byebug'
require 'git'

root_folder = File.expand_path('..', __dir__)
g = Git.open(root_folder)

last_tag = g.describe(nil, {tags: true, abbrev: 0})

merged_pull_requests = g.log.between(last_tag, 'master').grep("Merge pull request")

byebug
puts 'Exit'
