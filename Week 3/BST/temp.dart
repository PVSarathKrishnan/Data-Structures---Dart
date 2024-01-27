//this file is a work space
class Node {
  int? data;
  Node? left, right;
  Node({this.data});
}

class BinaryST {
  Node? root;

  //insertion function
  void insert(int data) {
    Node? newNode = Node(data: data);
    Node? currentNode = root;
    if (root == null) {
      root = newNode;
      print("as root : $data");
      return;
    }
    while (true) {
      if (data > currentNode!.data!) {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          print("$data added in right because it is bigger that ${root!.data}");
          return;
        }
        currentNode = currentNode.right;
      } else {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          print("$data added in left because it is lesser that ${root!.data}");
          return;
        }
        currentNode = currentNode.left;
      }
    }
  }
}

void main() {
  BinaryST bst = BinaryST();
  bst.insert(50);
  bst.insert(10);
  bst.insert(55);
}
