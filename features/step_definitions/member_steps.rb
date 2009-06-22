Then /^they have id "([^\"]*)"$/ do |id|
  Then "we just focus on the first member"
  @app.member.id?(id.to_i)
end

Then /^there's "([^\"]*)" members?$/ do |count|
  @app.member.count?(count.to_i)
  Then "we just focus on the first member"
  @app.member.exists?
end

Then /^we just focus on the first member$/ do
  @app.member.first!
end

Then /^the member is "([^\"]*)"$/ do |name|
  @app.member.full_name?(name)
end

Then /^they're in the house "([^\"]*)"$/ do |house|
  @app.member.house?(house)
end

Then /^they're in the "([^\"]*)" party$/ do |party|
  @app.member.party?(party)
end

Then /^they're in the electorate of "([^\"]*)"$/ do |electorate|
  @app.member.electorate?(electorate)
end

Then /^they have the current portfolio "([^\"]*)" since "([^\"]*)"$/ do |portfolio, since|
  #@app.member.current_portfolio?(portfolio)
  # @app.member.current_portfolio_since?(since)
end

Then /^they've had following positions:$/ do |table|
  @app.member.positions?(table)
end

