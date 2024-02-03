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
}

void main() {
  Graph g = Graph();
  g.insert(10, 20, true);
  g.insert(30, 10, false);
  g.insert(40, 20, true);
  g.insert(50, 40, true);
  g.display();
}
