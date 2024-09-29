Feature: As an administrator (admin), I want to be able to delete sho information with the specified id number via API connection.

  Scenario: admin Send a DELETE request to the api/shop/delete/{id} endpoint with valid authorization and correct id, verify
  that the response status code is 200, the message is 'Deleted', and the 'Deleted ID' in the response body matches
  the id in the path. Then, confirm the deletion by sending a GET request to api/hub/{id} to verify the hub has been removed.

    * The api user sets "api/shop/delete/854" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Deleted".
    * The api user verifies that the "data" "Deleted ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki Deleted ID bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular


  Scenario: admin It should be verified that when a DELETE request is sent to the api/shop/delete/{id}
  endpoint with valid authorization information and (id), the status code returned is 203 and the message
  in the response body is "No id.".

    * The api user sets "api/shop/delete" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular


  Scenario: admin when a DELETE request is sent with an unregistered (id), the status code returned is
  203 and the message in the response body is "there is no hub with this id".

    * The api user sets "api/shop/delete/5236" path parameters.
    * The api user sends a "DELETE" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no shop with this id".
    # Api kullanicisi response bodydeki message bilgisinin "there is no shop with this id" oldugunu dogrular



  Scenario: Invalid Token When a DELETE request is sent to the api/hub/delete/{id} endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message
  information in the response body is "Unauthenticated.".
    * The api user sets "api/shop/delete/885" path parameters.
    * The api user sends a "DELETE" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.

    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular





  Scenario Outline: admin The deletion of the hub record that is requested to be deleted from the API must be verified from the API.
  (It can be verified that the record has been deleted by sending a GET request to the api/shop/{id} endpoint
  with the “Deleted ID” returned in the response body).

    * The api user sets "api/shop/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the "message" information in the response body is "there is no shop with this id".
    # Api kullanicisi response bodydeki message bilgisinin "there is no hub with this id" oldugunu dogrular

    Examples:
      | id  |
      | 854 |