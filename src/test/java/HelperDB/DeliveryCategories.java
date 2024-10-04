package HelperDB;

import lombok.Getter;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import static HelperDB.CommonData.faker;


@Getter
public class DeliveryCategories {

    //  (title, status, position, created_at, updated_at)
    private String title;
    private int status;
    private int position;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    //Constructor parametreli
    public DeliveryCategories(String title, int status, int position, Timestamp createdAt, Timestamp updatedAt) {
        this.title = title;
        this.status = status;
        this.position = position;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;

    }

    public List<DeliveryCategories> getCategories() {
        return List.of(
                new DeliveryCategories(faker.commerce().department(), faker.number().numberBetween(0, 1), faker.number().numberBetween(1, 100), Timestamp.from(Instant.now().now()), Timestamp.from(Instant.now().now())),
                new DeliveryCategories(faker.commerce().department(), faker.number().numberBetween(0, 1), faker.number().numberBetween(1, 100), Timestamp.from(Instant.now().now()), Timestamp.from(Instant.now().now())),
                new DeliveryCategories(faker.commerce().department(), faker.number().numberBetween(0, 1), faker.number().numberBetween(1, 100), Timestamp.from(Instant.now().now()), Timestamp.from(Instant.now().now()))
        );
    }

    public static List<DeliveryCategories> generateCategory(int count) {
        List<DeliveryCategories> categories = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            DeliveryCategories categorie = new DeliveryCategories(
                    faker.commerce().department(),
                    faker.number().numberBetween(0, 1),
                    faker.number().numberBetween(1, 100),
                    Timestamp.from(Instant.now().now()),
                    Timestamp.from(Instant.now().now()));
            categories.add(categorie);
        }


        return categories;
    }
}
