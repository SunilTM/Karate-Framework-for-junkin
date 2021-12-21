Feature: Testing reqres get Scenario

Background:
	* url urlBase
	* header Accept = 'application/json'
	
	Scenario: Validate get response
	Given url urlBase
	When method GET
	Then status 200
	Then print response
	Then print response.data[2].last_name 
	# to get data from particular id 
	Then set response.data[2].last_name = "Patil"
	Then print response.data[2].last_name