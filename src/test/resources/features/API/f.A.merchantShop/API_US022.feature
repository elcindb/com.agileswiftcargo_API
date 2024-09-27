Feature: As an administrator (admin) I want to be able to access Shop List via API connection.

  Scenario Outline: admin Send a GET request to the  api/shop/list endpoint with valid authorization, verify that the
  response status code is 200. Additionally, validate the details (merchant_id, name, contact_no, address, status,
  default_shop, created_at, updated_at) of the entry with id(x) in the response body.

    * The api user sets "api/shop/list" path parameters.
    # Api kullanicisi "api/shop/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, "<name>", "<contact_no>","<address>", <status>, <default_shop>, "<created_at>" and "<updated_at>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin <merchant_id>, "<name>", "<contact_no>","<address>", "<status>", "<default_shop>", "<created_at>" ve "<updated_at>" bilgilerini doğrular.

    Examples:
      | dataindex | merchant_id | name       | contact_no   | address    | status | default_shop | created_at                 | updated_at                  |
      | 1         |  8          | Prof Cargo | 33358975556  | New York   | 1      | 0            |2024-09-24T19:22:41.000000Z | 2024-09-24T19:22:41.000000Z |




  Scenario: Invalid Token Send a GET request to the api/shop/list endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/shop/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

