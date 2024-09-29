Feature: As an administrator (admin), I want to be able to access the detailed information of the merchant shop with the specified id number via the API connection.

  Scenario Outline: admin a GET request with valid authorization information and correct data (id)
  is sent to the api/shop/{id} endpoint, the data in the response body (id, merchant_id, name,
  contact_no, address, status, default_shop, created_at, updated_at) should be verified.


    * The api user sets "api/shop/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, <merchant_id>, "<name>", "<contact_no>", "<address>", <status>, <default_shop>, "<created_at>", "<updated_at>".



    Examples:
      | id  | id  | merchant_id | name                      | contact_no  | address    | status | default_shop | created_at                  | updated_at                  |
      | 770 | 770 | 476         | sumeyra coskun kahraman   | 74141474147 | Washington | 1      | 1            | 2024-09-09T14:55:05.000000Z | 2024-09-09T14:55:05.000000Z |



  Scenario: Invalid Token Send a GET request to the  api/shop/{id} endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/shop/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.




  Scenario: admin Send a GET request to the api/shop/{id} endpoint without an id and with valid authorization, verify that the
  response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/shop" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".
    # Api kullanicisi response bodydeki message bilgisinin "No id." oldugunu dogrular



  Scenario Outline: admin Send a GET request to the api/shop/{id} endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'there is no hub with this id'

    * The api user sets "api/shop/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no shop with this id".
    # Api kullanicisi response bodydeki message bilgisinin "there is no hub with this id" oldugunu dogrular

    Examples:
      | id   |
      | 1111 |
