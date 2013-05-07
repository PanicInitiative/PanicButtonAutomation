@settings
Feature: Facade and Settings page

  Background: Open settings from facade
    Given I press view with id "panic_button_text"
    And I press "Start"
    And I enter "123456789" into input field number 1
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    And I press "Finish & activate disguise"
    And I long press "="
    Then I wait upto 10 seconds for the "SettingsActivity" screen to appear
    Then I see the text "Send emergency alert"
    Then I see the text "Alert is in standby"
    Then I see the text "SMS settings"
    Then I see the text "Twitter settings"

  Scenario: Verify that SMSSettingsActivity is opened on SMS click
    Given I press "SMS settings"
    Then I wait upto 10 seconds for the "SMSSettingsActivity" screen to appear


