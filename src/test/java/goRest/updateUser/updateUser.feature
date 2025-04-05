Feature: Update a user in GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken
    * def userData = read('classpath:data/data.json')
    * userData.email = 'juan321@gmail.com'

  Scenario: Update an existing user
    * def id = 7813921
    Given path 'users/', id
    And request userData
    When method PUT
    Then status 200
    And match response.email == userData.email
