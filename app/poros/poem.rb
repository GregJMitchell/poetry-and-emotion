class Poem
  attr_reader :title, :author, :lines
  def initialize(data)
    @title = data[:title]
    @author = data[:author]
    @lines = join_lines(data[:lines])
  end

  def join_lines(line_array)
    line_array.join(' ')
  end
end
