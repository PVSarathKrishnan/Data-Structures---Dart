import 'dart:collection';

class Graph {
  HashMap<int, List<int>> graph = HashMap();
  //insert function
  void insert(int vertex, int edge, bool isBiDirext) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isBiDirext) {
      graph[edge]!.add(vertex);
    }
  }

  //display function
  void display() {
    graph.forEach((key, value) {
      print("$key : $value");
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

  void bfsTraversal(int startVertex) {
    Queue<int> queue = Queue();
    Set<int> visited = Set();
    queue.add(startVertex);
    visited.add(startVertex);
    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print(currentVertex);

      List<int>? lists = graph[currentVertex];
      if (lists != null) {
        for (var neighbour in lists) {
          if (!visited.contains(neighbour)) {
            queue.add(neighbour);
            visited.add(neighbour);
          }
        }
      }
    }
    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        print("Isolated vertex  : $vertex");
      }
    });
  }

  void dfs(int startVertex) {
    Set<int> visited = Set();

    dfsRecursive(int currentVertex) {
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
}

void main() {
  Graph g = Graph();
  g.insert(20, 10, true);
  g.insert(10, 30, true);
  g.insert(30, 50, true);
  g.insert(50, 10, true);
  g.display();
  g.bfsTraversal(20);
  print("---");
  g.dfs(20);
}
