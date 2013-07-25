(ns clj.one)

(defn problem-one
  "Sum the #s < 1000 that are evenly divisible by 3 or 5"
  [x]
  (reduce +
    (distinct
      (concat
        (filter #(= 0 (mod % 3)) (range 1 x))
        (filter #(= 0 (mod % 5)) (range 1 x))))))
