require 'rails_helper'

describe ToneService do
  context '#authors_poems' do
    it 'returns appropriate data' do
      VCR.use_cassette('emily_poem_tone') do
        data = { title: 'Not at Home to Callers', author: 'Emily Dickinson', lines: ['Not at Home to Callers', 'Says the Naked Tree --', 'Bonnet due in April --', 'Wishing you Good Day --'], linecount: '4' }
        poem = Poem.new(data)
        results = ToneService.analyze(poem)
        expect(results).to be_a(Hash)

        expect(results[:title]).to be_a(String)

        expect(results[:author]).to be_a(String)

        expect(results[:lines]).to be_a(String)

        expect(results[:tone]).to be_a(Hash)
        expect(results[:tone][:document_tone]).to be_a(Hash)
        expect(results[:tone][:document_tone][:tones]).to be_a(Array)
        expect(results[:tone][:document_tone][:tones][0][:score]).to be_a(Float)
        expect(results[:tone][:document_tone][:tones][0][:tone_id]).to be_a(String)
        expect(results[:tone][:document_tone][:tones][0][:tone_name]).to be_a(String)
      end
    end
  end
end
