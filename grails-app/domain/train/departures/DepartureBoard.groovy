package train.departures

import groovy.util.slurpersupport.GPathResult

class DepartureBoard extends EmptyDepartureBoard {

    static constraints = {
    }

    Train next
    Train second
    Train third

    private DepartureBoard(GPathResult departures) {

        next = Train.departing(departures.tbody.tr[0])
        second = Train.departing(departures.tbody.tr[1])
        third = Train.departing(departures.tbody.tr[2])

    }

    public static configure(GPathResult info) {

        return new DepartureBoard(info)

    }

}
