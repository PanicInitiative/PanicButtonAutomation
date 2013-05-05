@welcome
Feature: Welcome page

  Scenario: Verify welcome screen displays wizard entry point text
    Then I see the text "Panic\nButton"

  Scenario: Verify wizard start screen is displayed on clicking wizard entry point
    Given I press view with id "panic_button_text"
    Then I wait upto 10 seconds for the "WizardActivity" screen to appear
    Then I see the text "Panic Button"
    Then I see the text "setup wizard"
    Then I verify action button text is "Start"
    Then I verify action button is "enabled"
