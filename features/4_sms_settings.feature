@sms_settings
Feature: SMS Settings page

  @clear_sms
  Scenario: Open the SMS Settings page
    Given I press view with id "panic_button_text"
    And I press "Start"
    And I enter "123456789" into input field number 1
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    And I press "Finish & activate disguise"
    And I long press "="
    And I press "SMS"
    Then I wait upto 10 seconds for the "SMSSettingsActivity" screen to appear

  Scenario: Save SMS settings
    Given I long press "="
    And I press "SMS"
    And I clear input field number 1
    And I enter "123456789" into input field number 1
    And I enter "222-222-2222" into input field number 2
    And I enter "100" into input field number 3
    And I enter text " testing message" into field with id "message_edit_text"
    When I press "Save"
    Then I see the text "*******89"
    Then I see the text "**********22"
    Then I see the text "*00"
    Then I see the text "Help me, I'm in danger testing message"

  Scenario: View Saved Settings
    Given I long press "="
    And I press "SMS"
    Then I see the text "*******89"
    Then I see the text "**********22"
    Then I see the text "*00"
    Then I see the text "Help me, I'm in danger testing message"
    Then I see the text "Characters left:"
    Then I see the text "47"

  Scenario: Display characters left for message
    Given I long press "="
    And I press "SMS"
    And I see the text "Characters left:"
    And I see the text "47"
    When I enter text " some testing message" into field with id "message_edit_text"
    Then I see the text "Characters left:"
    Then I see the text "26"

  Scenario: Clear SMS to disable Alert activation
    Given I long press "="
    And I press "SMS"
    And I clear input field number 1
    And I clear input field number 2
    And I clear input field number 3
    And I clear input field number 4
    And I press "Save"
    When I press view with id "sms_previous_button"
    Then I verify "activate_alert" button is "disabled"
    Then I see the text "Alert cannot be sent. please choose contacts"