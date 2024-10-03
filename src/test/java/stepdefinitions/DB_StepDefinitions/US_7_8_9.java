package stepdefinitions.DB_StepDefinitions;

import HelperDB.DeliveryCharges;
import HelperDB.DeliveryMan;
import Manage.Manage;
import io.cucumber.java.en.Given;
import org.junit.Assert;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;


public class US_7_8_9 extends Manage {
    DeliveryCharges deliveryCharges = new DeliveryCharges();
    DeliveryMan deliveryMan = new DeliveryMan();


    //**************____ US_07 START ____******************
    @Given("Query prepared for currency table.")
    public void query_prepared_for_currency_table() throws SQLException {

        query = getUS_07_currencies();
        resultSet = getStatement().executeQuery(query);
    }

    @Given("CurrencyQuery result set is compared.")
    public void currency_query_result_set_is_compared() throws SQLException {

        while (resultSet.next()) {
            dataMaps.put(resultSet.getInt("id"), resultSet.getString("country"));

        }
        if (!dataMaps.isEmpty()) {
            // Beklenen veriler için bir map oluşturuyoruz
            Map<Integer, String> expectedData = new HashMap<>();
            expectedData.put(81, "Namibia");
            expectedData.put(22, "Canada");
            expectedData.put(6, "Australia");

            // Her bir id ve ülkeyi karşılaştırıyoruz
            for (Map.Entry<Integer, String> entry : expectedData.entrySet()) {
                int expectedId = entry.getKey();
                String expectedCountry = entry.getValue();

                // Gerçek datayı map'ten alıyoruz
                String actualCountry = (String) dataMaps.get(expectedId);
                // Assert ile karşılaştırma yapıyoruz
                assertEquals("Country doesn't match for ID: " + expectedId, expectedCountry, actualCountry);

                // Gerçek veriyi ekrana yazdırıyoruz
                System.out.println("ID: " + expectedId + " -> " + expectedCountry);


            }
        } else {
            assertFalse("ResultsetEMpty", resultSet.next());
        }

    }

//**************____ US_07 END ____******************

//**************____ US_08 START ____******************

    @Given("New delivery charge is inserted into delivery_charges table.")
    public void new_delivery_charge_is_inserted_into_delivery_charges_table() throws SQLException {
        query = getUS_08_delivery_charges();
        preparedStatement = getPraperedStatement(query);
        //**category_id, weight, same_day, next_day, sub_city, outside_city, position, status (should be 0)*
        preparedStatement.setInt(1, deliveryCharges.getCategory_id());
        preparedStatement.setInt(2, deliveryCharges.getWeight());
        preparedStatement.setDouble(3, deliveryCharges.getSame_day());
        preparedStatement.setDouble(4, deliveryCharges.getNext_day());
        preparedStatement.setDouble(5, deliveryCharges.getSub_city());
        preparedStatement.setDouble(6, deliveryCharges.getOutside_city());
        preparedStatement.setInt(7, deliveryCharges.getPosition());
        preparedStatement.setInt(8, deliveryCharges.getStatus());
    }

    @Given("Verified that {int} row added to the table.")
    public void verified_that_row_added_to_the_table(int expectedRow) {

        int actualRow = 0;

        try {
            actualRow = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Assert.assertEquals(expectedRow, actualRow);

    }

//**************____ US_08 END ____******************

//**************____ US_09 START ____******************

    @Given("Query prepared for deliveryman table.")
    public void query_prepared_for_deliveryman_table() throws SQLException {
        query = getUS_09_delivery_man();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setDouble(1, deliveryMan.getDelivery_charge());
        preparedStatement.setInt(2, deliveryMan.getId());

    }

//**************____ US_09 END ____******************


}
