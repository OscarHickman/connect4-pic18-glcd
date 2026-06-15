#include p18f87k22.inc
	
    global move, target_col, target_row, last_mov_row, last_mov_col, digital_read, squares0, squares1, squares2, squares3, squares4, squares5, init_digital_grid, temp
    extern  key_out, c_w, d_w, glcd_start_left, glcd_start_right, Keypad_test, go, fill_1, fill_2, fill_3, fill_4, fill_5, fill_6, fill_7
 
    
acs0	udata_acs   ; reserve data space in access ram
target_col res 1
target_row res 1
last_mov_row   res 1    ; fills in the value of the last move
last_mov_col	res 1
squares0   res 0x07 ;fills up depending on the values of the 42 squares, 0x01 for naughts, 0x02 for crosses
squares1   res 0x07
squares2   res 0x07
squares3   res 0x07
squares4   res 0x07
squares5   res 0x07
temp	   res 1
init	   res 1
   
     
moves	code

move	
fill_col1   ;equal to first column
		movlw	0x01
		CPFSEQ	key_out	       
		goto	fill_col2
		goto	s1
	    
s1
			movlw	0x00	;column is empty
			CPFSEQ	fill_1
			goto	s2	
			
			call	glcd_start_left
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x45	
			call	c_w	;sets y = 5
			call	fill_square
			incf	fill_1
			
			;fill digital version
			movlw	0x00	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
			
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x00
			movwf	last_mov_col
			return
		
s2
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_1  
			goto s3
			
			call	glcd_start_left
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x45	
			call	c_w	;sets y = 5
			call	fill_square
			incf	fill_1
			
			;fill digital version
			movlw	0x00	
			movwf	target_col  ;digital column	
			movlw	0x01
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x00
			movwf	last_mov_col
			return
		
s3
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_1
			goto s4
			
			call	glcd_start_left
			movlw	0xBB	
			call	c_w	;sets x = 3
			movlw   0x45	
			call	c_w	;sets y = 5
			call	fill_square
			incf	fill_1
			
			;fill digital version
			movlw	0x00	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x00
			movwf	last_mov_col
			return
			
			
s4
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_1 
			goto s5
	    
			call	glcd_start_left
			movlw	0xBA
			call	c_w	;sets x = 2
			movlw   0x45	
			call	c_w	;sets y = 5
			call	fill_square
			incf	fill_1
			
			;fill digital version
			movlw	0x00	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x00
			movwf	last_mov_col
			return
			
			
s5	
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_1	  
			goto s6
			
			call	glcd_start_left
			movlw	0xB9	
			call	c_w	;sets x = 1
			movlw   0x45	
			call	c_w	;sets y = 5
			call	fill_square
			incf	fill_1
			
			;fill digital version
			movlw	0x00	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x00
			movwf	last_mov_col
			return
			
s6
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_1	  
			goto	Back
			
			call	glcd_start_left
			movlw	0xB8
			call	c_w	;sets x = 0
			movlw   0x45	
			call	c_w	;sets y = 5
			call	fill_square			
			incf	fill_1
			
			;fill digital version
			movlw	0x00	
			movwf	target_col  ;digital column	
			movlw	0x05	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x00
			movwf	last_mov_col
			return
	
			
			
	    
fill_col2   ;equal to second column
		movlw	0x02
		CPFSEQ	key_out	       
		goto	fill_col3
		goto	s7
	
s7
			movlw	0x00	;column is empty
			CPFSEQ	fill_2
			goto	s8	
			
			call	glcd_start_left
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x56	
			call	c_w	;sets y = 22
			call	fill_square
			incf	fill_2
			
			;fill digital version
			movlw	0x01	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x01
			movwf	last_mov_col
			return
		
s8
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_2  
			goto	s9
			
			call	glcd_start_left
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x56	
			call	c_w	;sets y = 22
			call	fill_square
			incf	fill_2
			
			;fill digital version
			movlw	0x01	
			movwf	target_col  ;digital column	
			movlw	0x01	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x01
			movwf	last_mov_col
			return
		
