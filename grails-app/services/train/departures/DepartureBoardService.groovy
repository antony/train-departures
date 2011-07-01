package train.departures

import groovy.util.slurpersupport.GPathResult
import train.departures.exception.DepartureInformationAvailabilityException

class DepartureBoardService {

    static transactional = false
    DeparturesHtmlCleaningService departuresHtmlCleaningService

    DepartureBoard nextDepartures(String stationCode) {

        URL url = new URL("http://ojp.nationalrail.co.uk/service/ldbboard/dep/${stationCode ?: 'WAT'}")

        GPathResult departures
        try {
            departures = departuresHtmlCleaningService.clean(url)
        } catch (DepartureInformationAvailabilityException diae) {
            return DepartureBoard.configure()
        }

        return DepartureBoard.configure(departures)

    }

}
