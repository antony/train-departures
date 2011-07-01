package train.departures

import grails.converters.deep.JSON

class TrainsController {

    DepartureBoardService departureBoardService

    def departures = {

        return render(departureBoardService.nextDepartures('BFD') as JSON)

    }

    def fiveohtwo = {

        return render(status:502)
        
    }

}
