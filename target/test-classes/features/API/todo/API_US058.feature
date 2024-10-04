Feature: As an administrator (admin) I want to be able to create a new todo record via API connection.
  @TC_5801
  Scenario Outline: admin TC01 Validation of Sending POST request and adding new register

    * The api user sets "api/todo/add" path parameters.
    # Api kullanicisi "api/hub/add" path parametrelerini olusturur
    * The api user prepares a POST request containing "<name>", "<description>", "<user_id>" and "<date>" information to send to the api hubadd endpoint.
    # Api kullanicisi api hubadd endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir post request hazirlar
    * The api user sends a "POST" request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "message" information in the response body is "New ToDo Added".
    # Api kullanicisi response bodydeki message bilgisinin "Hub is added" oldugunu dogrular
    * The api user verifies that the "name" is "France Carg" by sending a GET request to the "api" "todo" endpoint with the "data" "New ToDo ID" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "New Hub ID" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Test Hub" oldugunu dogrular

    Examples:
      | name          | description  | user_id  | date |
      | France Carg  | abc | 22542   | 20170502      |
    #title, description, user_id, date
  @TC_5802
  Scenario Outline: Invalid Token Send a POST request to the api/todo/add endpoint with invalid authorization and correct data
  (title, description, user_id, date), verify that the response status code is 401 and the message in the response body is
  'Unauthenticated.'

    * The api user sets "api/shop/add" path parameters.
    * The api user prepares a POST request containing <title>,"<description>", "<user_id>" and "<date>" information to send to the api todo endpoint.
    * The api user sends a POST request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
        # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title | description          | user_id  | date  |
      | cargocu  | France Cargo  | 33358975559 | 25092024   |