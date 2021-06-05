# thunder_meter

A weather forecast flutter application

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- Clone the project
- run pub get and you are ready to work on and modify the application.
- edit weather.dart file (lib/services) : add your API key.
- create a new api key on openweathermap's server. (code is written as per the data from openweathermap api).

## Introduction

This project includes 3 screens and each one has different functionality for the proper working of the application.

### The Splash Screen

Rather than showing the welcome animation, the splash screen also has the functionality to get the current location of the user.

<p align="center">
  <img src="/readme_images/splash_screen_0.jpg" width="250"> <img src="/readme_images/splash_screen.jpg" width="250">
</p>

The spinner on the splash screen will continue to spin until it gets the current location of the user.

### Main Screen

After successfully getting the current location of the user, the app will navigate to the main screen and where the screen is populated with the data from API i.e. the climate conditions.

<p align="center">
  <img src="/readme_images/main_screen.jpg" width="250"> <img src="/readme_images/main_screen_2.jpg" width="250">
</p>

### City Screen

The application also has functionality that users can also search for other cities.
At the top right corner of the main screen, there is IconButton which will navigate the user to the cit_screen where the user can search for his favorite city's weather condition.

<p align="center">
  <img src="/readme_images/city_search.jpg" width="250">
</P>
