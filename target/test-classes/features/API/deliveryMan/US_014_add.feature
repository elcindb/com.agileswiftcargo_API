Feature: As an administrator (admin) I want to be able to create a new Delivery man record via API connection.


  Scenario Outline: admin When a POST body with valid authorization information and correct data (name, mobile, email, password, address, hub_id, status) is sent to the api/deliveryman/add endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "New Delivery Man Added".

    * The api user sets "api/deliveryman/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<mobile>", "<email>", "<password>", "<address>", <hub_id>  and <status> information to send to the api deliverymanadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "New Delivery Man Added".
    * The api user verifies that the "data[0].user.id" is 1115 by sending a GET request to the "api" "deliveryman" endpoint with the "data" "deliveryman id" returned in the response body.

    Examples:
      | name       | mobile      | email                      | password | address       | hub_id | status |
      | burhanTest | 12589634780 | burhantest@deliveryman.com | 123123   | New York City | 1      | 1      |


  Scenario Outline: invalid token When a POST body containing correct data (name, mobile, email, password, address, hub_id, status) with invalid authorization information is sent to the api/deliveryman/add endpoint, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".    * The api user sets "api/deliveryman/add" path parameters.
    * The api user sets "api/deliveryman/add" path parameters.
    * The api user prepares a POST request containing "<name>", "<mobile>", "<email>", "<password>", "<address>", <hub_id>  and <status> information to send to the api deliverymanadd endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    Examples:
    Examples:
      | name       | mobile      | email                      | password | address       | hub_id | status |
      | burhanTest | 12589634780 | burhantest@deliveryman.com | 123123   | New York City | 1      | 1      |
