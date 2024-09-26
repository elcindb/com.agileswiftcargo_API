The api user sets "api/hub/edit" path parameters.
    # Api kullanicisi "api/hub/edit/{id}" path parametrelerini olusturur
* The api user prepares a PATCH request containing "<name>", "<phone>" and "<address>" information to send to the api hubedit endpoint.
    # Api kullanicisi api hubedit endpointine gondermek icin "<name>", "<phone>" ve "<address>" bilgilerini iceren bir patch request hazirlar
* The api user sends a "PATCH" request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
* The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
* The api user verifies that the "message" information in the response body is "Updated".
    # Api kullanicisi response bodydeki message bilgisinin "Updated" oldugunu dogrular
* The api user verifies that the "data" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    # Api kullanicisi donen response body icindeki "data" "id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular
* The api user verifies that the "name" is "Updated Hub" by sending a GET request to the "api" "hub" endpoint with the "data" "id" returned in the response body.
    # Api kullanicisi response bodyde donen "data" "id" ile "api" "hub" endpoint'ine GET request göndererek "name" bilgisinin "Updated Hub" oldugunu dogrular
