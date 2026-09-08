#!/bin/bash
# ============================================================
# DEPLOY SCRIPT — Mbayu's Hometheater Website
#
# Uploads index.html to S3 and invalidates CloudFront cache (if configured).
# Run this from the kwmbayu-site directory after making changes.
#
# Usage:
#   chmod +x deploy.sh   (first time only)
#   ./deploy.sh
# ============================================================

BUCKET="kwmbayu.com"
REGION="us-east-1"

echo "🚀 Deploying to s3://$BUCKET ..."

aws s3 cp index.html s3://$BUCKET/index.html \
  --content-type "text/html" \
  --region $REGION

echo "✅ Done! Site is live at:"
echo "   http://kwmbayu.com"
echo "   http://kwmbayu.com.s3-website-$REGION.amazonaws.com (S3 direct)"
echo ""
echo "⏳ DNS propagation takes 1–5 minutes if you just updated Route 53."
