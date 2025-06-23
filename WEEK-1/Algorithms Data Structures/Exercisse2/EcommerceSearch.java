// EcommerceSearch.java

import java.util.Arrays;

class Product implements Comparable<Product> {
    int productId;
    String productName;
    String category;

    Product(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    @Override
    public int compareTo(Product other) {
        return this.productName.compareToIgnoreCase(other.productName);
    }

    @Override
    public String toString() {
        return "ProductID: " + productId + ", Name: " + productName + ", Category: " + category;
    }
}

public class EcommerceSearch {

    public static Product linearSearch(Product[] products, String name) {
        for (Product p : products) {
            if (p.productName.equalsIgnoreCase(name)) {
                return p;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String name) {
        int left = 0, right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int cmp = products[mid].productName.compareToIgnoreCase(name);

            if (cmp == 0) return products[mid];
            else if (cmp < 0) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Shirt", "Clothing"),
            new Product(103, "Mobile", "Electronics"),
            new Product(104, "Shoes", "Footwear"),
            new Product(105, "Book", "Education")
        };

        System.out.println("Linear Search Result:");
        Product found1 = linearSearch(products, "Shoes");
        System.out.println(found1 != null ? found1 : "Product not found");

        Arrays.sort(products);  

        System.out.println("\nBinary Search Result:");
        Product found2 = binarySearch(products, "Shoes");
        System.out.println(found2 != null ? found2 : "Product not found");
    }
}
