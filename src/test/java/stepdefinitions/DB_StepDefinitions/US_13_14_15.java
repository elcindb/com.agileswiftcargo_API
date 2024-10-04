package stepdefinitions.DB_StepDefinitions;

import HelperDB.JDBC_Structure_Methods;
import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static org.junit.Assert.assertEquals;


public class US_13_14_15 extends Manage {


    PreparedStatement preparedStatement;

    int intresult;


    //**************____ US_13 ____******************

    @Given("DataBase connection established")
    public void data_base_connection_established() {
        createConnection();
    }

    @Given("Query prepared hub_payments table.")
    public void query_prepared_hub_payments_table() throws SQLException {
        query = getUS_13_hub();
        resultSet = getStatement().executeQuery(query);


    }
    @Given("HubQuery result set is compared.")
    public void hub_query_result_set_is_compared() throws SQLException {

        resultSet.next();

        int expected=6502;
        int actual=resultSet.getInt("Total");

        assertEquals(expected,actual);


    }
    @Given("DataBase closed")
    public void data_base_closed() {
        closeConnection();

    }

    //**************____ US_14 ____******************


    @Given("Query prepared hubs table.")
    public void query_prepared_hubs_table() throws SQLException {

        query = getUS_14_hub();
        resultSet = getStatement().executeQuery(query);

    }
    @Given("HubNameQuery result set is compared.")
    public void hub_name_query_result_set_is_compared() throws SQLException {

        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String address = resultSet.getString("address");

            // Assert ile doğrulama: address sütununda name'in bulunması gerekir
            assert address.contains(name) : "Doğrulama başarılı: " + name + " -> " + address;

            // Doğrulama başarılıysa yazdır
            System.out.println("Doğrulama başarılı: " + name + " -> " + address);
        }
    }

    //**************____ US_15 ____******************


    @Given("Delivery_charges prepared merchant_delivery_charges table.")
    public void delivery_charges_prepared_merchant_delivery_charges_table() throws SQLException {

        query = getUS_15_merchant();
        resultSet = getStatement().executeQuery(query);

    }


    @Given("Verified that row affected to the merchant_delivery_charges table.")
    public void verified_that_row_affected_to_the_merchant_delivery_charges_table() throws SQLException {

        int rowCount = 0;


        while (resultSet.next()) {
            rowCount++;  // Her bir satır için rowCount'u artır
        }

        // Assert ile 9 satır olup olmadığını kontrol ediyoruz
        assertEquals("Beklenen satır sayısı 9 değil!", 9, rowCount);

    }

}
