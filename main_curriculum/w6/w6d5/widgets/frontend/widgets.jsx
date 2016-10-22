import React from 'react';
import ReactDOM from 'react-dom';
import Tab from './tabs';
import WeatherClock from './weather_clock';
import AutoComplete from './auto_complete';

document.addEventListener("DOMContentLoaded", () =>{

  //Tabs
  const tabs = document.getElementById("tabs");
  const tabData = [
    { title: "Tab 1", content: "Content for tab 1" },
    { title: "Tab 2", content: "Content for tab 2" },
    { title: "Tab 3", content: "Content for tab 3" }
  ];

  ReactDOM.render(<Tab tabData = {tabData} />, tabs);

  //Weather Clock
  const weather = document.getElementById("weatherclock");
  ReactDOM.render(<WeatherClock />, weather);

  //Autocomplete
  const autocomplete = document.getElementById("autocomplete");
  const autocompleteData = ["Larry Ringsholtz",
  "Bruce LaBruce",
  "Ebmo Weeny Von Skulk",
  "Uriah Jones-Ripplewater",
  "Bobby Car-bombs",
  "Vincent Eagleton",
  "Carson Robertson",
  "scooter looselamp",
  "Lothario horsenplamt",
  "Mulberry Pantswatch",
  "Archie Mulletweather",
  "Lunchmeat Jones",
  "Darnell Vicegrips",
  "Aardvark Lanigan",
  "Porcupine Turniptruck",
  "Tad Wanks",
  "Carlish Binkel",
  "Yurich Flottersham",
  "Archibald Trumpetnoise",
  "Reinwolf Musketgun",
  "Rumpy Fatfeather",
  "Carl Brumblebeard",
  "Baron Von Cheesecake",
  "Cobra Ramirez",
  "Manny Bombshelter",
  "Mohammod Zanzibar",
  "Bearskin Gobbagoo",
  "Ernie Palisades",
  "Marley Turdplunder",
  "Lord Gerrimander Counterpole",
  "Lardly Fannypot",
  "Barry O'Blarnahan",
  "sasquatch littlefoot",
  "Tinky Bellding",
  "Shaky Flemson",
  "Barney Narmelpop",
  "Funson Slakewaltz",
  "Anvid Plimpersac",
  "Gloose Kroomps",
  "Hooch McToobs",
  "Barney Hoffelsteader",
  "Teeny Wheems",
  "Bernard Flarthleby",
  "Rupert Grunes",
  "Sanford P Urbanplot",
  "Ernesto Pomodoro",
  "Hamburger Nelson",
  "Manheim Turtleshell",
  "Rube Clementine",
  "Nate Parsimmons",
  "Roland P. Goodtimes"];

  ReactDOM.render(<AutoComplete autocompleteData = {autocompleteData} />, autocomplete);
});
