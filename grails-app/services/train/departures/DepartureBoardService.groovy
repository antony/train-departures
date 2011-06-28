package train.departures

import groovy.util.slurpersupport.GPathResult

class DepartureBoardService {

    static transactional = false
    HtmlCleaningService htmlCleaningService

    DepartureBoard nextDepartures(String stationCode) {

        URL url = new URL("http://ojp.nationalrail.co.uk/service/ldbboard/dep/${stationCode ?: 'WAT'}")
        GPathResult departures = htmlCleaningService.clean(url)
        return DepartureBoard.configure(departures)

    }

}
