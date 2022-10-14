variable "postfix" {
  type    = string
  default = "mkaey"
}

variable "apiServerAuthorizedIpRanges" {
  type = list(string)
}

variable "logAnalyticsWorkspaceId" {
  type = string
}
