public class MVCPatternTest {
    public static void main(String[] args) {
        // Create a Student model
        Student student = new Student("Shaurya", "S12345", "A");

        // Create a view to display student details
        StudentView view = new StudentView();

        // Create a controller to manage the student model and view
        StudentController controller = new StudentController(student, view);

        // Display student details
        controller.updateView();

        // Update student details
        controller.setStudentName("Shaurya Verma");
        controller.setStudentId("S54321");
        controller.setStudentGrade("B");

        // Display updated student details
        controller.updateView();
    }
}
