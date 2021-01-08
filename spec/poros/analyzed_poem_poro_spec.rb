require 'rails_helper'

describe AnalyzedPoem do
  it 'exists' do
    data = { title: 'Not at Home to Callers',
             author: 'Emily Dickinson',
             tone: { document_tone: { tones: [{ score: 0.730959, tone_id: 'joy', tone_name: 'Joy' }] } },
             lines: 'Not at Home to Callers Says the Naked Tree -- Bonnet due in April -- Wishing you Good Day --' }
    poem = AnalyzedPoem.new(data)

    expect(poem).to be_a(AnalyzedPoem)

    expect(poem.title).to eq(data[:title])
    expect(poem.author).to eq(data[:author])
    expect(poem.lines).to eq(data[:lines])
    expect(poem.tones).to eq([{ tone_name: 'Joy',
                                tone_score: 0.730959 }])
  end
end
