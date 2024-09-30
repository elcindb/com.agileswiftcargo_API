Feature:As an administrator (admin) I want to be able to create a new blog record via an API connection.

  Scenario Outline: Admin Send a POST request to the "api/blog/add" endpoint with valid authorization and the correct data
  (title, description, position, status), verify that the response status code is 200 and the message in the response body is
  "New Blog Added".

    * The api user sets "api/blog/add" path parameters.

    * The api user prepares a POST request containing "<title>" ,"<description>","<position>" and <status> information to send to the api blog add endpoint.

    * The api user sends a "POST" request and saves the returned response.

    * The api user verifies that the status code is 200.

    * The api user verifies that the "message" information in the response body is "New Blog Added".

    Examples:
      | title       | description    |position  |status  |
      |             |                |     0    |    1   |

  Scenario Outline:Invalid Token Send a POST request to the api/blog/add endpoint with invalid authorization and correct data
  (title, description, position, status) verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/blog/add" path parameters.

    * The api user prepares a POST request containing "<title>" ,"<description>","<position>" and <status> information to send to the api blog add endpoint.

    * The api user sends a "POST" request and saves the returned response.

    * The api user verifies that the status code is 401.

    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | title      | description |  position  |  status |
      |            |             |      0      |    1     |


  Scenario Outline:Admin The new blog record to be created from the API must be verified from the API.
  (with the "New Blog ID" returned in the response body, it can be verified that a record was created by sending a GET
  request to the api/blog/{id} endpoint.)

    * The api user sets "api/blog/<id>" path parameters.

    * The api user sends a "GET" request and saves the returned response.

    * The api user verifies that the status code is 200.

    Examples:
      | id  |
      | 21  |


