import java.util.HashMap;
import java.util.Map;

public class InventoryManager {
    private Map<String, Product> inventory;

    public InventoryManager() {
        inventory = new HashMap<>();
    }

    // Adding a product
    public void addProduct(Product product) {
        inventory.put(product.getProductId(), product);
    }

    // Updating a product
    public void updateProduct(String productId, int quantity, double price) {
        Product product = inventory.get(productId);
        if (product != null) {
            product.setQuantity(quantity);
            product.setPrice(price);
        }
    }

    // Deleting a product
    public void deleteProduct(String productId) {
        inventory.remove(productId);
    }

    // Retrieving a product
    public Product getProduct(String productId) {
        return inventory.get(productId);
    }

    // Printing all products
    public void printAllProducts() {
        for (Product product : inventory.values()) {
            System.out.println(product);
        }
    }
}
