@wizard
Feature: One time setup wizard

  Background: Start the wizard
    Given I wait upto 30 seconds for the "WizardActivity" screen to appear

  @passwordscreen
  Scenario: Starting wizard shows password entry screen
    Given I press "Take me to the training"
    Then I see the text "Panic Button Training"
    Then I press "Next"
    Then I see the text "Step 1"
    Then I verify action button is "disabled"

  @validpassword
  Scenario: Validating pin password
    Given I press "Take me to the training"
    Then I see the text "Panic Button Training"
    Then I press "Next"

    Then I see the text "Step 1"
    Then I enter text "123 " into field with id "create_pin_edittext"
    Then I verify action button is "disabled"
    Then I clear input field number 1
    Then I enter text "1234" into field with id "create_pin_edittext"
    Then I verify action button is "enabled"
    Then I press "Next"
    Then I see the text "Step 2"

  Scenario: SMS Settings
    Given I press "Take me to the training"
    Then I see the text "Panic Button Training"
    Then I press "Next"

    Then I see the text "Step 1"
    Then I enter text "1234" into field with id "create_pin_edittext"
    Then I press "Next"

    Then I see the text "Step 2"
    Then I press "I understand, set-up my trusted contacts now"

    Then I see the text "Step 2: Set-up your trusted contacts"
    Then I verify action button text is "Next"
    Then I verify action button is "disabled"
    Then I see the text "Think first! Your trusted contacts should be people that you know personally and should be prepared and able to respond fast."

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