public class AdapterPatternTest {
    public static void main(String[] args) {
        // Create instances of the gateways
        PayPalGateway paypalGateway = new PayPalGateway();
        StripeGateway stripeGateway = new StripeGateway();

        // Create adapters
        PaymentProcessor paypalAdapter = new PayPalAdapter(paypalGateway);
        PaymentProcessor stripeAdapter = new StripeAdapter(stripeGateway);

        // Process payments
        System.out.println("Using PayPal Gateway:");
        paypalAdapter.processPayment(100.0);

        System.out.println("\nUsing Stripe Gateway:");
        stripeAdapter.processPayment(200.0);
    }
}
