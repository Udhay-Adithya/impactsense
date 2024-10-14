# Smart Helmet Companion App

The Impactsense App is a safety-focused application developed using Flutter. It connects to a Impactsense helmet via bluetooth and detects crashes in real-time. Upon detecting a crash, it sends notifications to the user’s predefined emergency contacts and local emergency services, ensuring timely assistance during critical situations.

## Features

- **Crash Detection and Notification**: The app receives crash alerts from the smart helmet and automatically sends notifications to family members and emergency services.
- **Helmet Management**: Users can view and manage all their connected helmets.
- **Emergency Contacts**: Users can modify and update close family members and emergency contacts.
- **Helmet Info**: View detailed information about each connected helmet, such as sensor status, battery life, and last sync time.

## Usage

1. Connect your smart helmet to the app via Bluetooth.
2. Manage your helmet connections and update emergency contacts.
3. The app will automatically send alerts in case of a detected crash.

## Requirements

- Flutter SDK
- Impactsense smart helmet
- Internet or Bluetooth connection

## Technologies Used

- Flutter
- Riverpod for state management
- Shared Preferences for storing user data

## Contributing

Contributions are welcome! If you would like to contribute, feel free to open a pull request or issue on [GitHub](https://github.com/yourusername/smart-helmet-app).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
