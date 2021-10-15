class AleatorizarPalavra
    def self.palavra
        p = ["abacate", "abacaxi", "maca", "melao", "pera", "uva", "goiaba", "banana", "morango", "framboesa", "figo", "pessego", "fruta"]
        
        # TIVE PROBLEMAS COM O MÉTODO DE ACESSAR ARQUIVOS
        #    File.open(File.expand_path('../../palavras.txt', __FILE__), 'r') do |arq|
        #        while line = arq.gets
        #            p.push(line.to_s)
        #        end
        #    end
        p.sample
    end
end
