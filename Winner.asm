#include p18f87k22.inc
  extern    fill_1, fill_2, fill_3, fill_4, fill_5, fill_6, fill_7, last_mov_row, last_mov_col, digital_read, target_row, target_col, go, active_go, glcd_start_left, glcd_start_right, c_w, d_w 
  extern    game_reset, temp
  global    won, winnerscreen

acs0	udata_acs   ; reserve data space in access ram
target  	res 1	    
	
	
Winner	code


won   
br1
		;br1 checks if any are bottom right of it, if not goto bl1
		movff	last_mov_row, target_row
		movlw	0x01
		subwf	target_row
		movff	last_mov_col, target_col
		addwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	bl1
		goto	br2

	
br2
		;br2 checks if 2 are bottom right of it, if not goto br5
		movlw	0x01
		subwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	br5
		goto	br3
	
br3
		;br3 checks if 3 are botom right of it, if not goto br4  -  if so goto winnerscreen
		movlw	0x01
		subwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	br4
		goto	winnerscreen
		
	
br4
		;br4 checks if 1 top left of it (2 already bottom right), if not goto bl1 - if so goto winnerscreen
		movlw	0x04
		addwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	bl1 
		goto	winnerscreen
		
	
br5	
		;br5 checks if 1 top left of it, (1 already bottom right), if not goto bl1
		movlw	0x03
		addwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	bl1
		goto	br6
		
	
br6	
		;br6 checks if 2 top left of it, (1 already bottom right), if not goto bl1 - if so goto winnerscreen
		movlw	0x01
		addwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	bl1
		goto	winnerscreen
		

	
	
bl1
	    	;bl1 checks if 1 bottom left of it, if not goto b1
		movff	last_mov_row, target_row
		movlw	0x01
		subwf	target_row
		movff	last_mov_col, target_col
		subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	b1
		goto	bl2
		
	
bl2
		;bl2 checks if 2 bottom left of it, if not goto bl5
		movlw	0x01
		subwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	bl5
		goto	bl3
		
	
bl3
		;bl3 checks if 3 are bottom left of it, if not goto bl4  -  if so goto winnerscreen
		movlw	0x01
		subwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	bl4
		goto	winnerscreen
		
	
bl4
		;bl4 checks if 1 top right of it (2 already bottom left), if not goto b1- if so goto winnerscreen
		movlw	0x04
		addwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	b1
		goto	winnerscreen
		
	
bl5	
		;bl5 checks if 1 top right of it, (1 already bottom left), if not goto b1
		movlw	0x03
		addwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	b1
		goto	bl6
		
	
bl6
		;bl6 checks if 2 top right of it, (1 already bottom left), if not goto b1 - if so goto winnerscreen
		movlw	0x01
		addwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	b1
		goto	winnerscreen
		
	
	
	

b1   
		;b1 checks if 1 below it, if not goto tr1 - if so goto b2
		movff	last_mov_row, target_row
		movlw	0x01
		subwf	target_row
		movff	last_mov_col, target_col
		call	digital_read
		cpfseq	active_go 
		goto	tr1
		goto	b2
			
	
b2
		;b2  checks if 2 below it, if not goto tr1
		movlw	0x01
		subwf	target_row
		call	digital_read
		cpfseq	active_go  
		goto	tr1
		goto	b3
		
	
b3
		;b3 checks if 3 are below it, if not goto tr1 - if so goto winnerscreen
		movlw	0x01
		subwf	target_row
		call	digital_read
		cpfseq	active_go   
	    	goto	tr1
		goto	winnerscreen
		

	
	
	
tr1
		;tr1 checks if any are top right of it, if not goto tl1
		movff	last_mov_row, target_row
		movlw	0x01
		addwf	target_row
		movff	last_mov_col, target_col
		addwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	tl1
		goto	tr2
		
	
tr2
		;tr2 checks if 2 top right of it, if not goto tr5
		movlw	0x01
		addwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	tr5
		goto	tr3
		
	
tr3
		;tr3 checks if 3 are top right of it, if not goto tr4  -  if so goto winnerscreen
		movlw	0x01
		addwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	tr4
		goto	winnerscreen
		
	
tr4
		;tr4 checks if 1 bottom left of it (2 already top right), if not goto tl1- if so goto winnerscreen
		movlw	0x04
		subwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	tl1
		goto	winnerscreen
		
	
