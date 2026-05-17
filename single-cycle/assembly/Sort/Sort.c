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

main:	
	addi s1, zero, 0x0
	add s2, s1, zero
	
While1:	
	slti t0, s2, 40
	beq t0, zero, endWhile1
	add s3, s1, zero
While2:
	slti t0, s3, 36
	beq t0, zero, endWhile2
	lw s4, 0(s3) //A[j]
	lw s5, 4(s3) //A[j + 1]
if:
	bge s4, s5, endif
	sw s4, 4(s3)
	sw s5, 0(s4)
endif:
	addi s3, s3, 4
	j while2
endWhile2:
	addi s2, s2, 4
	j while1
endWhile1:
endmain:
	j endmain



addi	s1, zero, 0x0
add	s2, s1, zero
slti	t0, s2, 40
beq	t0, zero, 52
add	s3, s1, zero
slti	t0, s3, 36
beq	t0, zero, 32
lw	s4, 0(s3)
lw	s5, 4(s3)
bge	s4, s5, 12
sw	s4, 4(s3)
sw	s5, 0(s4)
addi	s3, s3, 4
jal	zero, -32
addi	s2, s2, 4
jal	zero, -52
jal	zero, 0
