Feature: try to automate CRUD via karate framework

Background: Set url
    * url "https://rahulshettyacademy.com/maps/api/place/"

# 1. Create a point on the map
Scenario: Create a place
    Given path "add/json"
    Given header Content-Type = "application/json"
    And param "key" = "qaclick123"
    And request
    """
        {
        "location": {
            "lat": -38.383494,
            "lng": 33.427362
        },
        "accuracy": 50,
        "name": "Denys house in Kiev",
        "phone_number": "(+91) 983 893 3937",
        "address": "29, side layout, cohen 09",
        "types": [
            "shoe park",
            "shop"
        ],
        "website": "http://abc.com",
        "language": "Ukr-IN"
        }
    """
    When method Post
    Then status 200
    Then match response == "#object"
    Then match response.scope == "APP"

    * def responsePlaceId = response.place_id
    * def expectedResponseAddress = '29, side layout, cohen 09'

# 2. Get the point from the map
    Given path "get/json"
    And param key = 'qaclick123'
    And param place_id = responsePlaceId
    When method Get
    Then status 200
    Then match response.address == expectedResponseAddress
    Then match response.address == "#notnull"
    * print "The address in response is ", response.address


# 3. Update a point on the map
Scenario: Create a place
    Given path "update/json"
    Given header Content-Type = "application/json"
    And param "key" = "qaclick123"
    And param place_id = responsePlaceId
    And request
    """
        {
        "place_id": responsePlaceId,
        "address":"New Year streat, USA",
        "key":"qaclick123"
        }
    """
    When method Put
    Then status 200
    Then match response == "#object"
    Then match response.msg == "Address successfully updated"




