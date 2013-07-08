
# 1

(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))

vs. 
 
#2

 (flatmap
 (lambda (rest-of-queens)
   (map (lambda (new-row)
          (adjoin-position new-row k rest-of-queens))
        (enumerate-interval 1 board-size)))
 (queen-cols (- k 1))))))


The first one is going to be significantly slower b/c it calls the
recursive call for every new row, at every depth, rather than just 
once per depth - so rather than n calls, it has n! calls. 

For a rough estimate, if #2 takes T time, each call is (T/n), and
the total time required by #1 is T*(n-1)!

However, it's not *quite* that bad, b/c the smaller calls are made 
more often but are faster. 


