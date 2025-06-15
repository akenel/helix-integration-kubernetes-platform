#!/bin/bash
#  --- Chuck Norris Joke Module 🤣 ---
# This script provides a function to fetch and display a random Chuck Norris joke.

# Ensures 'curl' and 'jq' are available for fetching and parsing jokes.
check_joke_dependencies() {
    if ! command -v curl &> /dev/null; then
        echo "⚠️ Warning: 'curl' is not installed. Cannot fetch Chuck Norris jokes."
        return 1
    fi
    if ! command -v jq &> /dev/null; then
        echo "⚠️ Warning: 'jq' is not installed. Cannot parse Chuck Norris jokes."
        echo "💡 To install 'jq': sudo apt install jq"
        return 1
    fi
    return 0
}

# Fetches and prints a random Chuck Norris joke.
get_chuck_norris_joke() {
    # Only try to fetch a joke if dependencies are met
    if check_joke_dependencies; then
        echo "😂 Here's a Chuck Norris fact for you: "
        # Fetch a random joke from the API and extract the 'value' field
        joke_json=$(curl -s https://api.chucknorris.io/jokes/random)
        if [ $? -eq 0 ]; then # Check if curl command succeeded
            joke_value=$(echo "$joke_json" | jq -r '.value' 2>/dev/null)
            if [ -n "$joke_value" ] && [ "$joke_value" != "null" ]; then
                echo "    \"${joke_value}\" "
            else
                echo "    (Couldn't retrieve a good joke right now. Even Chuck has off days.)"
            fi
        else
            echo "    (Failed to connect to the joke API. Chuck might be busy fighting crime.)"
        fi
        echo "" # Add a blank line for readability
    fi
}
