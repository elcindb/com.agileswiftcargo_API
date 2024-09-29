Feature: As an administrator (admin), I want to be able to delete Merchant information with the specified id number via API connection.

  @TC_2101
  Scenario Outline: admin When a DELETE request is sent to the api/merchant/delete/{id} endpoint with valid authorization information and the correct (id), it should be verified that the status code returned is 200 and the message information in the response body is "Deleted".

    * The api user sets "api/merchant/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted id" information in the returned response body is the same as the id path parameter written in the endpoint.
    * The api user verifies that the "message" is "there is no merchant with this id" by sending a GET request to the "api" "merchant" endpoint with the "data" "Deleted id" returned in the response body.

    Examples:
      | id  |
      | 525 |

  @TC_2102
  Scenario:admin Send a DELETE request to the api/merchant/delete/{id} endpoint  that does not
  contain valid authorization information and (id), the status code returned is 203 and the message in the response body is "No id.".

    * The api user sets "api/merchant/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is, "No id.".

  @TC_2103
  Scenario:admin Send a DELETE request to the api/merchant/delete/{id} endpoint  that does not
  contain valid authorization information and (id), the status code returned is 401 and the message in the response body is "Unauthenticated.".

    * The api user sets "api/merchant/delete/<id>" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is, "Unauthenticated.".