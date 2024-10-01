package stepdefinitions.parcelStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import utilities.API_Utilities.API_Methods;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class API_ParcelStepDef extends BaseTest {

    String requestBody;

    @Given("The api user verifies that the {string} information in the response body is the {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        System.out.println("Response Body: " + response.asString());

        // Eğer "success" alanı kontrol ediliyorsa, boolean bir değer olduğundan dolayı özel kontrol yapıyoruz
        if (key.equals("success")) {
            boolean successValue = Boolean.parseBoolean(value); // "true" veya "false" stringini boolean'a çeviriyoruz
            response.then()
                    .assertThat()
                    .body(key, equalTo(successValue)); // success alanını doğrula
        } else {
            response.then()
                    .assertThat()
                    .body(key, equalTo(value)); // Diğer alanları olduğu gibi kontrol et
        }
    }

    @Given("The api user verifies that the parcel details in the response body match the expected values, including {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, and {string}.")
    public void the_api_user_verifies_that_the_parcel_details_in_the_response_body_match_the_expected_values_including_and(
            String id, String merchant_id, String merchant_shop_id, String pickup_address,
            String pickup_phone, String customer_name, String customer_phone, String customer_address,
            String invoice_no, String category_id, String weight, String delivery_type_id,
            String packaging_id, String first_hub_id, String hub_id, String transfer_hub_id,
            String cash_collection) {

        // JsonPath object from the framework
        JsonPath repJP = response.jsonPath();

        // Validate each field
        assertEquals(Integer.parseInt(id), repJP.getInt("data.id"));
        assertEquals(Integer.parseInt(merchant_id), repJP.getInt("data.merchant_id"));
        assertEquals(Integer.parseInt(merchant_shop_id), repJP.getInt("data.merchant_shop_id"));
        assertEquals(pickup_address, repJP.getString("data.pickup_address"));
        assertEquals(pickup_phone, repJP.getString("data.pickup_phone"));
        assertEquals(customer_name, repJP.getString("data.customer_name"));
        assertEquals(customer_phone, repJP.getString("data.customer_phone"));
        assertEquals(customer_address, repJP.getString("data.customer_address"));

        // Check for invoice_no null or empty
        if (invoice_no == null || invoice_no.isEmpty() || invoice_no.equals("null")) {
            assertNull(repJP.getString("data.invoice_no"));
        } else {
            assertEquals(invoice_no, repJP.getString("data.invoice_no"));
        }

        assertEquals(Integer.parseInt(category_id), repJP.getInt("data.category_id"));
        assertEquals(Integer.parseInt(weight), repJP.getInt("data.weight"));
        assertEquals(Integer.parseInt(delivery_type_id), repJP.getInt("data.delivery_type_id"));

        // Check for packaging_id null
        if (packaging_id == null || packaging_id.isEmpty() || packaging_id.equals("null")) {
            assertNull(repJP.get("data.packaging_id"));
        } else {
            assertEquals(Integer.parseInt(packaging_id), repJP.getInt("data.packaging_id"));
        }

        // Validate other fields
        assertEquals(Integer.parseInt(first_hub_id), repJP.getInt("data.first_hub_id"));
        assertEquals(Integer.parseInt(hub_id), repJP.getInt("data.hub_id"));

        // Check for transfer_hub_id null
        if (transfer_hub_id == null || transfer_hub_id.isEmpty() || transfer_hub_id.equals("null")) {
            assertNull(repJP.get("data.transfer_hub_id"));
        } else {
            assertEquals(Integer.parseInt(transfer_hub_id), repJP.getInt("data.transfer_hub_id"));
        }

        // Validate cash_collection
        assertEquals(cash_collection, repJP.getString("data.cash_collection"));
    }


    @Given("The api user verifies that the parcel details in the response body match the expected values, including {int}, {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {int}, {int}, {string}, {int}, {int}, {string}, and {string}.")
    public void the_api_user_verifies_that_the_parcel_details_in_the_response_body_match_the_expected_values_including(
            int id, int merchant_id, int merchant_shop_id, String pickup_address,
            String pickup_phone, String customer_name, String customer_phone,
            String customer_address, String invoice_no, int category_id, int weight,
            int delivery_type_id, String packaging_id, int first_hub_id, int hub_id,
            String transfer_hub_id, String cash_collection) {

        // JsonPath object from the response
        JsonPath repJP = response.jsonPath();

        // Validate each field
        assertEquals(id, repJP.getInt("data.id"));
        assertEquals(merchant_id, repJP.getInt("data.merchant_id"));
        assertEquals(merchant_shop_id, repJP.getInt("data.merchant_shop_id"));
        assertEquals(pickup_address, repJP.getString("data.pickup_address"));
        assertEquals(pickup_phone, repJP.getString("data.pickup_phone"));
        assertEquals(customer_name, repJP.getString("data.customer_name"));
        assertEquals(customer_phone, repJP.getString("data.customer_phone"));
        assertEquals(customer_address, repJP.getString("data.customer_address"));

        // Check for invoice_no being null or empty
        if (invoice_no == null || invoice_no.isEmpty() || invoice_no.equals("null")) {
            assertNull(repJP.getString("data.invoice_no"));
        } else {
            assertEquals(invoice_no, repJP.getString("data.invoice_no"));
        }

        assertEquals(category_id, repJP.getInt("data.category_id"));
        assertEquals(weight, repJP.getInt("data.weight"));
        assertEquals(delivery_type_id, repJP.getInt("data.delivery_type_id"));

        // Check for packaging_id being null
        if (packaging_id == null || packaging_id.isEmpty() || packaging_id.equals("null")) {
            assertNull(repJP.get("data.packaging_id"));
        } else {
            assertEquals(Integer.parseInt(packaging_id), repJP.getInt("data.packaging_id"));
        }

        // Validate other fields
        assertEquals(first_hub_id, repJP.getInt("data.first_hub_id"));
        assertEquals(hub_id, repJP.getInt("data.hub_id"));

        // Check for transfer_hub_id being null
        if (transfer_hub_id == null || transfer_hub_id.isEmpty() || transfer_hub_id.equals("null")) {
            assertNull(repJP.get("data.transfer_hub_id"));
        } else {
            assertEquals(Integer.parseInt(transfer_hub_id), repJP.getInt("data.transfer_hub_id"));
        }

        // Validate cash_collection
        assertEquals(cash_collection, repJP.getString("data.cash_collection"));
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



    @Given("The api user prepares a POST request containing {int}, {int}, {double},{string},{string} and {string} information to send to the api parcel add endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_the_api_parcel_add_endpoint(
            Integer merchant_id, Integer merchant_shop_id, Integer category_id, Integer delivery_type_id,
            String customer_name, String customer_phone, String customer_address) {

        requestBody = builder
                .addParameterForMap("merchant_id", merchant_id)
                .addParameterForMap("merchant_shop_id", merchant_shop_id)
                .addParameterForMap("category_id", category_id)
                .addParameterForMap("delivery_type_id", delivery_type_id)
                .addParameterForMap("customer_name", customer_name)
                .addParameterForMap("customer_phone", customer_phone)
                .addParameterForMap("customer_address", customer_address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {int}, {int}, {int}, {string}, {string} and {string} information to send to api parcel add endpoint.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_api_parcel_add_endpoint(
            Integer merchant_shop_id, Integer category_id, Integer delivery_type_id,
            String customer_name, String customer_phone, String customer_address) {

        requestBody = builder
                .addParameterForMap("merchant_shop_id", merchant_shop_id)
                .addParameterForMap("category_id", category_id)
                .addParameterForMap("delivery_type_id", delivery_type_id)
                .addParameterForMap("customer_name", customer_name)
                .addParameterForMap("customer_phone", customer_phone)
                .addParameterForMap("customer_address", customer_address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request containing {int}, {int}, {int}, {string}, {string} and {string} information to send to api parcel add endpoint.    * The api user sends a POST request and saves the returned response.")
    public void the_api_user_prepares_a_post_request_containing_and_information_to_send_to_api_parcel_add_endpoint_the_api_user_sends_a_post_request_and_saves_the_returned_response(Integer merchant_shop_id, Integer category_id, Integer delivery_type_id, String customer_name, String customer_phone, String customer_address) {

        // Request body hazırlanıyor
        requestBody = builder
                .addParameterForMap("merchant_shop_id", merchant_shop_id)
                .addParameterForMap("category_id", category_id)
                .addParameterForMap("delivery_type_id", delivery_type_id)
                .addParameterForMap("customer_name", customer_name)
                .addParameterForMap("customer_phone", customer_phone)
                .addParameterForMap("customer_address", customer_address)
                .buildUsingMap();

        System.out.println("POST Request Body : " + requestBody);


    }
}