s9
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_2
			goto	s10
			
			call	glcd_start_left
			movlw	0xBB
			call	c_w	;sets x = 3
			movlw   0x56	
			call	c_w	;sets y = 22
			call	fill_square
			incf	fill_2
			
			;fill digital version
			movlw	0x01	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x01
			movwf	last_mov_col
			return
			
			
s10
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_2
			goto	s11
	    
			call	glcd_start_left
			movlw	0xBA
			call	c_w	;sets x = 2
			movlw   0x56	
			call	c_w	;sets y = 22
			call	fill_square
			incf	fill_2
			
			;fill digital version
			movlw	0x01	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x01
			movwf	last_mov_col
			return
			
			
s11	
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_2	  
			goto	s12
			
			call	glcd_start_left
			movlw	0xB9
			call	c_w	;sets x = 1
			movlw   0x56	
			call	c_w	;sets y = 22
			call	fill_square
			incf	fill_2
			
			;fill digital version
			movlw	0x01	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x01
			movwf	last_mov_col
			return
			
s12
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_2	  
			goto	Back
			
			call	glcd_start_left
			movlw	0xB8
			call	c_w	;sets x = 0
			movlw   0x56	
			call	c_w	;sets y = 22
			call	fill_square			
			incf	fill_2
			
			;fill digital version
			movlw	0x01
			movwf	target_col  ;digital column	
			movlw	0x05	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x01
			movwf	last_mov_col
			return
	    
	    
	    
	    
			
			
	    
fill_col3   ;equal to third column
		movlw	0x03
		CPFSEQ	key_out	       
		goto	fill_col4
		goto	s13
		
s13
			movlw	0x00	;column is empty
			CPFSEQ	fill_3
			goto	s14	
			
			call	glcd_start_left
			movlw	0xBD
			call	c_w	;sets x = 5
			movlw   0x67	
			call	c_w	;sets y = 39
			call	fill_square
			incf	fill_3
			
			;fill digital version
			movlw	0x02	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x02
			movwf	last_mov_col
			return
		
s14
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_3  
			goto	s15
			
			call	glcd_start_left
			movlw	0xBC
			call	c_w	;sets x = 4
			movlw   0x67	
			call	c_w	;sets y = 39
			call	fill_square
			incf	fill_3
			
			;fill digital version
			movlw	0x02	
			movwf	target_col  ;digital column	
			movlw	0x01	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x02
			movwf	last_mov_col
			return
		
s15
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_3
			goto	s16
			
			call	glcd_start_left
			movlw	0xBB
			call	c_w	;sets x = 3
			movlw   0x67	
			call	c_w	;sets y = 39
			call	fill_square
			incf	fill_3
			
			;fill digital version
			movlw	0x02	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x02
			movwf	last_mov_col
			return
			
			
s16
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_3 
			goto	s17
	    
			call	glcd_start_left
			movlw	0xBA
			call	c_w	;sets x = 2
			movlw   0x67	
			call	c_w	;sets y = 39
			call	fill_square
			incf	fill_3
			
			;fill digital version
			movlw	0x02	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x02
			movwf	last_mov_col
			return
			
			
s17	
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_3	  
			goto	s18
			
			call	glcd_start_left
			movlw	0xB9	
			call	c_w	;sets x = 1
			movlw   0x67	
			call	c_w	;sets y = 39
			call	fill_square
			incf	fill_3
			
			;fill digital version
			movlw	0x02	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x02
			movwf	last_mov_col
			return
			
s18
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_3	  
			goto	Back
			
			call	glcd_start_left
			movlw	0xB8	
			call	c_w	;sets x = 0
			movlw   0x67	
			call	c_w	;sets y = 39
			call	fill_square			
			incf	fill_3
			
			;fill digital version
			movlw	0x02	
			movwf	target_col  ;digital column	
			movlw	0x05
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x02
			movwf	last_mov_col
			return
	
	    
	    
	    
	    
