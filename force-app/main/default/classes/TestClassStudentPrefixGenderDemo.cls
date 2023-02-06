@isTest
public class TestClassStudentPrefixGenderDemo {
    @isTest
    public static void malePrefix(){
        Student_Detail__c stud = new Student_Detail__c(First_Name__c='Sanket',Gender__c='Male');
        insert stud;
    }
    @isTest
    public static void femalePrefix(){
        Student_Detail__c stud = new Student_Detail__c(First_Name__c='Sneha',Gender__c='Female');
        insert stud;
    }
    @isTest
    public static void otherPrefix(){
        Student_Detail__c stud = new Student_Detail__c(First_Name__c='Snesdadha',Gender__c='Trangender');
        insert stud;
    }
}