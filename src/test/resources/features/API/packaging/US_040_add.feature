Feature: As an administrator (admin) I want to be able to create a new packaging record via API connection.

  Scenario Outline: admin When a POST body with valid authorization information and correct data (name, price, status, position) is sent to the api/packaging/add endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "New Packaging Added".
    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<price>", <status>, "<position>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Packaging Added".

    Examples:
    | name | price | status | position |
    | test | 322   |  1     |   3      |

  Scenario Outline: admin The creation of the new packaging record should be verified from the API.

    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <id> id, including "<name>", "<price>", <status>, "<position>", "<photo>", "<created_at>", "<updated_at>".

    Examples:
      | id | name        | price | status | position | photo | created_at                  | updated_at                  |
      | 60 | test        | 322.00| 1      | 3        | null  | 2024-10-01T01:21:41.000000Z | 2024-10-01T01:21:41.000000Z |

  Scenario Outline: admin It should be verified that when a POST body with valid authorization information and missing or no data is sent to the api/packaging/add endpoint, the status code returned is 400 and the message in the response body is "Name, price, status and position required"

    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request containing no data.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "Name, price, status and position required".
    * The api user prepares a POST request containing only "<name>", "<price>".
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "Name, price, status and position required".

    Examples:
      | name | price |
      | test | 322   |

  Scenario Outline: Invalid Token When a POST body containing correct data (name, price, status, position) with invalid authorization information is sent to the api/packaging/add endpoint, it should be verified that the status code returned is 401 and the message information in the response body is “Unauthenticated.”
    * The api user sets "api/packaging/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<price>", <status>, "<position>".
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | name      | price | status | position |
      | testEmrah | 322   |  1     |   3      |