public class Main {
    public static void main(String[] args) {
        InventoryManager manager = new InventoryManager();

        Product p1 = new Product(101, "Laptop", 10, 1500.0);
        Product p2 = new Product(102, "Mouse", 50, 25.0);
        Product p3 = new Product(103, "Keyboard", 30, 45.0);

        manager.addProduct(p1);
        manager.addProduct(p2);
        manager.addProduct(p3);

        System.out.println("\nUpdating product 102:");
        manager.updateProduct(102, 60, 22.0);

        System.out.println("\nDeleting product 103:");
        manager.deleteProduct(103);

        System.out.println("\nFinal Inventory:");
        manager.displayAllProducts();
    }
}
