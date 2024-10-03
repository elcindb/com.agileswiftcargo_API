package HelperDB;

import com.github.javafaker.Faker;
import lombok.Getter;

@Getter
public class DeliveryCharges {

    Faker faker = new Faker();

    private int category_id;
    private int weight;
    private double same_day;
    private double next_day;
    private double sub_city;
    private double outside_city;
    private int position;
    private int status;


    public DeliveryCharges() {
        this.category_id = faker.number().numberBetween(1, 6);
        this.weight = faker.number().numberBetween(1, 10);
        this.same_day = faker.random().nextDouble();
        this.next_day = faker.random().nextDouble();
        this.sub_city = faker.random().nextDouble();
        this.outside_city = faker.random().nextDouble();
        this.position = faker.number().numberBetween(1, 5);
        this.status = 0;
    }
}
