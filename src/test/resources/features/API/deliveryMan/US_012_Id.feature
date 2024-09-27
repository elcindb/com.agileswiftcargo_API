Feature: As an administrator (admin), I want to be able to access the detailed information of the Delivery Man with the specified id number via the API connection.

  @ab
  Scenario Outline: admin When a GET request with valid authorization information and correct data (id) is sent to the api/deliveryman/{id} endpoint, the data in the response body (id, user_id, status, delivery_charge, pickup_charge, return_charge, current_balance, opening_balance, driving_license_image_id, created_at, updated_at) should be verified.
    * The api user sets "api/deliveryman/<id>" path parameters.
    * The api user sets "api/deliveryman/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes <id>, <user_id>, <status>, "<delivery_charge>", "<pickup_charge>", "<return_charge>", "<current_balance>", "<opening_balance>", "<driving_license_image_id>", "<created_at>", "<updated_at>".

    Examples:
      | id  | id  | user_id | status | delivery_charge | pickup_charge | return_charge | current_balance | opening_balance | driving_license_image_id | created_at                  | updated_at                  |
      | 396 | 396 | 993     | 1      | 0.00            | 0.00          | 0.00          | -520.00         | 0.00            | null                     | 2024-09-09T16:04:47.000000Z | 2024-09-11T15:46:20.000000Z |