fill_col4   ;equal to fourth column	(middle)
		movlw	0x04
		CPFSEQ	key_out	       
		goto	fill_col5
		goto	s19
		
s19
			movlw	0x00	;column is empty
			CPFSEQ	fill_4
			goto	s20	
			
			
			call	glcd_start_left
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x78	
			call    c_w	;sets y = 56
			call	midleft
			
			call	glcd_start_right
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x40		
			call    c_w	;sets y = 0
			call	midright
			
			incf	fill_4
			
			;fill digital version
			movlw	0x03	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x03
			movwf	last_mov_col
			return
		
s20
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_4  
			goto	s21
			
			
			call	glcd_start_left
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x78	
			call    c_w	;sets y = 56
			call	midleft
			
			call	glcd_start_right
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x40	
			call    c_w	;sets y = 0
			call	midright
			
			
			incf	fill_4
			
			;fill digital version
			movlw	0x03	
			movwf	target_col  ;digital column	
			movlw	0x01	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x03
			movwf	last_mov_col
			return
		
s21
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_4
			goto	s22
			
			
			call	glcd_start_left
			movlw	0xBB	
			call	c_w	;sets x = 3
			movlw   0x78	
			call    c_w	;sets y = 56
			call	midleft
			
			call	glcd_start_right
			movlw	0xBB	
			call	c_w	;sets x = 3
			movlw   0x40	
			call    c_w	;sets y = 0
			call	midright
			
			
			incf	fill_4
			
			;fill digital version
			movlw	0x03	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x03
			movwf	last_mov_col
			return
			
			
s22
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_4 
			goto	s23
	    
			
			call	glcd_start_left
			movlw	0xBA	
			call	c_w	;sets x = 2
			movlw   0x78	
			call    c_w	;sets y = 56
			call	midleft
			
			call	glcd_start_right
			movlw	0xBA	
			call	c_w	;sets x = 2
			movlw   0x40	
			call    c_w	;sets y = 0
			call	midright
			
			
			incf	fill_4
			
			;fill digital version
			movlw	0x03	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x03
			movwf	last_mov_col
			return
			
			
s23	
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_4	  
			goto	s24
			
			
			call	glcd_start_left
			movlw	0xB9	
			call	c_w	;sets x = 1
			movlw   0x78	
			call    c_w	;sets y = 56
			call	midleft
			
			call	glcd_start_right
			movlw	0xB9	
			call	c_w	;sets x = 1
			movlw   0x40	
			call    c_w	;sets y = 0
			call	midright
			
			
			incf	fill_4
			
			;fill digital version
			movlw	0x03	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x03
			movwf	last_mov_col
			return
			
s24
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_4	  
			goto	Back
			
			
			call	glcd_start_left
			movlw	0xB8
			call	c_w	;sets x = 0
			movlw   0x78	
			call    c_w	;sets y = 56
			call	midleft
			
			call	glcd_start_right
			movlw	0xB8
			call	c_w	;sets x = 0
			movlw   0x40	
			call    c_w	;sets y = 0
			call	midright	
			
			
			incf	fill_4
			
			;fill digital version
			movlw	0x03	
			movwf	target_col  ;digital column	
			movlw	0x05	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x03
			movwf	last_mov_col
			return
			
	    
	    
fill_col5   ;equal to fifth column
		movlw	0x05
		CPFSEQ	key_out	       
		goto	fill_col6
		goto	s25
		
s25
			movlw	0x00	;column is empty
			CPFSEQ	fill_5
			goto	s26	
			
			call	glcd_start_right
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x48
			call    c_w	;sets y = 8
			call	fill_square
			
			
			incf	fill_5
						
			;fill digital version
			movlw	0x04	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x04
			movwf	last_mov_col
			return
		
s26
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_5
			goto	s27
			
			call	glcd_start_right
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x48
			call    c_w	;sets y = 8
			call	fill_square
			incf	fill_5
						
			;fill digital version
			movlw	0x04
			movwf	target_col  ;digital column	
			movlw	0x01	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x04
			movwf	last_mov_col
			return
		
