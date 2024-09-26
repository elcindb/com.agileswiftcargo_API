package stepdefinitions.deliverymanStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.hamcrest.Matchers;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class deliverymanStepDef extends BaseTest {

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer int1, Integer int2, Integer int3, String string, String string2, String string3, String string4, String string5, String string6, String string7) {


    }

    @Given("The api user verifies that the data in the response body includes {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string},{string} {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(int id, int userId, int status, String deliveryCharge, String pickupCharge, String returnCharge, String currentBalance, String openingBalance, String drivingLicenseImageId, String createdAt, String updatedAt) {
        response.then()
                .assertThat()
                .body("data[0].id", equalTo(id),
                        "data[0].user_id", equalTo(userId),
                        "data[0].status", equalTo(status),
                        "data[0].delivery_charge", equalTo(deliveryCharge),
                        "data[0].pickup_charge", equalTo(pickupCharge),
                        "data[0].return_charge", equalTo(returnCharge),
                        "data[0].current_balance", equalTo(currentBalance),
                        "data[0].opening_balance", equalTo(openingBalance),
                        "data[0].driving_license_image_id", Matchers.nullValue(),
                        "data[0].created_at", equalTo(createdAt),
                        "data[0].updated_at", equalTo(updatedAt));
    }
}

