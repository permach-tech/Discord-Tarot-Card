# Discord-Tarot-Card
Fun Discord project for you and your friends to get a Tarot card reading using the /tarot command.

![command](https://github.com/permach-tech/Discord-Tarot-Card/blob/main/screenshots/command.png)

<p align="center">
  <img width="257" height="402" src="https://github.com/permach-tech/Discord-Tarot-Card/blob/main/screenshots/result.png">
</p>

## Step 1
1. Go to the [Discord Developer Portal](https://discord.com/developers) and sign in to your Discord profile
2. Create a new application Go to "Bot" → Click "Add Bot."
3. Give the bot these permissions:
    - [SCOPES] applications.commands
    - [SCOPES] bot 
    - [BOT PERMISSIONS] Send Messages
4. Copy the URL generated and paste it in yoru browser to invite the bot to your Discord server

## Step 2
Create a Bot Script to accept requests, I used Python, but feel free to use the language of your choosing<br>
refer to [bot.py](https://github.com/permach-tech/Discord-Tarot-Card/blob/main/bot.py) <br>
Declare your Token, Guild ID (Discord server ID), and HTTP Trigger URL (to be used later)

## Step 3
Create an Azure Function App(or another SaaS provider or on-premise solution) to take the HTTP POST request from your bot and run the function that will spit out a random tarot card to in the Discord server.
