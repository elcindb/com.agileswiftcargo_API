Feature: As an administrator (admin) I want to be able to create a new Shop record via API connection.

  Scenario Outline: admin Send a POST request to the api/shop/add endpoint with valid authorization and the correct data
  (merchant_id, name, contact_no, address, status), verify that the response status code is 200 and the message in the response body is
  'New Shop Added'. Then, confirm the creation of the new hub by sending a GET request to the api/shop/{id} endpoint
  using the 'New Shop ID' from the response.


    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>,"<name>", "<contact_no>","<address>" and <status> information to send to the api shopadd endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Shop Added".
    * The api user verifies that the "name" is "France Cargo" by sending a GET request to the "api" "shop" endpoint with the "data" "New Shop ID" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "New Hub ID" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Test Hub" oldugunu dogrular


    Examples:
      | merchant_id | name          | contact_no  | address  | status |
      | 505         | France Cargo  | 33358975556 | France   | 2      |


  Scenario Outline: admin Send a POST request to the api/shop/add endpoint with valid authorization and incomplete data, verify
  that the response status code is 400 and the message in the response body is 'No merchant id.'

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<contact_no>","<address>" and <status> information to send to the api shopadd endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".
    # Api kullanicisi response bodydeki message bilgisinin "No merchant id." oldugunu dogrular

    Examples:
      | name          | contact_no  | address  | status |
      | France Cargo  | 33358975556 | France   | 2      |


  Scenario Outline: admin Send invalid merchant_id POST request to the api/shop/add endpoint with valid authorization, verify that the response
  status code is 400 and the message in the response body is 'there is no merchant with this id.'

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>,"<name>", "<contact_no>","<address>" and <status> information to send to the api shopadd endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".
    # Api kullanicisi response bodydeki message bilgisinin "there is no merchant with this id." oldugunu dogrular

    Examples:
      | merchant_id | name         | contact_no  | address | status |
      | 1000        | France Cargo | 33358975556 | France  | 2      |



  Scenario Outline: Invalid Token Send a POST request to the api/shop/add endpoint with invalid authorization and correct data
  (merchant_id, name, contact_no, address, status), verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>,"<name>", "<contact_no>","<address>" and <status> information to send to the api shopadd endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
        # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | merchant_id | name          | contact_no  | address  | status |
      | 505         | France Cargo  | 33358975556 | France   | 2      |



