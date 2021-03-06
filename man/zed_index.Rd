% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zed_index.R
\name{zed_index}
\alias{zed_index}
\title{Zed-Index}
\usage{
zed_index(area = NULL, output = NULL, API_key = NULL)
}
\arguments{
\item{area}{A string representing a valid UK outcode or postcode, e.g. "NW10" or "EH1 2NG".}

\item{output}{A string representing desired output: "town", "outcode", "county", "country".}

\item{API_key}{An API key from Zoopla.}
}
\value{
A list
}
\description{
Retrieve the Zoopla.co.uk Zed-Index! for a requested area.
}
\examples{
\dontrun{

zed_index("NW10", "outcode", "YOUR_API_KEY")
zed_index("E151AZ", "town", "YOUR_API_KEY")
zed_index("EH1 2NG", "county", "YOUR_API_KEY")
zed_index("CF10 3XQ", "country", "YOUR_API_KEY")
}

}
\references{
\url{http://developer.zoopla.com/docs/read/Zed_Index_API}
}
