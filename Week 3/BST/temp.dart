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
      if (data > current.data!) {
        parent = current;
        current = current.right;
      } else if (data < current.data!) {
        parent = current;
        current = current.left;
      } else {
        //data found
        if (current.left != null && current.right != null) {
          current.data = getmin(current.right);
          deleteHelper(data, current.right, current);
        } else {
          Node? child = (current.left != null) ? current.left : current.right;
          if (parent == null) {
            root = child;
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
}
