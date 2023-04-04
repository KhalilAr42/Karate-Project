@APIPlaceAnOrderForAPet
Feature: Place an order for a pet

  Scenario: Test if the API return pets based on a status
    Given url "https://petstore.swagger.io/v2"
    And path "/store/order"
    And def request_body =
    """
      {
        "id": 14,
        "petId": 12,
        "quantity": 22,
        "shipDate": "2023-04-04T17:47:50.182Z",
        "status": "placed",
        "complete": true
      }
    """
    And request request_body
    When method POST
    Then status 200
    And def response_schema =
    """
      {
        "id":"#number",
        "petId":"#number",
        "quantity":"#number",
        "shipDate":"#string",
        "status":"#string",
        "complete":"#boolean"
      }
    """
    And match response == response_schema