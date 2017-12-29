#definir uma suite de teste
describe('suite de teste') do
        #hook acontece antes dos cenários
        #all executa uma unica vez para todos os casos de teste
        #each executa para cada caso de teste
        before(:all) do
            puts 'tudo aqui acontece antes do cenário'
        end
        
        #caso de teste
        it ('novo test') do
            puts 'executando o caso de teste'
        end

        it('mais um caso de teste') do
            puts 'mais um caso de teste'
        end

        after(:all) do
            puts 'tudo aqui acontece depois do cenário'
        end


end