Feature: SMS Settings page

  Background: Open the SMS Settings page
    Given I press "SMS"
    Then I wait upto 10 seconds for the "SMSSettingsActivity" screen to appear

  Scenario: Save SMS settings
    Given I enter "123456789" into input field number 1
    And I enter "222-222-2222" into input field number 2
    And I enter "100" into input field number 3
    And I enter text "testing message" into field with id "message_edit_text"
    When I press "Save"
    Then I see the text "*******89"
    Then I see the text "**********22"
    Then I see the text "*00"
    Then I see the text "testing message"

  Scenario: View Saved Settings
    Then I see the text "*******89"
    Then I see the text "**********22"
    Then I see the text "*00"
    Then I see the text "testing message"
    Then I see the text "Characters left :85"

  Scenario: Display characters left for message
    Given I see the text "Characters left :85"
    When I enter text "some testing message" into field with id "message_edit_text"
    Then I see the text "Characters left :65"

