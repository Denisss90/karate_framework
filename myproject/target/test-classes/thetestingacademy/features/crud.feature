Feature: try to automate CRUD via karate framework

Background: Set url
    * url "https://rahulshettyacademy.com/maps/api/place/"

Scenario: Create a palce
    Given path "add"
    And request
    """
        {
        "location": {
            "lat": -38.383494,
            "lng": 33.427362
        },
        "accuracy": 50,
        "name": "Denys house",
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
    Then match status 200

    * def responsePlaceId=response.place_id


