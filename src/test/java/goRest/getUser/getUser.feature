Feature: testing to users functionality from gorest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken

Feature: Create a new user in GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken
    * def userData = read('classpath:features/data/user_data.json')

  Scenario: Create a valid user
    Given request userData
    When method POST
    Then status 201
    And match response.name == userData.name

Feature: Retrieve a user from GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken

  Scenario: Get a user by ID
    Given path 'users', 123
    When method GET
    Then status 200


Feature: Update a user in GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken
    * def updatedData = read('classpath:features/data/user_data.json')
    * updatedData.name = 'John Updated'

  Scenario: Update an existing user
    Given path 'users', 123
    And request updatedData
    When method PUT
    Then status 200
    And match response.name == updatedData.name


Feature: Partially update a user in GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken

  Scenario: Modify user status
    Given path 'users', 123
    And request { status: 'inactive' }
    When method PATCH
    Then status 200
    And match response.status == 'inactive'


Feature: Delete a user in GoRest

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + authToken

  Scenario: Delete a user by ID
    Given path 'users', 123
    When method DELETE
    Then status 204