Feature: As an administrator (admin), I want to be able to update the information of the shop with the specified id number via the API connection.

  Scenario Outline: admin Send a PATCH request to the api/shop/edit/{id}  endpoint with valid authorization, correct id, and data
  (merchant_id, name, contact_no, address, status), verify that the response status code is 200, the message is 'Updated',
  and the id in the response body matches the id in the path. Then, confirm the update by sending a GET request to api/shop/{id} using
  the same id.

    * The api user sets "api/shop/edit/<id>" path parameters.
    * The api user prepares a patch request to send to the api shopedit endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki id bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id   |
      | 852  |


