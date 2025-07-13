#!/bin/bash

# CTFNote Coolify Setup Script

echo "🚀 CTFNote Coolify Setup"
echo "========================"

# Check if running in Coolify environment
if [ -z "$COOLIFY_FQDN" ]; then
    echo "⚠️  Warning: COOLIFY_FQDN not set. Make sure to set this in Coolify."
fi

# Generate session secret if not provided
if [ -z "$SESSION_SECRET" ]; then
    echo "🔐 Generating session secret..."
    SESSION_SECRET=$(openssl rand -hex 32)
    echo "SESSION_SECRET=$SESSION_SECRET" >> .env
    echo "✅ Session secret generated and added to .env"
else
    echo "✅ Session secret already configured"
fi

# Copy Coolify environment template
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file from Coolify template..."
    cp .env.coolify .env
    echo "✅ Environment file created"
fi

# Set domain if FQDN is available
if [ ! -z "$COOLIFY_FQDN" ]; then
    echo "🌐 Setting domain to $COOLIFY_FQDN"
    sed -i "s/\${FQDN}/$COOLIFY_FQDN/g" .env
    echo "✅ Domain configured"
fi

echo ""
echo "🎯 Setup Summary:"
echo "- Docker Compose: docker-compose.coolify.yml"
echo "- Environment: .env (based on .env.coolify)"
echo "- Documentation: COOLIFY_DEPLOYMENT.md"
echo ""
echo "📋 Next Steps:"
echo "1. Verify environment variables in Coolify"
echo "2. Set SESSION_SECRET (64+ characters)"
echo "3. Configure CMD_DOMAIN to your domain"
echo "4. Deploy via Coolify interface"
echo ""
echo "✅ Setup complete!"
