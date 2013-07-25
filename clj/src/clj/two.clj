(ns clj.two)

(def fib-seq
  (lazy-cat [0 1]
    (map + (rest fib-seq) fib-seq)))

(defn problem-two
  "Sum the even Fibonacci numbers under 4 million"
  [x]
  (reduce +
    (filter even?
      (take-while (partial > x)
        fib-seq))))
