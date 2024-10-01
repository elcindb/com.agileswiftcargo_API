Feature: As an administrator (admin) I want to be able to access the parcel list via API connection.


  Scenario Outline: admin When a GET request is sent to the api/parcel/list endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “Success”., When a GET request is sent to the api/parcel/list endpoint with valid authorization information, the information (merchant_id, merchant_shop_id, pickup_address, pickup_phone, customer_name, customer_phone, customer_address, invoice_no, category_id, weight, delivery_type_id, packaging_id, first_hub_id, hub_id, transfer_hub_id, cash_collection) returned in the response body of id(x) should be verified.

    * The api user sets "api/parcel/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, <merchant_shop_id>, "<pickup_address>", "<pickup_phone>", "<customer_name>", "<customer_phone>", "<customer_address>", <category_id>, <weight> ,<delivery_type_id> ,<first_hub_id>.

    Examples:
      | dataindex | merchant_id | merchant_shop_id | pickup_address | pickup_phone  | customer_name    | customer_phone | customer_address | category_id | weight | delivery_type_id | first_hub_id |
      | 1         | 8           | 12               | New York City  | 0254485485445 | Gedson Fernandes | 5555555555555  | Denizli          | 1           | 1      | 2                | 1            |





  @ab
  Scenario: Invalid Token Send a GET request to the api/parcel/list endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'


    * The api user sets "api/parcel/list" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
