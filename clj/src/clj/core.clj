(ns clj.core
  (:gen-class)
  (:require [clj.one :refer :all]))

(defn -main
  "Runner for project euler solutions."
  [& args]
  ;; work around dangerous default behaviour in Clojure
  (alter-var-root #'*read-eval* (constantly false))
  (println (problem-one 1000)))
