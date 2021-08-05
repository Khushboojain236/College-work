 /*
Positions: 1 -> _ <- 2 <- 3 <- 4
Stones :   1    2    3    4    5

Frogs[0] in the array frogs[] is an empty position and no frog exist there; at position two initially
 */


#define STONES 5
mtype frogs[STONES];

proctype move_frog(){
int position=frogs[_pid];
    if
    ::(_pid<2)->printf( "START FROG %d AT %d GOING RIGHT\n", _pid, frogs[_pid] );
    ::(_pid>=2) ->printf( "START FROG %d AT %d GOING LEFT\n",  _pid, frogs[_pid]);
    fi;
start:
    atomic {
        if
        ::(_pid==1) ->
        	if
        	::(position < 5) ->
        		if
        		::(position+1==frogs[0])->printf( "MOVE FROG%d FROM %d TO %d\n", _pid, position, position+1); position=position+1; frogs[_pid]=frogs[_pid]+1; frogs[0]=frogs[_pid]-1;	printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frogs[0], frogs[1], frogs[2], frogs[3], frogs[4]);
        		:: else ->skip;
                fi;   
            ::(position < 4)->
              if
        		::(position+2==frogs[0])->printf( "MOVE FROG%d FROM %d TO %d\n", _pid , position, position+2); position=position+2; frogs[_pid]=frogs[_pid]+2; frogs[0]=frogs[_pid]-2;	printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frogs[0], frogs[1], frogs[2], frogs[3], frogs[4]);
        		:: else ->skip;
                fi; 
            :: else -> skip;
            fi; 
        :: else ->
        if
        	::(position > 1) ->
        		if
        		::(position-1==frogs[0])->printf( "MOVE FROG%d FROM %d TO %d\n", _pid, position, position-1); position=position-1; frogs[_pid]=frogs[_pid]-1; frogs[0]=frogs[_pid]+1;	printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frogs[0], frogs[1], frogs[2], frogs[3], frogs[4]);
        		:: else ->skip;
                fi;   
            ::(position > 2)->
              if
        		::(position-2==frogs[0])->printf( "MOVE FROG%d FROM %d TO %d\n", _pid, position, position-2); position=position-2; frogs[_pid]=frogs[_pid]-2; frogs[0]=frogs[_pid]+2;	printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frogs[0], frogs[1], frogs[2], frogs[3], frogs[4]);
        		:: else ->skip;
                fi; 
            :: else -> skip;
            fi; 
        fi; 
       if 
       ::(frogs[1]==5 && frogs[0]==4) ->printf("DONE!\n"); assert(false);
       :: else ->skip;
       fi;

    }
    goto start;
}

init{
  atomic{
	frogs[0]=2; 
	frogs[1]=1;
	frogs[2]=3;
    frogs[3]=4;
    frogs[4]=5;
    
	printf( "EMPTY %d, FROG1@%d, FROG2@%d, FROG3@%d, FROG4@%d\n", frogs[0], frogs[1], frogs[2], frogs[3], frogs[4]);
    }
    run move_frog();
    run move_frog();
    run move_frog();
    run move_frog();
}
