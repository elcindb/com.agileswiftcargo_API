Feature: As an administrator (admin), I want to be able to access the detailed information of the Hub with the specified id number via the API connection.

  Scenario Outline: admin Send a GET request to the api/hub/{id} endpoint with valid authorization and correct data (id),
  verify that the response status code is 200 and the response body includes the correct details (id, name, phone,
  address, current_balance, status, created_at, updated_at).

    * The api user sets "api/hub/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the data in the response body includes <id>, "<name>", "<phone>", "<address>", "<current_balance>", <status>, "<created_at>" and "<updated_at>".
    # Api kullanicisi response bodydeki data <id>, "<name>", "<phone>", "<address>", "<current_balance>", <status>, "<created_at>" ve "<updated_at>" içeriklerini doğrular.

    Examples:
      | id | id | name        | phone       | address                 | current_balance | status | created_at                  | updated_at                  |
      | 2  | 2  | Los Angeles | 01000000002 | Los Angeles, California | 0.00            | 1      | 2023-08-01T14:12:21.000000Z | 2023-08-01T14:12:21.000000Z |

