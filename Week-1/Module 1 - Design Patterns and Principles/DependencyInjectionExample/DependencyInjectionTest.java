public class DependencyInjectionTest {
    public static void main(String[] args) {
        // Create a concrete repository
        CustomerRepository customerRepository = new CustomerRepositoryImpl();

        // Inject the repository into the service
        CustomerService customerService = new CustomerService(customerRepository);

        // Use the service to find and print customer details
        customerService.printCustomerDetails("12345");
    }
}
// //Explanation
// CustomerRepository: Interface defining the contract for the repository.
// CustomerRepositoryImpl: Concrete implementation of the CustomerRepository
// interface.
// CustomerService: Depends on CustomerRepository and uses constructor injection
// to receive an instance of it.
// DependencyInjectionTest: Main class that demonstrates the creation of
// CustomerService with CustomerRepositoryImpl injected.