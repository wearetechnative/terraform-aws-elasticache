variable "cluster_name" {
  description = "Cluster identifier."
  type        = string
}

variable "engine" {
  description = "Choose between redis or memcached engine types"
  type        = string
  validation {
    condition     = contains(["redis", "memcached"], var.engine)
    error_message = "Only redis or memcached are valid options"
  }
}

variable "node_type" {
  description = "The instance class used."
  type        = string
}

variable "num_cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have."
  type        = number
  default     = 1
}

variable "preferred_cache_cluster_azs" {
  description = "Set prefered AZ's for the cache clusters"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Required list of subnets to launch instances in."
  type        = list(string)
}

variable "security_group_ids" {
  description = "Provide at least one security group to be associated with this instance."
  type        = list(string)
}

variable "multi_az_mode" {
  description = "Whether Redis nodes are created in a single AZ or created across multiple AZ."
  type        = bool
}

variable "engine_version" {
  description = "Version number of the cache engine to be used. If not set, defaults to the latest version."
  type        = string
}

variable "parameter_group_family" {
  description = "Provide parameter group family"
  default     = "redis6.x"
}

variable "parameter_group_overrides" {
  description = "Optional map of user defined parameters. The map key is the parameter name."
  type        = map(string)
  default     = {}
}

variable "additional_tags" {
  description = "Additional tags to be added to resources."
  type        = map(string)
  default     = {}
}

variable "transit_encryption" {
  description = "switch in transit encryption on or off"
  type= bool
  default = false
}
