resource "null_resource" "example2" {}

module "server" {
    source        = "../../modules/server"
}