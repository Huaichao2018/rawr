context('Visual tests')

test_that('Visual tests for kmplot and kmplot_by', {
  quote({
    ## visual tests
    library('rawr')
    library('survival')
    
    
    ## identical plots (minus some aesthetics)
    s <- survfit(Surv(time, status) ~ sex, lung)
    mar <- c(5,6,2,2)
    par(mar = mar)
    plot(s, mark.time = TRUE, col = 1:2)
    kmplot(s, atrisk.table = FALSE, mar = mar)
    kmplot_by(s, atrisk.table = FALSE, mar = mar)
    kmplot_by(time = 'time', strata = 'sex', event = 'status', data = lung,
              atrisk.table = FALSE, mar = mar)
    
    
    colon2 <- within(colon[duplicated(colon$id), ], {
      pfs_time <- time
      pfs_ind  <- status
      sex <- c('Female','Male')[sex + 1L]
      sex1 <- 'Male'
    })
    
    ## --- color mapping --- ##
    
    ## colors should map
    kmplot_by('sex', 'pfs', colon2, by = 'sex', single = FALSE, map.col = TRUE)
    
    ## colors should _not_ map
    kmplot_by('sex', 'pfs', colon2, by = 'sex', single = FALSE)
    
    ## colors should map
    kmplot_by('sex', 'pfs', colon2, by = 'sex', single = FALSE,
              col.surv = c(Male = 'green', Other = 'blue', Female = 'red'))
    
    ## --- labels are not mapped -- low priority --- ##
    
    kmplot_by('sex', 'pfs', colon2, by = 'sex', single = FALSE, strata_lab = 1:2,
              col.surv = c('1' = 'green', '2' = 'blue'))
    
    kmplot_by('sex', 'pfs', colon2, by = 'sex', single = FALSE,
              strata_lab = c('1', '2'))
    
    ## labels are mapped
    kmplot_by('sex', 'pfs', colon2, by = 'rx', single = FALSE,
              strata_lab = c('abc', 'def'),
              col.surv = c('abc' = 'magenta', 'def' = 'blue'))
    
    ## --- drop a level for one plot --- ##
    
    colon2$rx[colon2$rx == 'Obs' & colon2$sex == 'Male'] <- NA
    s <- survfit(Surv(pfs_time, pfs_ind) ~ rx, colon2)
    
    ## base plot
    kmplot(s, col.surv = 1:3)
    ## expect warning
    kmplot(s, col.surv = c('rx=Obs' = 'red'))
    ## second plot should drop black line not green
    kmplot_by(s, by = 'sex', col.surv = 1:3)
    
    kmplot_by(s, by = 'sex', strata_lab = FALSE,
              col.surv = c('Obs' = 1, 'Lev' = 2, 'Lev+5FU' = 'purple'))
    ## second plot should drop black line not purple
    kmplot_by(s, by = 'sex', col.surv = c(1, 'purple', 2))
  })
  
})


test_that('Visual tests for waffle', {
  quote({
    library('rawr')
    
    ## inversions keep text in correct place
    f <- function(colors, invert) {
      w <- waffle(matrix(colors, 4), invert = invert, reset_par = FALSE)
      text(w$c[, 'x'], w$c[, 'y'], labels = colors)
    }
    
    cc <- sample(colors(), 20L)
    f(cc, '')
    f(cc, 'x')
    f(cc, 'y')
    f(cc, 'xy')
    f(cc, 'yx')
    
  })
  
})
