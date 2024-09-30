package stepdefinitions.pickupRequestStepDef;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import org.json.JSONObject;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class API_Stepdefinitions extends BaseTest {

    Gson gson = new Gson();
    JSONObject data;

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {int}, {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataindex, int id, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {

        repJP = response.jsonPath();

        assertEquals(id, repJP.getInt("[" + dataindex + "].id"));

        //request type null control
        if ("null".equals(request_type)) {
            assertNull(repJP.getString("[" + dataindex + "].request_type"));
        } else {
            assertEquals(request_type, repJP.getString("[" + dataindex + "].request_type"));
        }

        //merchant id
        assertEquals(merchant_id, repJP.getInt("[" + dataindex + "].merchant_id"));

        //address null control
        if ("null".equals(address)) {
            assertNull(repJP.getString("[" + dataindex + "].address"));
        } else {
            assertEquals(address, repJP.getString("[" + dataindex + "].address"));
        }

        //name null control
        if ("null".equals(name)) {
            assertNull(repJP.getString("[" + dataindex + "].name"));
        } else {
            assertEquals(name, repJP.getString("[" + dataindex + "].name"));
        }

        // note null control
        if ("null".equals(note)) {
            assertNull(repJP.getString("[" + dataindex + "].note"));
        } else {
            assertEquals(note, repJP.getString("[" + dataindex + "].note"));
        }

        //parcel quantity
        assertEquals(parcel_quantity, repJP.getInt("[" + dataindex + "].parcel_quantity"));

        // phone null control
        if ("null".equals(phone)) {
            assertNull(repJP.getString("[" + dataindex + "].phone"));
        } else {
            assertEquals(phone, repJP.getString("[" + dataindex + "].phone"));
        }

        // cod_amount null control
        if ("null".equals(cod_amount)) {
            assertNull(repJP.getString("[" + dataindex + "].cod_amount"));
        } else {
            assertEquals(cod_amount, repJP.getString("[" + dataindex + "].cod_amount"));
        }

        // invoice null control
        if ("null".equals(invoice)) {
            assertNull(repJP.getString("[" + dataindex + "].invoice"));
        } else {
            assertEquals(invoice, repJP.getString("[" + dataindex + "].invoice"));
        }

        //weight
        assertEquals(weight, repJP.getInt("[" + dataindex + "].weight"));

        //exchange
        assertEquals(exchange, repJP.getInt("[" + dataindex + "].exchange"));

        // created_at null control
        if ("null".equals(created_at)) {
            assertNull(repJP.getString("[" + dataindex + "].created_at"));
        } else {
            assertEquals(created_at, repJP.getString("[" + dataindex + "].created_at"));
        }

        // updated_at null control
        if ("null".equals(updated_at)) {
            assertNull(repJP.getString("[" + dataindex + "].updated_at"));
        } else {
            assertEquals(updated_at, repJP.getString("[" + dataindex + "].updated_at"));
        }
    }



    @Given("The api user verifies that the data in the response body includes {int}, {string}, {int}, {string}, {string}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes_and(int id, String request_type, int merchant_id, String address, String note, int parcel_quantity, String name, String phone, String cod_amount, String invoice, int weight, int exchange, String created_at, String updated_at) {
        API_Methods.assertBodyMatchers("id", id);
        API_Methods.assertBodyMatchers("request_type", request_type);
        API_Methods.assertBodyMatchers("merchant_id", merchant_id);
        API_Methods.assertBodyMatchers("address", address);
        API_Methods.assertBodyMatchers("note", note);
        API_Methods.assertBodyMatchers("parcel_quantity", parcel_quantity);
        API_Methods.assertBodyMatchers("name", name);
        API_Methods.assertBodyMatchers("phone", phone);
        API_Methods.assertBodyMatchers("cod_amount", cod_amount);
        API_Methods.assertBodyMatchers("weight", weight);
        API_Methods.assertBodyMatchers("exchange", exchange);
        API_Methods.assertBodyMatchers("created_at", created_at);
        API_Methods.assertBodyMatchers("updated_at", updated_at);

    }


    @Given("The api user prepares a POST request containing {int}, {string}, {string} and {string} information to send to the api pickuprequestexpress add endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_pickuprequestexpress_add_endpoint(int merchant_id, String address, String name, String phone) {
        requestBody.put("merchant_id", merchant_id);
        requestBody.put("address",address);
        requestBody.put("name",name);
        requestBody.put("phone",phone);
    }


    @Given("The api user prepares a POST request containing {int}, {string} and {int} information to send to the api pickuprequestregular add endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_pickuprequestregular_add_endpoint(int merchant_id, String note, Integer parcel_quantity) {
        requestBody.put("merchant_id", merchant_id);
        requestBody.put("note", note);
        requestBody.put("parcel_quantity", parcel_quantity);
    }

    @Given("The api user prepares a POST request containing {string} and {int} information to send to the api pickuprequestregular add endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_pickuprequestregular_add_endpoint(String note, int parcel_quantity) {

        requestBody.put("note", note);
        requestBody.put("parcel_quantity", parcel_quantity);
    }

    @Given("The api user prepares a PATCH request to send to the api {string} and {int} pickup request regular endpoint.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_hubedit_endpoint(String note,int parcel_quantity) {

        API_Common_Stepdefinitions.requestBody=builder
                .addParameterForJSONObject("note", note)
                .addParameterForJSONObject("parcel_quantity", parcel_quantity)
                .buildUsingJSONObject();
    }

    @Given("The api user prepares a {string} request that contains no data Hasan.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data(String request) {
        API_Common_Stepdefinitions.requestBody=builder
                .addParameterForJSONObject("note","")
                .addParameterForJSONObject("parcel_quantity", "")
                .buildUsingJSONObject();

    }

    @Given("The api user verifies that id is {string}")
    public void the_api_user_verifies_that_name_is(String value) {
        map = response.as(HashMap.class);
        API_Common_Stepdefinitions.requestBody = gson.toJson(map);
        Assert.assertEquals(value, map.get("id"));
    }

    @Given("The api user verifies that the id information in the returned response body is the same as the id path parameter written in the endpoint Hasan.")
    public void the_api_user_verifies_that_the_id_information_in_the_returned_response_body_is_the_same_as_the_id_path_parameter_written_in_the_endpoint() {
        repJP = response.jsonPath();

        Assert.assertEquals(API_Methods.id,repJP.getInt("data.[0]"));

    }


}

