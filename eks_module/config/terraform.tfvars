
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids           = ["subnet-0cc65b82a4bbd36bd","subnet-0889a158d76d9dd12","subnet-0cd7da977f4060dca"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }

}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-0cc65b82a4bbd36bd","subnet-0889a158d76d9dd12","subnet-0cd7da977f4060dca"]

        tags = {
             "Name" =  "node1"
         } 
  }

}