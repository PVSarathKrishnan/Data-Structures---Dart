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

  inOrderHelper(Node? node, List<int> arr) {
    if (node != null) {
      inOrderHelper(node.left, arr);
      arr.add(node.data!);
      inOrderHelper(node.right, arr);
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

bool bstCheck(List<int> arr) { // this function uses inorder traversal for bst checking : 
  bool check = false;
  for (var i = 0; i < arr.length - 1; i++) {
    if (arr[i] < arr[i + 1]) {
      check = true;
    }
  }
  return check;
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
  List<int> result = [];
  bst.insert(40);
  bst.insert(20);
  bst.insert(10);
  bst.insert(60);
  bst.insert(50);
  bst.insert(70);
  bst.inOrderHelper(bst.root, result);
  print(result);
  print(bstCheck(result));
  print(bst.getClose(100));
  print(isBST(bst.root, null, null));
  
}
