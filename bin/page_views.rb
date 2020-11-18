require "rubygems"
require "bundler/setup"

require_relative "../lib/page_views"

log_file = ARGV[0] || 'data/webserver.log'

page_views = PageViews.new(log_file)

#TODO create classes for printing and styling
puts 'pages in descending order by number of views:'
puts '--------------------------------------------------------'
page_views.pages_ordered_by_views.each do |p|
  puts "#{p.path} #{p.views} visits"
end

puts ''
puts 'pages in descending order by number of unique views:'
puts '--------------------------------------------------------'
page_views.pages_ordered_by_unique_views.each do |p|
  puts "#{p.path} #{p.unique_views} unique views"
end
