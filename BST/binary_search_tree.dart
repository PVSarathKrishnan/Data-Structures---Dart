class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class BinarySearchTree {
  Node? root;

  //functions
  //insert function
  void insert(int data) {
    Node newNode = Node(data: data);
    Node? current = root;

    if (current == null) {
      root = newNode;
      print("$data added as root");
      return;
    }
    while (true) {
      if (data < current!.data!) {
        if (current.left == null) {
          current.left = newNode;
          print("$data added left");
          break;
        }
        current = current.left;
      } else {
        current.right = newNode;
        print("$data added right");
        break;
      }
      current!.right = newNode;
    }
  }

  // // contains function
  // bool contains(int data) {
  //   Node? current = root;
  //   while (current != null) {
  //     if (current.data! > data) {}
  //   }
  // }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(20);
  bst.insert(5);
}
