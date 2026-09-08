#!/bin/bash
# ============================================================
# DEPLOY SCRIPT — Mbayu's Hometheater Website
#
# Uploads index.html to S3 and clears the CloudFront cache
# so visitors see your changes immediately (not the cached old version).
#
# Usage:
#   chmod +x deploy.sh   (first time only)
#   ./deploy.sh
# ============================================================

BUCKET="kwmbayu.com"
CF_DISTRIBUTION="E1PMHG26BCDN7"
REGION="us-east-1"

echo "🚀 Uploading to S3..."
aws s3 cp index.html s3://$BUCKET/index.html \
  --content-type "text/html" \
  --region $REGION

echo "🔄 Clearing CloudFront cache (so changes appear instantly)..."
aws cloudfront create-invalidation \
  --distribution-id $CF_DISTRIBUTION \
  --paths "/*" \
  --region us-east-1

echo ""
echo "✅ Done! Your site will be live at:"
echo "   https://kwmbayu.com        ← main address (HTTPS)"
echo "   https://www.kwmbayu.com    ← redirects to above"
echo ""
echo "⏳ CloudFront takes 5–10 min to fully deploy worldwide."
echo "   You can check progress at:"
echo "   https://console.aws.amazon.com/cloudfront/home#/distributions/E1PMHG26BCDN7"
