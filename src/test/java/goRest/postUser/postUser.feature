Feature: Create a new user in GoRest

  Background:
    * url baseUrl + 'users'
    * header Authorization = 'Bearer ' + authToken
    * header Content-Type = 'application/json'

  Scenario: Create a valid user
   * def userData = read('classpath:data/data.json')
    Given request userData
    When method POST
    Then status 201
    And match response.email == userData.email
    * print response