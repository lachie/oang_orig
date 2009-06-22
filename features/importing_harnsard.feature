Feature: importing the hansard
  As OpenAustralia
  I want to import the hansard
  So that we can see what's happening in parliament

Scenario: Importing a day of hansard
  Given a hansard file
  And lots of speakers

  When I import the hansard

  Then I should see a root
  And 54 major headings
  And 32 minor headings
  And 100 speeches
