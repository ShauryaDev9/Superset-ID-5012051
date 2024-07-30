
public class BuilderPatternTest {
    public static void main(String[] args) {
        Computer gamingPC = new Computer.Builder()
                .setCPU("Intel i9")
                .setRAM("32GB")
                .setStorage("1TB SSD")
                .setGPU("NVIDIA RTX 3080")
                .setOS("Windows 10")
                .build();

        Computer officePC = new Computer.Builder()
                .setCPU("Intel i5")
                .setRAM("16GB")
                .setStorage("512GB SSD")
                .setOS("Windows 10")
                .build();

        Computer basicPC = new Computer.Builder()
                .setCPU("Intel i3")
                .setRAM("8GB")
                .setStorage("256GB SSD")
                .setOS("Linux")
                .build();

        System.out.println("Gaming PC Configuration: " + gamingPC);
        System.out.println("Office PC Configuration: " + officePC);
        System.out.println("Basic PC Configuration: " + basicPC);
    }
}
