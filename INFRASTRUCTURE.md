# kwmbayu.com Infrastructure

## Architecture
```
Browser → Route 53 → CloudFront → S3 (private)
```

## Resources

| Resource | ID / Name | Notes |
|----------|-----------|-------|
| S3 Bucket | `kwmbayu.com` | Private — only CloudFront can read it |
| CloudFront Distribution | `E1PMHG26BCDN7` | d3fbz4wf52znes.cloudfront.net |
| CloudFront OAC | `E1I7MLAD0XX6MB` | kwmbayu-com-oac |
| ACM Certificate | `5d892f49-ca02-4bbc-91d7-369eb9ba96c3` | kwmbayu.com + www.kwmbayu.com |
| Route 53 Hosted Zone | `Z01342433HV3BZ4DNL5IX` | kwmbayu.com |
| Security Headers Policy | `4ac78da0-c433-476f-b500-17a24c927057` | kwmbayu-com-security-headers |

## Security Headers Applied
- `Strict-Transport-Security` — forces HTTPS, 1 year, includes subdomains
- `X-Frame-Options: DENY` — prevents clickjacking
- `X-Content-Type-Options: nosniff` — stops MIME type sniffing
- `Content-Security-Policy` — restricts scripts/styles/images to trusted sources
- `Referrer-Policy: strict-origin-when-cross-origin`

## CloudWatch Alarms
- `kwmbayu-com-high-error-rate` — alerts if 5xx errors exceed 5%
- `kwmbayu-com-no-traffic` — alerts if zero requests for 30 minutes

## Deploying Updates
```bash
./deploy.sh
```
This uploads index.html to S3 and clears the CloudFront cache automatically.
