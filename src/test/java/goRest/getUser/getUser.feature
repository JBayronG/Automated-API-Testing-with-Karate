Feature: testing to users functionality from gorest
  
  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken

  Scenario: Get a user by ID
    * def id = 7813921
    Given path 'users/', id
    When method GET
    Then status 200
    * print response
