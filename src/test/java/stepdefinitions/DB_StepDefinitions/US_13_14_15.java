package stepdefinitions.DB_StepDefinitions;

import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import static org.junit.Assert.assertEquals;


public class US_13_14_15 extends Manage {


    PreparedStatement preparedStatement;


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




}
