package stepdefinitions.DB_StepDefinitions;

import io.cucumber.java.en.Given;

import static HelperDB.JDBC_Structure_Methods.closeConnection;
import static HelperDB.JDBC_Structure_Methods.createConnection;

public class CommonStepDefs {

    @Given("DataBase connection established.")
    public void data_base_connection_established() {
        createConnection();
    }

    @Given("DataBase closed.")
    public void data_base_closed() {
        closeConnection();
    }
}
