require 'rails_helper'

describe Poem do
  it 'exists' do
    data = { title: 'Not at Home to Callers', author: 'Emily Dickinson', lines: ['Not at Home to Callers', 'Says the Naked Tree --', 'Bonnet due in April --', 'Wishing you Good Day --'], linecount: '4' }
    poem = Poem.new(data)

    expect(poem).to be_a(Poem)

    expect(poem.title).to eq(data[:title])
    expect(poem.author).to eq(data[:author])
    expect(poem.lines).to eq(data[:lines].join(' '))
  end
end
