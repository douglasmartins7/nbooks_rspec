#equal papito
describe('GET /api/books') do
    before(:all) do
        @user = {
            name: 'Renato Gaucho',
            email: 'Gremio@qaninja.io',
            password: '232425' 
        }

        Books.delete("/api/accounts/#{@user[:email]}")
        Books.post(
            '/api/accounts',
             body: @user.to_json)

        @token = get_token(@user)  
    end

    describe('status 200') do
        before(:all) do
            books.each do |book|
                Books.post(
                    '/api/books',
                    body: book.to_json,
                    headers: { 'ACCESS_TOKEN' => @token }
                )
            end
        end
        it('buscar por titulo do livro') do
            @params = {
                title: 'O monge e o executivo'
            }

            @result = Books.get(
                '/api/books'
                query: @params,
                headers: { 'ACCESS_TOKEN' => @token }
            )

            expect(@result.response.code).to eql '200'
            expect(
                @result.parsed_response.size
            ).to eql 1
        end

        it('quando a pesquisa não retorna registro') do
            @params = {
                author: 'James C. Hunter'
            }

            @result = Books.get(
                '/api/books',
                query: @params,
                headers: { 'ACCESS_TOKEN' => @token }
            )

            expect(@result.response.code).to eql '200'
            expect(
                @result.parsed_response
            ).to be_empty
        end
    end

    after(:each) do |example|
        if example.exception
            puts @token
            puts @result.parsed_response
        end
    end
end