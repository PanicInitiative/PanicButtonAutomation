Feature: SMS Settings page

  Background: Open the SMS Settings page
    Given I press "SMS"
    Then I wait for the "SMSSettingsActivity" screen to appear

  Scenario: Save SMS settings
    Given I enter "123456789" into input field number 1
    And I enter "222-222-2222" into input field number 2
    And I enter "100" into input field number 3
    When I press "Save"
    Then I see the text "*******89"
    Then I see the text "**********22"
    Then I see the text "*00"


