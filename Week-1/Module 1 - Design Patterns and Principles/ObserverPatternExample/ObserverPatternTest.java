public class ObserverPatternTest {
    public static void main(String[] args) {
        StockMarket stockMarket = new StockMarket();

        Observer mobileApp1 = new MobileApp("MobileApp1");
        Observer mobileApp2 = new MobileApp("MobileApp2");
        Observer webApp1 = new WebApp("WebApp1");
        Observer webApp2 = new WebApp("WebApp2");

        stockMarket.registerObserver(mobileApp1);
        stockMarket.registerObserver(mobileApp2);
        stockMarket.registerObserver(webApp1);
        stockMarket.registerObserver(webApp2);

        stockMarket.setStockPrice(150.25);
        System.out.println();

        stockMarket.setStockPrice(155.75);
        System.out.println();

        stockMarket.deregisterObserver(mobileApp1);
        stockMarket.setStockPrice(160.50);
    }
}
