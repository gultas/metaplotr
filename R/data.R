#' Effect sizes and standard errors from Ferguson and Brannick (2012).
#'
#' This data set contains Z scores and standards errors from Ferguson and
#' and Brannick (2012) meta-analysis.
#'
#' @format A data frame with 24 rows and 5 variables:
#' \describe{
#'   \item{pub_z}{Publication effect size in z scores}
#'   \item{dis_z}{Dissertation effect size in z scores}
#'   \item{pub_z_se}{Standard error of the publication effect size z scores}
#'   \item{dis_z_se}{Standard error of the dissertation effect size z scores}
#'   \item{mod}{Moderator variable}
#' }
#' @source \url{http://dx.doi.org/10.1037/a0027128}
"FergusonBrannick2012"


#' Gender Differences Data (1).
#'
#' This is a data set that show gender differences in effect sizes.
#'
#' @format A data frame with 45 rows and 14 variables:
#' \describe{
#'   \item{author}{Author of the publication.}
#'   \item{pub_year}{Year of the publication.}
#'   \item{boys_n}{Sample size of male group.}
#'   \item{boys_r}{Correlation of male group.}
#'   \item{boys_z}{Effect size of male group.}
#'   \item{boys_se}{Standard error of the effect size.}
#'   \item{girls_n}{Sample size of female group.}
#'   \item{girls_r}{Correlation of female group.}
#'   \item{girls_z}{Effect size of female group.}
#'   \item{girls_se}{Standard error of the effect size.}
#' }
#' @source \url{http://dx.doi.org/10.1037/a0027128}
"GenderDiff01"

#' Gender Differences Data (2).
#'
#' This data set contains Z scores and standards errors from Ferguson and
#' and Brannick (2012) meta-analysis.
#'
#' @format A data frame with 27 rows and 13 variables:
#' \describe{
#'   \item{author}{Author(s) of the study.}
#'   \item{year}{Publication year.}
#'   \item{men_n}{Number of male participants.}
#'   \item{men_r}{Correlation.}
#'   \item{men_z}{Z-scores.}
#'   \item{men_se}{Standard error of male participants.}
#'   \item{women_n}{Number of female participants.}
#'   \item{women_r}{Correlation.}
#'   \item{women_z}{Standard effect size.}
#'   \item{women_se}{Standard error of female participants.}
#'   \item{menage_m}{To be written.}
#'   \item{country}{Country from which study was conducted.}
#'   \item{region}{Continent of the study.}
#' }
#' @source \url{http://dx.doi.org/10.1037/a0027128}
"GenderDiff02"

#' Gender Differences Data (3).
#'
#' To be written.
#'
#' @format A data frame with 24 rows and 5 variables:
#' \describe{
#'   \item{author}{Author of the study.}
#'   \item{year}{Publication year.}
#'   \item{men_n}{Number of men.}
#'   \item{men_r}{Correlation among men.}
#'   \item{men_z}{Z-scores of men.}
#'   \item{men_se}{Standard errors of men.}
#'   \item{gender}{Factor indicating gender.}
#' }
#' @source \url{http://dx.doi.org/10.1037/a0027128}
"GenderDiff03"


#' Effect sizes from McLeod, Weisz, and Wood (2007).
#'
#' This data set contains various factors and variables from McLeod, Weisz, and
#' Wood (2007) Examining the association between parenting and childhood depression: A meta-analysis.
#'
#' @format A data frame with 45 rows and 14 variables:
#' \describe{
#'   \item{author}{Author(s) of the publication used in the meta-analysis}
#'   \item{year}{Year of the publication}
#'   \item{n}{Sample size of the primary study used in the meta-analysis}
#'   \item{age}{Mean age of the participants}
#'   \item{parent}{Which parent was used? Mother (M), father (F), both (B)}
#'   \item{techp}{Technology of the parenting measure: questionnaire (Q), interview (I), observation (O)}
#'   \item{informp}{Who is the informant? Child (C), parent (P), observer (O)}
#'   \item{dx}{Diagnostic status: yes (Y), no (N)}
#'   \item{tf}{Timeframe: current symptomatology (C), lifetime symptomatology (L), unspecified (U)}
#'   \item{techd}{To be added}
#'   \item{informd}{Information technology used}
#'   \item{r}{Mean r}
#'   \item{z}{Effect size as Z-score.}
#'   \item{var}{Variance of the Z-score.}
#' }
#' @source \url{http://dx.doi.org/10.1016/j.cpr.2007.03.001}
"McLeod2007"

#' Effect sizes from Sweeney and Moyer (2015).
#'
#' Self-affirmation and responses to health messages: A meta-analysis on
#' intentions and behavior.
#'
#' @format A data frame with 10 rows and 6 variables:
#' \describe{
#'   \item{author}{Author of the primary study}
#'   \item{year}{Publication of the primary study}
#'   \item{inten_d}{Effect size of intentions}
#'   \item{inten_se}{Standard error of intentions effect size}
#'   \item{beh_d}{Effect size of behaviors}
#'   \item{beh_se}{Standard error of behaviors effect size}
#' }
#' @source \url{http://dx.doi.org/10.1037/hea0000110}
"Sweeney2015"
