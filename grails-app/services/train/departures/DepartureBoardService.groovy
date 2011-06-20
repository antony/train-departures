package train.departures

import groovy.util.slurpersupport.GPathResult

class DepartureBoardService {

    static transactional = true

    DepartureBoard nextDepartures(GPathResult departureInformation) {

        return DepartureBoard.configure(departureInformation)

    }
}
