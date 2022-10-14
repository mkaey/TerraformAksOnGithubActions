variable "postfix" {
  type = string
}

variable "aksAdminGroupObjectIds" {
  type = list(string)
}

variable "apiServerAuthorizedIpRanges" {
  type = list(string)
}

variable "logAnalyticsWorkspaceId" {
  type = string
}

variable "nodeSubnetId" {
  type = string
}

variable "podSubnetId" {
  type = string
}
