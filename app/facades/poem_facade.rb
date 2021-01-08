class PoemFacade
  def self.authors_poems(search)
    json = PoemService.authors_poems(search)
    top10 = json[0..9]
    top10.map do |data|
      Poem.new(data)
    end
  end
end
