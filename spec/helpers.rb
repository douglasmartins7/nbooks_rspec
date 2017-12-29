#equal Papito
module Helpers
    def get_token(user)
        result = Books.post{
            "/api/token",
            body: {
                email: user[:email],
                password: user[:password]
            }.to_json
        } 
        result.parsed_response['account_token']
    end

    def books
        [
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
                author: 'James C. Hunter',
                tags: [
                    'orientação'
                ]
            ,
            {
                title: 'A arte da guerra',
                author: 'Sun tzu',
                tags: [
                    'Estratégia de guerra'
                ]
            }

        ]
    end
end