tr5
		;tr5 checks if 1 bottom left of it, (1 already top right), if not goto tl1
		movlw	0x03
		subwf	target_row
	        subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	tl1
		goto	tr6
		

tr6
		;tr6 checks if 2 bottom left of it, (1 already top right), if not goto tl1 - if so goto winnerscreen
		movlw	0x01
		subwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	tl1
		goto	winnerscreen
		
	
	
	
	
tl1
		;tl1 checks if 1 top left of it, if not goto l1
		movff	last_mov_row, target_row
		movlw	0x01
		addwf	target_row
		movff	last_mov_col, target_col
		subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	l1
		goto	tl2
		
	
tl2
		;tl2 checks if 2 top left of it, if not goto tl5
		movlw	0x01
	    	addwf	target_row
		subwf	target_col
		call	digital_read
		cpfseq	active_go 
		goto	tl5
		goto	tl3
		
	
tl3
		;tl3 checks if 3 are top left of it, if not goto tl4  -  if so goto winnerscreen
	        movlw	0x01
	        addwf	target_row
	        subwf	target_col
	        call	digital_read
		cpfseq	active_go   
		goto	tl4
		goto	winnerscreen
			
	
tl4
		;tl4 checks if 1 bottom right of it (2 already top left), if not goto - if so goto winnerscreen
		movlw	0x04
		subwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	tl5
		goto	winnerscreen
		
	
tl5
		;tl5 checks if 1 bottom right of it, (1 already top left), if not goto l1
		movlw	0x03
		subwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	l1
		goto	tl6
			
	
tl6
		;tl6 checks if 2 bottom right of it, (1 already top left), if not goto l1 - if so goto winnerscreen
		movlw	0x01
		subwf	target_row
		addwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	l1
		goto	winnerscreen
		
	
	
	
	
l1
		;l1 checks if 1 left of it, if not goto r1
		movff	last_mov_row, target_row
	    	movlw	0x01
		movff	last_mov_col, target_col
		subwf	target_col
	    	call	digital_read
		cpfseq	active_go  
		goto	r1
		goto	l2
			
	
l2
		;l2 checks if 2 left of it, if not goto l5
		movlw	0x01
		subwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	l5
		goto	l3
		
	
l3
		;l3 checks if 3 are left of it, if not goto l4  -  if so goto winnerscreen
		movlw	0x01
		subwf	target_col
		call	digital_read
		cpfseq	active_go   	
		goto	l4
		goto	winnerscreen
		
	    
l4
		;l4 checks if 1 right of it (2 already left), if not goto r1 - if so goto winnerscreen
		movlw	0x04
		addwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	r1
		goto	winnerscreen
		
	
l5
		;l5 checks if 1 right of it, (1 already left), if not goto r1
		movlw	0x03
		addwf	target_col
	    	call	digital_read
		cpfseq	active_go  
		goto	r1
		goto	l6
		
	
l6
		;l6 checks if 2 right of it, (1 already left), if not goto r1 - if so goto winnerscreen
		movlw	0x01
		addwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	r1
		goto	winnerscreen
		

	

	
r1
		;r1 checks if any are right of it, if not goto n
		movff	last_mov_row, target_row
		movlw	0x01
		movff	last_mov_col, target_col
		addwf	target_col
		call	digital_read
		cpfseq	active_go  	
		goto	nw
		goto	r2
		
	
r2
		;r2 checks if 2 right of it, if not goto r5
		movlw	0x01
		addwf	target_col
		call	digital_read
		cpfseq	active_go  	
		goto	r5
		goto	r3
		
	
r3
		;r3 checks if 3 are right of it, if not goto r4  -  if so goto winnerscreen
		movlw	0x01
	    	addwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	r4
		goto	winnerscreen
				
	
r4
		;r4 checks if 1 left of it (2 already right), if not goto nw - if so goto winnerscreen
		movlw	0x04
		subwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	nw
		goto	winnerscreen
		
	
	
r5
		;r5 checks if 1 left of it, (1 already right), if not goto n
		movlw	0x03
		subwf	target_col
		call	digital_read
		cpfseq	active_go   
		goto	nw
		goto	r6
		
	
	
	
r6
		;r6 checks if 2 left of it, (1 already right), if not goto n - if so goto winnerscreen
		movlw	0x01
	    	subwf	target_col
		call	digital_read
		cpfseq	active_go  
		goto	nw
		goto	winnerscreen
		

	
	

