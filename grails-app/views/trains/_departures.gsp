<div id="departure-board">
  <div id="next" class="line">
      <div class="scheduled displayelement time" id="first-scheduled">&nbsp;</div>
      <div id="next-destination" class="destination displayelement">
        <div class="scrollingHotSpotLeft"></div>
        <div class="scrollingHotSpotRight"></div>
        <div class="scrollWrapper">
          <div class="scrollableArea">
            <span id="first-destination">Live travel information</span>
          </div>
        </div>
      </div>
      <div class="expected displayelement time" id="first-expected">&nbsp;</div>
    </div>
    <div id="second" class="line">
      <div class="scheduled displayelement time" id="second-scheduled">&nbsp;</div>
      <div class="destination secondary displayelement" id="second-destination">
        is currently unavailable
      </div>
      <div class="expected displayelement time" id="second-expected">&nbsp;</div>
    </div>
    <div id="third" class="line">
      <div class="scheduled displayelement time" id="third-scheduled">&nbsp;</div>
      <div class="destination secondary displayelement" id="third-destination">
        please see posters
      </div>
      <div class="expected displayelement time" id="third-expected">&nbsp;</div>
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
               $j(".scrollableArea span").css("width", "200%");
               $j('#next').fadeIn(function() {
                 $j('#second').fadeOut(function() {
                   $j('#second-destination').text(data.second.destination);
                   $j('#second-scheduled').text(data.second.scheduled);
                   $j('#second-expected').text(data.second.expected);
                   $j('#second').fadeIn(function() {
                     $j('#third').fadeOut(function() {
                       $j('#third-destination').text(data.third.destination);
                       $j('#third-scheduled').text(data.third.scheduled);
                       $j('#third-expected').text(data.third.expected);
                       $j('#third').fadeIn();
                     });
                   });
                 });
               });
             });

             $j("div#next-destination").smoothDivScroll({autoScroll: "always", autoScrollStep: 1, autoScrollDirection:"right"}, {
                autoScrollRightLimitReached: function() {
                  setTimeout(function() {
                    $j("div#next-destination").smoothDivScroll("restoreOriginalElements");
                  }, ${params.ep ? 0 : 2500});
                }
              });
            },
            displayCustomerApology: function(data) {
              $j("div.destination").css('text-align', 'center');
              $j("div.time").text('');
              $j("span#first-destination").text('Live travel information');
              $j("div#second-destination").text('is currently unavailable');
              $j("div#third-destination").text('please see posters');
            },
            requestTravelInformation: function() {
              $j.PeriodicalUpdater({
                 url : '${params.ep ?: resource(dir:'trains/departures', file:'BFD.json')}',
                 minTimeout: ${params.ep ? 5000 : 60000},
                 maxTimeout: 60000,
                 multiplier: 1,
                 type: 'json'
              },
              function(data) {
                if (data['empty'] == true) {
                  $j.displayCustomerApology();
                } else {
                  $j.updateDepartureBoard(data);
                }
              });
            }
          });

          $j(window).load(function() {
            $j.requestTravelInformation();
          });
    </g:javascript>
</div>