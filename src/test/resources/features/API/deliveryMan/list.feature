Feature: As an administrator (admin) I want to be able to access the Delivery Man list via API connection.

  Scenario Outline: admin a GET request is sent to the api/deliveryman/list endpoint with valid authorization information, the information (user_id, status, delivery_charge, pickup_charge, return_charge, current_balance, opening_balance, driving_license_image_id, created_at, updated_at) returned in the response body of id(x) should be verified.
    * The api user sets "api/deliveryman/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <user_id>, <status>, "<delivery_charge>", "<pickup_charge>", "<return_charge>", "<current_balance>", "<driving_license_image_id>", "<created_at>", "<updated_at>".
    * The api user sets "api" path parameters.
    * The api user sets "api" path parameters.

    Examples:
      | dataindex | user_id | status | delivery_charge | pickup_charge | return_charge | current_balance | driving_license_image_id | created_at                  | updated_at                  |
      | 0         | 1044    | 1      | 0.00            | 0.00          | 1             | 0.00            | null                     | 2024-09-26T16:08:02.000000Z | 2024-09-26T16:08:02.000000Z |
