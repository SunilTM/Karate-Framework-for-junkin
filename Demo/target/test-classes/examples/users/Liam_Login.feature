Feature: Login_LIAM

  Background: 
    * url urlBase
    * header Accept = 'application/json'

  Scenario: Injection of Transport Instruction
    Given path '/oauth2/v2.0/token'
    And form field scope = 'https://blueyonderinteroptestus.onmicrosoft.com/6ad21424-b4b2-462e-80df-252ec22dd6a9/.default'
    And form field client_id = 'c667ae36-807f-4fe3-b88e-a90b117b5407'
    And form field client_secret = '15l35FUFUy.n34GhW.27e-m35xFKB9YN.l'
    And form field grant_type = 'client_credentials'
    When method post
    Then status 200
    * def loginResponse = response
    And print response