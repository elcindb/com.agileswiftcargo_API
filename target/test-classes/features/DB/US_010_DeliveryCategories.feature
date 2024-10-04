

Feature: DB TESTING
  Background: Database connectivity established
    * Database connection established
   @US10
  Scenario: Enter the necessary data in the deliverycategories table
    * Prepare query to insert 3 data entry into the deliverycategories table
    * Verify bulk 3 data added to the table
    * Database closed