require 'rails_helper'

describe 'view' , type: :request do
  context 'when view index page'  do
    it 'return status code 200' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end


# describe TasksController , type: :view do

#   let(:task) { create(:task) }

#   describe '#new' do
#     context 'when view new page' do
    
#     end
    
#   end

# end
# 