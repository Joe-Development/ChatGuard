# Language Filter Script for FiveM Lua

A language filter script for FiveM Lua that helps prevent the usage of inappropriate language in your server. This script also includes integrated Discord logging to keep track of filtered messages.

## Features

- Filters out inappropriate language in chat messages.
- Logs filtered messages to a Discord channel for moderation purposes.
- Easy to configure and customize.

## Installation

1. Extract the downloaded ZIP file.
2. Copy the `FiveM-language-filter` folder into your FiveM server's `resources` directory.
3. Add `ensure FiveM-language-filter` to your server.cfg file.

## Configuration

You can configure the language filter script by modifying the `config.lua` file located in the `FiveM-language-filter` folder. In this file, you can specify the list of blocked words, the Discord webhook URL for logging, and other settings.

## Usage

Once the script is installed and configured, it will automatically filter out any chat messages that contain blocked words. Filtered messages will be logged to the specified Discord channel.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

