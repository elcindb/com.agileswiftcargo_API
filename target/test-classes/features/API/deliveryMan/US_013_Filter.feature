Feature: As an administrator (admin), I want to be able to filter among the deliverables (with email and name information) via API connection.


  Scenario Outline: admin When a POST body with valid authorization information and correct data (name or email) is sent to the api/deliveryman/filter endpoint, it should be verified that the status code returned is 200.

    * The api user sets "api/deliveryman/filter" path parameters.
    * The api user prepares a POST request containing "<email>" information to send to the api deliverymanfilter endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 200.
    * The api user verifies that the "data[0].user.id","data[0].user.name","data[0].user.email" is 993, "burhan.deliveryman", "burhan.deliveryman@agileswiftcargo.com" by sending a GET request to the "api" "deliveryman" endpoint with the "[0]" "id" returned in the response body.


    Examples:
      | email  |
      | burhan |

  @ab
  Scenario Outline: invalid token When a POST body with invalid authorization information and correct data (name or email) is sent to the api/deliveryman/filter endpoint, it should be verified that the status code returned is 401 and the message information in the response body is "Unauthenticated.".
    * The api user sets "api/deliveryman/filter" path parameters.
    * The api user prepares a POST request containing "<email>" information to send to the api deliverymanfilter endpoint.
    * The api user sends a "POST" request and saves the returned response.
    * The api user verifies that the status code is 401.
    * The api user verifies that the "message" information in the response body is "Unauthenticated.".
    Examples:
      | email  |
      | burhan |

