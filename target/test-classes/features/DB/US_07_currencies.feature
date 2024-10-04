Feature: Verify the data with 'A' in the code information of the contents with name=Dollars in the currencies table on the database by sorting them in reverse order.

  @DB1
  Scenario:  Verify the order of the specified currencies

    * DataBase connection established.
    * Query prepared for currency table.
    * CurrencyQuery result set is compared.
    * DataBase closed.
