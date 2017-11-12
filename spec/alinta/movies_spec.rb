require 'spec_helper'
require 'alinta/movies'

describe Alinta::Movies do
  describe '#actors' do
    before do
      # Better off in a fixture or factory if examples need to be more detailed
      @data = [
        {
          name: 'Family Guy',
          roles: [
            { name: 'Meg Griffin', actor: 'Mila Kunis' },
            { name: 'Meg Griffin', actor: 'Mila Kunis' }
          ]
        },
        {
          roles: [
            { name: 'Dr Barry Wolfson', actor: 'Keifer Sutherland' }
          ]
        },
        {
          name: 'Berverly Hills Cop',
          roles: [
            { name: 'Mikey Tandino', actor: '' },
            { actor: 'Lisa Eilbacher' }
          ]
        }
      ]
  
      @credits = Alinta::Movies.new(@data)
    end

    it 'contains no duplicate roles' do
      expect(@credits.actors['Mila Kunis']).to have_exactly(1).items 
    end

    it 'contains no empty actor names' do
      expect(@credits.actors.keys).not_to include('')
    end

    it 'gracefully handles missing titles' do
      expect(@credits.actors['Keifer Sutherland'].sample[:movie]).to include('missing title')
    end

    it 'gracefully handles missing credits' do
      expect(@credits.actors['Lisa Eilbacher'].sample[:role]).to include('uncredited')
    end

  end
end