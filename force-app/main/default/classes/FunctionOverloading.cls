public class FunctionOverloading {
    public void add(Integer a, Integer b){
        Integer sum=a+b;
        system.debug('Sum='+sum);
    }
    public void add(Decimal a,Integer b){
        Double sum = a + b;
        system.debug('Sum='+sum);
    }
    public void add(Integer a,Integer b,Integer c){
        Integer sum=a+b+c;
        system.debug('Sum='+sum);
    }
}