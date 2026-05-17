#define SIZE 10

int main(){
	int A[SIZE]; //values are available in memory


	int i = 0;
	while(i < SIZE){
		int j = 0;
		while(j < SIZE - 1){
			if(A[j] < A[j + 1]){
				swap(A[j], A[j + 1]);
			}
			j += 1;
		}
		i += 1;
	}
}
