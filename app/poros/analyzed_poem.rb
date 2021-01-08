class AnalyzedPoem
  attr_reader :title, :author, :tones, :lines
  def initialize(data)
    @title = data[:title]
    @author = data[:author]
    @tones = get_tones(data[:tone][:document_tone])
    @lines = data[:lines]
  end

  def get_tones(tones)
    tones[:tones].map do |tone|
      { tone_name: tone[:tone_name],
        tone_score: tone[:score] }
    end
  end
end
