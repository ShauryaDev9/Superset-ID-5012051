// This is optimized Recursive Implementation with Memoization

import java.util.HashMap;
import java.util.Map;

public class FinancialForecastingMemoized {
    private static Map<String, Double> memo = new HashMap<>();

    public static double calculateFutureValue(double pastValue, double growthRate, int periods) {
        String key = pastValue + "|" + growthRate + "|" + periods;

        // Check memoization
        if (memo.containsKey(key)) {
            return memo.get(key);
        }

        // Base case
        if (periods == 0) {
            memo.put(key, pastValue);
            return pastValue;
        }

        // Recursive case with memoization
        double futureValue = calculateFutureValue(pastValue * (1 + growthRate), growthRate, periods - 1);
        memo.put(key, futureValue);
        return futureValue;
    }

    public static void main(String[] args) {
        double pastValue = 1000.0; // Initial value
        double growthRate = 0.05; // 5% growth rate
        int periods = 10; // Number of periods

        double futureValue = calculateFutureValue(pastValue, growthRate, periods);
        System.out.printf("Future Value after %d periods: %.2f\n", periods, futureValue);
    }
}
