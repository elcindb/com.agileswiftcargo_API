Feature: As an administrator (admin) I want to be able to create a new Parcel record via API connection.

  Scenario Outline: admin Send a POST request to the api/parcel/add endpoint with valid authorization and the correct data
  (merchant_id, merchant_shop_id, category_id, delivery_type_id, customer_name, customer_phone, customer_address),
  verify that the response status code is 200 and the message in the response body is 'Parcel is added'. Then, confirm the creation
  of the new hub by sending a GET request to the api/parcel/{id} endpoint using the 'Parcel ID' from the response.

    * The api user sets "api/parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, <merchant_shop_id>, <category_id>,<delivery_type_id>,"<customer_name>","<customer_phone>" and "<customer_address>" information to send to the api parcel add endpoint.
    * The api user sends a POST request and saves the returned response
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Parcel is added".
    * The api user verifies that the "customer_name" is "Kerim" by sending a GET request to the "api" "parcel" endpoint with the "data" "Parcel ID" returned in the response body.

    Examples:
      | merchant_id | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address |
      | 8           | 12               | 1           | 1                | Kerim         | 245252345234   | 4trt             |


  Scenario Outline: admin Send a POST request to the api/parcel/add endpoint with valid authorization and incomplete data, verify
  that the response status code is 400 and the message in the response body is 'No merchant id.'

    * The api user sets "api/parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_shop_id>, <category_id>, <delivery_type_id>, "<customer_name>", "<customer_phone>" and "<customer_address>" information to send to api parcel add endpoint.    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 400.
    * The api user verifies that the "message" information in the response body is "No merchant id.".
    # Api kullanicisi response bodydeki message bilgisinin "No merchant id." oldugunu dogrular

    Examples:
      | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address |
      | 12               | 1           | 1                | Kerim         | 245252345234   | 4trt             |


  Scenario Outline: Invalid Token Send a POST request to the api/parcel/add endpoint with invalid authorization and correct data
  (merchant_id, merchant_shop_id, category_id, delivery_type_id, customer_name, customer_phone, customer_address) verify that the response status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/parcel/add" path parameters.
    * The api user prepares a POST request containing <merchant_id>, <merchant_shop_id>, <category_id>,<delivery_type_id>,"<customer_name>","<customer_phone>" and "<customer_address>" information to send to the api parcel add endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".

    Examples:
      | merchant_id | merchant_shop_id | category_id | delivery_type_id | customer_name | customer_phone | customer_address |
      | 8           | 12               | 1           | 1                | Kerim         | 245252345234   | 4trt             |
