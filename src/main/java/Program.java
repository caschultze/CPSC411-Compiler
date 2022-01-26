public class Program {
    public static void main(String[] args) {
        if (args.length == 1)
        {
            System.out.println("length of args = " + args.length + " is enough");
        }
        else if (args.length < 1)
        {
            System.err.println("length of args = " + args.length + " is too few");
        }
        else {
            System.err.println("length of args = " + args.length + " is too high");
        }
    }
}
