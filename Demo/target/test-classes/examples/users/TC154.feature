Feature: ECOM_TC154 - Transport Instruction for Curbside Pickup is Ignored.

  Background: 
    * url loginUrl
    
    * header Accept = 'application/json'

  Scenario: Injection of Transport Instruction.
    # Access login_LIAM.feature file inside this Scenario.
    * def cookieData = call read('Liam_Login.feature')
    * def access_token = cookieData.response.access_token
    Given url 'https://api-tst.jdadelivers.com/'
    Given path 'dp/ingestion/v1/transportInstructions'
    And def request_body = karate.read("file:src\test\java\examples.users\transportInstructionsPayload.json")
    And request request_body
    And header Authorization = 'Bearer '+ access_token
    When method post
    Then status 202
    And print response
    * def ingestionId = response.ingestionId
    Given path 'dp/ingestion/v1/status/' + ingestionId
    And header Authorization = 'Bearer '+ access_token
    When method get
    Then status 200
    And print response
    And match response == '#object'
    Then match response.objectType =='transportinstructions'
    Then match response.events[0].status =='ACCEPTING'
    Then match response.events[0].description =='Upload request has been accepted.'
