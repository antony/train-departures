<div id="departure-board">
  <div id="next" class="line">
      <div class="scheduled displayelement time" id="first-scheduled">xxx</div>
      <div id="next-destination" class="destination displayelement">
        <div class="scrollingHotSpotLeft"></div>
        <div class="scrollingHotSpotRight"></div>
        <div class="scrollWrapper">
          <div class="scrollableArea">
            <p id="first-destination">Please see posters</p>
          </div>
        </div>
      </div>
      <div class="expected displayelement time" id="first-expected">xxx</div>
    </div>
    <div id="second" class="line">
      <div class="scheduled displayelement time" id="second-scheduled">xxx</div>
      <div class="destination secondary displayelement" id="second-destination">
        xxx
      </div>
      <div class="expected displayelement time" id="second-expected">xxx</div>
    </div>
    <div id="third" class="line">
      <div class="scheduled displayelement time" id="third-scheduled">xxx</div> <div class="destination secondary displayelement" id="third-destination">xxx</div><div class="expected displayelement time" id="third-expected">xxx</div>
    </div>
    <g:javascript>
          var $j = jQuery.noConflict();

          $j.extend({
            updateDepartureBoard: function(data) {
              $j("div.destination").css('text-align', 'left');
              $j('#next').fadeOut(function() {
               $j('#first-destination').text(data.next.destination);
               $j('#first-scheduled').text(data.next.scheduled);
               $j('#first-expected').text(data.next.expected);
               $j('#next').fadeIn();
             });

             $j('#second').fadeOut(function() {
               $j('#second-destination').text(data.second.destination);
               $j('#second-scheduled').text(data.second.scheduled);
               $j('#second-expected').text(data.second.expected);
               $j('#second').fadeIn();
             });

             $j('#third').fadeOut(function() {
               $j('#third-destination').text(data.third.destination);
               $j('#third-scheduled').text(data.third.scheduled);
               $j('#third-expected').text(data.third.expected);
               $j('#third').fadeIn();
             });

             $j("div#next-destination").smoothDivScroll({autoScroll: "always", autoScrollStep: 1, autoScrollDirection:"right"}, {
                autoScrollRightLimitReached: function() {
                  setTimeout(function() {
                    $j("div#next-destination").smoothDivScroll("restoreOriginalElements");
                  }, 2500);
                }
              });
            },
            displayCustomerApology: function(data) {
              $j("div.destination").css('text-align', 'center');
              $j("div.time").text('');
              $j("div#next-destination").text('Live travel information');
              $j("div#second-destination").text('is currently unavailable');
              $j("div#third-destination").text('please see posters');
            }
          });

          $j(window).load(function() {
            $j.PeriodicalUpdater({
               url : '${resource(dir:'trains/departures', file:'BFD.json')}',
               minTimeout: 60000,
               maxTimeout: 60000,
               multiplier: 1,
               type: 'json'
            },
            function(data) {
              if (data['class'] == 'train.departures.EmptyDepartureBoard') {
                $j.displayCustomerApology();
              } else {
                $j.updateDepartureBoard(data);
              }
            });
          });
    </g:javascript>
</div>