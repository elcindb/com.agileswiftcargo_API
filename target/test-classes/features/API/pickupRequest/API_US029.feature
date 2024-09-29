Feature:As an administrator (admin) I want to be able to access the entire regular pickup list via API connection.

  Scenario Outline: admin When a GET request is sent to the api/pickuprequest/regular endpoint with valid authorization information, it should be verified that the status code returned is 200.

    * The api user sets "api/pickuprequest/regular" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataindex> index, including <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoice>", <weight>, <exchange>, "<created_at>" and "<updated_at>".
    # Api kullanıcısı response body icindeki <dataindex> indexe sahip olanin <id>, "<request_type>", <merchant_id>, "<adress>", "<note>", <parcel_quantity>, "<name>", "<phone>", "<cod_amount>", "<invoive>", <weight>, <exchange>, "<created_at>" ve "<updated_at>" bilgilerini doğrular.

    Examples:
      | dataindex | id  | request_type | merchant_id | adress        | note             | parcel_quantity | name | phone | cod_amount | invoice | weight | exchange | created_at                  | updated_at                  |
      | 0         | 134 | 1           | 2         | null | En toute sécurité | 0              | null | null  | 0.00      | null    | 0      | 0        | 2024-09-27T16:03:28.000000Z | 2024-09-27T16:03:28.000000Z |


  Scenario: Invalid Token When a GET request is sent to the api/pickuprequest/regular endpoint with invalid authorization information, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".

    * The api user sets "api/pickuprequest/regular" path parameters.
    # Api kullanicisi "api/hub/list" path parametrelerini olusturur
    * The api user sends a "GET" request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular