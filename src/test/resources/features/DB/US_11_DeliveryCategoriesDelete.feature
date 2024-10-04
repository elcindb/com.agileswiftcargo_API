
Feature: Delete the records with status:0 in the deliverycategories table via database and verify that they are deleted.
  Background: Database connectivity established
    * Database connection established
  @US11
  Scenario: verify that the deliverycategories information is deleted
    * verify the category with status 1 is to be deleted
    * The results of the Delete Query are validated.
    * Database closed