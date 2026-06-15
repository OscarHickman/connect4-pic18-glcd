#include p18f87k22.inc
	
	
    global glcd_start_left, glcd_start_right, c_w, d_w, glcd_grid, glcd_start_left, glcd_start_right
    extern  naughts, crosses, LCD_delay_x4us

	
acs0	udata_acs   ; reserve data space in access ram
delay_count res 1   ; reserve one byte for counter in the delay routine
delay_count2 res 1  ; for delay
delay_count3 res 1  ; for delay
 
x_ad	res 1	; x address
y_ad	res 1	; y address
ct	res 1	; how many times it has done the sixteen columns with just top full
ct2	res 1	; see whether its done three lots of a full then sixteen columns
ct3	res 1	; see how many x address' its done
	
glcd	code
 
glcd_start_left
	movlw	0xff
	movwf	delay_count
	
	; Sets port D and B to outputs
	clrf	TRISB
	clrf	TRISD
	
	; Sets RST to 1
	bsf	LATB, RB5
	
	; Turns off right half of glcd
	bsf	LATB,RB1
	; Turns on left half of glcd
	bcf	LATB,RB0
	call	delay

	;Turns the display on
	movlw	b'00111111'
	call	c_w
	call	delay
	return
	
glcd_start_right
	movlw	0xff
	movwf	delay_count
	
	; Sets port D and B to outputs
	clrf	TRISB
	clrf	TRISD
	
	; Sets RST to 1
	bsf	LATB, RB5
	
	; Turns off left half of glcd
	bsf	LATB,RB0
	; Turns on right half of glcd
	bcf	LATB,RB1
	call	delay

	;Turns the display on
	movlw	b'00111111'
	call	c_w
	call	delay
	return
	
	
glcd_grid
	call glcd_start_left	;write left grid and naughts box
	
	movlw	0xB8	;sets x = 0, B8=10111000
	movwf	x_ad
	movlw   0x40	;sets y = 0, 40=01000000
	movwf   y_ad
	
	clrf	ct3	;counts its done all 6 rows
	
	
bigloop	    ;writes a line then 16 one with the top filled, x3, then a full, then 8 empties all x6 
	    incf    ct3	
	    movf    x_ad, W
	    call    c_w
	    movf    y_ad, W
	    call    c_w
	
	    movlw   0x00
	    call    d_w	;writes y = 0 
	    call    d_w	;writes y = 1 
	    call    d_w	;writes y = 2 
	    call    d_w	;writes y = 3 
	    
	    call    threesquare	;writes	y = 4 - y = 54 , 3x full then top one
		
	    movlw   0xFF	;writes y = 55 
	    call    d_w
	    movlw   0x01	;writes y = 56 
	    call    d_w
	    call    d_w 	;writes y = 57 
	    call    d_w	;writes y = 58 
	    call    d_w	;writes y = 59
	    call    d_w	;writes y = 60 
	    call    d_w	;writes y = 61 	
	    call    d_w	;writes y = 62 	
	    call    d_w	;writes y = 63
	    
	    incf    x_ad
	    movlw   0x06	;counter if done six times
	    cpfseq  ct3		;sees if its done it six times.	
	    goto    bigloop
	    
	
		
	;write naughts box and bottom line of the grid
	call	naughts
	

	;write right grid and player crosses box
	
	call glcd_start_right	    
	
	;write left grid and naughts box
	movlw	0xB8	;sets x = 0
	movwf	x_ad
	movlw   0x40	;sets y = 0
	movwf   y_ad
	
	clrf	ct3	;counts its done all 6 rows
	
	
bigloop2	    ;writes a line then 16 one with the top filled, x3, then a full, then 8 empties all x6 
	    incf    ct3	
	    movf    x_ad, W
	    call    c_w
	    movf    y_ad, W
	    call    c_w
	    
	    movlw   0x01	
	    call    d_w	;writes y = 0
	    call    d_w  ;writes y = 1 
	    call    d_w  ;writes y = 2
	    call    d_w  ;writes y = 3  
	    call    d_w  ;writes y = 4  
	    call    d_w	;writes y = 5
	    call    d_w	;writes y = 6

	    call    threesquare	;writes	y = 7 - y = 57 , 3x full then top one
	    
	
	    
	    movlw   0xFF	
	    call    d_w	;writes y = 58
	    movlw   0x00
	    call    d_w	;writes y = 59
	    call    d_w	;writes y = 60
	    call    d_w	;writes y = 61
	    call    d_w	;writes y = 62
	    call    d_w	;writes y = 63
	    
	    incf    x_ad
	    movlw   0x06	;counter if done six times
	    cpfseq  ct3		;sees if its done it six times.	
	    goto    bigloop2
	    
	
;	;write crosses box and bottom line of the grid
	call	crosses
			
	return

	
threesquare	;writes a full one, then 16 one at top, all times 3
	clrf	ct2	;checks for three times 
	
loop16
	        incf    ct2
	        movlw   0xFF
	        call    d_w
		clrf	ct  ;checks for 16 times
	
sixteen
			movlw   0x01
			call    d_w
			incf    ct
			movlw   0x10
			cpfseq  ct	;if its done 16
			goto sixteen    
	        
		
		movlw   0x03	;counter if done three times
	        cpfseq  ct2		;sees if its done it three times.	
	        goto    loop16
	
	return
	
	
d_w	;writes data to the GLCD		
	; moves input from W to the data bus
	movwf	PORTD
	; Sets RS to 1
	bsf	LATB, RB2
	; Sets R/w to 0
	bcf	LATB, RB3	
	; E set from low to high.
	bsf	LATB,RB4
	call	delay
	bcf	LATB,RB4
	call	delay
	return

	
	
c_w	;writes a command to the GLCD
	movwf	PORTD
	; Sets RS to 0
	bcf	LATB, RB2
	; Sets R/W to 0
	bcf	LATB, RB3
	; Sets E from low to high.
	bsf	LATB,RB4
	call	delay
	bcf	LATB,RB4
	call	delay
	return

	
delay	clrf	delay_count
	clrf	delay_count2
	
delay_1	movff	delay_count,delay_count3
;	call	delay_2
	decfsz	delay_count2
	bra	delay_1	   
	return

;delay_2	decfsz	delay_count3
;	bra delay_2
;	return
	
    end