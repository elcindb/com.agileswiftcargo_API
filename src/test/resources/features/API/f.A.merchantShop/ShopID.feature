Feature: As an administrator (admin), I want to be able to access the detailed information of the merchant shop with the specified id number via the API connection.

  Scenario Outline: admin a GET request with valid authorization information and correct data (id)
  is sent to the api/shop/{id} endpoint, the data in the response body (id, merchant_id, name,
  contact_no, address, status, default_shop, created_at, updated_at) should be verified.


    * The api user sets "api/shop/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, <merchant_id>, "<name>", "<contact_no>", "<address>", <status>, <default_shop>, "<created_at>", "<updated_at>".



    Examples:
      | id  | id  | merchant_id | name        | contact_no  | address  | status | default_shop | created_at                  | updated_at                  |
      | 834 | 834 | 8           | Prof Cargo  | 33358975556 | New York | 1      | 0            | 2024-09-24T19:06:32.000000Z | 2024-09-24T19:06:32.000000Z |



  Scenario: Invalid Token Send a GET request to the  api/shop/{id} endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/shop/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


