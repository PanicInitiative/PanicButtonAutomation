Feature: Settings page

  Scenario: Verify header and menu items
    Then I see the text "Settings"
    Then I see the text "SMS"
    Then I see the text "Twitter"

  Scenario: Verify that SMSSettingsActivity is opened on SMS click
    Given I press "SMS"
    Then I wait upto 10 seconds for the "SMSSettingsActivity" screen to appear
