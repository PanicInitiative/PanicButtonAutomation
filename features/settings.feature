Feature: Settings page

  Scenario: Verify header and menu items
    Then I see the text "Settings"
    Then I see the text "SMS"
    Then I see the text "Twitter"

  Scenario: Verify that SMSSettingsActivity is opened on SMS click
    Given I press view with id "sms_row"
    Then I wait for the "SMSSettingsActivity" screen to appear