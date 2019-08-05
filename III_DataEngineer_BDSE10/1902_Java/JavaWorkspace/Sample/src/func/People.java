package func;

public class People {
    double height;
    double weight;
    //BMI = 體重(公斤) / 身高平方
    public double getBMI() {
        double BMI = People.BMI(height,weight);
        return BMI;
    }

    public static double BMI(double height,double weight){
        return weight / (height*height);
    }
    /*
    public static double BMI(){
        return weight / (height*height);//compile會有錯
    }
    */
}
