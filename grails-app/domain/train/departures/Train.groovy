package train.departures

import groovy.util.slurpersupport.GPathResult

class Train {

    String scheduled
    String destination
    String expected
    String platform

    static constraints = {
    }

    private final Train train() {

    }

    static Train departing(GPathResult info) {

        Train train = new Train()
        train.with {
            scheduled = info.td[0].text()
            destination = info.td[1].text()
            expected = info.td[2].text().split(' ')[0]
            platform = info.td[3].text()
        }
        return train

    }
}
