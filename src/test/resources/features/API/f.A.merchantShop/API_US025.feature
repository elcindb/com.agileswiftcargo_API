Feature: As an administrator (admin) I want to be able to create a new Shop record via API connection.

  Scenario Outline: admin Send a POST request to the api/shop/add endpoint with valid authorization and the correct data
  (merchant_id, name, contact_no, address, status), verify that the response status code is 200 and the message in the response body is
  'New Shop Added'. Then, confirm the creation of the new hub by sending a GET request to the api/shop/{id} endpoint
  using the 'New Shop ID' from the response.


    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing "<merchant_id>","<name>", "<contact_no>","<address>" and "<status>" information to send to the api shopadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Shop Added".
    * The api user verifies that the "name" is "GLB Cargo" by sending a GET request to the "api" "shop" endpoint with the "data" "New Shop ID" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "New Hub ID" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Test Hub" oldugunu dogrular




    Examples:
      | merchant_id | name       | contact_no  | address        | status |
      | 1           | GLB Cargo  | 01000000004 | Houston, Texas | 1      |
