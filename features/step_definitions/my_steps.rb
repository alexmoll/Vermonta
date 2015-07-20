require 'test/unit/assertions'
include Test::Unit::Assertions

When(/^I enter the username "([^"]*)" and press login$/) do |arg|
	$driver.find_element(:id, "UserName").send_keys(arg)
	$driver.find_element(:xpath, "//button[contains(.,'Log In')]").click
end

When(/^I enter the password "([^"]*)" and press login$/) do |arg|
	$driver.find_element(:id, "txtPassword").send_keys(arg)
	$driver.find_element(:xpath, "//button[contains(.,'Log In')]").click
end

When(/^I enter the invalid username "([^"]*)" and press login$/) do |arg|
	$driver.find_element(:id, "UserName").send_keys(arg)
	$driver.find_element(:xpath, "//button[contains(.,'Log In')]").click
end


Then(/^I am thrown the error "([^"]*)" on the "([^"]*)" page$/) do |arg1, arg2|
	assert_equal(arg2+" - Vermont Customer Access Portal", $driver.title)
	assert_include($driver.page_source,arg1)
end

When(/^I enter the invalid password "([^"]*)" and press login$/) do |arg|
	$driver.find_element(:id, "txtPassword").send_keys(arg)
	$driver.find_element(:xpath, "//button[contains(.,'Log In')]").click
end

Then(/^I am taken to the "([^"]*)" page$/) do |arg|
	assert_equal(arg+" - Vermont Customer Access Portal", $driver.title)
end

Given(/^I am on the "([^"]*)" page$/) do |arg|
	$driver.navigate.to "http://capvtdev.idhllc.com/"
	assert_equal(arg+" - Vermont Customer Access Portal", $driver.title)
end

When(/^I click new user button$/) do
	$driver.find_element(:xpath, "//a[contains(.,'New Customer')]").click
end


Then(/^I enter "([^"]*)" as email \+ email confirm and "([^"]*)" as user id$/) do |arg1, arg2|
	$driver.find_element(:xpath, "//input[@id='Email']").send_keys(arg1)
	$driver.find_element(:xpath, "//input[@id='ConfirmEmail']").send_keys(arg1)
	$driver.find_element(:xpath, "//input[@id='UserName']").send_keys(arg2)

end

Then(/^I check the ToS checkbox and submit$/) do
	$driver.find_element(:xpath, "//input[@id='AcceptedTerms']").click
	$driver.find_element(:xpath, "//button[@id='btnSubmitProfile']").click
end

Then(/^I am taken to the second step$/) do
	assert_include($driver.page_source, "Create Your Password")
end

And(/^I enter "([^"]*)" into password fields, select an imagekey, and submit$/) do |arg|
	$driver.find_element(:xpath, "//input[@id='Password']").send_keys(arg)
	$driver.find_element(:xpath, "//input[@id='ConfirmPassword']").send_keys(arg)
	$driver.find_element(:xpath, "//img[@id='3']").click
	$driver.find_element(:xpath, "//button[@id='btnSubmitPassword']").click
end


And(/^I enter "([^"]*)" into password fields, select an imagekey, name it "([^"]*)", and submit$/) do |arg1, arg2|
	$driver.find_element(:xpath, "//input[@id='Password']").send_keys(arg1)
	$driver.find_element(:xpath, "//input[@id='ConfirmPassword']").send_keys(arg1)
	$driver.find_element(:xpath, "//img[@id='3']").click
	$driver.find_element(:xpath, "//input[@id='ImageKey_Name']").send_keys(arg2)
	$driver.find_element(:xpath, "//button[@id='btnSubmitPassword']").click
end

Then(/^I am taken to the third step$/) do
	assert_include($driver.page_source,"Create Your Security Questions")
end


And(/^I select two random security questions with "([^"]*)" as the answers and submit$/) do |arg|
	security = [1,2,3,4,5,6,8,9,10]

	Selenium::WebDriver::Support::Select.new($driver.find_element(:xpath, "//select[@id='ddlQuestion1']")).select_by(:value, "3")
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, "ddlQuestion2")).select_by(:value, "5")
	$driver.find_element(:xpath, "//input[@id='txtAnswer1']").send_keys(arg)
	$driver.find_element(:xpath, "//input[@id='txtAnswer2']").send_keys(arg)
	$driver.find_element(:xpath, "//button[@id='btnSubmitQuestions']").click
end

Then(/^I am taken to the account owner page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        About You
    ')]"))
	end


And(/^I enter "([^"]*)" for the First Name and "([^"]*)" for the Last Name$/) do |firstname, lastname|
	Selenium::WebDriver::Support::Select.new($driver.find_element(:xpath, "//select[@id='Salutation']")).select_by(:value, "2")
	$driver.find_element(:id, 'FirstName').send_keys(firstname)
	$driver.find_element(:id, 'LastName').send_keys(lastname)
end

And(/^I enter "([^"]*)" for the SSN and "([^"]*)" for the DoB$/) do |ssn, dob|
	$driver.find_element(:id, 'SocialSecurityNumber').send_keys(ssn)
	$driver.find_element(:id, 'DOB').send_keys(dob)
	$driver.find_element(:id, 'DOB').clear
	$driver.find_element(:id, 'DOB').send_keys(dob)

end

And(/^I enter "([^"]*)" for the AO Address and "([^"]*)" for the AO City$/) do |aoaddy, aocity|
	$driver.find_element(:id, 'PermanentAddress1').send_keys(aoaddy)
	$driver.find_element(:id, 'PermanentCity').send_keys(aocity)
end

And(/^I enter "([^"]*)" for the ZIP and "([^"]*)" as the Primary Telephone$/) do |aozip, aophone|
	$driver.find_element(:id, 'PermanentZip').send_keys(aozip)
	$driver.find_element(:id, 'PrimaryPhone').send_keys(aophone)
	$driver.find_element(:id, 'PrimaryPhoneType_0').click

end

And(/^press the submit button$/) do
	$driver.find_element(:id, 'btnSubmitOwner').click
end

Then(/^I am taken to the delivery options page$/) do
		assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Delivery Options
    ')]"))
end

And(/^I select e\-delivery for statements$/) do
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'PromosDelivery')).select_by(:value, "2")
end

