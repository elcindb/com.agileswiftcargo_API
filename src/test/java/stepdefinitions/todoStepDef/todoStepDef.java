package stepdefinitions.todoStepDef;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import utilities.API_Utilities.API_Methods;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class todoStepDef extends BaseTest {

    @Given("The api user verifies the information in the response body for the entry with the specified {string} index, including {string}, {string}, {string},{string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(String string, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9) {

    }
    @Given("The api user verifies that the data in the response body includes {string}, {string}, {string},{string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_includes(String string, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10, String string11, String string12, String string13, String string14) {

    }
    @Given("The api user prepares a POST request containing {string},{string}, {string},{string} and {int} information to send to the api shopadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_shopadd_endpoint(String string, String string2, String string3, String string4, Integer int1) {

    }

    @Given("The api user prepares a POST request containing {string}, {string}, {string} and {string} information to send to the api hubadd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_hubadd_endpoint(String string, String string2, String string3, String string4) {

    }
    @Given("The api user prepares a POST request containing cargocu,{string}, {string} and {string} information to send to the api todo endpoint.")
    public void the_api_user_prepares_a_post_request_containing_cargocu_and_information_to_send_to_the_api_todo_endpoint(String string, String string2, String string3) {

    }
}
