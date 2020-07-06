public class TestIfSwitch {
    public static void main(String[] args) {

        //if 範例
        int numberOfStudents = 35;
        int classroom;
        if (  numberOfStudents >= 30 ){
            classroom = 204;
        }else if  ( numberOfStudents < 30 && numberOfStudents >= 20  ) {
            classroom = 305;
        }else {
            classroom = 201;
        }
        System.out.println("教室在"+classroom);


        //switch int範例
        switch (classroom) {
            case 204:
                System.out.println("人數大於等於30人");
                break;
            case 305:
                System.out.println("人數小於30大於等於20人");
                break;
            default:
                System.out.println("default 其它");
        }

        //switch 字元範例(字元為''）
        char gender = 'F';
        switch (gender) {
            case 'F':
                System.out.println("女");
                break;
            case 'M':
                System.out.println("男");
                break;
            default:
                System.out.println("default 其它");
        }

        //switch 字串範例(字串為""）
        String genderString = "F";
        switch (genderString) {
            case "F":
                System.out.println("女");
                break;
            case "M":
                System.out.println("男");
                break;
            default:
                System.out.println("default 其它");
        }

    }
}
