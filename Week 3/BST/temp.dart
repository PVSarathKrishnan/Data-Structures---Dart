import 'dart:mirrors';

class Node {
  int? data;
  Node? right, left;

  Node({required this.data});
}

class Bst {
  Node? root;
  // insert
  void insert(int data) {
    Node newNode = Node(data: data);
    if (root == null) {
      root = newNode;
      return;
    }
    Node current = root!;
    while (true) {
      if (data < current.data!) {
        if (current.left == null) {
          current.left = newNode;
          break;
        }
        current = current.left!;
      } else if (data >= current.data!) {
        if (current.right == null) {
          current.right = newNode;
          break;
        } else
          current = current.right!;
      }
    }
  }

  bool contains(int data) {
    Node? current = root;
    while (current != null) {
      if (data > current.data!) {
        current = current.right;
      } else if (data < current.data!) {
        current = current.left!;
      } else {
        return true;
      }
    }
    return false;
  }

  int getclose(int target) {
    Node? current = root;
    int closest = current!.data!;

    while (current != null) {
      if ((target - closest).abs() > (target - current.data!)) {
        closest = current.data!;
      }
      if (target > current.data!) {
        current = current.right;
      } else {
        current = current.left;
      }
    }
    return closest;
  }

  //indorder
  void inorder() {
    inorderHelper(root);
  }

  inorderHelper(Node? node) {
    if (node != null) {
      inorderHelper(node.left);
      print(node.data);
      inorderHelper(node.right);
    }
  }
}

void main() {
  Bst b = Bst();
  b.insert(10);
  b.insert(5);
  b.insert(15);
  b.inorder();
  b.insert(5);
  b.inorder();
  print(b.contains(20));
  print(b.contains(10));
  print(b.getclose(7));
  print(b.getclose(5));
}
