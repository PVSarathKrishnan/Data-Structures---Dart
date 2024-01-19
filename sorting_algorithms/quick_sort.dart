class QuickSort {

  // Method to perform quicksort on the given list
  List<int> quick(List<int> arr){
    sort(arr, 0, arr.length-1);
    return arr;
  }

  // Recursive method to perform the partitioning and sorting
  void sort(List<int> arr, int start, int end){

    // Base case: If the start index is greater than or equal to end index, return
    if(start >= end){
      return;
    }
     
    // Initialize pivot, left, and right pointers
    int pivot = start;
    int left = start + 1;
    int right = end;

    // Continue until left pointer is less than or equal to right pointer
    while(left <= right){

      // Swap elements if left element is greater than pivot and right element is less than pivot
      if(arr[left] > arr[pivot] && arr[right] < arr[pivot]){
        swap(arr, left, right);
        left++;
        right--;
      }

      // Move left pointer to the right if the element is less than or equal to pivot
      if(arr[left] <= arr[pivot]){
        left++;
      }

      // Move right pointer to the left if the element is greater than or equal to pivot
      if(arr[right] >= arr[pivot]){
        right--;
      }
    }

    // Swap pivot with the element at the right pointer position
    swap(arr, right, pivot);

    // Recursively sort the left partition
    sort(arr, start, right - 1);

    // Recursively sort the right partition
    sort(arr, right + 1, end);
  }
  
  // Method to swap two elements in the list
  void swap(List<int> arr, int i, int j){
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main(){

  // Example usage
  List<int> arr = [1, 4, 3, 6, 4, 3, 9];

  QuickSort q = QuickSort();
  print(q.quick(arr));
}
