class Pe11
  @r_diags

  def initialize
    @grid, @r_diags = [], []
    @grid << [1,2,3,1]
    @grid << [2,1,3,1]
    @grid << [3,3,2,2]
    @grid << [0,1,3,2]
  end

  def horiz(n)
    max = 1
    @grid.each do |row|
      max = max_prod(row, n) if max < max_prod(row, n)
    end
    max
  end

  def vert(n)
    max, i, c = 1, 0, 0
    while i < @grid[0].size
      col_max = 1
      while c < @grid.size
        temp = []
        @grid.each { |x| temp << x[c] }
        col_max = max_prod(temp, n) if col_max < max_prod(temp, n)
        c += 1
      end
      max = col_max if max < col_max
      i += 1
    end
    max
  end

  def max_prod(array, n)
    i, row_max = 0, 1
    while i + n < array.size
      test = array[i...(i+n)].inject(1,&:*)
      row_max = test if row_max < test
      i += 1
    end
    row_max
  end

end
