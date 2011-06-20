package train.departures

import grails.converters.XML
import groovy.util.slurpersupport.GPathResult

class TrainsController {

    HtmlCleaningService htmlCleaningService
    DepartureBoardService departureBoardService

    def index = {

        URL url = new URL('http://ojp.nationalrail.co.uk/service/ldbboard/dep/BFD')

        GPathResult departures = htmlCleaningService.clean(url)
        DepartureBoard departureBoard = departureBoardService.nextDepartures(departures)

        render(view:'departures', model:[departures:departureBoard])

    }

}
