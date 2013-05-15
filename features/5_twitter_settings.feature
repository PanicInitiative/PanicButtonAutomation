@twitter_settings
Feature: Twitter Settings page

  @navigate_to_twitter_settings
  Scenario: Open the Twitter Settings page
    Given I wait upto 10 seconds for the "WizardActivity" screen to appear
    And I press "Start"
    And I enter "abcdEF1 " into input field number 1
    And I press "Save"
    And I enter "123456789" into contact field 0
    And I press "Save"
    And I press "Next"
    And I press "Next"
    And I press "Next"
    And I press "Finish & activate disguise"
    And I long press "="
    And I press "Twitter settings"
    Then I wait upto 10 seconds for the "TwitterSettingsActivity" screen to appear

  @save_twitter_settings
  Scenario: Save Twitter settings
    Given I long press "="
    And I press "Twitter settings"
    And I press "Post alert to Twitter via SMS"
    And I select "Yemen" from "CountrySpinner"
    And I wait for 5 seconds
    And I select "MTN" from "ServiceProviderSpinner"
    And I press "Save"
    And I go back
    And I press "Twitter settings"
    Then I see the text "Yemen"
    Then I see the text "MTN"