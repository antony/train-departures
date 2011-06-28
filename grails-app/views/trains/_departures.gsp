<div id="next" class="line">
      <div class="scheduled displayelement">${departures.next.scheduled}</div>
      <div id="next-destination" class="destination displayelement">
        <div class="scrollingHotSpotLeft"></div>
        <div class="scrollingHotSpotRight"></div>
        <div class="scrollWrapper">
          <div class="scrollableArea">
            <p>${departures.next.destination.trim()}</p>
          </div>
        </div>
      </div>
      <div class="expected displayelement">${departures.next.expected}</div>
    </div>
    <div id="second" class="line">
      <div class="scheduled displayelement">${departures.second.scheduled}</div>
      <div class="destination secondary displayelement">
        ${departures.second.destination}
      </div>
      <div class="expected displayelement">${departures.second.expected}</div>
    </div>
    <div id="third" class="line">
      <div class="scheduled displayelement">${departures.third.scheduled}</div> <div class="destination secondary displayelement">${departures.third.destination}</div><div class="expected displayelement">${departures.third.expected}</div>
    </div>
    <g:javascript>
          var $j = jQuery.noConflict();
          $j(window).load(function() {
              $("div#next-destination").smoothDivScroll({autoScroll: "always", autoScrollStep: 1, autoScrollDirection:"right"}, {autoScrollRightLimitReached: function() {
                 setTimeout(function() {
                    $("div#next-destination").smoothDivScroll("restoreOriginalElements");
                 }, 2500);
              }
            });
             $.PeriodicalUpdater({
                url : '${resource(plugin:'train-departures', dir:'trains/departures', file:'BFD.json')}'
             },
             function(data){
                var myHtml = 'The data returned from the server was: ' + data + '';
                $('#results').append(myHtml);
             });
          });
    </g:javascript>