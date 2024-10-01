Feature: As an administrator (admin), I want to be able to access the detailed information of the Parcel with the specified id number via the API connection.

  Scenario Outline: admin a GET request with valid authorization information and correct data (id)
  is sent to the api/parcel/{id} endpoint, the data in the response body (id, merchant_id, merchant_shop_id, pickup_address,
  pickup_phone, customer_name, customer_phone, customer_address, invoice_no, category_id, weight, delivery_type_id, packaging_id,
  first_hub_id, hub_id, transfer_hub_id, cash_collection) should be verified.

    * The api user sets "api/parcel/<id>" path parameters.
    # Api kullanicisi "api/parcel/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "success" information in the response body is the "true".
    # Api kullanicisi response bodydeki message bilgisinin "true" oldugunu dogrular
    * The api user verifies that the parcel details in the response body match the expected values, including "<id>", "<merchant_id>", "<merchant_shop_id>", "<pickup_address>", "<pickup_phone>", "<customer_name>", "<customer_phone>", "<customer_address>", "<invoice_no>", "<category_id>", "<weight>", "<delivery_type_id>", "<packaging_id>", "<first_hub_id>", "<hub_id>", "<transfer_hub_id>", and "<cash_collection>".

    Examples:
      | id   | merchant_id | merchant_shop_id | pickup_address | pickup_phone | customer_name  | customer_phone | customer_address | invoice_no | category_id | weight | delivery_type_id | packaging_id | first_hub_id | hub_id | transfer_hub_id | cash_collection |
      | 0         | 8           | 12               | New York City  | 0254485485445 | gizm          | 245252345234   | 4trt             | 8676       | 1           | 1      | 1                | 3            | 1            | 1      | null            | 50.00           |

  @ug
  Scenario: Invalid Token Send a GET request to the  api/parcel/{id} endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/parcel/<id>" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.


  Scenario: admin Send a GET request to the api/parcel/{id} endpoint without an id and with valid authorization, verify that the
  response status code is 203 and the message in the response body is 'No id.'

    * The api user sets "api/parcel" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


  Scenario Outline: admin Send a GET request to the api/parcel/{id} endpoint with valid authorization and a non-existent id,
  verify that the response status code is 203 and the message in the response body is 'there is no parcel with this id'

    * The api user sets "api/parcel/<id>" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "there is no parcel with this id".

    Examples:
      | id   |
      | 1111 |