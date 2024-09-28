package stepdefinitions.deliverymanStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.builder.RequestSpecBuilder;
import stepdefinitions.API_Stepdefinitions;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.Authentication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class deliverymanStepDef extends BaseTest {

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(int dataIndex, int user_id, int status, String delivery_charge, String pickup_charge,
                                                                                                                            String return_charge, String current_balance, String opening_balance, String driving_license_image_id,
                                                                                                                            String created_at, String updated_at) {
        repJP = response.jsonPath();

        assertEquals(user_id, repJP.getInt("[" + dataIndex + "].user_id"));
        assertEquals(status, repJP.getInt("[" + dataIndex + "].status"));
        assertEquals(delivery_charge, repJP.getString("[" + dataIndex + "].delivery_charge"));
        assertEquals(pickup_charge, repJP.getString("[" + dataIndex + "].pickup_charge"));
        assertEquals(return_charge, repJP.getString("[" + dataIndex + "].return_charge"));
        assertEquals(current_balance, repJP.getString("[" + dataIndex + "].current_balance"));
        assertEquals(opening_balance, repJP.getString("[" + dataIndex + "].opening_balance"));
        assertEquals(created_at, repJP.getString("[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("[" + dataIndex + "].updated_at"));
        if ("null".equals(driving_license_image_id)) {
            assertNull(repJP.getString("[" + dataIndex + "].driving_license_image_id"));
        } else {
            assertEquals(driving_license_image_id, repJP.getString("[" + dataIndex + "].driving_license_image_id"));
        }
    }

    @Given("The api user verifies that the data in the response body includes {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(int id, int user_id, int status, String delivery_charge, String pickup_charge,
                                                                                  String return_charge, String current_balance, String opening_balance, String driving_license_image_id,
                                                                                  String created_at, String updated_at) {
        response.then()
                .assertThat()
                .body("data[0].id", equalTo(id),
                        "data[0].user_id", equalTo(user_id),
                        "data[0].status", equalTo(status),
                        "data[0].delivery_charge", equalTo(delivery_charge),
                        "data[0].pickup_charge", equalTo(pickup_charge),
                        "data[0].return_charge", equalTo(return_charge),
                        "data[0].current_balance", equalTo(current_balance),
                        "data[0].opening_balance", equalTo(opening_balance),
                        "data[0].created_at", equalTo(created_at),
                        "data[0].updated_at", equalTo(updated_at)
                );

        if ("null".equals(driving_license_image_id)) {
            response.then()
                    .assertThat()
                    .body("data[0].driving_license_image_id", nullValue());
        } else {
            response.then()
                    .assertThat()
                    .body("data[0].driving_license_image_id", equalTo(driving_license_image_id));
        }
    }

    @Given("The api user verifies that the {string},{string},{string} is {int}, {string}, {string} by sending a GET request to the {string} {string} endpoint with the {string} {string} returned in the response body.")
    public void the_api_user_verifies_that_the_is_by_sending_a_get_request_to_the_endpoint_with_the_returned_in_the_response_body(String path1, String path2, String path3, int value1, String value2, String value3, String pp1, String pp2, String data, String reponseId) {
        verification1(pp1, pp2, data, reponseId, path1, path2, path3, value1, value2, value3);
    }


    @Given("The api user prepares a POST request containing {string} information to send to the api deliverymanfilter endpoint.")
    public void the_api_user_prepares_a_post_request_containing_information_to_send_to_the_api_deliveryman_filter_endpoint(String email) {

        API_Stepdefinitions.requestBody = builder.addParameterForMap("email", email).buildUsingMap();

        System.out.println("POST Request Body : " + API_Stepdefinitions.requestBody);

    }


    public static void verification1(String pp1, String pp2, String dataKey, String responseIdKey, String path1, String path2, String path3, Object value1, Object value2, Object value3) {
        repJP = response.jsonPath();

        Object data = repJP.get(dataKey);  // "data" alanını elde ediyoruz

        Object idValue = null;

        if (data instanceof List) {
            // Eğer "data" bir dizi ise
            List<Map<String, Object>> dataList = (List<Map<String, Object>>) data;
            idValue = dataList.get(0).get(responseIdKey);

        } else if (data instanceof Map) {
            // Eğer "data" bir obje ise
            Map<String, Object> dataMap = (Map<String, Object>) data;
            idValue = dataMap.get(responseIdKey);
        }

        int id = 0;

        if (idValue instanceof String) {
            id = Integer.parseInt((String) idValue);
        } else {
            id = (Integer) idValue;
        }
        System.out.println(responseIdKey + " : " + id);

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();
        spec.pathParams("pp1", pp1, "pp2", pp2, "pp3", id);


        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .header("Authorization", "Bearer " + Authentication.generateToken("admin"))
                .when()
                .get("/{pp1}/{pp2}/{pp3}");

        response.then()
                .assertThat()
                .body(path1, equalTo(value1),
                        path2, equalTo(value2),
                        path3, equalTo(value3));

        System.out.println(value1);
        System.out.println(value2);
        System.out.println(value3);
    }
}

