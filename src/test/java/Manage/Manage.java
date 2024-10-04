package Manage;

import HelperDB.JDBC_Structure_Methods;
import lombok.Getter;

import java.util.HashMap;

@Getter
public class Manage extends JDBC_Structure_Methods {

    private String US_07_currencies = "SELECT * FROM currencies WHERE name = 'Dollars' AND code LIKE '%A%' ORDER BY code DESC;";
    private String US_08_delivery_charges = "INSERT INTO u201212290_agilesqa.delivery_charges (category_id, weight, same_day, next_day, sub_city, outside_city, position, status, created_at, updated_at) VALUES (?,?,?,?,?,?,?,?,Now(),Now());";
    private String US_09_delivery_man = "UPDATE u201212290_agilesqa.delivery_man SET delivery_charge = ? WHERE id = ?;";
    private String delivery_categories="INSERT INTO u201212290_agilesqa.deliverycategories (title, status, position, created_at, updated_at) VALUES (?,?,?,?,?);";
    private  String categoriesdelete="delete FROM deliverycategories WHERE status=?";
    private  String categoriesupdete="select * from deliverycategories WHERE status=?";


   private String getCategoriesdelete() {
        return categoriesdelete;
    }

    private String getCategoriesupdete() {
        return categoriesupdete;
    }

    private String US_13_hub = "select SUM(amount) as Total from u201212290_agilesqa.hub_payments where hub_id=328;";
}

