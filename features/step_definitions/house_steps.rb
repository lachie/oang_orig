Given /^there's member xmls for "([^\"]*)"$/ do |member|
  @app.house.xmls_for!(member)
end

When /^I import members$/ do
  @app.house.import_xmls!
end

