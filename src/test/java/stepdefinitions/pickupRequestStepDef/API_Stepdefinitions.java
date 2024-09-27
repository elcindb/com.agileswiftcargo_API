package stepdefinitions.pickupRequestStepDef;

import base.BaseTest;
import io.cucumber.java.en.Given;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class API_Stepdefinitions extends BaseTest {


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
    }
