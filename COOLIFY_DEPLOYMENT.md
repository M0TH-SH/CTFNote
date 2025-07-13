# CTFNote Coolify Deployment Guide

Deze versie van CTFNote is geconfigureerd voor deployment met Coolify.

## Quick Start

1. **Import in Coolify:**
   - Ga naar je Coolify dashboard
   - Klik op "New Resource" > "Application"
   - Kies "Docker Compose" als type
   - Voer de repository URL in van je fork

2. **Configuratie:**
   - Gebruik `docker-compose.coolify.yml` als compose bestand
   - Kopieer de inhoud van `.env.coolify` naar de environment variabelen
   - Zorg ervoor dat `FQDN` is ingesteld op je domain

3. **Environment Variabelen:**
   ```bash
   # Verplicht
   CMD_DOMAIN=je-domain.com
   SESSION_SECRET=genereer-een-64-karakter-string
   
   # Optioneel
   USE_DISCORD=true
   DISCORD_BOT_TOKEN=je-bot-token
   DISCORD_SERVER_ID=je-server-id
   ```

## Belangrijke Wijzigingen voor Coolify

### Docker Compose Aanpassingen
- Port mapping aangepast naar `80:80` voor de front-end
- Coolify labels toegevoegd voor beheer
- Volumes geconfigureerd voor persistentie

### Environment Configuratie
- `.env.coolify` bestand toegevoegd met Coolify-specifieke instellingen
- FQDN variabele gebruikt voor domein configuratie
- SSL standaard ingeschakeld

### Beveiliging
- CSP (Content Security Policy) ingeschakeld
- Filesystem uploads in plaats van imgur
- Secure session configuratie

## Handmatige Stappen

### 1. Generate Session Secret
```bash
# Gebruik een tool zoals pwgen of online generator
pwgen -s 64 1
```

### 2. Discord Setup (Optioneel)
Als je Discord integratie wilt:
1. Maak een Discord bot aan
2. Voeg de bot toe aan je server
3. Configureer de environment variabelen

### 3. Database Migratie
De database wordt automatisch geïnitialiseerd bij eerste start.

## Troubleshooting

### Veel Voorkomende Problemen

1. **Service start niet:**
   - Controleer of alle environment variabelen zijn ingesteld
   - Verificeer dat SESSION_SECRET is geconfigureerd

2. **Database connectie problemen:**
   - Zorg dat de database service volledig is opgestart
   - Controleer database credentials

3. **Pad (HedgeDoc) werkt niet:**
   - Controleer CMD_DOMAIN configuratie
   - Zorg dat SSL correct is geconfigureerd

### Logs Controleren
```bash
# In Coolify dashboard
- Ga naar je applicatie
- Klik op "Logs" tab
- Bekijk real-time logs voor debugging
```

## Productie Aanbevelingen

1. **Beveiliging:**
   - Verander standaard database passwords
   - Gebruik sterke SESSION_SECRET
   - Configureer SSL certificaten

2. **Monitoring:**
   - Setup monitoring via Coolify
   - Configureer alerting voor downtime

3. **Backup:**
   - Configureer database backups
   - Backup upload volumes

## Support

Voor problemen met deze Coolify configuratie:
1. Controleer eerst de logs in Coolify
2. Vergelijk met originele CTFNote documentatie
3. Check Coolify-specifieke configuratie

## Originele CTFNote

Deze configuratie is gebaseerd op het originele CTFNote project:
- Original: https://github.com/TFNS/CTFNote
- Documentatie: Check README.md voor originele instructies
