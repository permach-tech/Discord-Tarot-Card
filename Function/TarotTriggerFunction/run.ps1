# Define base URL for image hosting (Replace with actual host)
$imageBaseUrl = "https://i.imgur.com"

# Define the tarot deck with image URLs and fortunes
$tarotDeck = @(
    @{ Name = "The Fool"; Emoji = "`u{1F939}"; Image = "$imageBaseUrl/jxI2zQC.png"; Fortune = "A fresh start, new opportunities, take a leap of faith!" },        # 🤹
    @{ Name = "The Magician"; Emoji = "`u{1F9D9}"; Image = "$imageBaseUrl/UwW51xp.png"; Fortune = "You have all the tools you need to manifest your desires." },    # 🧙‍♂️
    @{ Name = "The High Priestess"; Emoji = "`u{1F52E}"; Image = "$imageBaseUrl/GAOdPr9.png"; Fortune = "Trust your intuition; the answers lie within." }, # 🔮
    @{ Name = "The Empress"; Emoji = "`u{1F451}"; Image = "$imageBaseUrl/mwa90vF.png"; Fortune = "Abundance and creativity are flowing your way." },     # 👑
    @{ Name = "The Emperor"; Emoji = "`u{1F3DB}"; Image = "$imageBaseUrl/pJgVxoO.png"; Fortune = "Structure and stability will bring success." },     # 🏛️
    @{ Name = "The Hierophant"; Emoji = "`u{1F4DC}"; Image = "$imageBaseUrl/UynAuCA.png"; Fortune = "Seek guidance or wisdom from tradition or mentors." },  # 📜
    @{ Name = "The Lovers"; Emoji = "`u{2764}"; Image = "$imageBaseUrl/ePzrQ5h.png"; Fortune = "A deep connection or important choice awaits you." },       # ❤️
    @{ Name = "The Chariot"; Emoji = "`u{1F3C7}"; Image = "$imageBaseUrl/uAnJM8j.png"; Fortune = "Focus and determination will lead to victory." },     # 🏇
    @{ Name = "Strength"; Emoji = "`u{1F981}"; Image = "$imageBaseUrl/F4fogs7.png"; Fortune = "Inner strength and patience will see you through." },       # 🦁
    @{ Name = "The Hermit"; Emoji = "`u{1F9D9}"; Image = "$imageBaseUrl/KJoAIBU.png"; Fortune = "Time for self-reflection and inner wisdom." },     # 🧙
    @{ Name = "Wheel of Fortune"; Emoji = "`u{1F3A1}"; Image = "$imageBaseUrl/7AWo9NM.png"; Fortune = "A turn of fate—luck is shifting!" }, # 🎡
    @{ Name = "Justice"; Emoji = "`u{2696}"; Image = "$imageBaseUrl/3ciq6BA.png"; Fortune = "Fairness and truth will prevail." },         # ⚖️
    @{ Name = "The Hanged Man"; Emoji = "`u{1FA9F}"; Image = "$imageBaseUrl/9c1nJA8.png"; Fortune = "A new perspective is needed—let go and surrender." }, # 🪢
    @{ Name = "Death"; Emoji = "`u{1F480}"; Image = "$imageBaseUrl/n2O3qlM.png"; Fortune = "Transformation and rebirth—let go of the old." },         # 💀
    @{ Name = "Temperance"; Emoji = "`u{2697}"; Image = "$imageBaseUrl/gKc1zX1.png"; Fortune = "Balance and patience will bring harmony." },      # ⚗️
    @{ Name = "The Devil"; Emoji = "`u{1F479}"; Image = "$imageBaseUrl/LHlM6qF.png"; Fortune = "Beware of temptations or toxic attachments." },     # 👹
    @{ Name = "The Tower"; Emoji = "`u{26A1}"; Image = "$imageBaseUrl/4hSNdKa.png"; Fortune = "Sudden change or upheaval—embrace the chaos." },      # 🌩️
    @{ Name = "The Star"; Emoji = "`u{2B50}"; Image = "$imageBaseUrl/fmETCBx.png"; Fortune = "Hope and inspiration will light your way." },       # ⭐
    @{ Name = "The Moon"; Emoji = "`u{1F319}"; Image = "$imageBaseUrl/sKM2K4c.png"; Fortune = "Things may not be as they seem—trust your instincts." },     # 🌙
    @{ Name = "The Sun"; Emoji = "`u{1F31E}"; Image = "$imageBaseUrl/lUnUQQ0.png"; Fortune = "Happiness and success are shining upon you." },      # 🌞
    @{ Name = "Judgement"; Emoji = "`u{1F4EF}"; Image = "$imageBaseUrl/6AsdeLB.png"; Fortune = "A wake-up call—rise to your higher purpose." },    # 📯
    @{ Name = "The World"; Emoji = "`u{1F30D}"; Image = "$imageBaseUrl/Xh9vYgG.png"; Fortune = "Completion and achievement—you have come full circle." }     # 🌍
)

# Function to draw a random tarot card
function Draw-RandomTarotCard {
    $randomIndex = Get-Random -Minimum 0 -Maximum $tarotDeck.Length
    return $tarotDeck[$randomIndex]
}

# Draw a card
$drawnCard = Draw-RandomTarotCard

# Define the webhook URL
$webhookUrl = "<YOUR_WEBHOOK_URL>"  # Replace with your actual webhook URL from Discord

# Create the embed payload with an image
$embed = @{
    title = "🔮 Your Tarot Reading 🔮"
    description = "You have drawn: **$($drawnCard.Emoji) $($drawnCard.Name)**`n*$($drawnCard.Fortune)*"
    color = 16711680  # Red color
    footer = @{ text = "May fate guide your path. ✨" }
    image = @{ url = "$($drawnCard.Image)" }
}

# Create the JSON payload
$payload = @{ embeds = @($embed) } | ConvertTo-Json -Depth 10 -Compress

# Send the webhook message
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload -ContentType "application/json; charset=utf-8"