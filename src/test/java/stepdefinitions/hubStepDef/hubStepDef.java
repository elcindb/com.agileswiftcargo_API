package stepdefinitions.hubStepDef;

import base.BaseTest;
import com.google.gson.Gson;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import org.json.JSONObject;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import java.util.HashMap;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;

public class hubStepDef extends BaseTest {
    TestData testData = new TestData();
    String reqBody;
    Gson gson = new Gson(); // Gson kütüphanesini kullanarak bir POJO nesnesini JSON formatında bir Stringe dönüştürebilirsiniz.
    String requestBody;
    Pojo hubAdd;
    @Given("The api user prepares a POST request that contains no data.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data() {
        JSONObject requestBody = new JSONObject();
    }
    @Given("The api user prepares a PATCH request that contains no data.")
    public void the_api_user_prepares_a_patch_request_that_contains_no_data() {
        JSONObject requestBody = new JSONObject();
    }

    @Given("The api user prepares a patch request to send to the api hubedit endpoint.")
    public void the_api_user_prepares_a_patch_request_to_send_to_the_api_hubedit_endpoint() {
        map = testData.hubRequestBody();
    }
    @Given("The api user verifies that name is {string}")
    public void the_api_user_verifies_that_name_is(String value) {
        map = response.as(HashMap.class);
        Assert.assertEquals(value,map.get("name"));

    }

}
