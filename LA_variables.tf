variable "name" {
  type        = string
  default     = "joshdevopsthehardway"
  description = "Name for resources"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure Location of resources"
}

variable "tags" {
  type = map(string)
}