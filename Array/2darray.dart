void main() {
  List<List<int>> m1 = [
    [1, 2, 3],
    [6, 8, 9],
    [4, 6, 8]
  ];

  List<List<int>> m2 = [
    [2, 5,0],
    [9, 4, 55],
    [34, 54, 32]
  ];

  List<List<int>> sum =
      List.generate(m1.length, (i) => List.generate(m2.length, (j) => 0));
  print(sum);

  for (var i = 0; i < m1.length; i++) {
    for (var j = 0; j < m2.length; j++) {
      sum[i][j] = m1[i][j] + m2[i][j];
    }
  }
  print("updated");
  print(sum);
}
