Feature: As an administrator (admin), I want to be able to access the Parcel List via an API connection.


  Scenario Outline: admin sends a GET request to the api/parcel/list endpoint with valid authorization
    * The api user sets "api/parcel/list" path parameters.
    * The api user sends a "GET" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Success".
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <merchant_id>, "<merchant_shop_id>", "<pickup_address>", "<pickup_phone>", "<customer_name>", "<customer_phone>", "<customer_address>", "<invoice_no>", <category_id>, <weight>, <delivery_type_id>, <packaging_id>, <first_hub_id>, <hub_id>, <transfer_hub_id>, and "<cash_collection>".

    Examples:
      | dataindex | merchant_id | merchant_shop_id | pickup_address | pickup_phone  | customer_name | customer_phone | customer_address | invoice_no | category_id | weight | delivery_type_id | packaging_id | first_hub_id | hub_id | transfer_hub_id | cash_collection |
      | 0         | 8           | 12               | New York City  | 0254485485445 | gizm          | 245252345234   | 4trt             | 8676       | 1           | 1      | 1                | 3            | 1            | 1      | null            | 50.00           |


  Scenario: Invalid Token Send a GET request to the api/parcel/list endpoint with invalid authorization, verify that the response
  status code is 401 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/parcel/list" path parameters.
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.