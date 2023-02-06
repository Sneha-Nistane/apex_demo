public class StudentPrefixGenderHandler {
    static boolean flag = true;
    public static void genderHandler(List<Student_Detail__c> Liststud){
        if(flag){
            flag = false;
            StudentPrefixGenderHelper.genderHelper(Liststud);
        }
    }
}