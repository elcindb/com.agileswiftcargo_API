Feature: As an administrator (admin), I want to be able to access the detailed information of the packaging with the specified id number via the API connection.

  Scenario Outline: admin When a GET request with valid authorization information and correct data (id) is sent to the api/packaging/{id} endpoint, the data (id, name, price, status, position, photo, created_at, updated_at) in the response body should be verified.

    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <id> id, including "<name>", "<price>", <status>, "<position>", "<photo>", "<created_at>", "<updated_at>".


    Examples:
      | id | name        | price | status | position | photo | created_at                  | updated_at                  |
      | 2  | Bubble Poly | 20.00 | 1      | 2        | null  | 2023-08-01T14:12:21.000000Z | 2023-08-01T14:12:21.000000Z |

  Scenario Outline: Invalid Token When a GET request is sent to the api/packaging/{id} endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is “Unauthenticated.”.
    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | id |
      | 2  |

  Scenario Outline: admin It should be verified that when a GET request is sent to the api/packaging/{id} endpoint with valid authorization information and (id), the status code returned is 203 and the message in the response body is "No id.", and when a GET request is sent with an unregistered (id), the status code returned is 203 and the message in the response body is "there is no packaging with this id".
    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no packaging with this id".

    Examples:
      | id |
      | 111 |