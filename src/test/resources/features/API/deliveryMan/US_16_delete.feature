Feature: As an administrator (admin), I want to be able to delete Delivery man information with the specified id number via API connection.


  Scenario Outline: admin When a DELETE request is sent to the api/deliveryman/delete/{id} endpoint with valid authorization information and the correct (id), it should be verified that the status code returned is 200 and the message information in the response body is "Deleted".

    * The api user sets "api/deliveryman/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no deliveryman with this id" by sending a GET request to the "api" "deliveryman" endpoint with the "data" "Deleted id" returned in the response body.


    Examples:
      | id  |
      | 474 |

  @ab
  Scenario: admin It should be verified that when a DELETE request is sent to the api/deliveryman/delete/{id} endpoint with valid authorization information and no (id), the status code returned is 203 and the message in the response body is "No id."

    * The api user sets "api/deliveryman/delete/" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin when a DELETE request is sent with an unregistered (id), the status code returned is 203 and the message in the response body is "there is no deliveryman with this id".

    * The api user sets "api/deliveryman/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no deliveryman with this id".

    Examples:
      | id  |
      | 474 |

  Scenario: invalid token When a DELETE request is sent to the api/deliveryman/delete/{id} endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/deliveryman/delete/" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthenticated.


