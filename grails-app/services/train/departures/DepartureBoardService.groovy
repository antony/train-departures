package train.departures

import groovy.util.slurpersupport.GPathResult
import train.departures.exception.DepartureInformationAvailabilityException

class DepartureBoardService {

    static transactional = false
    HtmlCleaningService htmlCleaningService

    DepartureBoard nextDepartures(String stationCode) {

        URL url = new URL("http://ojp.nationalrail.co.uk/service/ldbboard/dep/${stationCode ?: 'WAT'}")

        GPathResult departures
        try {
            departures = htmlCleaningService.clean(url)
        } catch (DepartureInformationAvailabilityException diae) {
            return new EmptyDepartureBoard()
        }

        return DepartureBoard.configure(departures)

    }

}
