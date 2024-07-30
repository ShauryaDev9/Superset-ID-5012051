public class StrategyPatternTest {
    public static void main(String[] args) {
        PaymentStrategy creditCardPayment = new CreditCardPayment("1234 5678 9012 3456", "Shaurya Verma", "123");
        PaymentStrategy paypalPayment = new PayPalPayment("Shauryakverma20@gmail.com");

        PaymentContext context = new PaymentContext(creditCardPayment);
        context.executePayment(100.0);

        System.out.println();

        context.setPaymentStrategy(paypalPayment);
        context.executePayment(200.0);
    }
}
