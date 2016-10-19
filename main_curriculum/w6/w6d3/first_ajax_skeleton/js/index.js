console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax ({
  method: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  dataType: 'json',
  success: function(response) {
    console.log(response);
  }
})

// Add another console log here, outside your AJAX request
console.log("2nd console log")
