package stepdefinitions.DB_StepDefinitions;

import Manage.Manage;
import io.cucumber.java.en.Given;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class FaqsStepDefinitions extends Manage {
    public static Map<Integer, String> question;
    String question1 ="How can I track my shipment?";
    String question2 ="What are the shipping fees and how are they calculated?";
    String question3 ="What is the delivery time for shipments?";

    @Given("Query prepared faqs links table")
    public void query_prepared_faqs_links_table() throws SQLException {
        String query = "select id,question from u201212290_agilesqa.faqs order by updated_at asc limit 3;";
        resultSet = getStatement().executeQuery(query);

    }
    @Given("Compare Question from the result set of Faqs")
    public void compare_question_from_the_result_set_of_faqs() throws SQLException {
        question = new HashMap<>();
        while (resultSet.next()) {
            question.put(resultSet.getInt("id"), resultSet.getString("question"));

        }
        if (!question.isEmpty()) {

            assertTrue(question.containsValue(question1));
            assertTrue(question.containsValue(question2));
            assertTrue(question.containsValue(question3));

            //buraya expected liste eklenebilecek

        } else {
            assertFalse("ResultsetEMpty", resultSet.next());
        }

    }
}
