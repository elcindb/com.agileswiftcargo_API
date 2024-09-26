Feature: As an administrator (admin) I want to be able to create a new hub record via API connection.

  Scenario Outline: admin Send a POST request to the api/hub/add endpoint with valid authorization and the correct data
  (name, phone, address), verify that the response status code is 200 and the message in the response body is
  'Hub is added'. Then, confirm the creation of the new hub by sending a GET request to the api/hub/{id} endpoint
  using the 'New Hub ID' from the response.

    * The api user sets "api/hub/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<phone>" and "<address>" information to send to the api hubadd endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "Hub is added".
    # Api kullanicisi response bodydeki message bilgisinin "Hub is added" oldugunu dogrular
    * The api user verifies that the "name" is "Test Hub" by sending a GET request to the "api" "hub" endpoint with the "data" "New Hub ID" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "New Hub ID" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Test Hub" oldugunu dogrular

    Examples:
      | name       | phone       | address        |
      | Test Hub   | 01000000004 | Houston, Texas |
      | selehattin | 123123132   | sinop          |
