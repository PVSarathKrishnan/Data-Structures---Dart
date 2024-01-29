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

  void bFsTraversal(int startVertex) {
    Queue<int> queue = Queue();
    Set<int> visited = Set();
    queue.add(startVertex);
    visited.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeLast();
      print("$currentVertex");
      List<int>? lists = graph[currentVertex];
      if (lists != null) {
        for (int neighbours in lists) {
          if (!visited.contains(neighbours)) {
            queue.add(neighbours);
            visited.add(neighbours);
          }
        }
      }
    }
    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        print("isolated vertex  : $vertex");
      }
    });
  }

  void bfs(int startVertex) {
    Queue<int> queue = Queue();
    Set<int> visited = Set();
    queue.add(startVertex);
    visited.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeLast();
      print(currentVertex);
      List<int>? lists = graph[currentVertex];
      if (lists != null) {
        for (var neighbours in lists) {
          if (!visited.contains(neighbours)) {
            queue.add(neighbours);
            lists.add(neighbours);
          }
        }
      }
    }
    graph.keys.forEach((vetex) {
      if (!visited.contains(vetex)) {
        print("Isolated vertex : $vetex");
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
  g.bFsTraversal(20);
}
