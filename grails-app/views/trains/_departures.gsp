<div id="next" class="line">
      <div class="scheduled displayelement" id="first-scheduled">xxx</div>
      <div id="next-destination" class="destination displayelement">
        <div class="scrollingHotSpotLeft"></div>
        <div class="scrollingHotSpotRight"></div>
        <div class="scrollWrapper">
          <div class="scrollableArea">
            <p id="first-destination">Please see posters</p>
          </div>
        </div>
      </div>
      <div class="expected displayelement" id="first-expected">xxx</div>
    </div>
    <div id="second" class="line">
      <div class="scheduled displayelement" id="second-scheduled">xxx</div>
      <div class="destination secondary displayelement" id="second-destination">
        xxx
      </div>
      <div class="expected displayelement" id="second-expected">xxx</div>
    </div>
    <div id="third" class="line">
      <div class="scheduled displayelement" id="third-scheduled">xxx</div> <div class="destination secondary displayelement" id="third-destination">xxx</div><div class="expected displayelement" id="third-expected">xxx</div>
    </div>
    <g:javascript>
          var $j = jQuery.noConflict();
          $j(window).load(function() {
              $j("div#next-destination").smoothDivScroll({autoScroll: "always", autoScrollStep: 1, autoScrollDirection:"right"}, {autoScrollRightLimitReached: function() {
                 setTimeout(function() {
                    $("div#next-destination").smoothDivScroll("restoreOriginalElements");
                 }, 2500);
              }
            });
            $j.PeriodicalUpdater({
               url : '${resource(dir:'trains/departures', file:'BFD.json')}',
               minTimeout: 60000,
               multiplier: 1,
               type: 'json'
            },
            function(data) {
             $j('#first-destination').text(data.next.destination);
             $j('#first-scheduled').text(data.next.scheduled);
             $j('#first-expected').text(data.next.expected);
             $j('#second-destination').text(data.second.destination);
             $j('#second-scheduled').text(data.second.scheduled);
             $j('#second-expected').text(data.second.expected);
             $j('#third-destination').text(data.third.destination);
             $j('#third-scheduled').text(data.third.scheduled);
             $j('#third-expected').text(data.third.expected);
            });
          });
    </g:javascript>