s27
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_5
			goto	s28
			
			call	glcd_start_right
			movlw	0xBB	
			call	c_w	;sets x = 3
			movlw   0x48
			call    c_w	;sets y = 8
			call	fill_square
			incf	fill_5
						
			;fill digital version
			movlw	0x04	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x04
			movwf	last_mov_col
			return
			
			
s28
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_5
			goto	s29
	    
			call	glcd_start_right
			movlw	0xBA	
			call	c_w	;sets x = 2
			movlw   0x48
			call    c_w	;sets y = 8
			call	fill_square
			incf	fill_5
						
			;fill digital version
			movlw	0x04	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x04
			movwf	last_mov_col
			return
			
			
s29	
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_5
			goto	s30
			
			call	glcd_start_right
			movlw	0xB9	
			call	c_w	;sets x = 1
			movlw   0x48
			call    c_w	;sets y = 8
			call	fill_square
			incf	fill_5
						
			;fill digital version
			movlw	0x04	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x04
			movwf	last_mov_col
			return
			
s30
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_5 
			goto	Back
			
			call	glcd_start_right
			movlw	0xB8	
			call	c_w	;sets x = 0
			movlw   0x48
			call    c_w	;sets y = 8
			call	fill_square			
			incf	fill_5
						
			;fill digital version
			movlw	0x04	
			movwf	target_col  ;digital column	
			movlw	0x05	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x04
			movwf	last_mov_col
			return
			
	    
	    
fill_col6   ;equal to sixth column
		movlw	0x06
		CPFSEQ	key_out	       
		goto	fill_col7
		goto	s31
		
s31
			movlw	0x00	;column is empty
			CPFSEQ	fill_6
			goto	s32	
			
			call	glcd_start_right
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x59	
			call    c_w	;sets y = 25
			call	fill_square
			incf	fill_6
						
			;fill digital version
			movlw	0x05	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x05
			movwf	last_mov_col
			return
		
s32
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_6
			goto	s33
			
			call	glcd_start_right
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x59	
			call    c_w	;sets y = 25
			call	fill_square
			incf	fill_6
						
			;fill digital version
			movlw	0x05	
			movwf	target_col  ;digital column	
			movlw	0x01	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x05
			movwf	last_mov_col
			return
		
s33
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_6
			goto	s34
			
			call	glcd_start_right
			movlw	0xBB
			call	c_w	;sets x = 3
			movlw   0x59
			call    c_w	;sets y = 25
			call	fill_square
			incf	fill_6
						
			;fill digital version
			movlw	0x05	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x05
			movwf	last_mov_col
			return
			
			
s34
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_6 
			goto	s35
	    
			call	glcd_start_right
			movlw	0xBA
			call	c_w	;sets x = 2
			movlw   0x59
			call    c_w	;sets y = 25
			call	fill_square
			incf	fill_6
						
			;fill digital version
			movlw	0x05	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x05
			movwf	last_mov_col
			return
			
			
s35	
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_6	  
			goto	s36
			
			call	glcd_start_right
			movlw	0xB9
			call	c_w	;sets x = 1
			movlw   0x59	
			call    c_w	;sets y = 25
			call	fill_square
			incf	fill_6
						
			;fill digital version
			movlw	0x05	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x05
			movwf	last_mov_col
			return
			
s36
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_6	  
			goto	Back
			
			call	glcd_start_right
			movlw	0xB8	
			call	c_w	;sets x = 0
			movlw   0x59
			call    c_w	;sets y = 25
			call	fill_square			
			incf	fill_6
						
			;fill digital version
			movlw	0x05	
			movwf	target_col  ;digital column	
			movlw	0x05	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x05
			movwf	last_mov_col
			return
	    
	    
fill_col7   ;equal to seventh column
		goto	s37
		
