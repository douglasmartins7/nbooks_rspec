# esse seria o envi
#existe airborne para api(framework) ele tem problema com array
#httpParty é para testar com api mais complexas Airborne mais simples.
#rspec também é para testes unitário
#pode rodar o rspec com rspec -fd que lista o status do response
#describe equivale com a um cenário
#metodo sample do for_each seria chamar um indice da lista randomico
# rspec --format html -- out specs.html roda e gera um formato html
# rspec_junit_formatter / rspect --format RspecJunitFormatter --out specs.xml/ gera um relatório que o jenkins aceita
# não usa o cucumber para testar api(Papito) - Cucumber para testar sistema web

#equal Papito
require 'httparty'
require 'faker'

require_relative 'helpers'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
 
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Helpers
end

class Books
  include HTTParty
  base_uri 'http://nbooks.herokuapp.com'
  default_params output: 'json'
end
