@wizard
Feature: One time setup wizard

  Background: Start the wizard
    Given I press view with id "panic_button_text"
    Then I wait upto 15 seconds for the "WizardActivity" screen to appear

  Scenario: Starting wizard shows SMS Settings
    Given I press "Start"
    Then I verify action button text is "Save"
    Then I verify action button is "disabled"
    Then I see the text "Next, setup the SMS alert"
    Then I see the text "Add upto three emergency contacts"
    Then I see the text "Help me, I'm in danger"
    Then I see the text "Emergency message"
    Then I see the text "Characters left :63"
    Then I see the text "+ I'm at"
    Then I see the text "http://maps.google.com/yourlocation"

  Scenario: Starting wizard and entering valid phone number enables saving
    Given I press "Start"
    Given I enter "12345" into input field number 1
    Then I verify action button is "enabled"

  Scenario: Starting wizard and entering invalid phone number does not enable saving
    Given I press "Start"
    Given I enter "1234" into input field number 1
    Then I verify action button is "disabled"

  Scenario: Starting wizard and entering one valid phone number enables saving
    Given I press "Start"
    Given I enter "12345" into input field number 1
    Given I enter "1234" into input field number 2
    Given I enter "123" into input field number 3
    Then I verify action button is "enabled"


