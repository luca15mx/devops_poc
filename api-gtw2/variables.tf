# #################################################################################
#
#  VARIABLES FOR API-GATEWAY MODULE
#
# #################################################################################

variable "mapi-gtw-common_tags" {
  type = map
}

variable "mapi-gtw-lambda_ws_default_uri" {
  type = string
}

variable "mapi-gtw-lambda_ws_connect_uri" {
  type = string
}

variable "mapi-gtw-lambda_ws_disconnect_uri" {
  type = string
}

variable "mapi-gtw-stage_name" {
  type = string
}
