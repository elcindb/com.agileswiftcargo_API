Feature: As an administrator (admin) I want to be able to create a new todo record via API connection.

  @TC_5701
  Scenario: admin Send a GET request to the api/todo/status-update/{id} endpoint without an id and with valid authorization, verify that the response status code is 200 and the message in the response body is 'Status Updated.'
    * The api user sets "api/todo/status-update/{id}" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Status Updated".

  @TC_5702
  Scenario: invalid token When a GET request is sent to the api/todo/status-update/{id} endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/todo/status-update/{id}" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

  @TC_5703
  Scenario: admin Send a GET request to the api/todo/status-update/{id} endpoint without an id and with valid authorization, verify that the response status code is 203 and the message in the response body is 'No id.'
    * The api user sets "api/todo/status-update/{id}" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

  @TC_5704
  Scenario Outline: admin Send a GET a request is sent with an unregistered (update) (id), the status code returned is 203 and the message in the response body is "there is no deliveryman with this id".
    * The api user sets "api/todo/status-update/{id}" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".
    Examples:
      | id     |
      | 123123 |

