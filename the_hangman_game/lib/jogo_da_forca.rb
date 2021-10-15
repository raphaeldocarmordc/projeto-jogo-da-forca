require_relative 'inicializacao'
require_relative 'sortear_palavra'

class JogoDaForca
    attr_reader :palavra_aleatoria, :perdeu, :tentativas, :letras_da_palavra, :nome_jogador, :letras_escolhidas, :letra_chutada

    def initialize
        Inicializacao.abertura_do_jogo
        @perdeu = false
        @letras_escolhidas = []
        @tentativas = 7 #numero de membros do bonequinho
        
         
    end

    def jogar
        @palavra_aleatoria = AleatorizarPalavra.palavra
        @letras_da_palavra = @palavra_aleatoria.chars.to_a # transforma a palavra aleatorizada num array
        Inicializacao.como_joga
        continuar_o_jogo
    end

    def continuar_o_jogo
        while !@perdeu
            saida
            chutar_letra
            mesmo_chute
            @letras_escolhidas << @letra_chutada
            if tentativas_restantes && !venceu
                interacao_do_jogo
            elsif venceu
                File.open(File.expand_path('../../ascii/draw_vitoria.txt', __FILE__), 'r') do |arq|
                    while line = arq.gets
                        puts line
                    end
                end
                fim
            else
                derrotado
            end
        end
    end

    def fim
        @perdeu = true
    end

    def derrotado
        File.open(File.expand_path('../../ascii/draw_derrota.txt', __FILE__), 'r') do |arq|
            while line = arq.gets
                puts line
            end
        end

        puts "- UHUL! Parece que eu ganhei um amigo..."
        sleep 5
        puts "- Sua cama vai ficar do lado da minha <3"
        sleep 5
        puts "- Ai ai... e tudo graças a palavra #{palavra_aleatoria}"
        sleep 5
        puts "- Obrigado por tudo, #{palavra_aleatoria}"
        
        fim
    end

    def venceu
        (@letras_da_palavra - @letras_escolhidas).length == 0 
    end

    def tentativas_restantes
        @tentativas > 1
    end

    def chutar_letra
        @letra_chutada = gets.chomp.downcase.to_s
    end

    def mesmo_chute
        if @letras_escolhidas.include? @letra_chutada
            puts "- Essa letra já foi, espertão!"
            continuar_o_jogo
        end
    end

    def interacao_do_jogo
        if @letra_chutada.size != 1
            puts "- Você ta tentando trapacear? É uma letra por vez só!"
        elsif @palavra_aleatoria.include? @letra_chutada
            puts "- ACERTO MIZERAVI!"
        else
            @tentativas -= 1
            puts "- Você perdeu uma tentativa, agora só te restam #{@tentativas}."
        end
    end

    def saida
        palavra = ""

        @letras_da_palavra.map do |l|
            palavra << (@letras_escolhidas.include?(l) ? l : '#') + ' ' #operador ternário/ shorthand pra if/else
        end
        
        puts palavra
    end

end