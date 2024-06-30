using System;
using System.Windows;
using System.Management.Automation;
using System.Collections.ObjectModel;

namespace VencordThemeGenerator
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ConvertButton_Click(object sender, RoutedEventArgs e)
        {
            ResultTextBox1.Text = ConvertLink(LinkTextBox1.Text);
            ResultTextBox2.Text = ConvertLink(LinkTextBox2.Text);
            ResultTextBox3.Text = ConvertLink(LinkTextBox3.Text);
        }

        private string ConvertLink(string link)
        {
            if (string.IsNullOrEmpty(link))
            {
                return string.Empty;
            }

            string convertedLink = string.Empty;

            if (link.Contains("github.com"))
            {
                if (link.Contains("/releases/download/") || link.Contains("/blob/main/"))
                {
                    // Extract parts and format GitHub link
                    // Example format: https://plusinsta.github.io/discord-plus/src/DiscordPlus-source.theme.css
                    // Replace with your actual conversion logic based on the provided formats
                    // For demonstration, I'm using a placeholder format
                    convertedLink = "Converted GitHub link";
                }
                else
                {
                    convertedLink = "Invalid GitHub link format";
                }
            }
            else if (link.Contains("betterdiscord.app"))
            {
                // Handle BetterDiscord link conversion
                // Example format: https://plusinsta.github.io/betterdiscord-themes/theme/theme.theme.css
                // Replace with your actual conversion logic for BetterDiscord links
                // For demonstration, I'm using a placeholder format
                convertedLink = "Converted BetterDiscord link";
            }
            else
            {
                convertedLink = "Unsupported link format";
            }

            return convertedLink;
        }
    }
}
