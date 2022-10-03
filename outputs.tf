output "go_site" {
  value = module.go_site
}

output "mark_site" {
  value = module.mark_site
}

output "site" {
  value = module.site
}

output "site_group" {
  sensitive = true
  value     = module.site_group
}
