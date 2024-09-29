Feature: As an administrator (admin), I want to be able to update Delivery man information with the specified id number via API connection.

  Scenario Outline: admin Deliveryman When a PATCH body with valid authorization information and correct (id) and correct data (name, mobile, email, address, delivery_charge, pickup_charge, return_charge) is sent to the api/deliveryman/edit/{id} endpoint, it should be verified that the status code returned is 200 and the message information in the response body is "Updated".

    * The api user sets "api/deliveryman/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<mobile>", "<email>", "<password>", "<address>", <hub_id>  and <status> information to send to the api deliverymanadd endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "message" information in the response body is "Updated".
    * The api user verifies that the "Delivery Man" "id" information in the returned response body is the same as the id path parameter written in the endpoint.
    Examples:
      | id  | name             | mobile     | email                            | password | address       | hub_id | status |
      | 466 | burhanTestUpdate | 0987654321 | updateburhantest@deliveryman.com | 123123   | New York City | 1      | 1      |


  Scenario Outline: admin When a PATCH request is sent to the api/deliveryman/edit/{id} endpoint with valid authorization information with the correct (id) and no data, it should be verified that the status code returned is 400 and the message information in the response body is "No data to update".
    * The api user sets "api/deliveryman/edit/<id>" path parameters.
    * The api user prepares a PATCH request containing no information to send to the api deliverymanedit endpoint.
    * The api user sends a "PATCH" request, saves the returned response, and verifies that the status code is '400' with the reason phrase Bad Request.
    # * The api user verifies that the "message" information in the response body is "No data to update".

    Examples:
      | id  |
      | 466 |


  Scenario Outline: admin When a PATCH body (name, mobile, email, address, delivery_charge, pickup_charge, return_charge) without an (id) is sent to the api/deliveryman/edit/{id} endpoint with valid authorization information, the status code returned is 203 and the message in the response body is "No id.",
    * The api user sets "api/deliveryman/edit" path parameters.
    * The api user prepares a PATCH request containing "<name>", "<mobile>", "<email>", "<address>", "<delivery_charge>", "<pickup_charge>"  and "<return_charge>" information to send to the api deliverymanedit endpoint.
    * The api user sends a "PATCH" request and saves the returned response.
    * The api user verifies that the status code is 203.
    * The api user verifies that the "message" information in the response body is "No id.".


    Examples:
      | name             | mobile     | email                            | address | delivery_charge | pickup_charge | return_charge |
      | burhanTestUpdate | 0987654321 | updateburhantest@deliveryman.com | Atlanta | 100.00          | 200.00        | 30.00         |

