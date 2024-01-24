class Node {
  int? data;
  Node? left, right;
  Node({required this.data});
}

class BinarySearchTree {
  Node? root;

  // Insert function
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
        if (current.right == null) {
          current.right = newNode;
          print("$data added right");
          break;
        }
        current = current.right;
      }
    }
  }

  // Contains function
  bool contains(int data) {
    Node? current = root;
    while (current != null) {
      if (current.data == data) {
        return true;
      } else if (data > current.data!) {
        current = current.right;
      } else {
        current = current.left;
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

  // Demonstrate getClose function

  print(bst.getClose(15));
 
}

  // void delete(int target) {
  //   deleteHelper(target, root, null);
  // }

  // void deleteHelper(int data, Node? currentNode, Node? parent) {
  //   while (currentNode != null) {
  //     if (data > currentNode.data!) {
  //       //move to right
  //       parent = currentNode;
  //       currentNode = currentNode.right;
  //     } else if (data < currentNode.data!) {
  //       parent = currentNode;
  //       currentNode = currentNode.right;
  //     } else { //item found
      
  //     }
  //   }
  // }

