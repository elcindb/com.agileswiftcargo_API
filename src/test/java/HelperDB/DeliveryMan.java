package HelperDB;

import lombok.Getter;

@Getter
public class DeliveryMan {

    private int id;
    private int user_id;
    private int status;
    private double delivery_charge;
    private double pickup_charge;
    private double return_charge;
    private double current_balance;
    private double opening_balance;

    public DeliveryMan() {

        this.delivery_charge = 300;
        this.id = 5555;

    }
}
