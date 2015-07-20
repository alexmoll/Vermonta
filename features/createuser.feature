Feature: Create User

  Scenario: User ID already in use
    Given I am on the "Log In" page
    When I click new user button
    Then I am taken to the "Create Your Account" page
    When I enter "appisi48@testfpp.com" as email + email confirm and "appisi48" as user id
    And I check the ToS checkbox and submit
    Then I am thrown the error "The User ID supplied is already in use." on the "Create Your Account" page

  Scenario: Create User
    Given I am on the "Log In" page
    When I click new user button
    Then I am taken to the "Create Your Account" page
    And I enter "appisi66@testfpp.com" as email + email confirm and "appisi66" as user id
    And I check the ToS checkbox and submit
    #Then I am taken to the second step
    And I enter "Password1" into password fields, select an imagekey, name it "ImageKeyTest", and submit
    Then I am taken to the third step
    And I select two random security questions with "AnswerTest" as the answers and submit
    Then I am taken to the account owner page





   Scenario: Fill Out Application - AO Information
    Given I am taken to the account owner page
    And I enter "Alexander" for the First Name and "Moll" for the Last Name
    And I enter "234553434" for the SSN and "1/14/1991" for the DoB
    And I enter "413 Inagua Drive" for the AO Address and "Saint Augustine" for the AO City
    And I enter "32085" for the ZIP and "904-540-2569" as the Primary Telephone
    And press the submit button
    Then I am taken to the delivery options page

  Scenario: Fill Out Application - Delivery Methods
    Given I am taken to the delivery options page
    And I select e-delivery for statements
    And I select U.S. Mail for Tax Forms
    And press the delivery submit button
    Then I am taken to the beneficiary page

  Scenario: Fill out Application - Bene Information
    Given I am taken to the beneficiary page
    And I enter "Alexander" for the First Name and "Moll" for the Last Name
    And I enter "234353434" for the SSN and "1/14/2015" for the DoB
    And I enter "413 Inagua Drive" for the mailing address and "32095" for the zip code
    And I press the bene submit button
    Then I am taken to the Plan Designation Page

  Scenario: Fill Out Application - Plan Designation
    Given I am taken to the Plan Designation Page
    And I select an Individual Savings Plan
    And click the plan designation page next button
    Then I am taken to the Contingent Account Owner page

   Scenario: Fill Out Application - Contingent Account Owner
     Given I am taken to the Contingent Account Owner page
     And I enter "Alexandra" for the First Name and "Moll" for the Last Name
     And I enter "234353431" for the SSN and "1/14/2015" for the DoB
     And I enter "413 Inagua Drive" for the mailing address and "32095" for the zip code
     And I press the bene submit button
     Then I am taken to the Investment Options Page

   Scenario: Fill out Application - Your Investment Choices
     Given I am taken to the Investment Options Page
     And I enter "20"% "20"% "20"% "20"% "10"% "10"% as investment options
     And I click the investment options Next button
     Then I am taken to the Contribution Options page

   Scenario: Fill Out Application - Contribution Options
     Given I am taken to the Contribution Options page
     And I select checkbox for Mail-in
     And I click the Next button on the contribution options page
     Then I am taken to the Optional Information Page
   ###Scenario:
    ### Given I am taken to the Initial Contribution Page
    # And I enter "150" for the Initial Contribution Amount
    # And I enter "Suntrust" for ACH Name
     #And I enter "021000021" for routing number and "12341234" for account number
    # And "Alex Moll" for Name on Account
    # And select "Checking" from the Account Type Dropdown
     #And I check the ToS checkbox and click next
     #Then I am taken to the automatic recurring contribution page

   Scenario: Fill Out Application - Optional Information
     Given I am taken to the Optional Information Page
     And I select I am a Customer for How Did You Hear?
     And I select 20k for annual income
     And I select Your Child from relationship
     And Black for race
     And click the submit button on Optional Information Page
     Then I am taken to the Complete Application Page

   Scenario: Fill Out Application - Complete Application
     Given I am taken to the Complete Application Page
     And I click Review and Submit


