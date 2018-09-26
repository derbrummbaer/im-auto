#!/bin/bash

# Kopieren der Konfigurationsdatei
/bin/cp /etc/pilight/config.bak /etc/pilight/config.json
# Starten des Pilight Daemon
/usr/local/sbin/pilight-daemon -F