nw
		;nw return cos no-ones won
		return

	

winnerscreen
		movlw	0x00
		cpfseq	go
		goto	naughts_win
		goto	crosses_win
		
			
naughts_win
			call	glcd_start_left
			movlw	0xB8	;sets x = 0	
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			movlw	0x40
			movwf	target
			call	Clear_row
			
			
			movlw	0xB9	;sets x = 1
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0xF8
			call	d_w	;y = 39	    Start of N
			movlw	0x70	
			call	d_w	;y = 40
			movlw	0x80
			call	d_w	;y = 41
			movlw	0x00
			call	d_w	;y = 42
			movlw	0xF8
			call	d_w	;y = 43	    End of N
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x00	
			call	d_w	;y = 46	    Start of A
			movlw	0x80
			call	d_w	;y = 47
			movlw	0x78
			call	d_w	;y = 48
			movlw	0x80
			call	d_w	;y = 49
			movlw	0x00
			call	d_w	;y = 50	    End of A
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0xF8
			call	d_w	;y = 53	    Start of U
			movlw	0x00
			call	d_w	;y = 54	    
			call	d_w	;y = 55
			call	d_w	;y = 56
			movlw	0xF8
			call	d_w	;y = 57	    End of U
			movlw	0x00
			call	d_w	;y = 58	    Gap
			call	d_w	;y = 59	    Gap
			movlw	0xF8
			call	d_w	;y = 60	    Start of G
			movlw	0x08	
			call	d_w	;y = 61
			call	d_w	;y = 62
			call	d_w	;y = 63
			
			
			movlw	0xBA	;sets x = 2
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0x7F
			call	d_w	;y = 39	    Start of N
			movlw	0x00	
			call	d_w	;y = 40
			movlw	0x03
			call	d_w	;y = 41
			movlw	0x1C
			call	d_w	;y = 42
			movlw	0x7F
			call	d_w	;y = 43	    End of N
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x78	
			call	d_w	;y = 46	    Start of A
			movlw	0x07
			call	d_w	;y = 47
			movlw	0x06
			call	d_w	;y = 48
			movlw	0x07
			call	d_w	;y = 49
			movlw	0x78
			call	d_w	;y = 50	    End of A
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0x7F
			call	d_w	;y = 53	    Start of U
			movlw	0x40
			call	d_w	;y = 54	    
			call	d_w	;y = 55
			call	d_w	;y = 56
			movlw	0x7F
			call	d_w	;y = 57	    End of U
			movlw	0x00
			call	d_w	;y = 58	    Gap
			call	d_w	;y = 59	    Gap
			movlw	0x7F
			call	d_w	;y = 60	    Start of G
			movlw	0x40	
			call	d_w	;y = 61
			movlw	0x43
			call	d_w	;y = 62
			call	d_w	;y = 63
			
			
			movlw	0xBB	;sets x = 3
			call	c_w
			movlw	0x40
			call	c_w
			movlw	0x40
			movwf	target
			call	Clear_row
			
			
			movlw	0xBC	;sets x = 4
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0xF8
			call	d_w	;y = 39	    Start of W
			movlw	0x00	
			call	d_w	;y = 40
			movlw	0xC0
			call	d_w	;y = 41
			movlw	0x00
			call	d_w	;y = 42
			movlw	0xF8
			call	d_w	;y = 43	    End of W
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x08	
			call	d_w	;y = 46	    Start of I
			call	d_w	;y = 47
			movlw	0xF8
			call	d_w	;y = 48
			movlw	0x08
			call	d_w	;y = 49
			call	d_w	;y = 50	    End of I
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0xF8
			call	d_w	;y = 53	    Start of N
			movlw	0x70
			call	d_w	;y = 54	    
			movlw	0xC0
			call	d_w	;y = 55
			movlw	0x00
			call	d_w	;y = 56
			movlw	0xF8
			call	d_w	;y = 57	    End of N
			movlw	0x06
			movwf	target
			call	Clear_row   ;empties for y = 58 - y = 63
						
			
			
			movlw	0xBD	;sets x = 5
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0x00
			call	d_w	;y = 39	    Start of W
			movlw	0x0F	
			call	d_w	;y = 40
			movlw	0x00
			call	d_w	;y = 41
			movlw	0x0F
			call	d_w	;y = 42
			movlw	0x00
			call	d_w	;y = 43	    End of W
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x08	
			call	d_w	;y = 46	    Start of I
			call	d_w	;y = 47
			movlw	0x0F
			call	d_w	;y = 48
			movlw	0x08
			call	d_w	;y = 49
			call	d_w	;y = 50	    End of I
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0x0F
			call	d_w	;y = 53	    Start of N
			movlw	0x00
			call	d_w	;y = 54	    
			movlw	0x01
			call	d_w	;y = 55
			movlw	0x07
			call	d_w	;y = 56
			movlw	0x0F
			call	d_w	;y = 57	    End of N
			movlw	0x06	;empties for y = 58 - y = 63
			movwf	target
			call	Clear_row
				
			
			
			movlw	0xBE	;sets x = 6
			call	c_w
			movlw	0x40
			movwf	target
			call	Clear_row
			movlw	0xBF	;sets x = 7
			call	c_w
			call	Clear_row
		
			
			
			
			
			
			call	glcd_start_right
			movlw	0xB8	;sets x = 0	
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			call	Clear_row
			
			
			movlw	0xB9	;sets x = 1
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			
			movlw	0x08
			call	d_w	;y = 0	    End of G
			movlw	0x00
			call	d_w	;y = 1	    Gap
			call	d_w	;y = 2	    Gap
			movlw	0xF8
			call	d_w	;y = 3	    Start of H
			movlw	0x00
			call	d_w	;y = 4	    
			call	d_w	;y = 5	    
			call	d_w	;y = 6	    
			movlw	0xF8
			call	d_w	;y = 7	    End of H
			movlw	0x00
			call	d_w	;y = 8	    Gap
			call	d_w	;y = 9	    Gap
			movlw	0x08
			call	d_w	;y = 10	    Start of T
			call	d_w	;y = 11
			movlw	0xF8
			call	d_w	;y = 12	    
			movlw	0x08
			call	d_w	;y = 13	    
			call	d_w	;y = 14	    End of T
			movlw	0x00
			call	d_w	;y = 15	    Gap
			call	d_w	;y = 16	    Gap
			movlw	0xF8
			call	d_w	;y = 17	    Start of S
			movlw	0x88
			call	d_w	;y = 18	    
			call	d_w	;y = 19	    
			call	d_w	;y = 20
			call	d_w	;y = 21	    End of S
			movlw	0x2B	    ;empty for y = 21 - y = 63
			movwf	target
			call	Clear_row
			
			
			
			
			movlw	0xBA	;sets x = 2
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			movlw	0x7F
			call	d_w	;y = 0	    End of G
			movlw	0x00
			call	d_w	;y = 1	    Gap
			call	d_w	;y = 2	    Gap
			movlw	0x7F
			call	d_w	;y = 3	    Start of H
			movlw	0x01
			call	d_w	;y = 4	    
			call	d_w	;y = 5	    
			call	d_w	;y = 6	    
			movlw	0x7F
			call	d_w	;y = 7	    End of H
			movlw	0x00
			call	d_w	;y = 8	    Gap
			call	d_w	;y = 9	    Gap
			movlw	0x00
			call	d_w	;y = 10	    Start of T
			call	d_w	;y = 11
			movlw	0x7F
			call	d_w	;y = 12	    
			movlw	0x00
			call	d_w	;y = 13	    
			call	d_w	;y = 14	    End of T
			movlw	0x00
			call	d_w	;y = 15	    Gap
			call	d_w	;y = 16	    Gap
			movlw	0x40
			call	d_w	;y = 17	    Start of S
			call	d_w	;y = 18	    
			call	d_w	;y = 19	    
			call	d_w	;y = 20
			movlw	0x7F
			call	d_w	;y = 21	    End of S
			movlw	0x2B	    ;empty for y = 21 - y = 63
			movwf	target
			call	Clear_row
			
			
			movlw	0xBB	;sets x = 3
			call	c_w
			movlw	0x40	;sets y = 0
			call	d_w
			movlw	0x40	    
			movwf	target
			call	Clear_row
			movlw	0xBC	;sets x = 4
			call	c_w
			call	Clear_row
			movlw	0xBD	;sets x = 5
			call	c_w
			call	Clear_row
			movlw	0xBE	;sets x = 6
			call	c_w
			call	Clear_row
			movlw	0xBF	;sets x = 7
			call	c_w
			call	Clear_row
			
			goto	game_reset
		
			
