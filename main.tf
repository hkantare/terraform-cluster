provider "ibm" {}
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
  cluster_name_id = "c2mftm7d02sqmqa0nf10"
  config_dir      = "."
}
variable "kube_config_path" {
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
}
terraform {
  required_providers {
    ibm = {
      version = "1.36.0"
      source = "IBM-Cloud/ibm"
    }
  }
}


