locals {
  # Determine the source of the plist content
  defender_onboarding_plist_raw = var.defender_onboarding_plist != "" ? base64decode(var.defender_onboarding_plist) : (var.defender_onboarding_plist_path != "" ? file(var.defender_onboarding_plist_path) : "")
  
  # Extract OrgId from the onboarding plist
  defender_org_id = local.defender_onboarding_plist_raw != "" ? regex("<key>OrgId</key>\\s*<string>([^<]+)</string>", local.defender_onboarding_plist_raw)[0] : ""
  
  # Extract OnboardingInfo (the JSON blob) from the onboarding plist
  defender_onboarding_info = local.defender_onboarding_plist_raw != "" ? regex("<key>OnboardingInfo</key>\\s*<string>([^<]+)</string>", local.defender_onboarding_plist_raw)[0] : ""
  
  # Generate UUIDs for the profile
  profile_uuid = "D71143E9-8F41-47EE-8CD2-69495E82C6AC"
  payload_uuid = "A27F524F-7A54-4E9A-B459-B50A321C4295"
  
  # Build the complete configuration profile by injecting values into template
  defender_onboarding_profile = local.defender_onboarding_plist_raw != "" ? templatefile(
    "${path.module}/support_files/onboarding.tpl",
    {
      org_id          = local.defender_org_id
      onboarding_info = local.defender_onboarding_info
      profile_uuid    = local.profile_uuid
      payload_uuid    = local.payload_uuid
    }
  ) : ""
}