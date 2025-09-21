@isTest
private class FlowDeletionSettingSchedulerTest {
    @isTest
    static void testSchedulerUpdatesAllowDeletion() {
        // Create org default custom setting with Allow_Deletion__c = true
        Flow_Deletion_Setting__c setting = new Flow_Deletion_Setting__c(
            SetupOwnerId = UserInfo.getOrganizationId(),
            Allow_Deletion__c = true
        );
        insert setting;

        // Run the scheduler
        Test.startTest();
        FlowDeletionSettingScheduler scheduler = new FlowDeletionSettingScheduler();
        scheduler.execute(null);
        Test.stopTest();

        // Verify the setting was updated
        Flow_Deletion_Setting__c updated = Flow_Deletion_Setting__c.getOrgDefaults();
        System.assertEquals(false, updated.Allow_Deletion__c, 'Allow_Deletion__c should be set to false');
    }
}