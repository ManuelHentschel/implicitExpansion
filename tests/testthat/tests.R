
test_that('dim expansion', {
  d2 <- c(1,5)
  d3 <- c(2,5,2)
  d4 <- c(2,1,2)
  d5 <- c(0,5)
  d6 <- c(0,1)

  expect_error(getExpandedDim(d3, d5))
  expect_error(getExpandedDim(d4, d5))
  expect_identical(getExpandedDim(d2, d3), d3)
  expect_identical(getExpandedDim(d2, d4), d3)
  expect_identical(getExpandedDim(d2, d6), d5)
  expect_identical(getExpandedDim(d5, d6), d5)
})

test_that('dim names', {
  v1 <- t(t(c(a=1, b=2)))
  v1b <- t(t(1:2))
  v2 <- t(c(x=1, y=2, z=3))
  v2b <- t(1:3)
  v3 <- array(1, c(1,1,1), list('n1', 'n2', 'n3'))
  
  expect_identical(
    getExpandedDimnames(list(v1, v2)),
    list(c('a', 'b'), c('x', 'y', 'z'))
  )
  expect_identical(
    getExpandedDimnames(list(v1, v2b)),
    list(c('a', 'b'), NULL)
  )
  expect_identical(
    getExpandedDimnames(list(v1b, v2b)),
    NULL
  )
  expect_identical(
    getExpandedDimnames(list(v1, v3)),
    list(c('a', 'b'), c('n2'), c('n3'))
  )
  expect_identical(
    getExpandedDimnames(list(v2, v3)),
    list(c('n1'), c('x', 'y', 'z'), c('n3'))
  )
  expect_identical(
    getExpandedDimnames(list(v1, v2, v3)),
    list(c('a', 'b'), c('x', 'y', 'z'), c('n3'))
  )
  expect_identical(
    getExpandedDimnames(list(v1, v2b, v3)),
    list(c('a', 'b'), NULL, c('n3'))
  )
})

test_that('array expansion', {
  v1 <- 1:3
  v2 <- t(2:5)

  expect_identical(
    expandArray(v1, c(3,3)),
    cbind(v1, v1, v1, deparse.level = 0)
  )
  expect_identical(
    expandArray(v2, c(2, 4)),
    rbind(v2, v2, deparse.level = 0)
  )
  expect_identical(
    expandArray('x', c(2,3,4)),
    array('x', c(2,3,4))
  )
})

test_that('binary operators', {
  v1 <- 1:3
  v2 <- t(4:5)
  expect_identical(v1 %m+% v2, array(c(5:7, 6:8), c(3,2)))
  expect_identical(v1 %m*% v2, array(c((1:3)*4L, (1:3)*5L), c(3,2)))
})
