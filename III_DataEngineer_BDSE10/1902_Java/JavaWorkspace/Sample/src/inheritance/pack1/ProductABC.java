package inheritance.pack1;

import inheritance.Product;

public class ProductABC extends Product {


    public String description(){
        //如果 Product中的name設定為protected 或者public，則可以使用super.name
        //因為與Product不在同一個package內，所以預設modifier也不行使用super.name
        //return super.name;
        return "";
    }

}
