//suffix - Trie

import 'dart:collection';

class TrieNode{
  HashMap<String, TrieNode> children = HashMap();
  bool end = false;
}

class Trie {
  TrieNode root = TrieNode();

  void insertWord(String word) {
    TrieNode temp = root;
for(int i = word.length-1;i>=0;i--){
  if(!temp.children.containsKey(word[i])) {
    TrieNode newNode = TrieNode();
    temp.children[word[i]] = newNode;
  }
  temp = temp.children[word[i]]!;
}
    temp.end = true;//end marking
  }

  //contains function
  bool containsSuffix(String suffix) {
    TrieNode temp = root;
    for(int i=suffix.length-1;i>=0;i--) {
      if(temp.children[suffix[i]]==null ||
        !temp.children.containsKey(suffix[i])) {
        return false;
      }
      temp = temp.children[suffix[i]]!;
    }
    return true;
  }
}
void main() {
  Trie newTrie = Trie();
  newTrie.insertWord("farhan");
  
  print(newTrie.containsSuffix("far")); // Output: false
  print(newTrie.containsSuffix("han")); // Output: true
}
