class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class BinarySearchTree {
  Node? root;

  // Insert function
  void insert(int data) {
    Node? current = root;
    Node? newNode = Node(data: data);

    if (root == null) {
      root = newNode;
      print("as root");
      return;
    }
    while (true) {
      if (data > current!.data!) {
        if (current.right == null) {
          current.right = newNode;
          print("right side");
          break;
        }
        current = current.right;
      } else {
        if (current.left == null) {
          current.left = newNode;
          print("left side");
          break;
        }
        current = current.left;
      }
    }
  }

  // Contains function
  bool contains(int data) {
    Node? curNode = root;
    while (curNode != null) {
      if (data < curNode.data!) {
        curNode = curNode.left;
      } else if (data > curNode.data!) {
        curNode = curNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  // Get closest function
  int getClose(int target) {
    Node? current = root;
    int? closest = current!.data;

    while (current != null) {
      if ((target - closest!).abs() > (target - current.data!)) {
        closest = current.data!;
      }
      if (target > current.data!) {
        current = current.right;
      } else if (target < current.data!) {
        current = current.left;
      } else {
        break;
      }
    }
    return closest!;
  }

  int? getmin(Node? currentNode) {
    if (currentNode!.left == null) {
      return currentNode.data;
    } else {
      getmin(currentNode.left);
    }
  }

  // Delete function
  void delete(int data) {
    root = deleteHelper(data, root);
  }

  Node? deleteHelper(int data, Node? current) {
    if (current == null) {
      return current;
    }

    // Recursive case: traverse the tree to find the node to delete
    if (data < current.data!) {
      current.left = deleteHelper(data, current.left);
    } else if (data > current.data!) {
      current.right = deleteHelper(data, current.right);
    } else {
      // Node to be deleted found

      // Case 1: Node with only one child or no child
      if (current.left == null) {
        return current.right;
      } else if (current.right == null) {
        return current.left;
      } else {
        // Case 2: Node with two children
        current.data = getmin(current.right!);
        current.right = deleteHelper(current.data!, current.right);
      }
    }

    return current;
  }

  inOrder() {
    inOrderHelper(root);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data!);
      inOrderHelper(node.right);
    }
  }

  void preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }
}



bool isBST(Node? node, int? min, int? max) {
  if (node == null) return true;

  if ((min != null && node.data! <= min) ||
      (max != null && node.data! >= max)) {
    //
    return false;
  }

  return isBST(node.left, min, node.data) && isBST(node.right, node.data, max);
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(40);
  bst.insert(20);
  bst.insert(10);
  bst.insert(60);
  bst.insert(50);
  bst.insert(70);
  bst.postOrder();
  // bst.inOrderHelper(bst.root);
  // print("==");
  // bst.delete(20);
  // bst.postOrder();
  print(isBST(bst.root, null, null));
}
