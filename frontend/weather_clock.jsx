import React from 'react';

class WeatherClock extends React.Component {

  constructor() {
    super();
    this.state = { clock: this.parseTime() };
  }

  parseTime(){
    const currentTime = new Date();
    const time = currentTime.toTimeString().slice(0, 8);
    const date = currentTime.toDateString();
    return { time, date };
  }

  componentDidMount() {
    this.fetchLocation();
    this.interval = window.setInterval(() => this.setState(
      {clock: this.parseTime()}
    ), 1000);
  }

  fetchLocation(){
    navigator.geolocation.getCurrentPosition(geo => {
      this.fetchWeather(geo);
    });
  }

  fetchWeather (geo) {
    let owUrl = "http://api.openweathermap.org/data/2.5/weather";
    let latArgs = `?lat=${geo.coords.latitude}`;
    let longArgs = `&lon=${geo.coords.longitude}`;
    let apiKey = "&appid=bcb83c4b54aee8418983c2aff3073b3b";
    let fetchUrl = owUrl + latArgs + longArgs + apiKey;

    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = () => {
      if (xmlhttp.readyState === XMLHttpRequest.DONE ) {
        if (xmlhttp.status === 200) {
          this.weather = JSON.parse(xmlhttp.responseText);
        }
        else if (xmlhttp.status === 400) {
          alert('There was an error 400');
        }
        else {
          alert('something else other than 200 was returned');
        }
      }
    };

    xmlhttp.open("GET", fetchUrl, true);
    xmlhttp.send();
  }

  render(){
    // const { tabData } = this.props;
    // const  titles = tabData.map( obj => obj.title);
    return (<div>
      <section>
        <h1>Date</h1>
        <h2>{this.state.clock.date}</h2>
      </section>

      <section>
        <h1>Time</h1>
        <h2>{this.state.clock.time}</h2>
      </section>

      <section>
        <h1>Weather</h1>
        <h2>{this.weather ? this.weather.weather[0].description : ""}</h2>
      </section>

      <section>
        <h1>Temperature</h1>
        <h2>{this.weather ? Math.floor(this.weather.main.temp - 273) : ""}°C</h2>
      </section>

      </div>
    );
  }
}

export default WeatherClock;
