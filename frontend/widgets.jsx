import React from 'react';
import ReactDOM from 'react-dom';
import Tab from './tabs';
import WeatherClock from './weather_clock';

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
  const weatherData = {};
  ReactDOM.render(<WeatherClock weatherData = {weatherData} />, weather);

});
