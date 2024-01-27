class selection{
  List<int> select(List<int> arr){
    for(int i = 0;i<arr.length-1;i++){
      int small  = i;
      for(int j = i+1;j<arr.length;j++){
        if(arr[small] > arr[j]){
          small = j;
        }
      } 
      int  temp = arr[small];
      arr[small] = arr[i];
      arr[i] = temp;
    }
    return arr;
  }
}

void main(){
  List<int> arr = [1,3,5,2,6,4,7,3];

  selection s = selection();
  print(s.select(arr));
}