crosses_win
			call	glcd_start_left
			movlw	0xB8	;sets x = 0	
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			call	Clear_row
			
			
			movlw	0xB9	;sets x = 1
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0xF8
			call	d_w	;y = 39	    Start of C
			movlw	0x08	
			call	d_w	;y = 40
			call	d_w	;y = 41
			call	d_w	;y = 42
			call	d_w	;y = 43	    End of C
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0xF8	
			call	d_w	;y = 46	    Start of R
			movlw	0x08
			call	d_w	;y = 47
			call	d_w	;y = 48
			call	d_w	;y = 49
			movlw	0xF8
			call	d_w	;y = 50	    End of R
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0xF8
			call	d_w	;y = 53	    Start of O
			movlw	0x08
			call	d_w	;y = 54	    
			call	d_w	;y = 55
			call	d_w	;y = 56
			movlw	0xF8
			call	d_w	;y = 57	    End of O
			movlw	0x00
			call	d_w	;y = 58	    Gap
			call	d_w	;y = 59	    Gap
			movlw	0xF8
			call	d_w	;y = 60	    Start of S
			movlw	0x88	
			call	d_w	;y = 61
			call	d_w	;y = 62
			call	d_w	;y = 63
			
			
			movlw	0xBA	;sets x = 2
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0x7F
			call	d_w	;y = 39	    Start of C
			movlw	0x40	
			call	d_w	;y = 40
			call	d_w	;y = 41
			call	d_w	;y = 42
			call	d_w	;y = 43	    End of C
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x7F	
			call	d_w	;y = 46	    Start of R
			movlw	0x05
			call	d_w	;y = 47
			movlw	0x09
			call	d_w	;y = 48
			movlw	0x11
			call	d_w	;y = 49
			movlw	0x21
			call	d_w	;y = 50	    End of R
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0x7F
			call	d_w	;y = 53	    Start of O
			movlw	0x40
			call	d_w	;y = 54	    
			call	d_w	;y = 55
			call	d_w	;y = 56
			movlw	0x7F
			call	d_w	;y = 57	    End of O
			movlw	0x00
			call	d_w	;y = 58	    Gap
			call	d_w	;y = 59	    Gap
			movlw	0x40
			call	d_w	;y = 60	    Start of S
			call	d_w	;y = 61
			call	d_w	;y = 62
			call	d_w	;y = 63
			
			
			movlw	0xBB	;sets x = 3
			call	c_w
			movlw	0x40
			call	c_w
			movlw	0x40
			movwf	target
			call	Clear_row
			
			
			movlw	0xBC	;sets x = 4
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0xF8
			call	d_w	;y = 39	    Start of W
			movlw	0x00	
			call	d_w	;y = 40
			movlw	0xC0
			call	d_w	;y = 41
			movlw	0x00
			call	d_w	;y = 42
			movlw	0xF8
			call	d_w	;y = 43	    End of W
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x08	
			call	d_w	;y = 46	    Start of I
			call	d_w	;y = 47
			movlw	0xF8
			call	d_w	;y = 48
			movlw	0x08
			call	d_w	;y = 49
			call	d_w	;y = 50	    End of I
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0xF8
			call	d_w	;y = 53	    Start of N
			movlw	0x70
			call	d_w	;y = 54	    
			movlw	0xC0
			call	d_w	;y = 55
			movlw	0x00
			call	d_w	;y = 56
			movlw	0xF8
			call	d_w	;y = 57	    End of N
			movlw	0x06
			movwf	target
			call	Clear_row   ;empties for y = 58 - y = 63
						
			
			
			movlw	0xBD	;sets x = 5
			call	c_w
			movlw	0x27	    ;empty for y = 0 - y = 38
			movwf	target
			call	Clear_row
			movlw	0x00
			call	d_w	;y = 39	    Start of W
			movlw	0x0F	
			call	d_w	;y = 40
			movlw	0x00
			call	d_w	;y = 41
			movlw	0x0F
			call	d_w	;y = 42
			movlw	0x00
			call	d_w	;y = 43	    End of W
			movlw	0x00
			call	d_w	;y = 44	    Gap
			call	d_w	;y = 45	    Gap
			movlw	0x08	
			call	d_w	;y = 46	    Start of I
			call	d_w	;y = 47
			movlw	0x0F
			call	d_w	;y = 48
			movlw	0x08
			call	d_w	;y = 49
			call	d_w	;y = 50	    End of I
			movlw	0x00
			call	d_w	;y = 51	    Gap
			call	d_w	;y = 52	    Gap
			movlw	0x0F
			call	d_w	;y = 53	    Start of N
			movlw	0x00
			call	d_w	;y = 54	    
			movlw	0x01
			call	d_w	;y = 55
			movlw	0x07
			call	d_w	;y = 56
			movlw	0x0F
			call	d_w	;y = 57	    End of N
			movlw	0x06	;empties for y = 58 - y = 63
			movwf	target
			call	Clear_row
			
			
			movlw	0xBE	;sets x = 6
			call	c_w
			movlw	0x40
			call	c_w
			movlw	0x40	    
			movwf	target
			call	Clear_row
			movlw	0xBF	;sets x = 7
			call	c_w
			call	Clear_row
		
			
			
			
			
			
			call	glcd_start_right
			movlw	0xB8	;sets x = 0	
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			call	Clear_row
			
			
			movlw	0xB9	;sets x = 1
			call	c_w
			movlw	0x88
			call	d_w	;y = 0	    End of S
			movlw	0x00
			call	d_w	;y = 1	    Gap
			call	d_w	;y = 2	    Gap
			movlw	0xF8
			call	d_w	;y = 3	    Start of S
			movlw	0x88
			call	d_w	;y = 4	    
			call	d_w	;y = 5	    
			call	d_w	;y = 6	    
			call	d_w	;y = 7	    End of S
			movlw	0x00
			call	d_w	;y = 8	    Gap
			call	d_w	;y = 9	    Gap
			movlw	0xF8
			call	d_w	;y = 10	    Start of E
			movlw	0x08
			call	d_w	;y = 11
			call	d_w	;y = 12	  
			call	d_w	;y = 13	    
			call	d_w	;y = 14	    End of E
			movlw	0x00
			call	d_w	;y = 15	    Gap
			call	d_w	;y = 16	    Gap
			movlw	0xF8
			call	d_w	;y = 17	    Start of S
			movlw	0x88
			call	d_w	;y = 18	    
			call	d_w	;y = 19	    
			call	d_w	;y = 20
			call	d_w	;y = 21	    End of S
			movlw	0x2A	    ;empties for y = 21 - y = 63
			movwf	target
			call	Clear_row
			
			
			movlw	0xBA	;sets x = 2
			call	c_w
			movlw	0x40	;sets y = 0
			call	c_w
			movlw	0x7F
			call	d_w	;y = 0	    End of S
			movlw	0x00
			call	d_w	;y = 1	    Gap
			call	d_w	;y = 2	    Gap
			movlw	0x40
			call	d_w	;y = 3	    Start of S
			call	d_w	;y = 4	    Gap
			call	d_w	;y = 5	    Gap
			call	d_w	;y = 6	    Gap
			movlw	0x7F
			call	d_w	;y = 7	    End of S
			movlw	0x00
			call	d_w	;y = 8	    Gap
			call	d_w	;y = 9	    Gap
			movlw	0x7F
			call	d_w	;y = 10	    Start of E
			movlw	0x41
			call	d_w	;y = 11
			call	d_w	;y = 12	   
			call	d_w	;y = 13	    
			call	d_w	;y = 14	    End of E
			movlw	0x00
			call	d_w	;y = 15	    Gap
			call	d_w	;y = 16	    Gap
			movlw	0x40
			call	d_w	;y = 17	    Start of S
			call	d_w	;y = 18	    
			call	d_w	;y = 19	    
			call	d_w	;y = 20
			movlw	0x7F
			call	d_w	;y = 21	    End of S
			movlw	0x2A	    ;empties for y = 21 - y = 63
			movwf	target
			call	Clear_row
			
			
			movlw	0xBB	;sets x = 3
			call	c_w
			movlw	0x40
			call	c_w
			movlw	0x40
			movwf	target
			call	Clear_row
			movlw	0xBC	;sets x = 4
			call	c_w
			call	Clear_row
			movlw	0xBD	;sets x = 5
			call	c_w
			movlw	0x40
			call	c_w
			call	Clear_row
			movlw	0xBE	;sets x = 6
			call	c_w
			call	Clear_row
			movlw	0xBF	;sets x = 7
			call	c_w
			call	Clear_row
			
			goto	game_reset
		
			
			
Clear_row
			clrf	temp
loop64
				movlw	0x00
				call	d_w
				incf	temp
				movf	target, 0		
				cpfseq	temp
				goto	loop64
				return
end
