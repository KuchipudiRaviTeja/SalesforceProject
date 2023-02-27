//A class with name DiscountClass is created
public class DiscountClass {
    //Defined a Final Decimal variable called “regularDiscount”
    final Decimal regularDiscount  = 0.1;
    //Defined a Decimal variable called “finalPrice”
    Decimal finalPrice;
    
    //Defined a Method called “calculateDiscount(Integer price)”
    //takes a Decimal data type and 
    //returns final price.
    public decimal calculateDiscount(Integer price){
        finalPrice = price - (price * regularDiscount);
        return finalPrice;
    }
}