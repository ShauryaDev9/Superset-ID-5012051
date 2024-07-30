import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Library {
    private List<Book> books;

    public Library(List<Book> books) {
        this.books = books;
    }

    // Linear Search Method
    public Book linearSearchByTitle(String title) {
        for (Book book : books) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                return book;
            }
        }
        return null; // If book not found
    }

    // Binary Search Method
    public Book binarySearchByTitle(String title) {
        Collections.sort(books, Comparator.comparing(Book::getTitle));

        int low = 0;
        int high = books.size() - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            Book midBook = books.get(mid);

            int comparison = midBook.getTitle().compareToIgnoreCase(title);
            if (comparison == 0) {
                return midBook; // Found book
            } else if (comparison < 0) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return null; // If book not found
    }
}
