public class Forecasting {
    public static double predictFutureValue(double presentValue, double growthRate, int years) {
        if (years == 0) {
            return presentValue;
        }
        return predictFutureValue(presentValue * (1 + growthRate), growthRate, years - 1);
    }

    public static void main(String[] args) {
        double presentValue = 1000.0;
        double growthRate = 0.05; 
        int years = 5;

        double futureValue = predictFutureValue(presentValue, growthRate, years);
        System.out.printf("Future value after %d years: $%.2f%n", years, futureValue);
    }
}
