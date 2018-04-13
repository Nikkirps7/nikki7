#samples

L1 = letters[1:26]
L2 = LETTERS[1:26]

M1 = month.abb[1:12]
M2 = month.name[1:12]

sample(L1,2)
sample(L2,15)
sample(L2,30,replace = T)
sample(L1,30,replace = T)

sample(M1,15,replace = T)
sample(M1,5)
set.seed(10)
sample(M1,5)
set.seed(10)
sample(M1,5)