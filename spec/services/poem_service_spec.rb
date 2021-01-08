require 'rails_helper'

describe PoemService do
  context '#authors_poems' do
    it 'returns appropriate data' do
      VCR.use_cassette('emily_poem_search') do
        results = PoemService.authors_poems('Emily')
        expect(results).to be_a(Array)

        first_result = results.first

        expect(first_result[:title]).to be_a(String)

        expect(first_result[:author]).to be_a(String)

        expect(first_result[:lines]).to be_a(Array)

        expect(first_result[:linecount]).to be_a(String)
      end
    end
  end
end
