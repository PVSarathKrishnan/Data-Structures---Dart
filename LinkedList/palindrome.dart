class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
  }
}

bool isPalindrome(Node head) {
  // Helper function to reverse a linked list in place
  Node? reverse(Node node) {
    Node? prev = null;
    Node current = node;
    // ignore: unnecessary_null_comparison
    while (current != null) {
      Node? nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode!;
    }
    return prev;
  }

  // Create a copy of the original linked list
  Node originalCopy = head;

  // Reverse the original linked list
  Node? reversedList = reverse(head);

  // Compare the reversed list with the original copy
  while (reversedList != null) {
    if (originalCopy.data != reversedList.data) {
      return false;
    }
    originalCopy = originalCopy.next!;
    reversedList = reversedList.next;
  }

  return true;
}

void main() {
  // Example usage
  Node head = Node(1)
    ..next = Node(2)
    ..next!.next = Node(3)
    ..next!.next!.next = Node(2)
    ..next!.next!.next!.next = Node(1);

  if (isPalindrome(head)) {
    print("The linked list is a palindrome.");
  } else {
    print("The linked list is not a palindrome.");
  }
}
