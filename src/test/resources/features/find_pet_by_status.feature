Feature: Find pets by status

  Scenario: Test if the API return pets based on a status
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/findByStatus"
    And param status = "available"
    When method GET
    Then status 200
