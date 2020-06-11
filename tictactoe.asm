.data
	intro_line: .asciiz "Bem vindo ao Jogo da Velha do JPG (Feito em Assembly!)\n"
	ver_line: .asciiz "Desenvolvido no ambiente MARS 4.5 usando a arquitetura MIPS.\n"
	expl_line: .asciiz "Primeiro jogará O, depois o X. Os espaços são numerados da seguinte maneira:\n"
	x_turn: .asciiz "Selecione um espaço (X)\n"
	o_turn: .asciiz "Selecione um espaço (O)\n"
	velha: .asciiz "Velha!\n"
	already_chosen: .asciiz "Local já escolhido! Tente novamente."
	x_win: .asciiz "X venceu!\n"
	o_win: .asciiz "O venceu!\n"
	line_break: .asciiz "\n"
	
	tab_1: .asciiz "[1][2][3]\n"
	tab_2: .asciiz "[4][5][6]\n"
	tab_3: .asciiz "[7][8][9]\n"

	# Constantes do jogo
	espaco_vazio: .asciiz "[]"
	espaco_bola: .asciiz "[O]"
	espaco_x: .asciiz "[X]"

	# Mapeamento:
	# [t0][t1][t2]
	# [t3][t4][t5]
	# [t6][t7][s0]
	# Vazio: 0
	# X: 3
	# Bola: 4
	# Registrador de resultado: $s1

