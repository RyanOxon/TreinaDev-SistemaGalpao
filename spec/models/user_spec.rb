require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#description" do
    it "exibe o nome e o email" do
      u = User.new(name: 'Rafael Salgado', email: 'rafael@email.com')

      result = u.description

      expect(result).to eq " Rafael Salgado | rafael@email.com"
    end
    
  end
  
end
