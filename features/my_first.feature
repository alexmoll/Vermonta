Feature: Login Functionality

  Background:
    Given I am on the "Log In" page

  @posMidEnrollment
  Scenario: I can log in
    When I enter the username "amoll" and press login
    Then I am taken to the "Enter Your Password" page
    When I enter the password "Password1" and press login
    Then I am taken to the "Enrollment" page

  @negInvalUsername
  Scenario: I can't login with an invalid username
    When I enter the invalid username "CCC" and press login
    Then I am thrown the error "The User ID provided is invalid." on the "Log In" page

  @negInvalPass
  Scenario: I can't login with an invalid password
    When I enter the username "amoll" and press login
    Then I am taken to the "Enter Your Password" page
    When I enter the invalid password "xx" and press login
    Then I am thrown the error "You have entered an invalid Password. Multiple invalid attempts may disable your online account access." on the "Enter Your Password" page

