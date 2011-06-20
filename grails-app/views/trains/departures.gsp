<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Departure Board</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'departureboard.css')}" />
    <g:javascript library="jquery" plugin="jquery" />
    <jqui:resources />
    <g:javascript library="smoothscroll" />
  </head>
  <body>
    <div id="next" class="line">
      <div class="scheduled displayelement">${departures.next.scheduled}</div>
      <div id="next-destination" class="destination displayelement">
        <div class="scrollingHotSpotLeft"></div>
        <div class="scrollingHotSpotRight"></div>
        <div class="scrollWrapper">
          <div class="scrollableArea">
            <p>${departures.next.destination.trim()} and then some more text goes here</p>
          </div>
        </div>
      </div>
      <div class="expected displayelement">${departures.next.expected}</div>
    </div>
    <div id="second" class="line">
      <div class="scheduled displayelement">${departures.second.scheduled}</div>
      <div class="destination displayelement">
        ${departures.second.destination}
      </div>
      <div class="expected displayelement">${departures.second.expected}</div>
    </div>
    <div id="third" class="line">
      <div class="scheduled displayelement">${departures.third.scheduled}</div> <div class="destination displayelement">${departures.third.destination}</div><div class="expected displayelement">${departures.third.expected}</div>
    </div>
    <g:javascript>
          $(window).load(function() {
              $("div#next-destination").smoothDivScroll({autoScroll: "always", autoScrollStep: 2, autoScrollDirection:"right", autoScrollInterval: 5}, {autoScrollRightLimitReached: function() {
                $("div#next-destination").smoothDivScroll("restoreOriginalElements");
              }
            });
          });
    </g:javascript>
  </body>
</html>