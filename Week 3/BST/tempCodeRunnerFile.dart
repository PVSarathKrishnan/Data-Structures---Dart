// ignore_for_file: body_might_complete_normally_nullable

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
          return;
        }
        current = current.right;
      } else {
        if (current.left == null) {
          current.left == newNode;
          print("left side");
          return;
        }
        current = current.left;
      }
    }
  }

  // Contains function
  bool contains(int data) {
    Node? current = root;
    while (current != null) {
      if (current.data == data) {
        return true;
      } else {
        if (data > current.data!) {
          current = current.right;
        } else {
          current = current.left;
        }
      }
    }
    return false;
  }

  // Get closest function
  int getClose(int target) {
    Node? curNode = root;
    int? closest = curNode!.data;

    while (curNode != null) {
      if ((target - closest!).abs() > (target - curNode.data!).abs()) {
        closest = curNode.data!;
      }
      if (target < curNode.data!) {
        curNode = curNode.left;
      } else if (target > curNode.data!) {
        curNode = curNode.right;
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

  void delete(int data) {
    deleteHelper(data, root, null);
  }

  void deleteHelper(int data, Node? current, Node? parent) {
    while (current != null) {
      if (data < current.data!) {
        parent = current;
        current = current.left;
      } else if (data > current.data!) {
        parent = current;
        current = current.right;
      } else {
        //data found
        if (current.left != null && current.right != null) {
          //node have 2 children
          current.data = getmin(current.right);
          deleteHelper(data, current.right, current);
        } else {
          //node have 0 or 1 child
          Node? child = (current.left != null) ? current.left : current.right;
          if (parent == null) {
            root = child; // node to delete is root
          } else {
            if (parent.left == current) {
              parent.left = child;
            } else {
              parent.right = child;
            }
          }
        }
        break;
      }
    }
  }

  void inOrder() {
    inOrderHelper(root);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
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

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(20);
  bst.insert(5);
  print(bst.contains(70));
  bst.insert(70);
  print(bst.contains(70));
  bst.getClose(68);
  bst.contains(5);
  bst.contains(55);
  // Demonstrate getClose function

  print(bst.getClose(15));

  if (isBST(bst.root, null, null)) {
    print("The tree is a Binary Search Tree (BST).");
  } else {
    print("The tree is not a Binary Search Tree (BST).");
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
