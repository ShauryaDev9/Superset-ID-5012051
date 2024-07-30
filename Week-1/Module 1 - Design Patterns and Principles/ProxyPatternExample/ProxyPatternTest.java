public class ProxyPatternTest {
    public static void main(String[] args) {
        Image image1 = new ProxyImage("image1.jpg");
        Image image2 = new ProxyImage("image2.jpg");

        // Images are loaded on first access
        image1.display();
        System.out.println();
        image2.display();

        // Images are not loaded again
        System.out.println();
        image1.display();
        image2.display();
    }
}
