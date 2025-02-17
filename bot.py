import discord
import requests
from dotenv import load_dotenv
load_dotenv()
import os
from discord.ext import commands

TOKEN = os.environ.get("BOT_TOKEN")
GUILD_ID = os.environ.get("GUILD_ID")
HTTP_TRIGGER_URL = os.environ.get("HTTP_TRIGGER_URL")

intents = discord.Intents.default()
intents.message_content = True  # Enable message content intent

bot = commands.Bot(command_prefix="!", intents=intents)
tree = bot.tree  # Using app_commands.CommandTree

@bot.event
async def on_ready():
    try:
        await tree.sync(guild=discord.Object(id=GUILD_ID))
        print(f"Bot is ready! Synced commands.")
    except Exception as e:
        print(f"Error syncing commands: {e}")

@tree.command(name="tarot", description="Triggers a tarot reading", guild=discord.Object(id=GUILD_ID))
async def tarot(interaction: discord.Interaction):
    response = requests.post(HTTP_TRIGGER_URL, json={"user": interaction.user.name})
    if response.status_code == 200:
        await interaction.response.send_message("Getting your Tarot Card Reading...")
    else:
        await interaction.response.send_message(f"Failed to trigger tarot reading. Status: {response.status_code}")

bot.run(TOKEN)