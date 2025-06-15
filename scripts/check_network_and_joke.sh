#!/bin/bash

INSTALL_MISSING=false
[ "${1:-}" == "--install" ] && INSTALL_MISSING=true

echo "🕵️ Sherlock & Chuck Norris' Network Inspector 🔍"

# Helper to print headings
section() {
  echo -e "\n🔧 $1\n----------------------------"
}

# 1. Dependencies check (curl, jq, dig)
section "Checking dependencies"
missing_tools=()
for tool in curl jq dig; do
  if ! command -v $tool >/dev/null 2>&1; then
    echo "❌ Missing: $tool"
    missing_tools+=($tool)
  else
    echo "✅ $tool found"
  fi
done

if [ ${#missing_tools[@]} -gt 0 ]; then
  if $INSTALL_MISSING && command -v apt-get >/dev/null; then
    echo "🔄 Attempting to install missing tools: ${missing_tools[*]}"
    sudo apt-get update
    sudo apt-get install -y ${missing_tools[*]}
  else
    echo "💡 Run with --install to attempt installation, or install manually: ${missing_tools[*]}"
    exit 1
  fi
fi

# 2. DNS resolution check
section "DNS resolution test"
if dig +short api.chucknorris.io | grep -qE '^[0-9]+\.'; then
  echo "✅ DNS resolution working"
else
  echo "❌ DNS resolution failed."
  echo "   → Temp fix: sudo bash -c 'echo nameserver 8.8.8.8 > /etc/resolv.conf'"
  echo "   Rerun with --install to auto-apply." 
  exit 2
fi

# 3. Curl connectivity check
section "HTTP connectivity test"
joke_json=$(curl --max-time 5 -s https://api.chucknorris.io/jokes/random)
if [ $? -ne 0 ] || [ -z "$joke_json" ]; then
  echo "❌ Failed to fetch joke from API."
  exit 3
fi

# 4. Display the joke
section "Chuck Norris Fact"
joke=$(echo "$joke_json" | jq -r '.value')
echo -e "🤣 $joke\n"
# 5. Final message
section "Network Check Complete"
echo "✅ All checks passed! Your network is ready for Chuck Norris jokes."
echo "🎉 Enjoy your day with a smile! Remember, Chuck Norris doesn't need an internet connection to tell jokes. "
echo "    He just stares at the router until it connects."
echo "    If you need more jokes, visit: https://api.chucknorris.io/jokes/random"
echo "    Or check out the API documentation: https://api.chucknorris.io/"
echo "    For more fun, try: https://www.chucknorrisfacts.com/"
echo "    And remember, Chuck Norris can divide by zero!"
