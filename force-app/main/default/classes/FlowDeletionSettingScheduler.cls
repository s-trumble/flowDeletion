public with sharing class FlowDeletionSettingScheduler implements Schedulable{
    public void execute(SchedulableContext sc){
        Flow_Deletion_Setting__c flowDeletionSetting = Flow_Deletion_Setting__c.getOrgDefaults();

        if(flowDeletionSetting.Allow_Deletion__c){
            flowDeletionSetting.Allow_Deletion__c = false;
            update flowDeletionSetting;
            System.debug('Flow deletion setting automatically reverted to false at: ' + System.now());
           }
    }
    /*
    // Schedule to run every hour at minute 0 - run in anonymous apex
        String cronExp = '0 0 * * * ?';
        String jobName = 'Flow Deletion Setting Reset';
        System.schedule(jobName, cronExp, new FlowDeletionSettingScheduler());
    */
}