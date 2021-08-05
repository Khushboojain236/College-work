#include "postfix.h"
#include "math.h"


// evaluate expression stored as an array of string tokens
double evaluate_postfix_expression(char ** args, int nargs) {
  // Write your code here
    double result;
    struct double_stack * theStackis = double_stack_new(nargs);
    for(int i=0;i<nargs;i++)
    {
        if((args[i][0]>=0 && args[i][0]<=9) || strlen(args[i]!=1 ))
        {
            double_stack_push(theStackis,atof[args[i]]);
        }
        else if (strlen(args[i]==1))
        {
            double secondOp=double_stack_pop(theStack);
            double firstOp=double_stack_pop(theStack);
            switch(args[i][0])
            {
                case '+':
                    result=firstOp+secondOp;
                    double_stack_push(theStack,result);
                    break;
                case '-':
                    result=firstOp-secondOp;
                    double_stack_push(theStack,result);
                    break;
                case 'X':
                    result=firstOp*secondOp;
                    double_stack_push(theStack,result);
                    break;
                case '/':
                    result=firstOp/secondOp;
                    double_stack_push(theStack,result);
                    break;
                case '^':
                    result= pow(firstOp,secondOp);
                    double_stack_push(theStack,result);
                    break;
                default:
                    break;
            }
        }
    }
    return result;
}
