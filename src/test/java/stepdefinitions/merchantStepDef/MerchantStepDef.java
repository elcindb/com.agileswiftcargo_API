package stepdefinitions.merchantStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;
import stepdefinitions.API_Stepdefinitions;
import utilities.API_Utilities.API_Methods;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

public class MerchantStepDef extends BaseTest {
    @Given("The api user verifies the information in the response body for the entry with the specified {string} index, including ,{string},{string},{string},{string},{string},{string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(String dataIndex, String userId, String business_name, String merchant_unique_id, String current_balance, String opening_balance, String vat) {
        repJP=response.jsonPath();
        assertEquals(userId, repJP.getString("[" + dataIndex + "].user_id"));
        assertEquals(business_name, repJP.getString("[" + dataIndex + "].business_name"));
        assertEquals(merchant_unique_id, repJP.getString("[" + dataIndex + "].merchant_unique_id"));
        assertEquals(current_balance, repJP.getString("[" + dataIndex + "].current_balance"));
        assertEquals(opening_balance, repJP.getString("[" + dataIndex + "].opening_balance"));
        assertEquals(vat, repJP.getString("[" + dataIndex + "].vat"));

    }


    @Given("The api user verifies that the data in the response body includes {int}, {int}, {string}, {string}, {string}, {string},and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(Integer id, int user_id, String business_name, String merchant_unique_id, String current_balance, String opening_balance, String vat) {
        response.then().assertThat()
                .body("id",equalTo(id),
                        "user_id",equalTo(user_id),
                        "business_name",equalTo(business_name),
                        "merchant_unique_id",equalTo(merchant_unique_id),
                        "current_balance",equalTo(current_balance),
                        "opening_balance",equalTo(opening_balance),
                        "vat",equalTo(vat));

    }

    @Given("The api user prepares a POST request containing {string},{string}, {string}, {string}, {string}, {string}, {string}  and {string} information to send to the api merchantadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_merchantadd_endpoint(String name, String business_name, String mobile, String email, String password, String address, String hub_id, String status) {
        API_Stepdefinitions.requestBody = builder
                .addParameterForMap("business_name",business_name)
                .addParameterForMap("name", name)
                .addParameterForMap("mobile", mobile)
                .addParameterForMap("email", email)
                .addParameterForMap("password", password)
                .addParameterForMap("address", address)
                .addParameterForMap("hub_id", hub_id)
                .addParameterForMap("status", status)
                .buildUsingMap();

        System.out.println("POST Request Body : " + API_Stepdefinitions.requestBody);
    }
    @Given("The api user prepares a PATCH request containing {string}, {string} and {string} information to send to the api merchantedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_and_information_to_send_to_the_api_merchantedit_endpoint(String business_name, String mobile, String email) {
        API_Stepdefinitions.requestBody = builder
                .addParameterForJSONObject("business_name",business_name)
                .addParameterForJSONObject("mobile",mobile)
                .addParameterForJSONObject("email",email)
                .buildUsingJSONObject();
        System.out.println("PATCH Request Body : " + API_Stepdefinitions.requestBody);
    }
    @Given("The api user prepares a PATCH request containing no information to send to the api merchantedit endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_no_information_to_send_to_the_api_merchantedit_endpoint() {
        API_Stepdefinitions.requestBody = builder.buildUsingMap();
        System.out.println(API_Stepdefinitions.requestBody);
    }
    @Given("The api user verifies that the {string} information in the response body is, {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {

        API_Methods.assertBody(key,value);

    }


}
