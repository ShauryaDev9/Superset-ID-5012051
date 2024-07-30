public class SingletonTest {
    public static void main(String[] args) {
        // Obtaining two references to the Logger instance
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        // Checking if both references point to the same instance
        if (logger1 == logger2) {
            System.out.println("Singleton pattern works! Both references point to the same instance.");
        } else {
            System.out.println("Singleton pattern failed! The references point to different instances.");
        }
        logger1.log("This is a test log message.");
    }
}
