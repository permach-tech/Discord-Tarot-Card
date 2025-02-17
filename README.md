# Discord Tarot Card
A fun Discord project that lets you and your friends get a Tarot card reading using the `/tarot` command.

![Command](https://github.com/permach-tech/Discord-Tarot-Card/blob/main/screenshots/command.png)

<p align="center">
  <img width="257" height="402" src="https://github.com/permach-tech/Discord-Tarot-Card/blob/main/screenshots/result.png">
</p>

## Step 1: Set Up Your Discord Bot
1. Go to the [Discord Developer Portal](https://discord.com/developers) and sign in.
2. Create a new application.
3. Navigate to **"Bot"** → Click **"Add Bot"**.
4. Assign the following permissions:
    - **Scopes:** `applications.commands`, `bot`
    - **Bot Permissions:** `Send Messages`
5. Copy the generated OAuth2 URL and paste it into your browser to invite the bot to your Discord server.

## Step 2: Create the Bot Script
Write a script to handle requests. This example uses Python, but feel free to use your preferred language.<br>
Refer to [bot.py](https://github.com/permach-tech/Discord-Tarot-Card/blob/main/bot.py).<br>
Make sure to declare your **Token**, **Guild ID** (Discord server ID), and **HTTP Trigger URL** (used in the next step).

## Step 3: Deploy a Serverless Function
Set up an **Azure Function App** (or another SaaS/on-prem solution) to process HTTP POST requests from your bot. This function will randomly select a Tarot card and send the result to your Discord server.
