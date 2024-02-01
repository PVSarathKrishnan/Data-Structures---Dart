import 'dart:collection';

class TrieNode {
  HashMap<String, TrieNode> children = HashMap();
  bool end = false;
}

class Trie {
  TrieNode root = TrieNode();

  Trie() {
    // Empty constructor for now
  }

  void insertWord(String word) {
    TrieNode temp = root;

    for (int i = 0; i < word.length; i++) {
      if (!temp.children.containsKey(word[i])) {
        TrieNode newNode = TrieNode();
        temp.children[word[i]] = newNode;
      }
      temp = temp.children[word[i]]!;
    }
    temp.end = true; // Mark the end of the inserted word.
  }

  bool containsPrefix(String prefix) {
    TrieNode temp = root;

    for (int i = 0; i < prefix.length; i++) {
      if (temp.children[prefix[i]] == null ||
          !temp.children.containsKey(prefix[i])) {
        return false;
      }
      temp = temp.children[prefix[i]]!;
    }
    return true; // Return true for any prefix of inserted words.
  }
}

void main() {
  Trie newTrie = Trie();
  newTrie.insertWord("farhan");

  print(newTrie.containsPrefix("far")); // Output: true
  print(newTrie.containsPrefix("han")); // Output: false
}
