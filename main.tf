
/*resource "ibm_container_cluster" "cluster" {
  name              = "${var.cluster_name}${random_id.name.hex}"
  datacenter        = "${var.datacenter}"
  no_subnet         = true
  default_pool_size = 2
  machine_type      = "${var.machine_type}"
  hardware         = "shared"
  public_vlan_id    = "${var.public_vlan_id}"
  private_vlan_id   = "${var.private_vlan_id}"
}*/


/*data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = "bs79g2k20piq1r143ps0"
}

resource "random_id" "name" {
  byte_length = 4
}*/
  
data "ibm_container_cluster_config" "testacc_ds_cluster" {
  cluster_name_id = var.cluster_id
  resource_group_id = var.resource_group_id
}

variable "cluster_id" {
  default = "ci4qhqbf0oglvsnk7qa0"
}
variable "resource_group_id" {
  default = "ae605e4e90494f52bdfdcbb5de8af338"
}

variable "api_key" {
  type = string
}

provider "ibm" {
  ibmcloud_api_key = var.api_key
}
/*variable "kube_config_path" {
  default = "/tmp"
}

resource null_resource calico {
  provisioner local-exec {
    environment = {
      KUBECONFIG   = data.ibm_container_cluster_config.testacc_ds_cluster.config_file_path
    }
    command = <<BASH
export KUBECONFIG=$KUBECONFIG
echo "Run Kubectl commands"
 kubectl get pods
        BASH
  }
}*/
terraform {
  required_providers {
    ibm = {
      version = "1.54.0"
      source = "IBM-Cloud/ibm"
    }
  }
}


