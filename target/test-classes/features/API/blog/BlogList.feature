Feature:As an administrator (admin), I want to be able to access the entire blog list via API connection.


  Scenario:Admin sends a GET request to api/blog/list endpoint with valid authorization information,
  verifies that the status code returned is 200.
    Given The api user sets "api/blog/list" path parameters.

    Then The api user verifies that the status code is 200.

  Scenario:Admin sends a GET request to api/blog/list endpoint with invalid authorization information,
  verifies that the status code returned is 401
  and the message information in the response body is “Unauthenticated”.

    Given The api user sets "api/blog/list" path parameters.

    Then The api user verifies that the status code is 401.

    And The api user verifies that the "message" information in the response body is "Unauthenticated.".



  Scenario Outline:Admin sends a GET request to api/blog/list endpoint with valid authorization information,
  verifies the information (title, image_id, description, position, status, created_by, views, created_at
  ,updated_at) returned in the response body of id(x).

    Given The api user sets "api/blog/list" path parameters.

    When  The api user sends a "GET" request and saves the returned response.

    Then The api user prepares a POST request containing "<title>" ,"<description>","<position>" and <status> information to send to the api blog list endpoint.

    Examples:
      | title      | description |  position  |  status |
      |            |             |      0     |     1   |