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
    * The api user verifies that the "data" "Updated Shop ID" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki id bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id   |
      | 848  |



  Scenario Outline: admin When a PATCH request is sent to the api/shop/edit/{id} endpoint with valid authorization information with
  the correct (id) and no data, it should be verified that the status code returned is 400 and the message information
  in the response body is "There is no data to update.".

    * The api user sets "api/shop/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing no information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.
    # Api kullanicisi response bodydeki message bilgisinin "There is no data to update." oldugunu dogrular


    Examples:
      | id  |
      | 848 |


  Scenario Outline: admin Send invalid merchant_id PATCH request to the api/shop/edit endpoint with valid authorization, verify that the response
  status code is 203 and the message in the response body is 'there is no merchant with this id.'

    * The api user sets "api/shop/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>,"<name>", "<contact_no>","<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".
    # Api kullanicisi response bodydeki message bilgisinin "there is no merchant with this id." oldugunu dogrular

    Examples:
    |id  |merchant_id | name         | contact_no   | address   | status |
    |983 | 5          | Frank Cargo  | 1111111111   | France    | 3      |



  Scenario: admin It should be verified that when sending a PATCH body (merchant_id, name, contact_no, address, status) that
  does not contain an (id) to the api/shop/edit/{id} endpoint with valid authorization information, the status
  code returned is 203 and the message in the response body is "No shop id."

    * The api user sets "api/shop/edit" path parameters.
    * The api user prepares a patch request to send to the api shopedit endpoint.
    * The api user sends a PATCH request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No shop id.".
    # Api kullanicisi response bodydeki message bilgisinin "No shop id." oldugunu dogrular


  Scenario Outline: admin when sending a PATCH body (merchant_id, name, contact_no, address, status) that contains an unregistered (id),
  the status code returned is 203 and the message in the response body is "There is no shop with this id".

    * The api user sets "api/shop/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing <merchant_id>,"<name>", "<contact_no>","<address>" and <status> information to send to the api shopedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "There is no shop with this id".
    # Api kullanicisi response bodydeki message bilgisinin "There is no shop with this id" oldugunu dogrular

        # burada bir defect var !!
    Examples:
      |id      |merchant_id | name         | contact_no   | address   | status |
      |10000   | 5          | Frank Cargo  | 1111111111   | New York  | 1      |




  Scenario Outline: Invalid Token When a PATCH body (name, phone, address) is sent to the api/shop/edit/{id} endpoint with invalid
  authorization information, it should be verified that the status code returned is 401 and the message information
  in the response body is “Unauthenticated.”.

    * The api user sets "api/shop/edit/<id>" path parameters.
    * The api user prepares a patch request to send to the api shopedit endpoint.
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 419 |




