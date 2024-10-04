Feature: As an administrator (admin) I want to be able to create a new Merchant record via API connection.

  @TC_1901
  Scenario Outline: admin When a POST body with valid authorization information and correct data (name, business_name, mobile, email, password, address, hub_id, status) is sent to the api/merchant/add endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "New Merchant Added".

    * The api user sets "api/merchant/add" path parameters.
    * The api user prepares a POST request containing "<name>","<business_name>", "<mobile>", "<email>", "<password>", "<address>", "<hub_id>"  and "<status>" information to send to the api merchantadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Merchant Added".


    Examples:
      | name           | business_name | mobile      | email              | password | address  | hub_id | status |
      | Ilgar Ganbarov | Granula GMBH  | 12345678999 | merchant@gmail.com | 12345    | New York | 5      | 5      |
      @TC_1902
  Scenario Outline:Invalid Token Send a POST request to the api/merchant/add endpoint with invalid authorization, verify that the response
      status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/merchant/add" path parameters.
    * The api user prepares a POST request containing "<name>","<business_name>", "<mobile>", "<email>", "<password>", "<address>", "<hub_id>"  and "<status>" information to send to the api merchantadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | name           | business_name | mobile      | email              | password | address  | hub_id | status |
      | Ilgar Ganbarov | Granula GMBH  | 12345678999 | merchant@gmail.com | 12345    | New York | 5      | 5      |