Feature: As an administrator (admin), I want to be able to access the detailed information of the todo with the specified id number via the API connection.

  @TC_5601
  Scenario Outline: admin When a GET request with valid authorization information and correct data (id) is sent to the api/todo/{id} endpoint, the data in the response body (id, user_id, status, delivery_charge, pickup_charge, return_charge, current_balance, opening_balance, driving_license_image_id, created_at, updated_at) should be verified.
    * The api user sets "api/todo/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies that the data in the response body includes "<id>", "<title>", "<description>","<user_id>", "<date>", "<status>", "<delivery_charge>", "<pickup_charge>", "<return_charge>", "<current_balance>", "<opening_balance>", "<driving_license_image_id>", "<created_at>", "<updated_at>".
    Examples:
      | id        | title | description | user_id | date       | status | note | created_at                  | updated_at                  |
      | 93        |    | qweqwe     | 915 | 2024-09-19 | 2      | null | 2024-09-10T00:31:14.000000Z | 2024-09-12T10:23:02.000000Z |

  @TC_5602
  Scenario: admin Send a GET request to the api/todo/{id} endpoint without an id and with valid authorization, verify that the response status code is 203 and the message in the response body is 'No id.'
    * The api user sets "api/todo" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".
  @TC_5603
  Scenario Outline: admin Send a GET a request is sent with an unregistered (id), the status code returned is 203 and the message in the response body is "there is no deliveryman with this id".
    * The api user sets "api/todo/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".
    Examples:
      | id     |
      | 123123 |