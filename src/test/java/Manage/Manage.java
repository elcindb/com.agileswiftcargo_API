package Manage;

import HelperDB.JDBC_Structure_Methods;
import lombok.Getter;

import java.util.HashMap;

@Getter
public class Manage extends JDBC_Structure_Methods {

    private String US_07_currencies = "SELECT * FROM currencies WHERE name = 'Dollars' AND code LIKE '%A%' ORDER BY code DESC;";
    private String US_08_delivery_charges = "INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) VALUES (?,?,?,?,?,?,?,?,Now(),Now());";

}
