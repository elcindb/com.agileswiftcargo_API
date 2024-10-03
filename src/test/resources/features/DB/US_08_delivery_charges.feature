Feature: Make a data record by entering all data in the delivery_charges table via the database and verify that a new record can be made (status:0)

  Scenario: Verify that new delivery charge insertion with valid data is successful

    * DataBase connection established.
    * New delivery charge is inserted into delivery_charges table.
    * Verified that 1 row added to the table.
    * DataBase closed.

  Scenario: Verif