s37
			movlw	0x00	;column is empty
			CPFSEQ	fill_7
			goto	s38	
			
			call	glcd_start_right
			movlw	0xBD	
			call	c_w	;sets x = 5
			movlw   0x6A
			call    c_w	;sets y = 42
			call	fill_square
			incf	fill_7
						
			;fill digital version
			movlw	0x06	
			movwf	target_col  ;digital column	
			movlw	0x00	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x00
			movwf	last_mov_row
			movlw	0x06
			movwf	last_mov_col
			return
		
s38
			movlw	0x01	;column has 1 item
			CPFSEQ	fill_7
			goto	s39
			
			call	glcd_start_right
			movlw	0xBC	
			call	c_w	;sets x = 4
			movlw   0x6A
			call    c_w	;sets y = 42
			call	fill_square
			incf	fill_7
						
			;fill digital version
			movlw	0x06	
			movwf	target_col  ;digital column	
			movlw	0x01	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x01
			movwf	last_mov_row
			movlw	0x06
			movwf	last_mov_col
			return
		
s39
			movlw	0x02	;column has 2 items
			CPFSEQ	fill_7
			goto	s40
			
			call	glcd_start_right
			movlw	0xBB
			call	c_w	;sets x = 3
			movlw   0x6A
			call    c_w	;sets y = 42
			call	fill_square
			incf	fill_7
						
			;fill digital version
			movlw	0x06	
			movwf	target_col  ;digital column	
			movlw	0x02	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x02
			movwf	last_mov_row
			movlw	0x06
			movwf	last_mov_col
			return
			
			
s40
			movlw	0x03	;column has 3 items
			CPFSEQ	fill_7
			goto	s41
	    
			call	glcd_start_right
			movlw	0xBA
			call	c_w	;sets x = 2
			movlw   0x6A
			call    c_w	;sets y = 42
			call	fill_square
			incf	fill_7
						
			;fill digital version
			movlw	0x06	
			movwf	target_col  ;digital column	
			movlw	0x03	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x03
			movwf	last_mov_row
			movlw	0x06
			movwf	last_mov_col
			return
			
			
s41
			movlw	0x04	;column has 4 items
			CPFSEQ	fill_7  
			goto	s42
			
			call	glcd_start_right
			movlw	0xB9
			call	c_w	;sets x = 1
			movlw   0x6A
			call    c_w	;sets y = 42
			call	fill_square
			incf	fill_7
						
			;fill digital version
			movlw	0x06	
			movwf	target_col  ;digital column	
			movlw	0x04	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x04
			movwf	last_mov_row
			movlw	0x06
			movwf	last_mov_col
			return
			
s42
			movlw	0x05	;column has 5 items
			CPFSEQ	fill_7
			goto	Back
			
			call	glcd_start_right
			movlw	0xB8	
			call	c_w	;sets x = 0
			movlw   0x6A
			call    c_w	;sets y = 42
			call	fill_square			
			incf	fill_7
						
			;fill digital version
			movlw	0x06	
			movwf	target_col  ;digital column	
			movlw	0x05	
			movwf	target_row  ;digital row
			call	digital_write
						
			;update last move
			movlw	0x05
			movwf	last_mov_row
			movlw	0x06
			movwf	last_mov_col
			return
			
			
	
	
	
Back	;the column selected is full - select a different button
	clrf	key_out
	call	Keypad_test
	goto	move
	
	
	
fill_square
	movlw	0x00
	movwf	temp
	movf	go, 0  ;go equal to 0x01 if its naughts go and vica versa
	CPFSEQ	temp
	goto	write_naught
	goto	write_cross
	
	
write_naught	;can write a naught (not possible with middle square)
		movlw	0x01	
		call	d_w	;col_0 of square
		call	d_w	;col_1 of square
		call	d_w	;col_2 of square
		call	d_w	;col_3 of square
		movlw	0x39
		call	d_w	;col_4 of square
		movlw	0x45
		call	d_w	;col_5 of square
		call	d_w	;col_6 of square
		call	d_w	;col_7 of square
		call	d_w	;col_8 of square
		call	d_w	;col_9 of square
		call	d_w	;col_10 of square
		movlw	0x39
		call	d_w	;col_11 of square
		movlw	0x01
		call	d_w	;col_12 of square
		call	d_w	;col_13 of square
		call	d_w	;col_14 of square
		call	d_w	;col_15 of square
	
		return
		
		
		
