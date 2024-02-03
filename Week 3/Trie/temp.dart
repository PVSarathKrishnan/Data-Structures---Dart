import 'dart:collection';

import 'prefix.dart';

class TrieNode {
  HashMap<String, TrieNode> children = HashMap();
  bool end = false;
}

class trie {
  TrieNode root = TrieNode();

  //functions
  void inserWord(String word) {
    TrieNode? temp = root;

    for (int i = 0; i < word.length; i++) {
      if (!temp!.children.containsKey(word[i])) {
        TrieNode newNode = TrieNode();
        temp.children[word[i]] = newNode;
      }
      temp = temp.children[word[i]];
    }
    temp!.end = true;
  }

  bool contains(String prefix) {
    TrieNode temp = root;

    for (int i = 0; i < prefix.length; i++) {
      if (temp.children[prefix[i]] == null ||
          !temp.children.containsKey(prefix[i])) {
        return false;
      }
      temp = temp.children[prefix[i]]!;
    }
    return true;
  }
}

void main() {
  Trie newTrie = Trie();
  newTrie.insertWord("farhan");

  print(newTrie.containsPrefix("far")); // Output: true
  print(newTrie.containsPrefix("han")); // Output: false
}
