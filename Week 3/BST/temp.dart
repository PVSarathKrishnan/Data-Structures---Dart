// // //this file is a work space
// // class Node {
// //   int? data;
// //   Node? left, right;
// //   Node({this.data});
// // }

// // class BinaryST {
// //   Node? root;

// //   //insertion function
// //   void insert(int data) {
// //     Node? newNode = Node(data: data);
// //     Node? currentNode = root;
// //     if (root == null) {
// //       root = newNode;
// //       print("as root : $data");
// //       return;
// //     }
// //     while (true) {
// //       if (data > currentNode!.data!) {
// //         if (currentNode.right == null) {
// //           currentNode.right = newNode;
// //           print("$data added in right because it is bigger that ${root!.data}");
// //           return;
// //         }
// //         currentNode = currentNode.right;
// //       } else {
// //         if (currentNode.left == null) {
// //           currentNode.left = newNode;
// //           print("$data added in left because it is lesser that ${root!.data}");
// //           return;
// //         }
// //         currentNode = currentNode.left;
// //       }
// //     }
// //   }
// // }

// // void main() {
// //   BinaryST bst = BinaryST();
// //   bst.insert(50);
// //   bst.insert(10);
// //   bst.insert(55);
// // }

// // class Node {
// //   int? data;
// //   Node? left, right;

// //   Node({required this.data});
// // }

// // class BST {
// //   Node? root;

// //   //insertion

// //   void insert(int data) {
// //     Node? newNode = Node(data: data);
// //     Node? current = root;
// //     if (current == null) {
// //       root = newNode;
// //       return;
// //     }
// //     while (true) {
// //       if (data > current!.data!) {
// //         if (current.right == null) {
// //           current.right = newNode;
// //           break;
// //         }
// //         current = current.right;
// //       } else {
// //         if (current.left == null) {
// //           current.left = newNode;
// //           break;
// //         }
// //         current = current.left;
// //       }
// //     }
// //   }

// //   //contains function

// //   bool contains(int data) {
// //     Node? current = root;
// //     if (current!.data == data) {
// //       return true;
// //     } else {
// //       if (data > current.data!) {
// //         current = current.right;
// //       } else {
// //         current = current.left;
// //       }
// //     }
// //     return false;
// //   }

// //   //get closest function
// //   int getClosest(int target) {
// //     Node? current = root;
// //     int? closest = current!.data;

// //     while (current != null) {
// //       if ((target - closest!).abs() > (target - current.data!).abs()) {
// //         closest = current.data;
// //       }
// //       if (target < current.data!) {
// //         current = current.left;
// //       } else if (target > current.data!) {
// //         current = current.right;
// //       } else {
// //         break;
// //       }
// //     }
// //     return closest!;
// //   }

// //   void delete(int data) {
// //     deleteHelper(data, root, null);
// //   }

// //   void deleteHelper(int data, Node? current, Node? parent) {
// //     while (current != null) {
// //       if (data < current.data!) {
// //         parent = current;
// //         current = current.left;
// //       } else if (data > current.data!) {
// //         parent = current;
// //         current = current.right;
// //       } else {
// //         //data found
// //         if (current.left != null && current.right != null) {
// //           // 2 childs
// //           // current.data = getMin(current.right);
// //         }
// //       }
// //     }
// //   }

// //   //inOrder
// //   void inOrder() {
// //     inOrderHelper(root);
// //   }

// //   inOrderHelper(Node? node) {
// //     if (node != null) {
// //       inOrderHelper(node.left);
// //       print(node.data);
// //       inOrderHelper(node.right)
// //     }
// //   }
// // }

// class MinHeap {
//   List<int> heap = [];
//   maxHeap(List<int> arr) {
//     buildHeap(arr);
//   }

//   void buildHeap(List<int> arr) {
//     heap = arr;
//     for (int i = parent(heap.length - 1); i >= 0; i--) {
//       shiftDown(i);
//     }
//   }

//   parent(i) => (i - 1) ~/ 2;
//   leftChild(i) => (2 * i) + 1;
//   rightChild(i) => (2 * i) + 2;

//   shiftDown(i) {
//     int end
//   }
// }
