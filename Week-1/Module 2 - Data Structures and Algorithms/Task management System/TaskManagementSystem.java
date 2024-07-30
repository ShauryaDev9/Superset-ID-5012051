public class TaskManagementSystem {
    private class Node {
        Task task;
        Node next;

        Node(Task task) {
            this.task = task;
            this.next = null;
        }
    }

    private Node head;

    public TaskManagementSystem() {
        head = null;
    }

    // Add task to end of the list
    public void addTask(Task task) {
        Node newNode = new Node(task);
        if (head == null) {
            head = newNode;
        } else {
            Node temp = head;
            while (temp.next != null) {
                temp = temp.next;
            }
            temp.next = newNode;
        }
    }

    // Search for a task
    public Task searchTask(int taskId) {
        Node temp = head;
        while (temp != null) {
            if (temp.task.getTaskId() == taskId) {
                return temp.task;
            }
            temp = temp.next;
        }
        return null; // If Task not found
    }

    // Travel and display all tasks
    public void displayAllTasks() {
        Node temp = head;
        while (temp != null) {
            System.out.println(temp.task);
            temp = temp.next;
        }
    }

    // Delete task
    public void deleteTask(int taskId) {
        Node temp = head;
        Node prev = null;

        // If head node itself holds the taskId
        if (temp != null && temp.task.getTaskId() == taskId) {
            head = temp.next; // Change head
            return;
        }

        // Search for the taskId to be deleted
        while (temp != null && temp.task.getTaskId() != taskId) {
            prev = temp;
            temp = temp.next;
        }

        // If taskId was not found
        if (temp == null) {
            System.out.println("Task not found");
            return;
        }

        // Unlink the node from the linked list
        prev.next = temp.next;
    }
}
