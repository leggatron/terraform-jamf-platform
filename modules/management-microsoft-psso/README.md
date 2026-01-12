## This module creates the necessary pieces in Jamf Pro to enable PSSO in your environment. 

# Required Variables:

## Jamf Pro Account Details

```
jamfpro_auth_method   = "" ## oauth2 or basic
jamfpro_instance_url  = ""
jamfpro_client_id     = ""
jamfpro_client_secret = ""
jamfpro_username      = ""
jamfpro_password      = ""
```

You will only need the client authentication items for ```oauth2``` or the username / password for ```basic``` 


## Implementation Notes

To prevent deployment of these settings before everything is completed, the Smart Group that we create as part of this module includes a placeholder serial number. If you remove the placeholder serial number from the ```Microsoft Entra PSSO Target Group``` Smart Group, the configuration profiles will automatically scope.