#include <iostream>


#define SIZE 10

void merge_sort(int A[], int T[], int start, int end);

int main(){
	int T[SIZE];
	int A[SIZE];
	for(int i = 0; i < SIZE ; i++){
		std::cin >> A[i];
	}
	merge_sort(A, T, 0, SIZE);
	for(int i = 0; i < SIZE ; i++){
		std::cout << A[i] << " ";
	}
}

void merge_sort(int A[], int T[], int start, int end){
	if(start == end || start + 1 == end){
		return;
	}
	int middle = (start + end) / 2;
	merge_sort(A, T, start, middle);
	merge_sort(A, T, middle, end);

	for(int i = start; i < end ; ++i){
		T[i] = A[i];
	}

	int i = start;
	int j = middle;
	int k = start;

	while(i < middle && j < end){
		if(T[i] >= T[j]){
			A[k++] = T[i++];
		}else{
			A[k++] = T[j++];
		}
	}
	while(i < middle){
		A[k++] = T[i++];
	}
	while(j < end){
		A[k++] = T[j++];
	}
	return;

}
