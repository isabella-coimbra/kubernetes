variable project {
  description = "The name of project."
  type        = string
  default     = "gglobo-storm-prod"
}

variable region {
  description = "The region of provider."
  type        = string
  default     = "us-east1"
}

# variable cluster_name {
#   description = "The name of GKE cluster."
#   type        = string
#   default     = "cluster-dev"
# }

# variable location {
#   description = "The location (region or zone) in which the cluster master will be create."
#   type        = string
#   default     = "us-east1-b"
# }

# variable initial_node_count {
#   description = "The number of nodes to create in this cluster."
#   type        = number
#   default     = 3
# }

# variable pool_name {
#   description = "The name of pool."
#   type        = string
#   default     = "pool-dev"
# }

# variable node_count {
#   description = "The number of nodes."
#   type        = number
#   default     = 1
# }

# variable machine_type {
#   description = "The type fo machine."
#   type        = string
#   default     = "e2-small"
# }