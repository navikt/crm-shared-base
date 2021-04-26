public without sharing class Shared_TestDataFactory {
    public static List<Account> createAccounts(Integer amount) {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < amount; i++) {
            Account acc = new Account();
            acc.Name = 'test';

            accounts.add(acc);
        }

        insert accounts;

        return accounts;
    }

    public static List<Contact> createContacts(List<Account> accounts, Integer amountPerAccount) {
        List<Contact> contacts = new List<Contact>();
        for (Account acc : accounts) {
            for (Integer i = 1; i <= amountPerAccount; i++) {
                contacts.add(new Contact(FirstName = 'Contact', LastName = String.valueOf(i), AccountId = acc.Id));
            }
        }
        insert contacts;

        return contacts;
    }

    public static User createStandardUser(String lastName) {
        User user = new User();
        String d =
            String.valueOf(DateTime.now().millisecond()) +
            String.valueOf(DateTime.now().second()) +
            String.valueOf(DateTime.now().minute());
        user.Username = d + 'test@nav.no';
        user.Email = d + 'test@nav.no';
        user.Alias = 'tsamp';
        user.ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' OR Name = 'Standardbruker' LIMIT 1].Id;
        user.isActive = true;
        user.FirstName = 'First';
        user.LastName = lastName;
        user.TimeZoneSidKey = 'Europe/Paris';
        user.LocaleSidKey = 'no_NO';
        user.EmailEncodingKey = 'UTF-8';
        user.LanguageLocaleKey = 'no';
        user.CommunityNickname = 'testUser' + d;
        insert user;

        return user;
    }
}
