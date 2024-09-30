Feature: As an administrator (admin) I want to be able to create a new express pickup record via API connection.


  Scenario Outline: admin Send a POST request to the api/pickuprequest/regular/add endpoint with valid authorization and the correct data
  (name, phone, address), verify that the response status code is 200 and the message in the response body is
  'Hub is added'. Then, confirm the creation of the new hub by sending a GET request to the api/pickuprequest/regular/add/{id} endpoint
  using the 'New Hub ID' from the response.

    * The api user sets "api/pickuprequest/express/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin <merchant_id>, "<address>"  "<name>" ve "<phone>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Pickup Request Added".

    Examples:
      | merchant_id | address       | name            | phone     |
      | 2       | Aix en Provence | Sena Didici | 12345678910 |



  Scenario Outline: admin When a POST body (merchant_id,address,name,phone) with valid authorization information and missing data (merchant_id) is sent to api/pickuprequest/regular/add endpoint,
  the status code returned is 400 and the message in the response body is "No merchant id."

    * The api user sets "api/pickuprequest/express/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
        # Api kullanicisi api hubadd endpointine gondermek icin <merchant_id>, "<address>"  "<name>" ve "<phone>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "No merchant id.".

    Examples:
      | merchant_id | address       | name            | phone     |
      | 2           | Aix en Provence  | Sena Didici | 12345678910 |



  Scenario Outline: admin When sending a POST body (merchant_id, adress, name, phone) with invalid merchant_id, it should be verified that the status code returned is 400
  and the message in the response body is "there is no merchant with this id.".

    * The api user sets "api/pickuprequest/regular/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
        # Api kullanicisi api hubadd endpointine gondermek icin <merchant_id>, "<address>"  "<name>" ve "<phone>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 400.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "there is no merchant with this id.".

    Examples:
      | merchant_id | address       | name            | phone     |
      | 12345678910   | Aix en Provence | Sena Didici | 12345678910 |



  Scenario Outline: Invalid Token Send a POST request to the api/pickuprequest/regular/add endpoint with invalid authorization and correct data
  (merchant_id, adress, name, phone), verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/pickuprequest/express/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing <merchant_id>, "<address>", "<name>" and "<phone>" information to send to the api pickuprequestexpress add endpoint.
        # Api kullanicisi api hubadd endpointine gondermek icin <merchant_id>, "<address>"  "<name>" ve "<phone>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | merchant_id | address       | name            | phone     |
      | 2         | Aix en Provence | Sena Didici | 12345678910 |

  Scenario Outline: admin The new express pickup record to be created from the API must be verified from the API.
  (It can be verified that the record was created by sending a GET request to the api/pickuprequest/express/add/ endpoint with the "New Pickup Request  ID" returned in the response body).

    * The api user sets "api/pickuprequest/express/add/<id>" path parameters.
    # Api kullanicisi "api/pickuprequest/express/add/{id}" path parametrelerini olusturur
    * The api user sends a "GET" request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id  |
      | 133 |