And(/^I select U\.S\. Mail for Tax Forms$/) do
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'OfficialDocsDelivery')).select_by(:value, "1")
end

And(/^press the delivery submit button$/) do
	$driver.find_element(:id, 'btnSubmitDM').click
end

Then(/^I am taken to the beneficiary page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Beneficiary
    ')]"))
end


And(/^I enter "([^"]*)" for the mailing address and "([^"]*)" for the zip code$/) do |mailing, mailzip|
	$driver.find_element(:id, 'MailingAddress1').send_keys(mailing)
	$driver.find_element(:id, 'MailingZip').send_keys(mailzip)
end

And(/^I press the bene submit button$/) do
	$driver.find_element(:id, 'btnSubmitBene').click
end

Then(/^I am taken to the Plan Designation Page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Plan Designation
    ')]"))
end

And(/^I select an Individual Savings Plan$/) do
	$driver.find_element(:id, 'PlanDesignationSelectedAnswer_0').click
end

And(/^click the plan designation page next button$/) do
	$driver.find_element(:id, 'btnNext').click
end

Then(/^I am taken to the Contingent Account Owner page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
            Contingent Account Owner
        ')]"))
end

Then(/^I am taken to the Investment Options Page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Investment Options
    ')]"))
end

And(/^I enter "([^"]*)"% "([^"]*)"% "([^"]*)"% "([^"]*)"% "([^"]*)"% "([^"]*)"% as investment options$/) do |first, second, third, fourth, fifth, sixth|
	$driver.find_element(:id, 'A1').send_keys(first)
	$driver.find_element(:id, 'B1').send_keys(second)
	$driver.find_element(:id, 'C1').send_keys(third)
	$driver.find_element(:id, 'D1').send_keys(fourth)
	$driver.find_element(:id, 'E1').send_keys(fifth)
	$driver.find_element(:id, 'F1').send_keys(sixth)
	assert_equal($driver.find_element(:xpath, "//input[@id='TotalAllocations']").text, "")
end

And(/^I click the investment options Next button$/) do
	$driver.find_element(:id, 'btnInvestment').click
end

Then(/^I am taken to the Contribution Options page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Contributions Options
    ')]"))
end

And(/^I select checkbox for Initial Contribution$/) do
	$driver.find_element(:id, 'InitialContribution').click
end

And(/^I select checkbox for Automatic Recurring Contribution$/) do
	$driver.find_element(:id, 'AutomaticRecurringContribution').click
end

And(/^I click the Next button on the contribution options page$/) do
	$driver.find_element(:id, 'btnContributions').click
end

Then(/^I am taken to the Initial Contribution Page$/) do
	assert_include($driver.page_source, "Initial Contribution")
end

And(/^I enter "([^"]*)" for ACH Name$/) do |achname|
	$driver.find_element(:id, 'FinancialInstituition').send_keys(achname)
end

And(/^I enter "([^"]*)" for routing number and "([^"]*)" for account number$/) do |routing, achnumber2|
	$driver.find_element(:id, 'RoutingNumber').send_keys(routing)
	$driver.find_element(:id, 'AccountNumber').send_keys(achnumber)
	$driver.find_element(:id, 'ConfirmAccountNumber').send_keys(achnumber)
end

And(/^"([^"]*)" for Name on Account$/) do |achusername|
	$driver.find_element(:id, 'NameOnAccount').send_keys(achusername)
end

And(/^I check the ToS checkbox and click next$/) do
	$driver.find_element(:id, 'cboAgree').click
	$driver.find_element(:id, 'btnContributions').click
end

Then(/^I am taken to the automatic recurring contribution page$/) do
	pending
end

And(/^select "([^"]*)" from the Account Type Dropdown$/) do |acnttype|
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'OfficialDocsDelivery')).select_by(:value, acnttype )
end

And(/^I enter "([^"]*)" for the Initial Contribution Amount$/) do |initialamount|
	$driver.find_element(:id, 'Amount').send_keys(initialamount)
end

And(/^I select checkbox for Mail\-in$/) do
	$driver.find_element(:id, 'MailInContribution').click
end

Then(/^I am taken to the Optional Information Page$/) do
	assert_equal($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Optional Information
    ')]"))
end

And(/^I select I am a Customer for How Did You Hear\?$/) do
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'OptionalLists_0__SelectedValue')).select_by(:value, "1" )
end

And(/^I select Your Child from relationship$/) do
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'OptionalLists_2__SelectedValue')).select_by(:value, "1" )
end

And(/^Black for race$/) do
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'OptionalLists_3__SelectedValue')).select_by(:value, "2" )
end

And(/^click the submit button on Optional Information Page$/) do
	$driver.find_element(:xpath, "//button[@type='submit']").click
end

And(/^I select 20k for annual income$/) do
	Selenium::WebDriver::Support::Select.new($driver.find_element(:id, 'OptionalLists_1__SelectedValue')).select_by(:value, "2" )
end

Then(/^I am taken to the Complete Application Page$/) do
	assert_include($driver.find_element(:xpath, "//li[@class=' active']"),$driver.find_element(:xpath, "//li[contains(.,'
        Complete Application
    ')]"))
end


And(/^I click Review and Submit$/) do
	$driver.find_element(:xpath, "//a[@class='btn  btn-danger']").click
end