#include <iostream>
using namespace std;

int partition(int A[],int Low, int High);
void swap(int* a, int* b);
void printArray(int A[],int size);
void quicksort(int A[], int LowIndex, int HighIndex);

void swap(int* a, int* b){

    int temp = *a;
    *a =*b;
    *b = temp;
}

void printArray(int A[], int size){

    cout<<"\n";
    for(int i = 0; i< size; i++){
        cout<<A[i]<<" ";
    }
    
}

int main()
{
    int A[] = {1,4,6,3,5,7,2,1,-3,3,5,3,2,1,4};
    int size = sizeof(A) / sizeof(A[0]);
    
    cout<<"Array Before QuickSort "<<endl;
    printArray(A,size);
    
    quicksort(A,0,size);

    cout<<"Array After QuickSort"<<endl;
    printArray(A,size);    

    return 0;
}

// A is the array, LowIndex and HighIndex ->  the range in which you want to sort the array that's probably -> 0 & (A.count -1)
void quicksort(int A[], int LowIndex, int HighIndex){
    if (LowIndex>=HighIndex){
        return;
    }

    int IndexOfPartitionElement = partition( A, LowIndex, HighIndex);
    quicksort(A, LowIndex, IndexOfPartitionElement-1);
    quicksort(A, IndexOfPartitionElement+1,HighIndex);

}

int partition(int A[],int LowIndex, int HighIndex){
    int pivot = A[HighIndex];
    int i = LowIndex - 1;
    for(int j=LowIndex; j<= HighIndex-1; j++){
        if (A[j]<pivot){
            i++;
            swap(A[j],A[i]);
        }
    }
    swap(A[i+1],A[HighIndex]);
    return (i+1);
}

