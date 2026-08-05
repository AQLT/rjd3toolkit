test_that("calendar_td works", {
    reg <- calendar_td(frequency = 12L, start = 2020L, length = 3L)
    expect_s3_class(reg, "mts")
    expect_identical(
        colnames(reg),
        c("group_1", "group_2", "group_3", "group_4", "group_5", "group_6")
    )
    expect_identical(dim(reg), c(3L, 6L))
})
