% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/area_value_graphs.R
\name{area_value_graphs}
\alias{area_value_graphs}
\title{Area Value Graphs}
\usage{
area_value_graphs(area = NULL, API_key = NULL)
}
\arguments{
\item{area}{A string representing a valid UK outcode, e.g. "W12".}

\item{API_key}{An API key from Zoopla.}
}
\value{
A list.
}
\description{
Generate a graph of values for an outcode over the previous 3 months and return the URL to the generated image.
Please note that the output type must always be "outcode" for this method and therefore
an area sufficient to produce an outcode is required.
}
\examples{
\dontrun{

area_value_graphs("W12", "YOUR_API_KEY")
}
}
\references{
\url{http://developer.zoopla.com/docs/read/Area_Value_Graphs}
}
