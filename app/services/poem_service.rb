class PoemService
  def self.authors_poems(search)
    conn = Faraday.new("https://poetrydb.org/author/#{search}")
    results = conn.get
    json = JSON.parse(results.body, symbolize_names: true)
  end
end