
Feature:
  Background: Database connectivity established
    * Database connection established

  @US12
Scenario: admin Verify the Questions values of the 3 oldest uptade data in the faqs table via the database.
    # Database üzerinden faqs tablosundaki en eski uptade işlemi yapılan 3 datanın Questions değerlerini doğrulayınız.
* Query prepared faqs links table
* Compare Question from the result set of Faqs
* Database closed