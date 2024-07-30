public class FinancialForecasting {
    public static double calculateFutureValue(double pastValue, double growthRate, int periods) {
        // Base case: If no periods are left, return the previous value
        if (periods == 0) {
            return pastValue;
        } else {
            // Recursive case: Multiply by (1 + growth rate) and decrease the no of periods
            return calculateFutureValue(pastValue * (1 + growthRate), growthRate, periods - 1);
        }
    }

    public static void main(String[] args) {
        double pastValue = 1000.0; // Initial value
        double growthRate = 0.05; // 5% growth rate
        int periods = 10; // No. of periods

        double futureValue = calculateFutureValue(pastValue, growthRate, periods);
        System.out.printf("Future Value after %d periods: %.2f\n", periods, futureValue);
    }
}
