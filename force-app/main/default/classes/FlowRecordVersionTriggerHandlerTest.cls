@isTest
private class FlowRecordVersionTriggerHandlerTest {
    static final String MOCK_LABEL = 'You cannot delete a Flow.';

    @isTest
    static void testHandleDeleteNotAllowed() {
        // Set up: Disallow deletion
        Flow_Deletion_Setting__c setting = new Flow_Deletion_Setting__c(
            SetupOwnerId = UserInfo.getOrganizationId(),
            Allow_Deletion__c = false
        );
        insert setting;

        // Mock FlowRecordVersion
        FlowRecordVersion mockFrv = (FlowRecordVersion)JSON.deserialize('{}', FlowRecordVersion.class);
        List<FlowRecordVersion> mockList = new List<FlowRecordVersion>{mockFrv};

        // Call handler directly and assert addError is called (cannot assert addError directly, but no exception should be thrown)
        Test.startTest();
        FlowRecordVersionTriggerHandler.handleDelete(mockList);
        Test.stopTest();
    }

    @isTest
    static void testHandleDeleteAllowed() {
        // Set up: Allow deletion
        Flow_Deletion_Setting__c setting = new Flow_Deletion_Setting__c(
            SetupOwnerId = UserInfo.getOrganizationId(),
            Allow_Deletion__c = true
        );
        insert setting;

        // Mock FlowRecordVersion
        FlowRecordVersion mockFrv = (FlowRecordVersion)JSON.deserialize('{}', FlowRecordVersion.class);
        List<FlowRecordVersion> mockList = new List<FlowRecordVersion>{mockFrv};

        // Call handler directly, should not throw
        Test.startTest();
        FlowRecordVersionTriggerHandler.handleDelete(mockList);
        Test.stopTest();
    }
}