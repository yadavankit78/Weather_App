# weather_app

A new Flutter project.
This is a simple Flutter weather application that displays the current weather conditions for a specific location. The app consists of two main screens: the Help Screen and the Home Screen.

# Feature 

# Help Screen:

Displays a splash screen with a heading "We show weather for you" and a button to skip to the homepage.
The Help Screen includes a background image frame.
Auto-redirects to the Home Screen after 5 seconds if no button is clicked.

# Home Screen:

Allows users to enter a location name and fetch weather data for that location.
If no location name is entered, it automatically fetches weather data using the device's current location (latitude and longitude).
Displays the temperature, weather condition (in text), and an icon representing the weather.
Users can save or update the location, and the app remembers the last entered location for future launches.
Includes a button in the top bar to return to the Help Screen.

# API 
This app uses the WeatherAPI to fetch weather data.
Sample API Endpoints:
1. By Latitude and Longitude:
2. By Location Name:

# Screens

# Help Screen

Displays introductory content and auto-redirects after 5 seconds or on button click.

# Home Screen
Displays a text box to enter a location and a save/update button to fetch weather data.
Displays temperature, weather condition, and an icon representing the current weather.

# Dependencies

Provider for state management .
http for making API calls.
shared_preferences for saving and loading the last entered location.

# Notes

Make sure to add your own API key in the code when using WeatherAPI.
The app is built using Flutter with best practices for code organization, state management, and separation of concerns.
