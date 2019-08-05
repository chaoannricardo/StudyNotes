package interFace;


import java.util.Date;

public class TestPolymorphism {

    public static void main(String[] args) {

        Product item = new Notebook("Asus",15000,365);
        Product item2 = new Food("肉鬆",100,Product.getDate(2019,1,1));
        Product item3 = new SimDataCard("日本4G",1000,Product.getDate(2019,1,1));

        checkExpireable((Expirable)item3);//因為item3型別為Product,必須利用強制轉型才能轉成Expirable

        Product[] items = { item, item2 ,item3  };
        for( int i=0 ;i < items.length ; i++) {
            Product eachItem = items[i];
            System.out.println("---------------------");
            System.out.println(eachItem.description());
            if ( eachItem instanceof Expirable ) {
                checkExpireable((Expirable)eachItem);
            }
        }

        


    }

    public static void checkExpireable(Expirable item){

        if ( item.最後使用期限().after(new Date())){
            System.out.println("期限內");
        }else{
            System.out.println("過期了");
        }
        
    }

}
