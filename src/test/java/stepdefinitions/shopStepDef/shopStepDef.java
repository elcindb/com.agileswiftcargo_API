package stepdefinitions.shopStepDef;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.hamcrest.Matchers;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

public class shopStepDef extends BaseTest {

    Gson gson = new Gson();

    String requestBody;

    String mesaj = null;


    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {string}, {string},{string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(Integer int1, Integer int2, String string, String string2, String string3, Integer int3, Integer int4, String string4, String string5) {

    }


    @Given("The api user verifies that the data in the response body includes {int}, {int}, {string}, {string}, {string}, {int}, {int}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(int id, int merchant_id, String name, String contact_no, String address, int status, int default_shop, String created_at, String updated_at) {

        response.then()
                .assertThat()
                .body("id", equalTo(id),
                        "merchant_id", equalTo(merchant_id),
                        "name", equalTo(name),
                        "contact_no", equalTo(contact_no),
                        "address", equalTo(address),
                        "status", equalTo(status),
                        "default_shop", equalTo(default_shop),
                        "created_at", equalTo(created_at),
                        "updated_at", equalTo(updated_at));
    }


        @Given("The api user prepares a POST request containing {int},{string}, {string},{string} and {int} information to send to the api shopadd endpoint.")
        public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_shopadd_endpoint(Integer merchant_id, String name, String contact_no, String address, Integer status) {

        requestBody = builder
                .addParameterForMap("merchant_id", merchant_id)
                .addParameterForMap("name", name)
                .addParameterForMap("contact_no", contact_no)
                .addParameterForMap("address", address)
                .addParameterForMap("status", status)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);

    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .when()
                .body(requestBody)
                .post(API_Methods.fullPath);

        response.prettyPrint();
    }


    @Given("The api user prepares a POST request containing {string}, {string},{string} and {int} information to send to the api shopadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_shopadd_endpoint(String name, String contact_no, String address, Integer status) {

        requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("contact_no", contact_no)
                .addParameterForMap("address", address)
                .addParameterForMap("status", status)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);


    }


    @Given("The api user prepares a patch request to send to the api shopedit endpoint.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_shopedit_endpoint() {

    }
    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {

    }
    @Given("The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint.")
    public void the_api_user_verifies_that_the_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {

    }






/*
     repJP = response.jsonPath();

        assertEquals(merchant_id, repJP.getInt("data[" + dataIndex + "].merchant_id"));
        assertEquals(name, repJP.getString("data[" + dataIndex + "].name"));
        assertEquals(contact_no, repJP.getString("data[" + dataIndex + "].contact_no"));
        assertEquals(address, repJP.getString("data[" + dataIndex + "].address"));
        assertEquals(status, repJP.getInt("data[" + dataIndex + "].status"));
        assertEquals(default_shop, repJP.getInt("data[" + dataIndex + "].default_shop"));
        assertEquals(created_at, repJP.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("data[" + dataIndex + "].updated_at"));
*/



    }