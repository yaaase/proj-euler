(ns clj.core
  (:gen-class)
  (:require [clj.one :refer :all]
            [clj.two :refer :all]))

(defn -main
  "Runner for project euler solutions."
  [& args]
  ;; work around dangerous default behaviour in Clojure
  (alter-var-root #'*read-eval* (constantly false))
  (println "Problem one: " (problem-one 1000))
  (println "Problem two: " (problem-two 4000000)))
