
                                                    ;Project Name: Numeric Evaluation Toolkit 
                                                    ;Group: 15
                                                    ;Section:07
                                                    
                                                    ;Members:21301558	Mir Abdullah Kawsar
                                                            ;22101002	Radiah Hassan
                                                            ;21301180	Fahmida Akter Rimo

;code starts from here

.MODEL SMALL
.STACK 100H
.DATA                       
    ; DEFINE YOUR VARIABLES 
    ; The .data section is where you define and allocate memory for
    ; your program's data variables. This section typically contains 
    ; declarations for variables, constants, and strings that your program uses.
    ar1 dw 10 dup(?)     
    
    d dw "Enter how many digits you want as input: $"
    c dw "Enter your number: $"
    m3 dw "Checking number properties of: $" 
    e db ? 
     
    palin dw "It's a palindrome$"
    not_p dw "It's not a palindrome$" 
    l_sq dw "It's a lucas number sequence$"
    nl_sq dw "It's not a lucas number sequence$"
    rem db ?
    vall db ? 
    
    evenn dw "It's an even Number$"
    odddd dw "It's an odd Number$"
    
        
    ;palindrome , lucas number & EvenOdd
    
    d1 dw "It's a Duck Number!$"
    d2 dw "It's not a Duck Number$"
    
    d3 dw "It's a Munchausen Number!$"
    d4 dw "It's not a Munchausen Number$"    
    
    
    


.CODE  
    ; The .code section is where you place your program's executable 
    ; instructions or code. It contains the actual assembly language
    ; instructions that perform tasks and computations.

    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
        lea dx,d 
        mov ah,9  	
        int 21h 
        
        mov ah,1
        int 21h 
        sub al,30h
        mov e,al        
        
        ;new line
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
                
        mov ah,9
        lea dx,c
        int 21h

        
        mov al,0
        mov ah,1
       ;dx has the value of how many numbers should be entered 
        mov dl,e
        mov dh,0
        mov cx,dx  ;cx has the value now
        
        mov bx,0
        lea bx,ar1
        
        ;inserting array values        
        start:
            int 21h  
            mov [bx],al
            add bx,1
        loop start
         
        ;for printing  
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        
        ;dx has the value of how many numbers should be entered        
        mov ah,9
        lea dx,m3
        int 21h
        
        mov dl,e
        mov dh,0
        mov cx,dx  
        
        MOV AH, 2
        MOV BX, 0
        secondLoop:
            MOV Dx, ar1[BX]  
            int 21h
            add BX, 1
        loop secondLoop         
        
       ;keep in mind that "e" is 8bit
          
        ;new line
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h 
         
