#include "infix.h"
#include "math.h"
#include <string.h>
#include <stdlib.h>

/*

for each token in the input string {
  if ( token is a number ) {
    append token to the output string
  }
  else if (token is a left bracket) {
    push bracket to stack
  }
  else if ( token in an operator ) {
    while ( there is operator on top of stack with equal or higher precedence ) {
      pop stack and append popped operator to output string
    }
    push token operator to stack
  }
  else if ( token is right bracket ) {
    while ( top of stack != '(' ) {
      pop operator from stack and append to output string
    pop left bracket
  }
}
pop remaining stack items and append each of them to the end of your reverse Polish notation expression.


Note that you can assume that the expression that your program
receives is well formed. You do not have to do any complicated error
checking.

You can assume that the precedence of operators is as follows:
    ^
    X, /
    +, -
 
 */
 int get_precedence(char operator)
{
    int precedence;
    switch (operator) {
        case '^':
            precedence=1;
            break;
        case 'X':
            precedence=2;
            break;
        case '/':
            precedence=2;
            break;
        case '+':
            precedence=3;
            break;
        case '-':
            precedence=3;
            break;
        default:
            precedence=0;
            break;
    }
    return precedence;
}
// evaluate expression stored as an array of string tokens
double evaluate_infix_expression(char ** args, int nargs) {
  // Write your code here
    char ** postfix = malloc (sizeof(char *)*nargs);
    int postfix_length=0;
    struct double_stack * stackis= double_stack_new(nargs);
    for(int i=0; i<nargs;i++)
    {
        if(strlen(args[i])!=1 || (args[i][0]>='0' && args[i][0]<='9')
        {
            postfix[postfix_length]= args[i];
            postfix_length++;
        }
        else if (strlen(args[i])==1  && args[i][0]=='(' )
           {
            double_stack_push(stackis,i);
           }
        else if ((strlen(args[i])==1) && (args[i][0]=='+'||args[i][0]=='-'|| args[i][0]=='X' || args[i][0]=='/' || args[i][0]=='^'))
          {
           if(stackis->top!=NULL)
            {
               int currentprecedence= get_precedence(args[i][0]);
               int getstackelement= *((stackis->items) + (stackis->top)-1 )
               int previousprecedence=get_precedence(args [getstackelement][0]);
               while(previousprecedence >= currentprecedence)
               {
                   int op=double_stack_pop(stackis);
                   postfix[postfix_length]=args[op];
                   postfix_length++;
                   getstackelement= *((stackis->items) + (stackis->top)-1 )
                   previousprecedence=get_precedence(args [getstackelement][0]);
               }
               double_stack_push(stackis,args[i]);
           }
            else
            {
                double_stack_push(stackis,args[i]);
            }
       }
      else if(strlen(args[i])==1 && args[i][0]==')')
        {
            int getstackindex= *((stackis->items)+(stackis->top)-1);
            while(args[getstackindex][0] != '(' && (stackis->top)!=0)
            {
                int op;
                op=double_stack_pop(stackis);
                postfix[postfix_length]=args[op];
                postfix_length++;
                getstackindex=*((stackis->items)+(stackis->top)-1);
            }
            double_stack_pop(stackis);
        }
    
}
           int top;
           for (top=(stackis->top);top>0;top--)
           {
            int index=double_stack_pop(stackis);
            postfix[postfix_length]=args[index];
            postfix_length++;
           }
           return evaluate_postfix_expression(postfix,postfix_length);

}
           
