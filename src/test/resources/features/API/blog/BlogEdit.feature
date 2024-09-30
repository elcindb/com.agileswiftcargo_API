

Feature:As an administrator (admin), I want to be able to update the blog information with the specified id number via the API connection


  @FAD
  Scenario Outline:Admin Send a PATCH request to the api/blog/edit/{id} endpoint with valid authorization, correct id, and data
  (title, description, position, status), verify that the response status code is 200, the message is 'Updated'.

    * The api user sets "api/blog/edit/<id>" path parameters.

    * The api user prepares a "patch" request to send to the api blog edit endpoint.

    * The api user sends a "PATCH" request and saves the returned response.

    * The api user verifies that the status code is 200.

    * The api user verifies that the "message" information in the response body is "Updated".

    Examples:
      | id  |
      |     |


  Scenario Outline:Admin When a PATCH request is sent to the api/blog/edit/{id} endpoint with valid authorization information with
  the correct (id) and no data, it should be verified that the status code returned is 400 and the message information
  in the response body is "No data to update".

    * The api user sets "api/blog/edit/<id>" path parameters.

    * The api user prepares a "PATCH" request that contains no data.

    * The api user sends a "PATCH" request and saves the returned response.

    * The api user verifies that the status code is 400.

    * The api user verifies that the "message" information in the response body is "No data to update".

    Examples:
      | id  |
      |    |

  Scenario:Admin It should be verified that when sending a PATCH body  (title, description, position, status) that does not contain an (id)
  to the api/blog/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the
  message in the response body is "No blog id."

    * The api user sets "api/blog/edit" path parameters.

    * The api user prepares a "patch" request to send to the api blog edit endpoint.

    * The api user sends a "PATCH" request and saves the returned response.

    * The api user verifies that the status code is 203.

    * The api user verifies that the "message" information in the response body is "No blog id.".



  Scenario Outline:Admin when sending a PATCH body (title, description, position, status) that contains an unregistered (id)
  to the api/blog/edit/{id} endpoint, the status code returned is 203 and the message in the response body is
  "there is no blog with this id",.

    * The api user sets "api/blog/edit/<id>" path parameters.

    * The api user prepares a "patch" request to send to the api blog edit endpoint.

    * The api user sends a "PATCH" request and saves the returned response.

    * The api user verifies that the status code is 203.

    * The api user verifies that the "message" information in the response body is "there is no blog with this id ".

    Examples:
      | id   |
      | 2514 |

  Scenario Outline:Invalid Token When a PATCH body (title, description, position, status) is sent to the api/blog/edit/{id} endpoint
  with invalid authorization information, it should be verified that the status code returned is 401 and the message information
  in the response body is “Unauthenticated.”

    * The api user sets "api/blog/edit/<id>" path parameters.

    * The api user prepares a "patch" request to send to the api blog edit endpoint.

    * The api user sends a "PATCH" request and saves the returned response.

    * The api user verifies that the status code is 401.

    * The api user verifies that the "message" information in the response body is "Unauthenticated ".

    Examples:
      | id  |
      | 419 |

  Scenario Outline:Admin verified that the id in the response body returned from the api/blog/edit/{id} endpoint is
  the same as the id path parameter in the api/blog/edit/{id} endpoint.

    * The api user sets "api/blog/edit/<id>" path parameters.

    * The api user prepares a "patch" request to send to the api blog edit endpoint.

    * The api user sends a "PATCH" request and saves the returned response.

    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint.

    Examples:
      | id  |
      | 419 |


  Scenario Outline:Admin It should be verified that the hub record requested to be updated via API has been updated via API.
  (It can be verified that the record has been updated by sending a GET request to the api/hub/{id} endpoint with the “id”
  returned in the response body).

    * The api user sets "api/hub/<id>" path parameters.

    * The api user sends a "GET" request and saves the returned response.

    * The api user verifies that name is "Updated Blog"

    Examples:
      | id  |
      | 419 |