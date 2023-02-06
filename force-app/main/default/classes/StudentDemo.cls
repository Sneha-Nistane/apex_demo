public class StudentDemo {
 	public String name;
    public Integer rollno;
    public String address;
    public Double percentage;
    public StudentDemo(){
        name='Sneha';
        rollno=23;
        address='Wardha';
        percentage = 98.33;
    }
    public void putData(){
        system.debug('Name of Student ='+name);
        system.debug('Roll No. of Student ='+rollno);
        system.debug('Address of Student ='+address);
        system.debug('Percentage of Student ='+percentage);
    }
}