Feature: As an administrator (admin) I want to be able to access the Packaging List via API connection.

  Scenario Outline: admin When a GET request is sent to the api/packaging/list endpoint with valid authorization information, the information (name, price, status, position, photo, created_at, updated_at) returned in the response body of id(x) should be verified.

    * The api user sets "api/packaging/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is, "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including "<name>", "<price>", <status>, "<position>", "<photo>", "<created_at>", "<updated_at>".

    Examples:
      | dataindex | name        | price | status | position | photo | created_at                  | updated_at                  |
      | 0         | Bubble Poly | 20.00 | 1      | 2        | null  | 2023-08-01T14:12:21.000000Z | 2023-08-01T14:12:21.000000Z |

  Scenario: Invalid Token When a GET request is sent to the api/packaging/list endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is “Unauthenticated.”.
    * The api user sets "api/packaging/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
