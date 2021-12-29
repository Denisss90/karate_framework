Feature: Get the details of User 2

    Background: Set url
        * url 'https://reqres.in/api/'
    
    Scenario: Get the details of User 2
        Given path "users/2"
        When method Get
        Then status 200

    @debug2
    Scenario: Create a person
        Given path "/users"
        And request
        """
        {
        "name": "denysLebedev",
        "job": "leader"
        }
        """
        When method Post
        Then status 202
        Then match respose.name == "denysLebedev"

