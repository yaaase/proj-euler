puts (1..100).to_a.inject(1,&:*).to_s.split(//).map(&:to_i).inject(0,&:+)
