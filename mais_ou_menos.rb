def dar_boas_vindas
	puts "Bem vindo ao jogo mais ou menos!"
	puts "Qual o seu nome?"
	nome = gets
	puts "\n\n\n"
	puts "Começaremos o jogo para você, " + nome
	nome
end

def dificuldade_do_jogo
	puts "Em qual dificuldade você quer jogar?"
	puts "(1) Muito Fácil (2) Fácil (3) Normal (4) Difícil (5) Muito Difícil"
	dificuldade = gets.to_i
end

def sorteio_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 15
	when 2
		maximo = 30
	when 3
		maximo = 50
	when 4
		maximo = 100
	else
		maximo = 200
	end

 	puts "Escolhendo um número de 0 a #{maximo}..."
	sorteio = rand(maximo) + 1
	puts "Escolhido, que tal advinhar o nosso número secreto?"
	return sorteio
end

def pede_um_palpite(chutes, tentativas, limite_tentativas)
	puts "\n\n"
	puts "Tentativa " + tentativas.to_s + " de " + limite_tentativas.to_s
	puts "Chutes até agora: #{chutes}"
	puts "Qual é o seu chute ?"
	chute = gets
	puts "Será que você acertou? Seu palpite foi " + chute
	chute.to_i
end

def verifica_se_acertou(chute, numero_secreto)
	acertou = numero_secreto == chute
	if acertou
		puts "Acertou!"
		return true
	end

	maior = numero_secreto > chute
	if maior
			puts "Mais!"
	else
			puts "Menos!"
	end
	false
end

def jogar_novamente
	puts"Você deseja jogar novamente? (S/N)"
	resposta = gets.strip
	resposta.upcase == "S"
end

def jogar (nome, dificuldade)
	puts "\n\n"
	numero_secreto = sorteio_numero_secreto dificuldade

	pontos_atuais = 1000
	limite_tentativas = 5
	chutes = []

	for tentativas in 1..limite_tentativas
		chute = pede_um_palpite chutes, tentativas, limite_tentativas
		puts "\n\n"
		chutes[chutes.size] = chute
		#ou chutes << chute

		if nome.strip == "Rods"
			puts "Acertou!"
			break
		end

		pontos_a_perder = chute - numero_secreto
		pontos_atuais -= pontos_a_perder.abs

		if verifica_se_acertou(chute, numero_secreto)
			break
		end
	end
	puts "Você fez #{pontos_atuais} pontos!"
end 

nome = dar_boas_vindas
dificuldade = dificuldade_do_jogo

loop do
	jogar nome, dificuldade
	if !jogar_novamente
		break
	end
end




#tentativas infinitas
#while chute.to_i != numero_secreto
#	puts "\n\n"
#	puts "Qual é o seu chute ?"
#	chute = gets
#
#	puts "\n\n"
#	puts "Será que você acertou? Seu palpite foi " + chute
#	acertou = numero_secreto == chute.to_i
#	if acertou
#		puts "Acertou!"
#	else 
#		maior = numero_secreto > chute.to_i
#		if maior
#			puts "O numero secreto é maior!"
#		else
#			puts "O numero secreto é menor!"
#		end
#	end
#end