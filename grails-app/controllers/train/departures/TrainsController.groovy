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

    def fixture = {

        DepartureBoard departureBoard = DepartureBoard.configure()
        List<Train> trains = [
            new Train(destination: 'Weybridge', scheduled: '09:00', expected:'10:00'),
            new Train(destination: 'London Waterloo', scheduled: '08:30', expected:'09:21'),
            new Train(destination: 'London Waterloo via Hounslow and Weybridge', scheduled: '08:20', expected:'8:45')
        ]

        Random r = new Random()
        departureBoard.next = trains[r.nextInt(3)]
        departureBoard.second = trains[r.nextInt(3)]
        departureBoard.third = trains[r.nextInt(3)]

        return render(departureBoard as JSON)

    }

    def empty = {
        DepartureBoard departureBoard = DepartureBoard.configure(new XmlSlurper().parseText("<tbody><tr><td>x</td><td></td></tr></tbody>"))
        return render(departureBoard as JSON)
    }

}
