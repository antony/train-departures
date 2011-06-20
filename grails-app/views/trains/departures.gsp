<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Departure Board</title>
    <link rel="stylesheet" type="text/css" href="/train-departures/css/departureboard.css" />
  </head>
  <body>
    <div id="next" class="line">
      <div class="scheduled displayelement">${departures.next.scheduled}</div> <div class="destination displayelement">${departures.next.destination}</div><div class="expected displayelement">${departures.next.expected}</div>
    </div>
    <div id="second" class="line">
      <div class="scheduled displayelement">${departures.second.scheduled}</div> <div class="destination displayelement">${departures.second.destination}</div><div class="expected displayelement">${departures.second.expected}</div>
    </div>
    <div id="third" class="line">
      <div class="scheduled displayelement">${departures.third.scheduled}</div> <div class="destination displayelement">${departures.third.destination}</div><div class="expected displayelement">${departures.third.expected}</div>
    </div>
  </body>
</html>