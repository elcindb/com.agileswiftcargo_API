Feature: Verify the sum of hub payments with hub_id:328 in the hub_payments table in the hub_payments Database

  Scenario: Verify the sum of hub payments with hub_id:328

    * DataBase connection established
    * Query prepared hub_payments table.
    * HubQuery result set is compared.
    * DataBase closed
