package stepdefinitions.blogStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

public class blogStepDef extends BaseTest {

    @Then("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string},{int},{int},{string},{string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String title, int image_id, String position, int status, int created_by, String views, String created_at, String updated_at) {

    }
    @Given("The api user prepares a {string} request to send to the api blog edit endpoint.")
    public void the_api_user_prepares_a_request_to_send_to_the_api_blog_edit_endpoint(String string) {
        map = testData.hubRequestBody();
    }
    @Given("The api user prepares a POST request containing {string} ,{string},{string} and {int} information to send to the api blog add endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_status_information_to_send_to_the_api_blog_add_endpoint(String title, String description, String position , int status) {

    }
    @Given("The api user prepares a POST request containing {string} ,{string},{string} and {int} information to send to the api blog list endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_status_information_to_send_to_the_api_blog_list_endpoint(String title, String description, String position , int status) {

    }
    @Given("The api user prepares a POST request containing {string} ,{string},{string} and {int} information to send to the api blog last endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_status_information_to_send_to_the_api_blog_last_endpoint(String title, String description, String position , int status) {

    }
}