#!/bin/bash

# Script to validate all Terraform folders that use centralized modules

echo "🔍 Searching for folders using centralized modules..."

# Find all folders containing references to modules
DIRS=$(find /workspaces/blue-octopus/catalog -name "*.tf" -exec grep -l "../../modules/" {} \; | xargs dirname | sort -u)

echo "📁 Folders found:"
echo "$DIRS"
echo ""

# Counters for final report
TOTAL=0
SUCCESS=0
FAILED=0

# Validate each folder
for dir in $DIRS; do
    TOTAL=$((TOTAL + 1))
    echo "=== 🚀 Validating $dir ==="
    terraform fmt
    # Go to the folder
    cd "$dir"
    
    # Check if there are .tf files
    if ls *.tf >/dev/null 2>&1; then
        # Run terraform init
        echo "   🔧 Initializing Terraform..."
        if terraform init -upgrade >/dev/null 2>&1; then
            echo "   ✅ Init successful"
            
            # Run terraform validate
            echo "   🔍 Validation in progress..."
            if terraform validate >/dev/null 2>&1; then
                echo "✅ Validation successful for $dir"
                SUCCESS=$((SUCCESS + 1))
            else
                echo "❌ Validation failed for $dir"
                echo "   Error details:"
                terraform validate 2>&1 | sed 's/^/   /'
                FAILED=$((FAILED + 1))
            fi
        else
            echo "❌ Init failed for $dir"
            echo "   Error details:"
            terraform init 2>&1 | sed 's/^/   /'
            FAILED=$((FAILED + 1))
        fi
    else
        echo "⚠️  No Terraform files found in $dir"
    fi
    echo ""
done

# Final report
echo "📊 === FINAL REPORT ==="
echo "Total folders validated: $TOTAL"
echo "✅ Successes: $SUCCESS"
echo "❌ Failures: $FAILED"

if [ $FAILED -eq 0 ]; then
    echo "🎉 All validations succeeded!"
    exit 0
else
    echo "⚠️  Some validations failed. Please check the errors above."
    exit 1
fi
