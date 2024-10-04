Feature:  Update the delivery_charge information of deliveryman with id:? in the delivery_man table on the database as ? and verify that it has been updated.

  Scenario: Verify that delivery_charge information is updated for specified deliveryman
    * DataBase connection established.
    * Query prepared for deliveryman table.
    * Verified that 1 row added to the table.
    * DataBase closed.