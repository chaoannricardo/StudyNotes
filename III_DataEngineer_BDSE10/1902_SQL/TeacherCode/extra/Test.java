/*java main ��String[] args���Ϊk 
  http://liujinpan75.iteye.com/blog/486664

*String[] args: args�O���Ѽơ����Y�g�A�i�H�令���N���W�r�C 
                args�s�J���O�R�O�C�ѼơA�i�Ω�{�����C 
*�䴩�q�R�O�C��J�ѼơG 
   String[] args�o�Ӧr��}�C�O�O�s�B��main��Ʈɿ�J���Ѽ� ���A�Ҧp main��ƩҦb�����W��test����A�bcmd�B��java test a b c�� 
   args[0]=a,args[1]=b,args[2]=c,�A�N�i�H�b�A���{�����եΧA��J���o���ܼơC 
*/

/*�Ҧp�GTest.java */
public class Test
{ 
   public static void main(String[] args)
   { 
     System.out.println("args[0] is "+args[0]); 
     System.out.println("args[1] is "+args[1]); 
     System.out.println("args[2] is "+args[2]); 
   } 
} 

/*
�bcmd����J�{���һݭn���ѼơG 
javac Test.java 
java Test zhang xiao yu 

��X���G�G 
args[0] is zhang 
args[1] is xiao 
args[2] is yu 

*/