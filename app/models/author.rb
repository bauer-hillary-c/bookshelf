class Author < ApplicationRecord

  def coordinates
    [rand(50), rand(50)]
  end
end
