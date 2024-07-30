import java.util.Arrays;

public class BinarySearch {
    public static Product searchProductByName(Product[] products, String targetName) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = products[mid].getProductName().compareToIgnoreCase(targetName);

            if (comparison == 0) {
                return products[mid];
            } else if (comparison < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null; // Not found
    }

    public static void main(String[] args) {
        Product[] products = {
                new Product("1", "iPhone 15 pro max", "Electronics"),
                new Product("2", "Samsung S22 Ultra", "Electronics"),
                new Product("3", "Boss Headphones", "Audio")
        };

        Arrays.sort(products, (p1, p2) -> p1.getProductName().compareToIgnoreCase(p2.getProductName()));

        Product result = searchProductByName(products, "Samsung S22 Ultra");
        if (result != null) {
            System.out.println("Found: " + result);
        } else {
            System.out.println("Product not found.");
        }
    }
}
