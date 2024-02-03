import 'dart:collection';

class Graph {
  HashMap<int, List<int>> graph = HashMap();

  //insertion function
  void insert(int vertex, int edge, bool isBidirect) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isBidirect) {
      graph[edge]!.add(vertex);
    }
  }

  //display function
  void display() {
    graph.forEach((key, value) {
      print("$key : $value");
    });
  }

  //remove function
  void remove(int data) {
    if (graph.containsKey(data)) {
      graph.remove(data);
    }
    graph.forEach((key, value) {
      if (value.contains(data)) {
        value.remove(data);
      }
    });
  }

  //dfs traversal
  void dfsTraversal(int startVertex) {
    Set<int> visited = Set();

    void dfsRecursive(int currentVertex) {
      print(currentVertex);
      visited.add(currentVertex);

      List<int>? neighbours = graph[currentVertex];
      for (var n in neighbours!) {
        if (!visited.contains(n)) {
          dfsRecursive(n);
        }
      }
    }

    dfsRecursive(startVertex);
    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        dfsRecursive(vertex);
      }
    });
  }

  //BFS Traversal
  void bfsTraversal(int startVertex) {
    Queue<int> QQ = Queue();
    Set<int> visited = Set();
    QQ.add(startVertex);
    visited.add(startVertex);

    while (QQ.isNotEmpty) {
      int currentVertex = QQ.removeFirst();
      print(currentVertex);
      List<int>? neighbours = graph[currentVertex];
      for (var n in neighbours!) {
        if (!visited.contains(n)) {
          QQ.add(n);
          visited.add(n);
        }
      }
    }
  }
}

void main() {
  Graph g = Graph();

  // Inserting vertices and edges
  g.insert(1, 2, true);
  g.insert(1, 3, true);
  g.insert(2, 4, true);
  g.insert(2, 5, true);
  g.insert(3, 6, true);
  g.insert(3, 7, true);

  // Displaying the graph
  print("Graph:");
  g.display();
  print("\n");

  // Performing BFS traversal starting from vertex 1
  print("BFS Traversal:");
  g.bfsTraversal(1);
  print("\n");

  // Performing DFS traversal starting from vertex 1
  print("DFS Traversal:");
  g.dfsTraversal(1);
}
