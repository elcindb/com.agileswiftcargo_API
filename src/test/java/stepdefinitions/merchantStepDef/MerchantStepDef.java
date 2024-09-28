package stepdefinitions.merchantStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;

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



}
