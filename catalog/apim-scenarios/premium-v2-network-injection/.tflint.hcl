plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# disable rules
rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}