data "aws_cloudfront_cache_policy" "cache_disabled" {
  name = var.cache_disabled_policy_name
}

data "aws_cloudfront_cache_policy" "cache_optimized" {
  name = var.cache_optimized_policy_name
}

data "aws_cloudfront_origin_request_policy" "all_viewer" {
  name = var.origin_request_policy_name
}

resource "aws_cloudfront_origin_access_control" "s3" {
  count = var.enable_s3_static_assets ? 1 : 0

  name                              = "${var.name}-s3-oac"
  description                       = "OAC for ${var.name} S3 static assets origin"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  aliases             = var.aliases
  price_class         = var.price_class
  http_version        = var.http_version
  retain_on_delete    = var.retain_on_delete
  wait_for_deployment = var.wait_for_deployment

  origin {
    origin_id   = "alb"
    domain_name = var.alb_domain_name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  dynamic "origin" {
    for_each = var.enable_s3_static_assets ? [1] : []

    content {
      origin_id                = "s3-assets"
      domain_name              = var.s3_bucket_regional_domain_name
      origin_access_control_id = aws_cloudfront_origin_access_control.s3[0].id
    }
  }

  default_cache_behavior {
    target_origin_id       = "alb"
    viewer_protocol_policy = "redirect-to-https"

    cache_policy_id          = data.aws_cloudfront_cache_policy.cache_disabled.id
    origin_request_policy_id = data.aws_cloudfront_origin_request_policy.all_viewer.id

    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
      "DELETE",
      "PATCH",
      "POST",
      "PUT"
    ]

    cached_methods = [
      "GET",
      "HEAD",
      "OPTIONS"
    ]

    compress = true
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.enable_s3_static_assets ? var.static_asset_path_patterns : []

    content {
      path_pattern           = ordered_cache_behavior.value
      target_origin_id       = "s3-assets"
      viewer_protocol_policy = "redirect-to-https"

      cache_policy_id = data.aws_cloudfront_cache_policy.cache_optimized.id

      allowed_methods = [
        "GET",
        "HEAD",
        "OPTIONS"
      ]

      cached_methods = [
        "GET",
        "HEAD",
        "OPTIONS"
      ]

      compress = true
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = var.minimum_protocol_version
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = var.tags
}

resource "aws_s3_bucket_policy" "allow_cloudfront" {
  count = var.enable_s3_static_assets ? 1 : 0

  bucket = var.s3_bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly"
        Effect = "Allow"

        Principal = {
          Service = "cloudfront.amazonaws.com"
        }

        Action = [
          "s3:GetObject"
        ]

        Resource = "${var.s3_bucket_arn}/*"

        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.this.arn
          }
        }
      }
    ]
  })
}