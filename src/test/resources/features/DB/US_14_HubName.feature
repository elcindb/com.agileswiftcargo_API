Feature: Verify the address information of the data whose name information starts with 'S' from the hubs table over the database.

  Scenario: Verify the address information of the data whose name information starts with 'S'

    * DataBase connection established
    * Query prepared hubs table.
    * HubNameQuery result set is compared.
    * DataBase closed
