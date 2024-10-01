
Feature:As an administrator (admin), I want to be able to access the detailed information
  of the blog with the specified id number via the API connection.

  Scenario:Admin sends a GET request with valid authorization information and correct data (id)
  to "api/blog/{id}" endpoint and Verifies that the status code returned is 200.
    Given The api user sets "api/blog/{id}" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 200.


  Scenario: Admin sends a GET request with valid authorization information and correct data (id)
  to "api/blog/{id}" endpoint,verifies the data in the response body (id, title, image_id,
  description, position, status, created_by, views, created_at, updated_at).

    Given The api user sets "api/blog/{id}" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 200.


  Scenario:admin Send a GET request to the "api/blog/{id}" endpoint without an id and with valid authorization, verify that the
  response status code is 203 and the message in the response body is 'No id.'

    Given The api user sets "api/blog" path parameters.

    When The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 203.

    And The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline:Admin Send a GET request to the "api/blog/{id}" endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'there is no blug with this id'

    Given The api user sets "api/blog/<id>" path parameters.

    When The api user sends a "GET" request and saves the returned response.

    Then The api user verifies that the status code is 203.

    And The api user verifies that the "message" information in the response body is "there is no blog with this id".

    Examples:
      | id   |
      | 222 |

  Scenario Outline:Invalid Token Send a GET request to the "api/blog/{id}" endpoint with invalid authorization, verify
  that the response status code is 401 and the message in the response body is 'Unauthenticated.

    Given The api user sets "api/blog/<id>" path parameters.

    When The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


    Examples:
      | id |
      | 0  |