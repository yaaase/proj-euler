(ns clj.core-test
  (:require [clojure.test :refer :all]
            [clj.core :refer :all]
            [clj.one :refer :all]))

(deftest a-test
  (testing "Problem one"
    (is (= 23 (problem-one 10)))))
