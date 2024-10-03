Feature: As an administrator (admin) I want to be able to access the Delivery Man list via API connection.

  Scenario Outline: admin When a GET request is sent to the api/deliveryman/list endpoint with valid authorization information, the information (user_id, status, delivery_charge, pickup_charge, return_charge, current_balance, opening_balance, driving_license_image_id, created_at, updated_at) returned in the response body of id(x) should be verified.

    * The api user sets "api/deliveryman/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <user_id>, <status>, "<delivery_charge>", "<pickup_charge>", "<return_charge>", "<current_balance>", "<opening_balance>", "<driving_license_image_id>", "<created_at>", "<updated_at>".

    Examples:
      | dataindex | user_id | status | delivery_charge | pickup_charge | return_charge | current_balance | opening_balance | driving_license_image_id | created_at                  | updated_at                  |
      | 0         | 1060    | 1      | 10.00           | 20.00         | 5.00          | 0.00            | 0.00            | null                     | 2024-09-27T19:35:32.000000Z | 2024-09-27T20:15:17.000000Z |


  Scenario: invalid token When a GET request is sent to the api/deliveryman/list endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/hub/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
