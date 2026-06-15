#include p18f87k22.inc

    extern  glcd_start_left, glcd_start_right, Keypad_test, glcd_grid, turn, move, winnerscreen, won, squares0, squares1, squares2, squares3, squares4, squares5, init_digital_grid, Keypad_reset
    global  go, fill_1, fill_2, fill_3, fill_4, fill_5, fill_6, fill_7, start, fsr, active_go
    
Reset_vector code
    org 0x0000
    goto start 
    
	

acs0	udata_acs   ; reserve data space in access ram
go  	res 1	    ;0x00 for naughts and 0x01 for crosses 
fsr   res 1   ;changes for calculations
fill_1	res 1	    ; number of items in first column
fill_2	res 1	    ; number of items in second column
fill_3	res 1	    ; number of items in third column    
fill_4	res 1	    ; number of items in fourth column
fill_5	res 1	    ; number of items in fifth column
fill_6	res 1	    ; number of items in sixth column
fill_7	res 1	    ; number of items in seventh column
active_go   res 1
  
Main code	
 
start	
    call    Initialisation
    call    glcd_grid  ;Give the glcd the initial grid and player turns
	
    goto    Connect4loop
    
    
Initialisation:
	    clrf	go
	    movlw	0x02
	    movwf	active_go
	    clrf	fill_1
	    clrf	fill_2
	    clrf	fill_3
	    clrf	fill_4
	    clrf	fill_5
	    clrf	fill_6
	    clrf	fill_7
	    clrf	squares0  
	    clrf	squares1  
	    clrf	squares2  
	    clrf	squares3   
	    clrf	squares4 
	    clrf	squares5  
	    call	init_digital_grid
	    return
	
	
	
Connect4loop:
		call turn   ;switch to others go
		
		call Keypad_test
	
		call move   ;implement move
	
		call won    ;see if winner	 
		
		call Keypad_reset
		
		goto Connect4loop
	
	
	
    end
	
