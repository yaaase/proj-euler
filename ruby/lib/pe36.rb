list = []

(1..1_000_000).map.each do |n|
  if n.to_s == n.to_s.reverse.to_i.to_s
    if n.to_s(2) == n.to_s(2).reverse.to_i.to_s
      list << n
    end
  end
end

#puts list.inject(0,&:+)
