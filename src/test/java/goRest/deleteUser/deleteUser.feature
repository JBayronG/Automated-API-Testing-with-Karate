Feature: Delete a user in GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken

  Scenario: Delete a user by ID
    * def id = 7813921
    Given path 'users/', id
    When method DELETE
    Then status 204