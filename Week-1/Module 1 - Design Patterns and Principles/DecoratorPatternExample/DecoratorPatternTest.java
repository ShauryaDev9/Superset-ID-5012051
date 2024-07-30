public class DecoratorPatternTest {
    public static void main(String[] args) {
        Notifier emailNotifier = new EmailNotifier();
        Notifier smsNotifier = new SMSNotifierDecorator(emailNotifier);
        Notifier slackNotifier = new SlackNotifierDecorator(smsNotifier);

        System.out.println("Sending notification via Email only:");
        emailNotifier.send("Hello, this is an email notification!");

        System.out.println("\nSending notification via Email and SMS:");
        smsNotifier.send("Hello, this is an SMS notification!");

        System.out.println("\nSending notification via Email, SMS, and Slack:");
        slackNotifier.send("Hello, this is a Slack notification!");
    }
}
