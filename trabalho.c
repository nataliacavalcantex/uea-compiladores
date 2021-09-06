#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define OPEN_BRACKET 0
#define CLOSE_BRACKET 1
#define PLUS 2
#define MINUS 3
#define MULTIPLICATION 4
#define DIVISION 5


void push(int * stack, int * stack_index, int value){
	(*stack_index)++;
	stack[*stack_index] = value;
}

void pop(int * stack, int * stack_index){
	stack[*stack_index] = 0;
	(*stack_index)--;	
}

int top(int * stack, int * stack_index){
	return stack[*stack_index];
}

int is_empty(int * stack_index){
	return (*stack_index) == -1;
}

void debug_stack(int * stack, int index){
	for(int i=0; i<=index; ++i){
		printf("%d ", stack[i]);
	}	
	printf("\n");
}

int operation(int x, int y, int operator){
	if(operator == (int)'*') return x * y;
	if(operator == (int)'/') return x / y;
	if(operator == (int)'+') return x + y;
	if(operator == (int)'-') return x - y;
}

int has_priority(int operator){
	return operator == (int)'*' || operator == (int)'/';
}

void make_operation(int * values, int * values_index, int * operators, int * operators_index){
	int y = top(values, values_index);
	pop(values, values_index);
	
	int x = top(values, values_index);
	pop(values, values_index);
	
	char operator = top(operators, operators_index);
	pop(operators, operators_index);
	
	push(values, values_index, operation(x, y, operator));
}

int solve(char * expression){
	int expression_length = strlen(expression);	
	int max_stack_size = expression_length;
	int values[max_stack_size], values_index = -1;
	int operators[max_stack_size], operators_index = -1;
	int number = 0, has_number = 0;

	for(int i=0; i<expression_length; ++i){
		if(isdigit(expression[i])){
			number = number * 10 + (expression[i] - '0');	
			has_number = 1;
			continue;
		}
		// if it goes beyond the if it means that the digits of the number are gone, we can already play on the stack
		//  convert string to integer
		if(has_number){
			push(values, &values_index, number);
			has_number = 0;
			number = 0;
		}

		if(expression[i] == '('){
			push(operators, &operators_index, (int)expression[i]);
		}
		else if(expression[i] == ')'){
			while(!is_empty(&operators_index) && top(operators, &operators_index) != '('){
				// in this case let's take the two numbers at the top of the stack and apply the operation
				make_operation(values, &values_index, operators, &operators_index);
			}
			// remove '('
			if(!is_empty(&operators_index)) pop(operators, &operators_index);
		}
		else {
			while(!is_empty(&operators_index) && has_priority(top(operators, &operators_index))){
				make_operation(values, &values_index, operators, &operators_index);
			}
			// add the new operator at the top of the queue
			push(operators, &operators_index, (int)expression[i]);
		}
	}
	
	// after I read the expression
	if(has_number){
		push(values, &values_index, number);
	}
	
	while(!is_empty(&operators_index)){
		make_operation(values, &values_index, operators, &operators_index);
	}
	
	return top(values, &values_index);	
}

int main(void){
	char input[100];
	int result;
	
	scanf("%s", input);
	result = solve(input);
	printf("%d\n", result);
	
	return 0;
}