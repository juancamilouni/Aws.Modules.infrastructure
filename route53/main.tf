module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "5.0.0"

  zone_name    = var.zone_name
  private_zone = var.private_zone

  records_jsonencoded = jsonencode([
    for record in var.records : {
      name = record.name
      type = record.type

      alias = {
        name                   = record.alias_name
        zone_id                = record.alias_zone_id
        evaluate_target_health = record.evaluate_target_health
      }
    }
  ])
}