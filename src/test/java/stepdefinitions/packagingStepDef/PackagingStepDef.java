package stepdefinitions.packagingStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;
import org.junit.Assert.*;
import stepdefinitions.API_Stepdefinitions;

import static org.junit.Assert.*;

public class PackagingStepDef extends BaseTest {

    //US38 first scenario
    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {int}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(Integer dataIndex, String name, String price, Integer status, String position, String photo, String created_at, String updated_at) {
        repJP = response.jsonPath();
        assertEquals(name, repJP.getString("data[" + dataIndex + "].name"));
        assertEquals(price, repJP.getString("data[" + dataIndex + "].price"));
        assertEquals(status.longValue(), repJP.getInt("data[" + dataIndex + "].status"));
        assertEquals(position, repJP.getString("data[" + dataIndex + "].position"));
        if (photo.equals("null")) {
            assertNull(repJP.get("data[" + dataIndex + "].photo"));
        }else {
            assertEquals(photo, repJP.get("data[" + dataIndex + "].photo") );
        }
        assertEquals(created_at, repJP.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, repJP.getString("data[" + dataIndex + "].updated_at"));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} id, including {string}, {string}, {int}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_id_including(Integer id, String name, String price, Integer status, String position, String photo, String created_at, String updated_at) {
        repJP = response.jsonPath();
        assertEquals(id.longValue(), repJP.getInt("id"));
        assertEquals(name, repJP.getString("name"));
        assertEquals(price, repJP.getString("price"));
        assertEquals(status.longValue(), repJP.getInt("status"));
        assertEquals(position, repJP.getString("position"));
        if (photo.equals("null")){
            assertNull(repJP.get("photo"));
        } else assertEquals(photo, repJP.get("photo"));
        assertEquals(created_at, repJP.getString("created_at"));
        assertEquals(updated_at, repJP.getString("updated_at"));

    }

    @Given("The api user prepares a POST request containing {string}, {string}, {int}, {string}.")
    public void the_api_user_prepares_a_post_request_containing(String name, String price, Integer status, String position) {

        API_Stepdefinitions.requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("price", price)
                .addParameterForMap("status", status)
                .addParameterForMap("position", position)
                .buildUsingMap();

        System.out.println("POST Request Body : " + API_Stepdefinitions.requestBody);
    }

    @Given("The api user prepares a POST request containing only {string}, {string}.")
    public void the_api_user_prepares_a_post_request_containing_only(String name, String price) {
        API_Stepdefinitions.requestBody = builder
                .addParameterForMap("name", name)
                .addParameterForMap("price", price)
                .buildUsingMap();

        System.out.println("POST Request Body : " + API_Stepdefinitions.requestBody);
    }

    @Given("The api user prepares a POST request containing no data.")
    public void the_api_user_prepares_a_post_request_containing_no_data() {
        API_Stepdefinitions.requestBody = builder.buildUsingMap();

        System.out.println("POST Request Body : " + API_Stepdefinitions.requestBody);
    }

    @Given("The api user verifies that the id in the response body returned is the same as the {int} path parameter.")
    public void the_api_user_verifies_that_the_id_in_the_response_body_returned_is_the_same_as_the_path_parameter(Integer id) {
        repJP = response.jsonPath();
        assertEquals(id.longValue(), repJP.getInt("data[0].id"));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} id, including {string}, {string}")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_id_including(Integer id, String name, String price) {

        repJP = response.jsonPath();
        assertEquals(id.longValue(), repJP.getInt("id"));
        assertEquals(name, repJP.getString("name"));
        assertEquals(price, repJP.getString("price"));

    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} id")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_id(Integer id) {

        String string = response.prettyPrint();

        assertTrue(string.contains(id.toString()));


    }
}
