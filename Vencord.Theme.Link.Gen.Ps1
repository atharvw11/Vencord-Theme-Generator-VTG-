# Ask for the theme link from GitHub or BetterDiscord
$link = Read-Host "Enter your theme link from GitHub or BetterDiscord (e.g., https://github.com/PlusInsta/discord-plus/releases/download/v3.2.1a/DiscordPlus.theme.css or https://github.com/PlusInsta/discord-plus/blob/main/DiscordPlus.theme.css or https://betterdiscord.app/Download?id=creator_name)"

# Use regex patterns to extract the necessary parts from the provided link, case-insensitive
if ($link -match "(?i)https://github.com/([^/]+)/([^/]+)/releases/download/.+/([^/]+\.theme\.css)") {
    $creator = $matches[1]
    $name = $matches[2]
    $themeFile = $matches[3]

    # Construct the new link in the desired format
    $newLink = "https://$creator.github.io/$name/$themeFile"

    # Output the new link
    Write-Output "New link: $newLink"

    # Copy the new link to the clipboard
    $newLink | Set-Clipboard

    Write-Output "The new link has been copied to the clipboard."
} elseif ($link -match "(?i)https://github.com/([^/]+)/([^/]+)/blob/main/([^/]+\.theme\.css)") {
    $creator = $matches[1]
    $name = $matches[2]
    $themeFile = $matches[3]

    # Construct the new link in the desired format
    $newLink = "https://$creator.github.io/$name/$themeFile"

    # Output the new link
    Write-Output "New link: $newLink"

    # Copy the new link to the clipboard
    $newLink | Set-Clipboard

    Write-Output "The new link has been copied to the clipboard."
} elseif ($link -match "(?i)https://betterdiscord.app/Download\?id=([^/]+)") {
    # Confirm if the link is a BetterDiscord link
    $isBetterDiscord = Read-Host "Is this a BetterDiscord link? (yes/no)"
    if ($isBetterDiscord -eq "yes") {
        $id = $matches[1]

        # Prompt for GitHub username and theme name
        $creator = Read-Host "Enter the creator's GitHub username"
        $name = Read-Host "Enter the theme name"

        # Construct the new link in the desired format
        $newLink = "https://$creator.github.io/$name/$name.theme.css"

        # Output the new link
        Write-Output "New link: $newLink"

        # Copy the new link to the clipboard
        $newLink | Set-Clipboard

        Write-Output "The new link has been copied to the clipboard."
    } else {
        Write-Output "Invalid link format. Please ensure you provide a valid BetterDiscord theme link."
    }
} else {
    Write-Output "Invalid link format. Please ensure you provide a link in one of the following formats:
    https://github.com/%creator%/%name%/releases/download/%latestversion%/%name%.theme.css
    https://github.com/%creator%/%name%/blob/main/%name%.theme.css
    https://betterdiscord.app/Download?id=creator_name"
}

# Press any key to continue
Write-Output "Press any key to continue..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
