(ns clj.core-test
  (:require [clojure.test :refer :all]
            [clj.core :refer :all]
            [clj.one :refer :all]
            [clj.two :refer :all]))

(deftest one-test
  (testing "Problem one"
    (is (= 23 (problem-one 10)))))

(deftest two-test
  (testing "Problem two"
    (is (= 10 (problem-two 10)))))
