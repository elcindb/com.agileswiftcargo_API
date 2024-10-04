Feature: As an administrator (admin) I want to be able to access Merchant List via API connection.

  @TC_1701
  Scenario Outline: admin Send a GET request to the api/merchant/list endpoint with valid authorization, verify that the
  response status code is 200.When a GET request is sent to the api/merchant/list endpoint with valid authorization information, the information
  (user_id, business_name, merchant_unique_id, current_balance, opening_balance, vat)
  returned in the response body of id(x) should be verified.

    * The api user sets "api/merchant/list" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified "<dataindex>" index, including ,"<user_id>","<business_name>","<merchant_unique_id>","<current_balance>","<opening_balance>","<vat>".

    Examples:
      | dataindex | user_id | business_name | merchant_unique_id | current_balance | opening_balance | vat  |
      | 0         | 1048    | Firm AŞ       | 595163             | 0.00            | 0.00            | 0.00 |

  @TC_1702
  Scenario: Invalid Token Send a GET request to the api/merchant/list endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'
    * The api user sets "api/merchant/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is, "Unauthenticated.".
