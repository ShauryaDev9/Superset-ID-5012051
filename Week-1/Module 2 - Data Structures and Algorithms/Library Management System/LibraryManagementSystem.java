import java.util.ArrayList;
import java.util.List;

public class LibraryManagementSystem {
    public static void main(String[] args) {
        List<Book> books = new ArrayList<>();
        books.add(new Book(1, "The Great Gatsby", "F. Scott Fitzgerald"));
        books.add(new Book(2, "Moby Dick", "Herman Melville"));
        books.add(new Book(3, "1984", "George Orwell"));
        books.add(new Book(4, "To Kill a Mockingbird", "Harper Lee"));

        Library library = new Library(books);

        // Using Linear Search
        Book book1 = library.linearSearchByTitle("1984");
        System.out.println("Linear Search Result: " + (book1 != null ? book1 : "Not Found"));

        // Using Binary Search
        Book book2 = library.binarySearchByTitle("Moby Dick");
        System.out.println("Binary Search Result: " + (book2 != null ? book2 : "Not Found"));
    }
}
