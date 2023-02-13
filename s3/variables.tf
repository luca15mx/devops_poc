################################################################################
#
#  Variables for module S3
#
################################################################################

variable "ms3_common_tags" {
    type = map
}

variable "ms3_enable_versioning" {
    type = bool
}

variable "ms3_force_destroy" {
    type = bool
}
