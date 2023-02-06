public class VFAccountListing_CX {
    List <Account> AccList{get;set;}
    public VFAccountListing_CX(ApexPages.StandardSetController controller) {
        AccList = [select Name,AccountNumber,Rating,Type from Account];
    }

}