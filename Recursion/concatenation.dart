String concatenateArray(List<String> strings, int index) {
  // Base case: if the index is at the end of the array, return an empty string
  if (index == strings.length) {
    return "";
  }

  // Recursive case: concatenate the current string with the result of the rest of the array
  return strings[index] + concatenateArray(strings, index + 1);
}

void main() {
  List<String> stringArray = ["Hello", " ", "World", "!"];

  // Start the recursion with index 0
  String result = concatenateArray(stringArray, 0);

  print("Concatenated Result: $result");
}
