Feature: As an administrator (admin), I want to be able to update the packaging information with the specified id number via API connection.

  Scenario Outline: admin When a PATCH body containing the correct (id) and correct data (name, price) with valid authorization information is sent to the api/packaging/edit/{id} endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "Updated".

  * The api user sets "api/packaging/edit/<id>" path parameters.
  * The api user prepares a POST request containing only "<name>", "<price>".
  * The api user sends a "PATCH" request and saves the returned response.
  * The api user verifies that the status code is 200.
  * The api user verifies that the "message" information in the response body is "Updated".
  * The api user verifies that the id in the response body returned is the same as the <id> path parameter.

    Examples:
      |  id  | name   | price    |
      |  60  | testV2 | 322.32   |

  Scenario Outline: admin It should be verified that when a PATCH request is sent to the api/packaging/edit/{id} endpoint with valid authorization information, the status code returned is 400 and the message in the response body is "There is no data to update.".

    * The api user sets "api/packaging/edit/<id>" path parameters.
    * The api user prepares a POST request containing only "<name>", "<price>".
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "There is no data to update.".

    Examples:
      |  id  | name   | price    |
      |  60  |        |          |


  Scenario Outline: admin It should be verified that when a PATCH body (name, price) without (id) is sent to the api/packaging/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the message in the response body is "No id."
    * The api user sets "api/packaging/edit/<id>" path parameters.
    * The api user prepares a POST request containing only "<name>", "<price>".
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      |  id  | name   | price    |
      |      | testV2 | 322.32   |

  Scenario Outline: admin when a PATCH body (name, price) with an unregistered (id) is sent, the status code returned is 203 and the message in the response body is "no id or there is no packaging with this id.".
    * The api user sets "api/packaging/edit/<id>" path parameters.
    * The api user prepares a POST request containing only "<name>", "<price>".
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "no id or there is no packaging with this id.".

    Examples:
      |  id  | name   | price    |
      |  1   | testV2 | 322.32   |

  Scenario Outline: Invalid Token When a PATCH body (name, price) is sent to the api/packaging/edit/{id} endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/packaging/edit/<id>" path parameters.
    * The api user prepares a POST request containing only "<name>", "<price>".
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      |  id  | name   | price    |
      |  60  | testV2 | 322.32   |

  Scenario Outline: admin It should be verified from the API that the packaging record requested to be updated from the API has been updated.
    * The api user sets "api/packaging/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <id> id, including "<name>", "<price>"

    Examples:
      | id   | name   | price    |
      | 60   | testV2 | 322.32   |