write_cross	;can write a cross (not possible with middle square)
	
		movlw	0x01	
		call	d_w	;col_0 of square
		call	d_w	;col_1 of square
		call	d_w	;col_2 of square
		call	d_w	;col_3 of square
		movlw	0x45
		call	d_w	;col_4 of square
		movlw	0x6D
		call	d_w	;col_5 of square
		movlw	0x39
		call	d_w	;col_6 of square
		movlw	0x11
		call	d_w	;col_7 of square
		movlw	0x39
		call	d_w	;col_8 of square
		movlw	0x6D
		call	d_w	;col_9 of square
		movlw	0x45
		call	d_w	;col_10 of square
		movlw	0x01
		call	d_w	;col_11 of square
		call	d_w	;col_12 of square
		call	d_w	;col_13 of square
		call	d_w	;col_14 of square
		call	d_w	;col_15 of square
	
		return
		

		
midleft	    ;fills the left half of the middle squares
	movlw	0x00
	movwf	temp
	movf	go, 0  ;go equal to 0x01 if its naughts go and vica versa
	CPFSEQ	temp
	goto	write_naught_left
	goto	write_cross_left
	
write_naught_left
		movlw	0x01	
		call	d_w	;col_0 of square
		call	d_w	;col_1 of square
		call	d_w	;col_2 of square
		call	d_w	;col_3 of square
		movlw	0x39
		call	d_w	;col_4 of square
		movlw	0x45
		call	d_w	;col_5 of square
		call	d_w	;col_6 of square
		call	d_w	;col_7 of square
		return
	
write_cross_left
		movlw	0x01	
		call	d_w	;col_0 of square
		call	d_w	;col_1 of square
		call	d_w	;col_2 of square
		call	d_w	;col_3 of square
		movlw	0x45
		call	d_w	;col_4 of square
		movlw	0x6D
		call	d_w	;col_5 of square
		movlw	0x39
		call	d_w	;col_6 of square
		movlw	0x11
		call	d_w	;col_7 of square
		return
	
midright    ;fills the right half of the middle squares
	movlw	0x00
	movwf	temp
	movf	go, 0  ;go equal to 0x01 if its naughts go and vica versa
	CPFSEQ	temp
	goto	write_naught_right
	goto	write_cross_right
	
write_naught_right
		movlw	0x45    
	        call	d_w	;col_8 of square
		call	d_w	;col_9 of square
		call	d_w	;col_10 of square
		movlw	0x39
		call	d_w	;col_11 of square
		movlw	0x01
		call	d_w	;col_12 of square
		call	d_w	;col_13 of square
		call	d_w	;col_14 of square
		return
	
write_cross_right
		movlw	0x39    
	        call	d_w	;col_8 of square
		movlw	0x6D
		call	d_w	;col_9 of square
		movlw	0x45
		call	d_w	;col_10 of square
		movlw	0x01
		call	d_w	;col_11 of square
		call	d_w	;col_12 of square
		call	d_w	;col_13 of square
		call	d_w	;col_14 of square
		return
		
		
		
		
    
digital_write ;writes data to the stored version 'squares'
	goto first_digital_row_write
		
first_digital_row_write   ;first row
		movlw	0x00
		cpfseq	target_row
		goto	second_digital_row_write
		lfsr    FSR1, squares0
		goto	digital_column_write
		
second_digital_row_write  ;second row
		movlw	0x01
		cpfseq	target_row
		goto	third_digital_row_write
		lfsr    FSR1, squares1
		goto	digital_column_write
	
third_digital_row_write  ;third row
		movlw	0x02
		cpfseq	target_row
		goto	fourth_digital_row_write
		lfsr    FSR1, squares2
		goto	digital_column_write
	
fourth_digital_row_write  ;fourth row
		movlw	0x03
		cpfseq	target_row
		goto	fifth_digital_row_write
		lfsr    FSR1, squares3
		goto	digital_column_write
	
