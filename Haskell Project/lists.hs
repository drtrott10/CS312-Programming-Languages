--Reeves Trott
--CS 312: Assignment 7
list = [1, 2, 3, 4, 5]


main = do
    --[1,2,3,4,5]
    print list

    -- 1
    print (head list)

    -- [2,3,4,5]
    print (tail list)

    -- 5
    print (last list)

    --[1,2,3,4]
    print (init list)

    -- 4
    print (list !! 3)

    -- True
    print (elem 3 list)

    -- 5
    print (length list)

    -- False
    print (null list)

    --[5,4,3,2,1]
    print (reverse list)

    -- [1,2]
    print (take 2 list)

    -- [3,4,5]
    print (drop 2 list)

    -- 1
    print (minimum list)

    -- 5
    print (maximum list)

    -- 15
    print (sum list)

    -- 120
    print (product list)

    -- [1,4,9,16,25]
    print (map(^2) list)

    -- False
    print (all even list)

    -- True
    print (any odd list)

    -- [8,1,2,3,4,5]
    print (8 : list)

    -- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    print ['A'..'Z']

    -- [3,9,15,18,21,27,30]
    print(map(*3) [1, 3, 5, 6, 7, 9, 10])

    -- [0,0,0,0,0,0,0,0,0,0]
    print (replicate 10 0)

    --"abc"
    print (['a'] ++ ['b'..'c'])

    -- [(1,'a'),(2,'b'),(3,'c')]
    print (zip [1,2,3] "abc")

    -- ([1,2,3],"abc")
    print (unzip [(1,'a'), (2,'b'), (3,'c')])

    -- ["Hello","world"]
    print (words "Hello world")
