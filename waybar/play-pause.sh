#!/bin/bash
playerctl --follow status -f '{"text": "{{status}}", "class": "{{status}}"}' 2>/dev/null || echo '{"text": "No player", "class": "inactive"}'
