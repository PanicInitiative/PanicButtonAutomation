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
    And I enter "12345" into input field number 1
    Then I verify action button is "enabled"

  Scenario: Starting wizard and entering invalid phone number does not enable saving
    Given I press "Start"
    And I enter "1234" into input field number 1
    Then I verify action button is "disabled"

  Scenario: Starting wizard and entering one valid phone number enables saving
    Given I press "Start"
    And I enter "123" into input field number 1
    And I enter "1234" into input field number 2
    And I enter "12345" into input field number 3
    Then I verify action button is "enabled"

  Scenario: Save SMS settings
    Given I press "Start"
    And I enter "123456789" into input field number 1
    And I enter "222-222-2222" into input field number 2
    And I enter "100" into input field number 3
    And I enter text "testing message" into field with id "message_edit_text"
    And I press "Save"
    Then I verify action button text is "Next"
    Then I verify action button is "enabled"
    Then I see the text "3 ways to send an emergency alert"
    Then I see the text "The Emergency Alert button in Settings..."

  Scenario: Emergency alert 2
    Given I press "Start"
    And I press "Save"
    And I press "Next"
    Then I verify action button text is "Next"
    Then I verify action button is "enabled"
    Then I see the text "3 ways to send an emergency alert"
    Then I see the text "From any button on the app’s disguise..."

  Scenario: Emergency alert 3
    Given I press "Start"
    And I press "Save"
    And I press "Next"
    And I press "Next"
    Then I verify action button text is "Next"
    Then I verify action button is "enabled"
    Then I see the text "3 ways to send an emergency alert"
    Then I see the text "Using the phone’s Power button..."

  Scenario: Finish wizard
    Given I press "Start"
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    Then I see the text "Panic Button will now disguise itself"
    Then I see the text "Finish & activate disguise"

  Scenario: Open facade
    Given I press "Start"
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    And I press "Finish & activate disguise"
    Then I wait upto 10 seconds for the "CalculatorActivity" screen to appear