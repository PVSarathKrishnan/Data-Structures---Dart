import 'dart:collection';

class TrieNode {
  HashMap children = HashMap();
}

class Trie {
  TrieNode root = TrieNode();
  String end = "*";

  void populateSuffixTrie(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubStringAt(i, str);
    }
  }

  void insertSubStringAt(int index, String str) {
    TrieNode temp = root;

    for (int i = index; i < str.length; i++) {
      if (!temp.children.containsKey(str[i])) {
        TrieNode newNode = TrieNode();
        temp.children[str[i]] = newNode;
      }
      temp = temp.children[str[i]];
    }
    temp.children[end] = TrieNode();
  }
}
