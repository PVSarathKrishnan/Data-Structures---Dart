import 'dart:collection';
import 'dart:ffi';

class Graph {
  HashMap<int, List<int>> graph = HashMap();
  // insertion

  void insertion(int vertex, int edge, bool isBidirect) {
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

  //deletion
  void remove(int data) {
    if (graph.containsKey(data)) {
      graph.remove(data);
      graph.forEach((key, value) {
        value.remove(data);
      });
    }
  }

  //display

  void display() {
    graph.forEach((key, value) {
      print("$key : $value");
    });
  }

  //dfs
  void dfs(int startVertex) {
    Set<int> visited = Set();

    void dfsRecursive(int currentVertex) {
      print(currentVertex);
      visited.add(currentVertex);

      List<int>? neighbours = graph[currentVertex];
      if (neighbours != null) {
        for (var n in neighbours) {
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

  void bfs(int startVertex) {
    Queue<int> qq = Queue();
    Set<int> visited = Set();

    visited.add(startVertex);
    qq.add(startVertex);
    while (qq.isNotEmpty) {
      int currentVertex = qq.removeFirst();
      print(currentVertex);
      List<int>? neighbours = graph[currentVertex];

      if (neighbours != null) {
        for (var n in neighbours) {
          if (!visited.contains(n)) {
            visited.add(n);
            qq.add(n);
          }
        }
      }
    }
  }
}
