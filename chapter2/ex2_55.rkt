#lang racket

(car ''abracadabra)
=> 'quote

Ah! ' must be synatctic shorthand for a quote operator s.t. 
'x <=> (quote x)
and ''abracadabra is represented as (quote (quote abracadabra))

