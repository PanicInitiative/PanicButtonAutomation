@welcome
Feature: Welcome page

  Scenario: Verify wizard start screen is displayed on clicking wizard entry point
    Given I wait upto 10 seconds for the "WizardActivity" screen to appear
    Then I see the text "Panic Button"
    Then I see the text "setup wizard"
    Then I verify action button text is "Start"
    Then I verify action button is "enabled"
