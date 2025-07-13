# CTFNote Coolify Deployment Guide

This version of CTFNote is configured for deployment with Coolify and is realized by **Team M0TH.SH**.

## Quick Start

1. **Import in Coolify:**
   - Go to your Coolify dashboard
   - Click on "New Resource" > "Application"
   - Choose "Docker Compose" as type
   - Enter the repository URL of your fork

2. **Configuration:**
   - Use `docker-compose.coolify.yml` as compose file
   - Copy the content of `.env.coolify` to the environment variables
   - Ensure that `FQDN` is set to your domain

3. **Environment Variables:**
   ```bash
   # Required
   CMD_DOMAIN=your-domain.com
   SESSION_SECRET=generate-a-64-character-string
   
   # Optional
   USE_DISCORD=true
   DISCORD_BOT_TOKEN=your-bot-token
   DISCORD_SERVER_ID=your-server-id
   ```

## Important Changes for Coolify

### Docker Compose Adjustments
- Port mapping changed to `80:80` for the frontend
- Coolify labels added for management
- Volumes configured for persistence

### Environment Configuration
- `.env.coolify` file added with Coolify-specific settings
- FQDN variable used for domain configuration
- SSL enabled by default

### Security
- CSP (Content Security Policy) enabled
- Filesystem uploads instead of imgur
- Secure session configuration

## Manual Steps

### 1. Generate Session Secret
```bash
# Use a tool like pwgen or online generator
pwgen -s 64 1
```

### 2. Discord Setup (Optional)
If you want Discord integration:
1. Create a Discord bot
2. Add the bot to your server
3. Configure the environment variables

### 3. Database Migration
The database is automatically initialized on first start.

## Troubleshooting

### Common Problems

1. **Service won't start:**
   - Check if all environment variables are set
   - Verify that SESSION_SECRET is configured

2. **Database connection problems:**
   - Ensure the database service is fully started
   - Check database credentials

3. **Pad (HedgeDoc) doesn't work:**
   - Check CMD_DOMAIN configuration
   - Ensure SSL is correctly configured

### Checking Logs
```bash
# In Coolify dashboard
- Go to your application
- Click on "Logs" tab
- View real-time logs for debugging
```

## Production Recommendations

1. **Security:**
   - Change default database passwords
   - Use strong SESSION_SECRET
   - Configure SSL certificates

2. **Monitoring:**
   - Setup monitoring via Coolify
   - Configure alerting for downtime

3. **Backup:**
   - Configure database backups
   - Backup upload volumes

## Support

For problems with this Coolify configuration:
1. Check the logs in Coolify first
2. Compare with original CTFNote documentation
3. Check Coolify-specific configuration

## Original CTFNote

This configuration is based on the original CTFNote project:
- Original: https://github.com/TFNS/CTFNote
- Documentation: Check README.md for original instructions