palindrome_check:       
        mov bl,e
        cmp bl,0
        je palindrome
        cmp bl,1
        je palindrome 
        
        mov ah,0
        mov al,e
        mov bl,2
        div bl
        mov vall,al  ;vall has the value of bhagfol
        add al,al
        cmp al , e ;
        je even_p
        ;add al,2
        
        mov si,0
        mov al,vall
        mov ah,0
        mov cx,ax
        push_l:
            mov ax,ar1[si]
            push ax
            inc si
        loop push_l 

        mov al,vall
        mov ah,0        
        mov si,ax
        add si,1
       ; mov al,rem
        mov ah,0
        mov cx,ax 
        pop_l:
            mov ax,ar1[si]
            pop dx
            cmp al,dl
            jg non_p
            jl non_p
            inc si
            loop pop_l
        
        palindrome:
            lea dx,palin 
            mov ah,9  	
            int 21h
            mov al,0
            mov bl,0
            cmp al,bl     
            je Lucas_Number
        non_p:
            lea dx,not_p
            mov ah,9  	
            int 21h 
            mov al,0
            mov bl,0
            cmp al,bl            
            je Lucas_Number   
            
        even_p:
            mov si,0
            mov al,vall
            mov ah,0
            mov cx,ax            
            push_ll: 
                mov ax,ar1[si]
                push ax
                inc si 
                loop push_ll    
            
            mov al,vall
            mov ah,0                
            mov si,ax
            mov cx,ax                                               
            pop_ll:
                mov ax,ar1[si]
                pop dx
                cmp al,dl
                jg non_p
                jl non_p
                inc si
                loop pop_ll
                mov al,0
                mov bl,0
                cmp al,bl
                je palindrome   
        

                
 Lucas_Number:
         ;new line
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        
        mov al,e
        mov rem,2
        cmp al,rem
        je not_l   ;2 ta e te value hole check kora lagbe
        jl not_l

        mov al,e
        mov rem,3
        cmp al,rem
        je  thre_v

        mov ah,0
        mov al,3
        mov bl,e
        sub bl,al
        mov bh,0
        mov cx,bx
        mov si,1
        
        lucas:
            mov ax,ar1[si]   ;1
            sub al,30h
            inc si
            mov bx,ar1[si]     ;2
            sub al,30h
            add ax,bx    
            inc si
            mov dx,ar1[si]
            sub dl,30h            
            cmp al,dl     ;3
            jl not_l
            jg not_l
            dec si 
            loop lucas  
              
            lucas_c: 
            mov ah,9
            lea dx,l_sq
            int 21h 
            mov al,1
            mov bl,1
            cmp al,bl
            je duck_check
        
        not_l:
            mov al,e
            cmp al,2
            je t_v
            mov al,e
            cmp al,1
            je one_v
            lea dx,nl_sq
            mov ah,9
            int 21h             
            mov al,1
            mov bl,1
            cmp al,bl
            je duck_check
        t_v:
            mov ax,ar1[0]
            mov bx,32h
            cmp al,bl
            jl n_ll 
            jg n_ll
            mov ax,ar1[1]
            mov bx,31h
            cmp al,bl
            jl n_ll
            jg n_ll
            mov ah,9
            lea dx,l_sq
            int 21h
            mov al,1
            mov bl,1
            cmp al,bl
            je duck_check            
                       
        one_v:
            mov ax,ar1[0]
            mov bx,32h
            cmp al,bl
            jl n_ll 
            jg n_ll            
            mov ah,9
            lea dx,l_sq
            int 21h
            mov al,1
            mov bl,1
            cmp al,bl
            je duck_check            
                     
        thre_v:
            mov ax,ar1[0]
            mov bx,32h
            cmp al,bl
            jl n_ll 
            jg n_ll
            mov ax,ar1[1]
            mov bx,31h
            cmp al,bl
            jl n_ll
            jg n_ll                    
            mov ax,ar1[2]
            mov bx,33h
            cmp al,bl
            je lucas_c
                                    
        n_ll:
        
            lea dx,nl_sq
            mov ah,9
            int 21h                        
            mov al,1
            mov bl,1
            cmp al,bl
            je duck_check                 


  
        duck_check:
          
        ;new line;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        
        
        ;Duck number checking(Checks if there is a zero in the number)
        mov dl,e
        mov dh,0
        mov cx,dx ;cx has the counter value
        mov bx,0

        duck_loop:
           mov dx,0 
           mov dx,ar1[bx]
           cmp dl,30h
           JE duck 
           add bx, 1
        loop duck_loop

        
        lea dx,d2
        mov ah,9
        int 21h
        ;new line
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        jmp munchausen_check
        
        
        duck:
        lea dx,d1
        mov ah,9
        int 21h
        ;new line
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        jmp munchausen_check
        
        
       
        ;Munchausen Number checking(a number that is equal to the sum of its digits each raised to a power equal to the digit)
        munchausen_check:
            mov dl,e
            mov dh,0
            mov cx,dx ; counter set
            mov bx,0  ; index set
            
            cmp cx,1
            je munchausen_l1
            cmp cx,4
            je  digits_check
            jmp not_munchausen
        
            
            munchausen_l1:
            cmp ar1[bx],31h
            je munchausen
            jmp not_munchausen    
        
        
            digits_check: ;3435
            mov dx,0
            mov dx,ar1[bx]
            cmp dl,33h
            jne not_munchausen
             
            add bx,1
            mov dx, ar1[bx]
            cmp dl, 34h
            jne not_munchausen
             
            add bx,1
            mov dx, ar1[bx]
            cmp dl,33h
            jne not_munchausen  
            
            add bx,1
            mov dx, ar1[bx]
            cmp dl,35h
            je munchausen
            jne not_munchausen

        
        
        munchausen:
        lea dx, d3
        mov ah, 9
        int 21h
        jmp even_odd
        
        not_munchausen:
        lea dx, d4
        mov ah, 9
        int 21h
  
;even_Odd  
     even_odd:
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h

        mov al,e
        mov ah,0                
        mov si,ax    
        sub si,1
        
        mov bl,2h
        mov ax,ar1[si] 
        mov ah,0
        div bl
        cmp ah,1
        je oddd
        mov ah,9
        lea dx,evenn
        int 21h
        jmp EXIT
                
        oddd:
        mov ah,9
        lea dx,odddd
        int 21h
        jmp EXIT 






                      
        EXIT:

        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H 
        
    MAIN ENDP
    END MAIN                       

;code ends here