.text
	.globl _main

	_main:
		la $a0, intro_line
		jal _print_intro
		la $a0, ver_line
		jal _print_intro
		la $a0, expl_line
		jal _print_intro
		
		la $a0, tab_1
		jal _print_intro
		la $a0, tab_2
		jal _print_intro
		la $a0, tab_3
		jal _print_intro
		
		jal _game_loop
		
		jal _exit
		
	_game_loop:
		
		jal _check_game_state
		j _vez_do_x
		
		_vez_do_x:
			jal _print_gameboard
			jal _check_game_state
			jal _x_input
		_vez_do_o:	
			jal _print_gameboard
			jal _check_game_state
			jal _o_input
			
			
	_o_input:
		la $a0, o_turn
		jal _print_intro
		jal _read_input
		
		
		# Registrador auxiliar - $s1 
		
		li $s1, 0x1	
		beq $s5, $s1, o_um
		li $s1, 0x2 
		beq $s5, $s1, o_dois
		li $s1, 0x3 
		beq $s5, $s1, o_tres
		li $s1, 0x4 
		beq $s5, $s1, o_quatro
		li $s1, 0x5 
		beq $s5, $s1, o_cinco
		li $s1, 0x6 
		beq $s5, $s1, o_seis
		li $s1, 0x7 
		beq $s5, $s1, o_sete
		li $s1, 0x8 
		beq $s5, $s1, o_oito
		li $s1, 0x9 
		beq $s5, $s1, o_nove
		
		jr $ra
		
		o_um:
			bnez $t0, _tentar_novamente_o
			li $t0, 0x4
			jal _vez_do_x
		o_dois:
			bnez $t1, _tentar_novamente_o
			li $t1, 0x4
			jal _vez_do_x
		o_tres:
			bnez $t2, _tentar_novamente_o
			li $t2, 0x4
			jal _vez_do_x
		o_quatro:
			bnez $t3, _tentar_novamente_o
			li $t3, 0x4
			jal _vez_do_x
		o_cinco:
			bnez $t4, _tentar_novamente_o
			li $t4, 0x4
			jal _vez_do_x
		o_seis:
			bnez $t5, _tentar_novamente_o
			li $t5, 0x4
			jal _vez_do_x
		o_sete:
			bnez $t6, _tentar_novamente_o
			li $t6, 0x4
			jal _vez_do_x
		o_oito:
			bnez $t7, _tentar_novamente_o
			li $t7, 0x4
			jal _vez_do_x
		o_nove:
			bnez $s0, _tentar_novamente_o
			li $s0, 0x4
			jal _vez_do_x
	
	_x_input:
		la $a0, x_turn
		jal _print_intro
		jal _read_input
		
		
		# Registrador auxiliar - $s1
		
		li $s1, 0x1 
		beq $s5, $s1, x_um
		li $s1, 0x2 
		beq $s5, $s1, x_dois
		li $s1, 0x3 
		beq $s5, $s1, x_tres
		li $s1, 0x4 
		beq $s5, $s1, x_quatro
		li $s1, 0x5 
		beq $s5, $s1, x_cinco
		li $s1, 0x6 
		beq $s5, $s1, x_seis
		li $s1, 0x7 
		beq $s5, $s1, x_sete
		li $s1, 0x8 
		beq $s5, $s1, x_oito
		li $s1, 0x9 
		beq $s5, $s1, x_nove
		
		jr $ra
		
		x_um:
			bnez $t0, _tentar_novamente_x
			li $t0, 0x3
			jal _vez_do_o
		x_dois:
			bnez $t1, _tentar_novamente_x
			li $t1, 0x3
			jal _vez_do_o
		x_tres:
			bnez $t2, _tentar_novamente_x
			li $t2, 0x3
			jal _vez_do_o
		x_quatro:
			bnez $t3, _tentar_novamente_x
			li $t3, 0x3
			jal _vez_do_o
		x_cinco:
			bnez $t4, _tentar_novamente_x
			li $t4, 0x3
			jal _vez_do_o
		x_seis:
			bnez $t5, _tentar_novamente_x
			li $t5, 0x3
			jal _vez_do_o
		x_sete:
			bnez $t6, _tentar_novamente_x
			li $t6, 0x3
			jal _vez_do_o
		x_oito:
			bnez $t7, _tentar_novamente_x
			li $t7, 0x3
			jal _vez_do_o
		x_nove:
			li $s0, 0x3
			jal _vez_do_o	
	
	_tentar_novamente_x:
		la $a0, already_chosen
		jal _print_intro
		jal _x_input
	
	_tentar_novamente_o:
		la $a0, already_chosen
		jal _print_intro
		jal _o_input	
	
	_check_game_state:
		li $s3, 0x9 # Vitória do X 
		li $s4, 0xC # Vitória do O
		move $t8, $ra
		# Vitória 1:
			move $a0, $t0
			move $a1, $t1
			move $a2, $t2
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 2
			move $a0, $t3
			move $a1, $t4
			move $a2, $t5
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 3
			move $a0, $t6
			move $a1, $t7
			move $a2, $s0
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 3
			move $a0, $t0
			move $a1, $t3
			move $a2, $t6
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 4
			move $a0, $t1
			move $a1, $t4
			move $a2, $t7
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 5
			move $a0, $t2
			move $a1, $t5
			move $a2, $s0
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 6
			move $a0, $t0
			move $a1, $t4
			move $a2, $s0
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Vitória 7
			move $a0, $t2
			move $a1, $t4
			move $a2, $t6
			li $s1, 0x0
			jal _sum_values
			beq $s1, $s3, _x_victory
			beq $s1, $s4, _o_victory
		# Velha
			li $s7, 0x0 # Flag de velha
			li $s6, 0x0 # Auxiliador
			li $t9, 0x4 # Offset
			
			# Salva o endereço atual e adiciona $ra + 4 para ter o endereço da próxima instrução.
			jal _aux 
			beq $t0, $s6, _change_flag
			beq $t1, $s6, _change_flag
			beq $t2, $s6, _change_flag
			beq $t3, $s6, _change_flag
			beq $t4, $s6, _change_flag
			beq $t5, $s6, _change_flag
			beq $t6, $s6, _change_flag
			beq $t7, $s6, _change_flag
			beq $s0, $s6, _change_flag
			
			beq $s7, $s6, _velha # Se checamos todos os espaços e o registrador s7 continua inalterado, quer dizer que deu velha
		
		jr $t8
			
			_change_flag:
				li $s7, 0x1 # Carrega 1 ao registrador s7 se pelo menos 1 espaço ainda não estiver preenchido
				add $ra, $t9, $ra
				jr $ra
			
			_x_victory:
				la $a0, x_win
				jal _print_intro
				jal _exit
			_o_victory:
				la $a0, o_win
				jal _print_intro
				jal _exit
			_velha:
				la $a0, velha
				jal _print_intro
				jal _exit
			_aux:
				jr $ra
		
	_print_gameboard:
		li $s4, 0x3 # X
		li $t8, 0x4 # 0
		li $s1, 0x0 # Registrador auxiliar que contém 0
		move $t9, $ra
				
		jal _aux
		
		beq $t0, $s4, _print_x
		jal _aux
		beq $t0, $t8, _print_o
		jal _aux
		beq $t0, $s1, _print_vazio
		jal _aux
		
		beq $t1, $s4, _print_x
		jal _aux
		beq $t1, $t8, _print_o
		jal _aux
		beq $t1, $s1, _print_vazio
		jal _aux
		
		beq $t2, $s4, _print_x
		jal _aux
		beq $t2, $t8, _print_o
		jal _aux
		beq $t2, $s1, _print_vazio
		jal _aux
		
		la $a0, line_break
	        li $v0, 4
		syscall
		
		jal _aux
		beq $t3, $s4, _print_x
		jal _aux
		beq $t3, $t8, _print_o
		jal _aux
		beq $t3, $s1, _print_vazio
		jal _aux
		
		beq $t4, $s4, _print_x
		jal _aux
		beq $t4, $t8, _print_o
		jal _aux
		beq $t4, $s1, _print_vazio
		jal _aux
		
		beq $t5, $s4, _print_x
		jal _aux
		beq $t5, $t8, _print_o
		jal _aux
		beq $t5, $s1, _print_vazio
		jal _aux
		
		la $a0, line_break
	        li $v0, 4
		syscall
		
		jal _aux
		beq $t6, $s4, _print_x
		jal _aux
		beq $t6, $t8, _print_o
		jal _aux
		beq $t6, $s1, _print_vazio
		jal _aux
		
		beq $t7, $s4, _print_x
		jal _aux
		beq $t7, $t8, _print_o
		jal _aux
		beq $t7, $s1, _print_vazio
		jal _aux
		
		beq $s0, $s4, _print_x
		jal _aux
		beq $s0, $t8, _print_o
		jal _aux
		beq $s0, $s1, _print_vazio
		jal _aux

		la $a0, line_break
	        li $v0, 4
		syscall
		jr $t9
		
		
	_print_x:
		la $a0, espaco_x
		li $v0, 4
		syscall
		add $ra, $t8, $ra
		jr $ra
	_print_o:
		la $a0, espaco_bola
		li $v0, 4
		syscall
		add $ra, $t8, $ra
		jr $ra
	_print_vazio:
		la $a0, espaco_vazio
		li $v0, 4
		syscall
		add $ra, $t8, $ra
		jr $ra
		
	
	# Apesar do nome, essa sub-rotina é responsável pela maioria dos prints no programa
	_print_intro:
		li $v0, 4
		syscall
		jr $ra
		
	
	_sum_values:
		add $s2, $a0, $a1
		add $s2, $s2, $a2
		move $s1, $s2
		jr $ra
	
	_read_input:
		li $v0, 5
		syscall
		move $s5, $v0
		jr $ra
	
	_exit:
    		li $v0, 10    
    		syscall                      