fifth_digital_row_write  ;fifth row
		movlw	0x04
		cpfseq	target_row
		goto	sixth_digital_row_write
		lfsr    FSR1, squares4
		goto	digital_column_write
	
sixth_digital_row_write  ;sixth row
		lfsr    FSR1, squares5
		goto	digital_column_write
	

	
digital_column_write
		movlw	0x00
		cpfseq	init
		goto	digital_write_empty
		
		
		;increment FSR1 by number of column (FSR1) gives the location
		movf    target_col, 0
		addwf   FSR1L
	
		movlw	0x00
		movwf	temp
		movf	go, 0  ;go equal to 0x01 if its naughts go and vica versa
		CPFSEQ	temp
		goto	digital_write_naught
		goto	digital_write_cross
	
	
digital_write_naught
				movlw   0x01
				movwf   INDF1   ; move data from W to given byte (move from f to w to read)
				return
	
digital_write_cross
				movlw   0x02
				movwf   INDF1
				return
				
digital_write_empty
				movlw	0x00
				movwf	POSTINC1
				movwf	POSTINC1
				movwf	POSTINC1
				movwf	POSTINC1
				movwf	POSTINC1
				movwf	POSTINC1
				movwf	POSTINC1
				return
		   
		    
digital_read ;reads data from the stored version 'naughts'. moves to W
	goto check1
	
check1
		movlw	0x00
		cpfslt	target_row  ;skips if target row is less than 0
		goto	check2
		goto	not_poss
	
check2
		movlw	0x05
		cpfsgt	target_row  ;skips if target row is greater than 5
		goto	check3
		goto	not_poss
	
	
check3
		movlw	0x00
		cpfslt	target_col  ;skips if target column is less than 0
		goto	check4
		goto	not_poss
	
	
check4
	        movlw	0x06
		cpfsgt	target_col  ;skips if target column is greater than 5
	        goto	first_digital_row_read
		goto	not_poss
		
	
first_digital_row_read   ;first row
		movlw	0x00
		cpfseq	target_row
		goto	second_digital_row_read
		lfsr    FSR1, squares0
		goto	digital_column_read
		
second_digital_row_read  ;second row
		movlw	0x01
		cpfseq	target_row
		goto	third_digital_row_read
		lfsr    FSR1, squares1
		goto	digital_column_read
	
third_digital_row_read  ;third row
		movlw	0x02
		cpfseq	target_row
		goto	fourth_digital_row_read
		lfsr    FSR1, squares2
		goto	digital_column_read
	
fourth_digital_row_read  ;fourth row
		movlw	0x03
		cpfseq	target_row
		goto	fifth_digital_row_read
		lfsr    FSR1, squares3
		goto	digital_column_read
	
fifth_digital_row_read  ;fifth row
		movlw	0x04
		cpfseq	target_row
		goto	sixth_digital_row_read
		lfsr    FSR1, squares4
		goto	digital_column_read
	
sixth_digital_row_read  ;sixth row
		lfsr    FSR1, squares5
		goto	digital_column_read
	
	
		
digital_column_read	
		;increment FSR1 by number of column (FSR1) gives the location
		movf   target_col, W
		addwf   FSR1L
    
		;reads value into W
		movf   INDF1, W   ; move data from position to W
		return
    
not_poss
		;row or column not possible
		movlw	0x00
		return


		
		
init_digital_grid
	movlw	0x01
	movwf	init
	movlw	0x00   
	movlw	target_col
	
	movlw	0x00
	movwf	target_row
	call	digital_write
	
	movlw	0x01
	movwf	target_row
	call	digital_write
	
	movlw	0x02
	movwf	target_row
	call	digital_write
	
	movlw	0x03
	movwf	target_row
	call	digital_write
	
	movlw	0x04
	movwf	target_row
	call	digital_write
	
	movlw	0x05
	movwf	target_row
	call	digital_write
	
	
	movlw	0x00
	movwf	init
	return
	
end
