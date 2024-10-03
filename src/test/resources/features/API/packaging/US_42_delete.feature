Feature: As an administrator (admin), I want to be able to delete packaging information with the specified id number via API connection.

  Scenario Outline: admin When a DELETE request is sent to the api/packaging/delete/{id} endpoint with valid authorization information and the correct (id), it should be verified that the status code returned is 200 and the message information in the response body is "Deleted".

    * The api user sets "api/packaging/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".

    Examples:
      | id |
      | 60 |

  Scenario Outline: Invalid Token When a DELETE request is sent to the api/packaging/delete/{id} endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/packaging/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | id |
      | 60 |

  Scenario Outline: admin It should be verified that when a DELETE request is sent to the api/packaging/delete/{id} endpoint with valid authorization information and (id), the status code returned is 203  and the message in the response body is "No id."
    * The api user sets "api/packaging/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".

    Examples:
      | id |
      |    |

  Scenario Outline: admin When a DELETE request is sent with an unregistered (id), the status code returned is 203 and the message in the response body is "there is no packaging with this id".
    * The api user sets "api/packaging/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no packaging with this id".

    Examples:
      | id |
      | 60 |

  Scenario Outline: admin Verify that the Deleted ID in the response body returned from the api/packaging/delete/{id} endpoint is the same as the id path parameter in the api/packaging/delete/{id} endpoint.
    * The api user sets "api/packaging/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies the information in the response body for the entry with the specified <id> id

    Examples:
      | id |
      | 78 |