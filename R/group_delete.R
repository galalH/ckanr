#' Delete a group
#'
#' @export
#' @param id (character) The id of the group. Required.
#' @param url Base url to use. Default: http://data.techno-science.ca
#' See also [ckanr_setup()] and [get_default_url()]
#' @param ... Curl args passed on to [crul::verb-POST] (optional)
#' @template key
#'
#' @examples \dontrun{
#' # Setup
#' ckanr_setup(url = "https://demo.ckan.org", key = getOption("ckan_demo_key"))
#'
#' # create a group
#' (res <- group_create("lions", description="A group about lions"))
#'
#' # show the group
#' group_show(res$id)
#'
#' # delete the group
#' group_delete(res)
#' ## or with it's id
#' # group_delete(res$id)
#' }
group_delete <- function(id, url = get_default_url(), key = get_default_key(),
  ...) {

  id <- as.ckan_group(id, url = url)
  tmp <- ckan_POST(url, 'group_delete', body = list(id = id$id), key = key,
    opts = list(...))
  jsonlite::fromJSON(tmp)$success
}
