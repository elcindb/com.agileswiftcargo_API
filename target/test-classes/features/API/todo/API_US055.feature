Feature: As an administrator (admin), I want to be able to access the detailed information of the todo with the specified id number via the API connection.

  @TC_5501
  Scenario Outline: admin Send a GET request to the  api/todo/list endpoint with valid authorization, verify that the
  response status code is 200. Additionally, validate the details (title, description, user_id, date, status, note, created_at, updated_at) of the entry with id(x) in the response body.

    * The api user sets "api/todo/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified "<dataindex>" index, including "<title>", "<description>", "<user_id>","<date>", "<status>", "<note>", "<created_at>" and "<updated_at>".
    Examples:
      | dataindex | title | user_id | date       | status | note | created_at                  | updated_at                  |
      | 0         | asd   | 915     | 2024-09-19 | 2      | null | 2024-09-10T00:31:14.000000Z | 2024-09-12T10:23:02.000000Z |

  @TC_5502
  Scenario: invalid token When a GET request is sent to the api/todo/list endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/todo/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

