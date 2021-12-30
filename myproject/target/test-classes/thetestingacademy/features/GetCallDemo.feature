Feature: Get the details of User 2

    Background: Set url
        * url 'https://reqres.in/api/'
    
    Scenario: Get the details of User 2
        Given path "users/2"
        When method Get
        Then status 200

    Scenario: Create a person
        Given path "/users"
        Given def expectedName="denysLebedev"
        And request
        """
        {
        "name": "denysLebedev",
        "job": "leader"
        }
        """
        When method Post
        Then status 201
        Then match $.name == expectedName

        @debug2
    Scenario: Get a list of users
        Given path "/users"
        And param "page" = "2"
        When method Get
        Then status 200
        Then match response.total == 12

