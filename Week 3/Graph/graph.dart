import 'dart:collection';
import 'dart:html';

class Graph {
  HashMap<int, List<int>> graph = HashMap();

  // insert Function
  void insert(int vertex, int edge, bool isBiDirect) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isBiDirect) {
      graph[edge]!.add(vertex);
    }
  }

  //display function
  void display() {
    graph.forEach((key, value) {
      print("$key:$value");
    });
  }

  // remove
  void remove(int data) {
    if (graph.containsKey(data)) {
      graph.remove(data);
      graph.forEach((key, value) {
        value.remove(data);
      });
    }
  }

  void dfs(int startVertex) {
    Set<int> visited = Set();
    void dfsRecursive(int currentVertex) {
      print(currentVertex);
      visited.add(currentVertex);
      List<int>? neighbours = graph[currentVertex];
      if (neighbours != null) {
        for (int n in neighbours) {
          if (!visited.contains(n)) {
            dfsRecursive(n);
          }
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
  g.insert(20, 10, true);
  g.insert(30, 10, true);
  g.insert(40, 10, true);
  g.insert(50, 10, false);

  g.display();
}
