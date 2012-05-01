package train.departures

import groovy.util.slurpersupport.GPathResult

class TrainDeparturesTagLib {

    DepartureBoardService departureBoardService

    static namespace = 'departures'

    def resources = {
        out << g.javascript([library:'jquery', plugin:'jquery'], "")
        out << render(plugin:'train-departures', template:'/trains/resources')
        out << g.javascript([library:'smoothscroll', plugin:'train-departures'], "")
        out << g.javascript([library:'jquery.periodicalupdater', plugin:'train-departures'], "")
        out << '<style type="text/css" media="screen">'
        out << "   @import url( ${resource(plugin:'train-departures', dir:'css', file:'departureboard.css')} );"
        out << "</style>"
    }

    def board = { Map attrs ->

        out << g.render(template:'/trains/departures', plugin:'train-departures', model: [from:attrs.from ?: 'BFD'])
    }

}
