package stepdefinitions.deliverymanStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;

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
}

