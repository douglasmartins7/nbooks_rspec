
describe('GET /api/books') do

    before(:all) do
        @user = {
            name: 'billie Joe',
            email: 'billie@greenday.com'
            password: '191817'
        }

        Books.delete("/apí/accounts/#{@user[:email]}")
        Books.post{
            '/api/accounts',
            body: @user.to_json
        } 

        puts @token = get_token(@user)
    end

    describe('status 200') do
        before(:all) do
            
            @books = [
                {
                    title: 'A culpa é das estrelas',
                    author: 'John Grenn',
                    tags: [
                        'Literatura Romance'
                    ]

                },
                {
                    title: 'Casamento Blindado',
                    author: 'Renato Cardoso',
                    tags: [
                        'orientação sentimental'
                    ]
                },
                {
                    title: 'O monge e o executivo',
                    author: 'James C. Hunter'
                    tags: [
                        'orientação'
                    ]
                },
                {
                    title: 'A arte da guerra',
                    author: 'Sun tzu',
                    tags: [
                        'Estratégia de guerra'
                    ]

                }

            ]
            @books.each do |book|
                Books.post{
                    '/api/books',
                    body: @book.to_json,
                    headers: { 'access_token' => @token }
                }
            end
        end
        it('listar livros') do

            Books.get(
                '/api/books',
                headers: { "ACESS_TOKEN" => @token}
            )
            
            expect(@result.response.code).to eql '200'

            #todo o response e salvo em uma lista(json response) 
            @list = @result.parsed_response

            expect(@list).not_to be_empty

            @list.each do |item|
                #compara se o class(tipo) é igual a da variavel
                expect(item[':title'].class).to eql String
                expect(item[':tags']).class).to eql Array
            end

            # validação do titulo do livro
            # esse laço é um foreach que captura o objeto da lista item[title, author, tags],
            # @books acessa pelo indice 0 o title do objeto fora da lista
            @list.each_with_index do |item, index|
                #   puts item['title']
                #   puts @books[index][:title]  
                expect(item['title']).to eql @books[index][:title]
            end
    end

    after(:each) do |example|
        #imprimi o body se o teste falha para eu entender o erro
        if example.exception
            puts @token
            puts @result.parsed_response
        end
    end  

end