public class StudentPrefixGenderHelper {
	public static void genderHelper(List<Student_Detail__c> Liststud){
        Student_Detail__c stud1 = new Student_Detail__c();
        stud1.First_Name__c = 'Sneha';
        stud1.Gender__c = 'Female';
        insert stud1;
        for(Student_Detail__c stud:Liststud){
            if(stud.Gender__c == 'Male' && stud.Marital_Status__c == 'Yes'){
                stud.First_Name__c = 'Mister.'+stud.First_Name__c;
            }
            if(stud.Gender__c == 'Male' && stud.Marital_Status__c == 'No'){
                stud.First_Name__c = 'Master.'+stud.First_Name__c;
            }
            if(stud.Gender__c == 'Female' && stud.Marital_Status__c == 'Yes'){
                stud.First_Name__c = 'Mrs.'+stud.First_Name__c;
            }
            if(stud.Gender__c == 'Female' && stud.Marital_Status__c == 'No'){
                stud.First_Name__c = 'Miss.'+stud.First_Name__c;
            }
            if(stud.Gender__c == 'Trangender' || stud.Gender__c == 'Unknown'){
                stud.Gender__c.addError('This Person is not Allowed');
            }
        }
    }
}