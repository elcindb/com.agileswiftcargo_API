package stepdefinitions.DB_StepDefinitions;

import HelperDB.CommonData;
import HelperDB.DeliveryCategories;
import HelperDB.JDBC_Structure_Methods;
import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import static HelperDB.CommonData.result;
import static HelperDB.DeliveryCategories.generateCategory;
import static org.junit.Assert.assertEquals;

public class CategoriesStepDefinitions extends Manage {
    PreparedStatement preparedStatement;

    CommonData data = new CommonData();
    int silinicekStatus;
    int silinicekPOsition;
    int updatedRows;

    @Given("Database connection established")
    public void database_connection_established() {
        createConnection();
    }

    @Given("Prepare query to insert {int} data entry into the deliverycategories table")
    public void prepare_query_to_insert_data_entry_into_the_deliverycategories_table(int count) throws SQLException {
        query = getDelivery_categories();
        preparedStatement = getPraperedStatement(query);
        List<DeliveryCategories> categories = generateCategory(count);
        int flag = 0;
        for (DeliveryCategories category : categories) {
            preparedStatement.setString(1, categories.get(flag).getTitle());
            preparedStatement.setInt(2, categories.get(flag).getStatus());
            preparedStatement.setInt(3, categories.get(flag).getPosition());
            preparedStatement.setTimestamp(4, categories.get(flag).getCreatedAt());
            preparedStatement.setTimestamp(5, categories.get(flag).getCreatedAt());

            preparedStatement.addBatch();// her bir kategori için bir batch eklenir.
            flag++;
            if (flag == categories.size()) {
                result = preparedStatement.executeBatch();
            }
        }
    }

    @Given("Verify bulk {int} data added to the table")
    public void verify_bulk_data_added_to_the_table(int rowCount) {
        System.err.println(result.length + "RECORD IS Successfully Added");
        assertEquals(rowCount, result.length);
    }

    @Given("Database closed")
    public void database_closed() {
        closeConnection();
    }
    @Given("verify the category with status {int} is to be deleted")
    public void the_category_with_status_is_to_be_deleted(Integer statusNo) throws SQLException {
        query=getDelivery_categories();
        preparedStatement=JDBC_Structure_Methods.getPraperedStatement(query);
        preparedStatement.setInt(1,statusNo);




    }



}
