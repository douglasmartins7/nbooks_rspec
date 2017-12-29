
describe('PUT /api/books') do
    before(:all) do
        @user = {
            name: 'Dante',
            email: 'DevilMayCry@hotmail.com',
            password: '1234567'
        }

        Books.delete("/api/accounts/#{@user[:email]}")
        Books.post('/api/accounts', body: @user.to_json)

        @token = get_token(@user)
    end

    describe('status 200') do
        
    end
end
