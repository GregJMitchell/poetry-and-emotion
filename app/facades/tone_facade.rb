class ToneFacade
  def self.analyze(poems)
    json = poems.map do |poem|
      ToneService.analyze(poem)
    end
    poems = json.map do |poem|
      AnalyzedPoem.new(poem)
    end
  end
end