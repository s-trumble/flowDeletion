# Flow Deletion Setting Project

This package contains a trigger on FlowRecordVersion that will throw an error when a user tries to delete a flow version to prevent accidental deletion of records.

To delete a flow record version the user must first enable the Flow_Deletion_Setting__c custom setting. 

A job can be scheduled to automatically switch this setting back to false every hour.

In anonymous apex run the following:

// Schedule to run every hour at minute 0

    String cronExp = '0 0 * * * ?';

    String jobName = 'Flow Deletion Setting Reset';

    System.schedule(jobName, cronExp, new FlowDeletionSettingScheduler());


    Production: https://login.salesforce.com/packaging/installPackage.apexp?p0=04tNS000000BlI9YAK
    Sandbox: https://test.salesforce.com/packaging/installPackage.apexp?p0=04tNS000000BlI9YAK