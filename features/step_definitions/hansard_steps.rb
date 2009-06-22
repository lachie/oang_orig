Given /^a hansard file$/ do
  @app.hansard.xml!
end

Given /^lots of speakers$/ do
end

When /^I import the hansard$/ do
  @app.hansard.import_xml!
end

Then /^I should see a root$/ do
  @app.hansard.fetch!.root?
end

Then /^(\d+) major headings$/ do |count|
  @app.hansard.major_heading_count?(count.to_i)
end

Then /^(\d+) minor headings$/ do |count|
  pending
end

Then /^(\d+) speeches$/ do |count|
  pending
end

