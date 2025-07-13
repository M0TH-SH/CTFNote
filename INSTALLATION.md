# CTFNote Coolify Installation Guide

This guide provides comprehensive instructions to deploy CTFNote using Coolify. This project is realized by **Team M0TH.SH**.

## Prerequisites

- **Coolify Instance**: A running Coolify instance with Docker support
- **Domain Name**: A domain name pointing to your Coolify server
- **GitHub Account**: Access to fork and clone repositories

## Step-by-Step Installation

### Step 1: Create New Application in Coolify

1. **Access Coolify Dashboard**
   - Navigate to your Coolify instance
   - Login with your credentials

2. **Create New Resource**
   - Click "**+ New Resource**"
   - Select "**Application**"
   - Choose "**Docker Compose**" as the application type

3. **Repository Configuration**
   - **Repository URL**: `https://github.com/M0TH-SH/CTFNote.git`
   - **Branch**: `main`
   - **Docker Compose File**: `docker-compose.coolify.yml`
   - **Build Pack**: Leave as "Docker Compose"

### Step 2: Configure Environment Variables

In the Coolify application settings, add the following environment variables:

#### Required Variables
```env
# Domain Configuration
CMD_DOMAIN=your-domain.com
CMD_PROTOCOL_USESSL=true
CMD_CSP_ENABLE=true

# Session Security (Generate a 64+ character random string)
SESSION_SECRET=your-64-character-random-string-here

# Database Configuration
DB_DATABASE=ctfnote
DB_ADMIN_LOGIN=ctfnote
DB_ADMIN_PASSWORD=ctfnote
DB_USER_LOGIN=user_postgraphile
DB_USER_PASSWORD=secret_password
DB_HOST=db
DB_PORT=5432

# File Upload Configuration
CMD_IMAGE_UPLOAD_TYPE=filesystem
CMD_DOCUMENT_MAX_LENGTH=100000

# Timezone
TZ=UTC
LC_ALL=en_US.UTF-8
```

#### Optional Discord Integration
```env
# Discord Bot (Optional)
USE_DISCORD=false
DISCORD_BOT_TOKEN=your-bot-token
DISCORD_SERVER_ID=your-server-id
DISCORD_VOICE_CHANNELS=3
DISCORD_REGISTRATION_ENABLED=false
```

### Step 3: Generate Session Secret

**Important**: You must generate a secure session secret. Use one of these methods:

1. **Online Generator**: Use a secure password generator for 64+ characters
2. **Command Line** (if available):
   ```bash
   openssl rand -hex 32
   ```
3. **PowerShell** (Windows):
   ```powershell
   -join ((1..64) | ForEach {[char]((65..90) + (97..122) + (48..57) | Get-Random)})
   ```

### Step 4: Domain Configuration

1. **DNS Setup**
   - Create an A record pointing `your-domain.com` to your Coolify server IP
   - Or create a CNAME record if using a subdomain

2. **Coolify Domain Settings**
   - In your application settings, set the domain to `your-domain.com`
   - Enable SSL/TLS (should be automatic with Coolify)

### Step 5: Deploy Application

1. **Review Configuration**
   - Double-check all environment variables
   - Ensure `CMD_DOMAIN` matches your actual domain
   - Verify `SESSION_SECRET` is set and secure

2. **Deploy**
   - Click "**Deploy**" in Coolify
   - Monitor the deployment logs for any errors
   - Wait for all services to start (database, API, frontend, HedgeDoc)

### Step 6: First-Time Setup

1. **Access Your Instance**
   - Navigate to `https://your-domain.com`
   - You should see the CTFNote login page

2. **Create Admin Account**
   - Click "Register" to create the first account
   - **The first account created will have admin privileges**
   - Fill in your details and create the account

3. **Verify Services**
   - Test the main CTFNote interface
   - Try creating a CTF to test the notepad (HedgeDoc) integration

## Advanced Configuration

### Security Hardening

1. **Change Default Passwords**
   ```env
   DB_ADMIN_PASSWORD=your-secure-password
   DB_USER_PASSWORD=your-secure-password
   ```

2. **Enable Content Security Policy**
   ```env
   CMD_CSP_ENABLE=true
   ```

### Discord Integration Setup

1. **Create Discord Bot**
   - Go to [Discord Developer Portal](https://discord.com/developers/applications)
   - Create a new application and bot
   - Copy the bot token

2. **Configure Bot Permissions**
   - Enable required intents: Presence Intent, Server Members Intent, Message Content Intent
   - Grant Administrator permissions

3. **Update Environment Variables**
   ```env
   USE_DISCORD=true
   DISCORD_BOT_TOKEN=your-bot-token
   DISCORD_SERVER_ID=your-server-id
   ```

### Monitoring and Maintenance

1. **Coolify Monitoring**
   - Use Coolify's built-in monitoring for resource usage
   - Set up alerts for service failures

2. **Log Management**
   - Access logs through Coolify's log viewer
   - Monitor for authentication errors or database issues

3. **Backup Strategy**
   - Regular database backups (handled by Coolify volumes)
   - Backup upload files and configurations

## Troubleshooting

### Common Issues

1. **Service Won't Start**
   - Check Coolify logs for specific error messages
   - Verify all environment variables are set correctly
   - Ensure `SESSION_SECRET` is properly configured

2. **Database Connection Issues**
   - Wait for database service to fully initialize
   - Check if database passwords match between services
   - Verify database service is running in Coolify

3. **Domain/SSL Issues**
   - Confirm DNS is properly configured
   - Check Coolify's SSL certificate generation
   - Verify `CMD_DOMAIN` matches your actual domain

4. **HedgeDoc (Notepad) Not Working**
   - Ensure `CMD_DOMAIN` is set correctly
   - Check if `CMD_PROTOCOL_USESSL=true` matches your SSL setup
   - Verify database connection for HedgeDoc service

### Debug Steps

1. **Check Service Status**
   - In Coolify, verify all services are running
   - Look for any services in "failed" or "restarting" state

2. **Review Logs**
   - Check individual service logs in Coolify
   - Look for authentication, database, or network errors

3. **Test Components**
   - Try accessing the main interface
   - Test user registration and login
   - Create a test CTF and verify notepad functionality

## Support and Resources

- **Original CTFNote**: [https://github.com/TFNS/CTFNote](https://github.com/TFNS/CTFNote)
- **Coolify Documentation**: [https://coolify.io/docs](https://coolify.io/docs)
- **This Fork**: [https://github.com/M0TH-SH/CTFNote](https://github.com/M0TH-SH/CTFNote)

## What's Next?

After successful deployment:

1. **Configure User Roles**: Set up appropriate permissions for team members
2. **Import CTFs**: Use the CTFtime integration to import upcoming CTFs
3. **Setup Discord Bot**: If using Discord integration
4. **Create Backup Strategy**: Regular backups for your CTF data
5. **Monitor Performance**: Keep an eye on resource usage and performance

---

**Note**: This installation guide is specific to the Coolify-optimized version. For traditional Docker deployments, refer to the original CTFNote documentation.

