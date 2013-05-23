@wizard
Feature: One time setup wizard

  Background: Start the wizard
    Given I wait upto 10 seconds for the "WizardActivity" screen to appear

  @passwordscreen
  Scenario: Starting wizard shows password entry screen
    Given I press "Start"
    Then I see the text "First, set a password"
    Then I see the text "create a password"
    Then I verify action button is "disabled"

  @validpassword
  Scenario: Validating password
    Given I press "Start"
    Then I enter text "Abcd12 " into field with id "create_password_edittext"
    Then I verify action button is "disabled"
    Then I clear input field number 1
    Then I enter text "abcdefgh" into field with id "create_password_edittext"
    Then I verify action button is "enabled"
    Then I press "Save"
    Then I see the text "Password must contain at least one lowercase, one uppercase, one number, and one space"
    Then I enter text "abcd EF1" into field with id "create_password_edittext"
    Then I press "Save"
    Then I see the text "Next, setup the SMS alert"

  Scenario: SMS Settings
    Given I press "Start"
    Then I enter text "abcd EF1" into field with id "create_password_edittext"
    Then I press "Save"
    Then I verify action button text is "Save"
    Then I verify action button is "disabled"
    Then I see the text "Next, setup the SMS alert"
    Then I see the text "Add up to three emergency contacts"
    Then I see the text "Help me, I'm in danger"
    Then I see the text "Emergency message"
    Then I see the text "Characters:"
    Then I see the text "63"
    Then I see the text "I'm at"
    Then I see the text "http://maps.google.com/GPS-location"

  @hardware_back
  Scenario: Hardware back in wizard takes back to previous screen
    Given I press "Start"
    And I go back
    Then I see the text "Panic Button"
    Then I see the text "setup wizard"
    Then I verify action button text is "Start"
    Then I verify action button is "enabled"

  Scenario: Navigating back to start screen
    Given I press "Start"
    And I press view with id "previous_button"
    Then I verify action button text is "Start"
    Then I verify action button is "enabled"

  Scenario: Starting wizard and entering valid phone number enables saving
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I enter "123456" into contact field 0
    Then I verify action button is "enabled"

  Scenario: Starting wizard and entering invalid phone number does not enable saving
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I enter "1234" into contact field 0
    Then I verify action button is "disabled"

  Scenario: Starting wizard and entering one valid phone number enables saving
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I enter "123" into contact field 0
    And I enter "1234" into contact field 1
    And I enter "12345" into contact field 2
    Then I verify action button is "enabled"

  Scenario: Save SMS settings
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I enter "123456789" into contact field 0
    And I enter "222-222-2222" into contact field 1
    And I enter "100" into contact field 2
    And I press "Save"
    Then I verify action button text is "Next"
    Then I verify action button is "enabled"
    Then I see the text "3 ways to send an emergency alert"
    Then I see the text "The Emergency Alert button in Settings"

  Scenario: Verifying the saved sms settings
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I enter "123456789" into contact field 0
    And I enter "222-222-2222" into contact field 1
    And I enter "100" into contact field 2
    And I enter text " testing message" into field with id "message_edit_text"
    And I press "Save"
    And I press view with id "previous_button"
    Then I verify action button text is "Save"
    Then I verify action button is "enabled"
    Then I see the text "*******89"
    Then I see the text "**********22"
    Then I see the text "*00"
    Then I see the text "Help me, I'm in danger testing message"

  Scenario: Emergency alert 2
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I press "Save"
    And I press "Next"
    Then I verify action button text is "Next"
    Then I verify action button is "enabled"
    Then I see the text "3 ways to send an emergency alert"
    Then I see the text "From any button on the app’s disguise"

  Scenario: Emergency alert 3
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I press "Save"
    And I press "Next"
    And I press "Next"
    Then I verify action button text is "Next"
    Then I verify action button is "enabled"
    Then I see the text "3 ways to send an emergency alert"
    Then I see the text "Using the phone’s Power button"

  Scenario: Finish wizard
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    Then I see the text "Panic Button will now disguise itself"
    Then I see the text "Finish & activate disguise"

  Scenario: Open facade
    Given I press "Start"
    And I enter text "abcd EF1" into field with id "create_password_edittext"
    And I press "Save"
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    And I press "Finish & activate disguise"
    Then I wait upto 10 seconds for the "CalculatorActivity" screen to appear