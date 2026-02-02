.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:03:43 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/b1760fb6-8453-47de-ae25-9d865cc70359","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160343Z:44fa1d11-32c9-4bd3-93c8-08ddc3f12b09","X-Msedge-Ref":"Ref A: 60689E57D4C646129847012884C8A937 Ref B: PAR611100608062 Ref C: 2025-09-02T16:03:42Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:03:43.178+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:03:43.178040 Retry: response 500
2025-09-02T18:03:43.178+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:03:43.178049 Retry: End Try #22, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [17m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [17m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [17m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [17m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [17m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [17m51s elapsed]
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:04:43.174389 Retry: =====> Try=23 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:04:43.174577 Request: ==> OUTGOING REQUEST (Try=23)
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:04:43.174+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:04:43.384+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:04:43.384841 Response: ==> REQUEST/RESPONSE (Try=23/210.225188ms, OpTime=17m56.437990081s) -- RESPONSE RECEIVED
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:04:43 GMT
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T160443Z:4f1ae30c-7c7f-48ae-8385-08351b870819
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:04:43 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/7248ece1-0a1b-47e4-8291-8eb98944ee42","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160443Z:4f1ae30c-7c7f-48ae-8385-08351b870819","X-Msedge-Ref":"Ref A: C10A3AB70ACF4724BF099907E02612D5 Ref B: PAR611100608062 Ref C: 2025-09-02T16:04:43Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:04:43.384907 Retry: response 500
2025-09-02T18:04:43.385+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:04:43.384915 Retry: End Try #23, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [18m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [18m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [18m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [18m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [18m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [18m51s elapsed]
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:05:43.380473 Retry: =====> Try=24 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:05:43.380591 Request: ==> OUTGOING REQUEST (Try=24)
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:05:43.380+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:05:43.625557 Response: ==> REQUEST/RESPONSE (Try=24/244.865519ms, OpTime=18m56.687522941s) -- RESPONSE RECEIVED
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:05:43 GMT
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T160543Z:c0c804e1-ee4d-47f2-a5a7-42f25bf48497
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:05:43 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/d2c3b30d-2408-4a70-9132-0e517fc5c8ad","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160543Z:c0c804e1-ee4d-47f2-a5a7-42f25bf48497","X-Msedge-Ref":"Ref A: DFFB1DE4DF5A40CB99C86848C7C5AEBB Ref B: PAR611100608062 Ref C: 2025-09-02T16:05:43Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:05:43.625672 Retry: response 500
2025-09-02T18:05:43.625+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:05:43.625698 Retry: End Try #24, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [19m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [19m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [19m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [19m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [19m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [19m51s elapsed]
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:06:43.619387 Retry: =====> Try=25 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:06:43.619463 Request: ==> OUTGOING REQUEST (Try=25)
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:06:43.619+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:06:44.063408 Response: ==> REQUEST/RESPONSE (Try=25/443.868538ms, OpTime=19m57.136036348s) -- RESPONSE RECEIVED
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:06:43 GMT
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T160644Z:535ebe16-e7c5-42f7-ba58-cddbce19b29f
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:06:43 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/daba28c5-39e4-4146-a0e8-47c62f29f12e","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160644Z:535ebe16-e7c5-42f7-ba58-cddbce19b29f","X-Msedge-Ref":"Ref A: 710095CC4F934E88943434EF5D335425 Ref B: PAR611100608062 Ref C: 2025-09-02T16:06:43Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:06:44.063515 Retry: response 500
2025-09-02T18:06:44.063+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:06:44.063526 Retry: End Try #25, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [20m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [20m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [20m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [20m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [20m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [20m51s elapsed]
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:07:44.064817 Retry: =====> Try=26 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:07:44.064926 Request: ==> OUTGOING REQUEST (Try=26)
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:07:44.065+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:07:44.275056 Response: ==> REQUEST/RESPONSE (Try=26/210.065936ms, OpTime=20m57.354422244s) -- RESPONSE RECEIVED
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:07:44 GMT
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T160744Z:664daace-826d-4f4b-868b-f1b7acababd6
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:07:44 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/f6ae1f6b-af28-4320-936a-57ee5f4b31e6","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160744Z:664daace-826d-4f4b-868b-f1b7acababd6","X-Msedge-Ref":"Ref A: 3F179F986E8943A88090CAAD6191FFB8 Ref B: PAR611100608062 Ref C: 2025-09-02T16:07:44Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:07:44.275172 Retry: response 500
2025-09-02T18:07:44.275+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:07:44.275187 Retry: End Try #26, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [21m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [21m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [21m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [21m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [21m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [21m51s elapsed]
2025-09-02T18:08:44.261+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:08:44.261798 Retry: =====> Try=27 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:08:44.261904 Request: ==> OUTGOING REQUEST (Try=27)
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:08:44.262+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:08:44.546146 Response: ==> REQUEST/RESPONSE (Try=27/284.174112ms, OpTime=21m57.643654275s) -- RESPONSE RECEIVED
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:08:44 GMT
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T160844Z:89f5c2e7-9983-4390-a710-28c3288fb58d
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:08:44 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/6123050e-b723-4ef3-888b-68c4ae0983c6","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160844Z:89f5c2e7-9983-4390-a710-28c3288fb58d","X-Msedge-Ref":"Ref A: 8162269628384E31BAE730B41D812793 Ref B: PAR611100608062 Ref C: 2025-09-02T16:08:44Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:08:44.546262 Retry: response 500
2025-09-02T18:08:44.546+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:08:44.546276 Retry: End Try #27, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [22m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [22m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [22m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [22m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [22m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [22m51s elapsed]
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:09:44.540051 Retry: =====> Try=28 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:09:44.540193 Request: ==> OUTGOING REQUEST (Try=28)
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:09:44.540+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:09:44.833138 Response: ==> REQUEST/RESPONSE (Try=28/292.883919ms, OpTime=22m57.942134219s) -- RESPONSE RECEIVED
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:09:44 GMT
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T160944Z:8fe80bbf-a343-4a6d-8c6f-6044467ce83d
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:09:44 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/c22fb293-33a6-4c69-885b-0603dbc8adce","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T160944Z:8fe80bbf-a343-4a6d-8c6f-6044467ce83d","X-Msedge-Ref":"Ref A: 92903DFA8FBF41C8B555527B894AC9C4 Ref B: PAR611100608062 Ref C: 2025-09-02T16:09:44Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:09:44.833218 Retry: response 500
2025-09-02T18:09:44.833+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:09:44.833229 Retry: End Try #28, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [23m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [23m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [23m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [23m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [23m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [23m51s elapsed]
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:10:44.822923 Retry: =====> Try=29 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:10:44.823008 Request: ==> OUTGOING REQUEST (Try=29)
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:10:44.823+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:10:45.193283 Response: ==> REQUEST/RESPONSE (Try=29/370.173731ms, OpTime=23m58.316495885s) -- RESPONSE RECEIVED
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:10:44 GMT
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T161045Z:15e882a1-9d6c-4767-8d02-72f4d8f0a8b5
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:10:45.193+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:10:45.194+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:10:45.194+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:10:44 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/26c38acc-e0c5-4830-b6f7-d852bff3b124","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T161045Z:15e882a1-9d6c-4767-8d02-72f4d8f0a8b5","X-Msedge-Ref":"Ref A: BEBDEA7B1B9246CA8C531EC69585AB6E Ref B: PAR611100608062 Ref C: 2025-09-02T16:10:44Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:10:45.194+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:10:45.193426 Retry: response 500
2025-09-02T18:10:45.194+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:10:45.193446 Retry: End Try #29, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [24m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [24m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [24m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [24m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [24m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [24m51s elapsed]
2025-09-02T18:11:45.183+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:11:45.183803 Retry: =====> Try=30 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:11:45.183+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:11:45.183898 Request: ==> OUTGOING REQUEST (Try=30)
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:11:45.184+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:11:45.423234 Response: ==> REQUEST/RESPONSE (Try=30/239.213679ms, OpTime=24m58.561225474s) -- RESPONSE RECEIVED
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:11:45 GMT
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T161145Z:7ec4d346-464f-44ed-9615-bc4e35317429
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:11:45 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/92da163c-7b68-406d-8788-91cdfa6f0126","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T161145Z:7ec4d346-464f-44ed-9615-bc4e35317429","X-Msedge-Ref":"Ref A: D20F94C815DA4B8B97FD4B8006CB3F6F Ref B: PAR611100608062 Ref C: 2025-09-02T16:11:45Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:11:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:11:45.423417 Retry: response 500
2025-09-02T18:11:45.424+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:11:45.423442 Retry: End Try #30, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [25m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [25m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [25m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [25m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [25m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [25m51s elapsed]
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:12:45.423405 Retry: =====> Try=31 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:12:45.423515 Request: ==> OUTGOING REQUEST (Try=31)
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:12:45.423+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:12:45.695637 Response: ==> REQUEST/RESPONSE (Try=31/272.086165ms, OpTime=25m58.843720869s) -- RESPONSE RECEIVED
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:12:45 GMT
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T161245Z:184f63e7-cefe-46cd-afe3-51390b8980fd
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:12:45.695+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:12:45 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/4ef47b86-681a-4f0c-a45f-ce014821d16e","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T161245Z:184f63e7-cefe-46cd-afe3-51390b8980fd","X-Msedge-Ref":"Ref A: D38C666C68194CD689C852FD5A6B9E02 Ref B: PAR611100608062 Ref C: 2025-09-02T16:12:45Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:12:45.696+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:12:45.695689 Retry: response 500
2025-09-02T18:12:45.696+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:12:45.695695 Retry: End Try #31, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [26m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [26m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [26m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [26m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [26m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [26m51s elapsed]
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:13:45.689993 Retry: =====> Try=32 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:13:45.690064 Request: ==> OUTGOING REQUEST (Try=32)
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:13:45.690+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:13:45.889204 Response: ==> REQUEST/RESPONSE (Try=32/198.943444ms, OpTime=26m59.047152467s) -- RESPONSE RECEIVED
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:13:45 GMT
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T161345Z:776c7e04-ef03-407c-bef8-6b381281b42e
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:13:45.889+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:13:45.890+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:13:45.890+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:13:45 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/18f91556-1a88-4713-9fef-945d423ce679","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T161345Z:776c7e04-ef03-407c-bef8-6b381281b42e","X-Msedge-Ref":"Ref A: 90F83D3AD2434363AC90D75B0B142414 Ref B: PAR611100608062 Ref C: 2025-09-02T16:13:45Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:13:45.890+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:13:45.889394 Retry: response 500
2025-09-02T18:13:45.890+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:13:45.889415 Retry: End Try #32, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [27m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [27m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [27m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [27m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [27m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [27m51s elapsed]
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:14:45.888223 Retry: =====> Try=33 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:14:45.888580 Request: ==> OUTGOING REQUEST (Try=33)
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:14:45.888+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:14:46.102973 Response: ==> REQUEST/RESPONSE (Try=33/214.334564ms, OpTime=27m59.266890759s) -- RESPONSE RECEIVED
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:14:45 GMT
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T161446Z:01042dff-cc39-428a-b324-f192d13f04e8
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:14:45 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/ae12fa3e-c450-4e07-bf78-5387bb3beccb","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T161446Z:01042dff-cc39-428a-b324-f192d13f04e8","X-Msedge-Ref":"Ref A: CC1558B898C140219ED27F2832A6CE87 Ref B: PAR611100608062 Ref C: 2025-09-02T16:14:45Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:14:46.103051 Retry: response 500
2025-09-02T18:14:46.103+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:14:46.103059 Retry: End Try #33, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [28m01s elapsed]
azapi_resource.github_api_mcp: Still creating... [28m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [28m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [28m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [28m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [28m51s elapsed]
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:15:46.099784 Retry: =====> Try=34 for GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:15:46.099863 Request: ==> OUTGOING REQUEST (Try=34)
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Request contained no body
2025-09-02T18:15:46.100+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
azapi_resource.github_api_mcp: Still creating... [29m01s elapsed]
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:15:46.589134 Response: ==> REQUEST/RESPONSE (Try=34/489.229101ms, OpTime=28m59.760731253s) -- RESPONSE RECEIVED
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    GET https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Accept: application/json
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Authorization: REDACTED
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    User-Agent: HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    RESPONSE Status: 500 Internal Server Error
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Cache-Control: private
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Length: 75
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Content-Type: text/html
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Date: Tue, 02 Sep 2025 16:15:46 GMT
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    Strict-Transport-Security: max-age=31536000; includeSubDomains
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Cache: REDACTED
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Content-Type-Options: nosniff
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Correlation-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Failure-Cause: service
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Operation-Identifier: REDACTED
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Global-Reads: REDACTED
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Ratelimit-Remaining-Subscription-Reads: 249
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Request-Id: 553a8324-a272-c0d5-a6ca-996315e794e1
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Ms-Routing-Request-Id: EASTUS2:20250902T161546Z:4b7ca3d9-00a7-424d-ad39-988167b60a1a
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    X-Msedge-Ref: REDACTED
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: The page cannot be displayed because an internal server error has occurred.
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1:    --------------------------------------------------------------------------------
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Live traffic: {"request":{"headers":{"Accept":"application/json","Authorization":"REDACTED","User-Agent":"HashiCorp Terraform/1.12.2 (+https://www.terraform.io) terraform-provider-azapi/v2.6.1 pid-222c6c49-1b0a-5959-a213-6608f9eb8820","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1"},"method":"GET","url":"https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api?api-version=2024-06-01-preview","body":""},"response":{"statusCode":500,"headers":{"Cache-Control":"private","Content-Length":"75","Content-Type":"text/html","Date":"Tue, 02 Sep 2025 16:15:46 GMT","Strict-Transport-Security":"max-age=31536000; includeSubDomains","X-Cache":"CONFIG_NOCACHE","X-Content-Type-Options":"nosniff","X-Ms-Correlation-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Failure-Cause":"service","X-Ms-Operation-Identifier":"tenantId=313fe192-d8de-4b0a-a1f9-6317847c41fd,objectId=f6b4d113-35ab-4dd6-b5b2-4140ae804489/eastus2/a3480b3b-6c20-4b07-b79a-4b04f0acf824","X-Ms-Ratelimit-Remaining-Subscription-Global-Reads":"3749","X-Ms-Ratelimit-Remaining-Subscription-Reads":"249","X-Ms-Request-Id":"553a8324-a272-c0d5-a6ca-996315e794e1","X-Ms-Routing-Request-Id":"EASTUS2:20250902T161546Z:4b7ca3d9-00a7-424d-ad39-988167b60a1a","X-Msedge-Ref":"Ref A: 41B803A217E9484C93103BC79B9D4C7A Ref B: PAR611100608062 Ref C: 2025-09-02T16:15:46Z"},"body":"The page cannot be displayed because an internal server error has occurred."}}
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:15:46.589195 Retry: response 500
2025-09-02T18:15:46.589+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:15:46.589202 Retry: End Try #34, Delay=1m0s
azapi_resource.github_api_mcp: Still creating... [29m11s elapsed]
azapi_resource.github_api_mcp: Still creating... [29m21s elapsed]
azapi_resource.github_api_mcp: Still creating... [29m31s elapsed]
azapi_resource.github_api_mcp: Still creating... [29m41s elapsed]
azapi_resource.github_api_mcp: Still creating... [29m51s elapsed]
2025-09-02T18:16:46.230+0200 [DEBUG] provider.terraform-provider-azapi_v2.6.1: [DEBUG] Sep  2 18:16:46.230015 Retry: abort due to context deadline exceeded
2025-09-02T18:16:46.231+0200 [ERROR] provider.terraform-provider-azapi_v2.6.1: Response contains error diagnostic: tf_provider_addr=registry.terraform.io/Azure/azapi tf_resource_type=azapi_resource @module=sdk.proto diagnostic_detail="checking for presence of existing Resource: (ResourceId \"/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api\" / Api Version \"2024-06-01-preview\"): context deadline exceeded" diagnostic_severity=ERROR diagnostic_summary="Failed to retrieve resource" tf_req_id=79233043-2ab0-c8fd-afb5-28a34bb2a178 tf_rpc=ApplyResourceChange @caller=github.com/hashicorp/terraform-plugin-go@v0.26.0/tfprotov6/internal/diag/diagnostics.go:58 tf_proto_version=6.8 timestamp="2025-09-02T18:16:46.231+0200"
2025-09-02T18:16:46.239+0200 [ERROR] vertex "azapi_resource.github_api_mcp" error: Failed to retrieve resource
╷
│ Error: Failed to retrieve resource
│ 
│   with azapi_resource.github_api_mcp,
│   on api_mcp.tf line 45, in resource "azapi_resource" "github_api_mcp":
│   45: resource "azapi_resource" "github_api_mcp" {
│ 
│ checking for presence of existing Resource: (ResourceId
│ "/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/apis/apim-dev-eus2-ai-mcp-ab5a/github-mcp-api"
│ / Api Version "2024-06-01-preview"): context deadline exceeded
╵
╷
│ Error: Failed to create/update resource
│ 
│   with azapi_resource.github_mcp_backend,
│   on backends.tf line 1, in resource "azapi_resource" "github_mcp_backend":
│    1: resource "azapi_resource" "github_mcp_backend" {
│ 
│ creating/updating Resource: (ResourceId
│ "/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/backends/github-mcp-backend"
│ / Api Version "2024-06-01-preview"): PUT
│ https://management.azure.com/subscriptions/e152b9cd-f5ac-4ed2-8b3c-8a451ba73bb3/resourceGroups/rg-dev-eus2-ai-mcp-ab5a/providers/Microsoft.ApiManagement/service/apim-dev-eus2-ai-mcp-ab5a/backends/github-mcp-backend
│ --------------------------------------------------------------------------------
│ RESPONSE 400: 400 Bad Request
│ ERROR CODE: ValidationError
│ --------------------------------------------------------------------------------
│ {
│   "error": {
│     "code": "ValidationError",
│     "message": "One or more fields contain incorrect values:",
│     "details": [
│       {
│         "code": "ValidationError",
│         "target": "protocol",
│         "message": "Protocol is not supported"
│       }
│     ]
│   }
│ }
│ --------------------------------------------------------------------------------
│ 
╵
2025-09-02T18:16:46.248+0200 [DEBUG] provider.stdio: received EOF, stopping recv loop: err="rpc error: code = Unavailable desc = error reading from server: EOF"
2025-09-02T18:16:46.251+0200 [INFO]  provider: plugin process exited: plugin=.terraform/providers/registry.terraform.io/azure/azapi/2.6.1/linux_amd64/terraform-provider-azapi_v2.6.1 id=247392
2025-09-02T18:16:46.251+0200 [DEBUG] provider: plugin exited