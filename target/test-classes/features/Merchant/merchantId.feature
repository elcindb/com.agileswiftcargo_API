
Feature: As an administrator (admin), I want to be able to access the detailed information of the Merchant with the specified id number via the API connection.

  @TC_1801
  Scenario Outline: admin Send a GET request to the api/merchant/{id} endpoint with valid authorization and correct data (id),
  verify that the response status code is 200 and the response body includes the correct details
  (id, user_id, business_name, merchant_unique_id, current_balance, opening_balance, vat).

    * The api user sets "api/merchant/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    * The api user verifies that the data in the response body includes <id>, <user_id>, "<business_name>", "<merchant_unique_id>", "<current_balance>", "<opening_balance>",and "<vat>".

    Examples:
      | id  | id  | user_id | business_name | merchant_unique_id | current_balance | opening_balance | vat  |
      | 512 | 512 | 1042    | Adams-Morar   | 973919             | 0.00            | 0.00            | 0.00 |

  @TC_1802
  Scenario: Invalid Token Send a GET request to the api/merchant/list endpoint with invalid authorization, verify that the response
  status code is 400 and the message in the response body is 'Unauthenticated.'
    * The api user sets "api/merchant/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.

  @TC_1803
  Scenario:admin Send a GET request to the api/merchant/{id} endpoint  that does not
  contain valid authorization information and (id), the status code returned is 203 and the message in the response body is "No id.",
  and when a GET request is sent that contains an unregistered (id), the status code returned is 203 and the message in the response body is
  "there is no merchant with this id".

    * The api user sets "api/merchant/<id>" path parameters.
    # Api kullanicisi "api/hub/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.