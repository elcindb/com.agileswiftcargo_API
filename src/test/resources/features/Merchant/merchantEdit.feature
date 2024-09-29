Feature: As an administrator (admin), I want to be able to update the information of the hub with the specified id number via the API connection.

  @TC_2001
  Scenario Outline: admin Merchant Send a PATCH request to the api/merchant/edit/{id} endpoint with valid authorization, correct id, and data
  (business_name, mobile, email), verify that the response status code is 200, the message is 'Updated', and the id in the
  response body matches the id in the path. Then, confirm the update by sending a GET request to api/merchant/{id} using
  the same id.

    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<business_name>", "<mobile>" ve "<email>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular


    Examples:
      | id  | business_name | mobile      | email                  |
      | 545 | merchant_Test | 12345678978 | merchantedit@gmail.com |

  @TC_2002
  Scenario Outline: admin When a PATCH request is sent to the api/merchant/edit/{id} endpoint with valid authorization information with the correct (id) and no data, it should be verified that the status code returned is 400 and the message information in the response body is "No data to update".
    * The api user sets "api/merchant/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing no information to send to the api merchantedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.
    Examples:
      | id  |
      | 525 |

  @TC_2003
  Scenario Outline: admin When a PATCH body (business_name, mobile, email) without an (id) is sent to the api/merchant/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the message in the response body is "there is no merchant with this id.",
    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<business_name>", "<mobile>" ve "<email>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular


    Examples:
      | business_name | mobile      | email                  |
      | merchant_Test | 12345678978 | merchantedit@gmail.com |

  @TC_2004
  Scenario Outline: Invalid Token Send a GET request to the api/merchant/list endpoint with invalid authorization, verify that the response
  status code is 400 and the message in the response body is 'Unauthenticated.'

    * The api user sets "api/merchant/edit/<id>" path parameters.
    # Api kullanicisi "api/merchant/edit/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<business_name>", "<mobile>" and "<email>" information to send to the api merchantedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<business_name>", "<mobile>" ve "<email>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is, "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular


    Examples:
      | business_name | mobile      | email                  |
      | merchant_Test | 12345678978 | merchantedit@gmail.com |