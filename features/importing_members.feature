Feature: Importing members of parliament
  As OpenAustralia
  I want to import member or parliament profiles
  So that we can see what the members are up to

Scenario: Importing a member
  Given there's member xmls for "abbott"

  When I import members

  Then there's "1" member
  And the member is "Tony Abbott"
  And they have id "5"
  And they're in the house "House of Representatives"
  And they're in the "Liberal" party
  And they're in the electorate of "warringah"
  And they've had following positions:
  | name | from | to | current |
  | Parliamentary Secretary to the Minister for Employment, Education, Training and Youth Affairs | 1996-03-11 | 1998-10-21 | false |
  | Leader of the House | 2002-03-19 | 2007-12-03 | false |
  | Minister for Employment and Workplace Relations | 2001-11-26 | 2003-10-07 | false |
  | Minister for Employment Services | 1998-10-21 | 2001-01-30 | false |
  | Minister for Employment, Workplace Relations and Small Business | 2001-01-30 | 2001-11-26 | false |
  | Minister for Health and Ageing | 2003-10-07 | 2007-12-03 | false |
  | Shadow Minister for Families, Community Services, Indigenous Affairs and the Voluntary Sector | 2007-12-06 | 2008-09-22 | false |
  | Shadow Minister for Families, Housing, Community Services and Indigenous Affairs | 2008-09-22 | | true |

