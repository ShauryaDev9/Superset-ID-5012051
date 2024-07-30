public class Logger {
    // This is Private static instance of Logger
    private static Logger instance;

    // THis is Private constructor to prevent instantiation
    private Logger() {
        // Initializing logging setup here
    }

    // here is public static method to get the instance
    public static synchronized Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    // It is an example method to log messages
    public void log(String message) {
        System.out.println("LOG: " + message);
    }
}
