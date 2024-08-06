package com.library;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {
    public static void main(String[] args) {
        // Load the Spring context from the XML configuration file
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Retrieve the BookService bean from the context
        BookService bookService = context.getBean("bookService", BookService.class);

        // Test if the BookService bean is properly wired with the BookRepository bean
        if (bookService != null && bookService.getBookRepository() != null) {
            System.out.println("Constructor and Setter Injection successful!");
        } else {
            System.out.println("Constructor and Setter Injection failed!");
        }

        // Invoke a method to see AOP in action
        bookService.someServiceMethod();
    }
}
