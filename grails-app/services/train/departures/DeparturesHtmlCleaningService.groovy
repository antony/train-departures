package train.departures

import org.htmlcleaner.HtmlCleaner
import org.htmlcleaner.TagNode

import groovy.util.slurpersupport.GPathResult
import org.htmlcleaner.CleanerProperties

import org.htmlcleaner.XPather
import org.htmlcleaner.XmlSerializer
import org.htmlcleaner.SimpleXmlSerializer
import train.departures.exception.DepartureInformationAvailabilityException

class DeparturesHtmlCleaningService {

    static transactional = false

    GPathResult clean(URL url) {

        HtmlCleaner cleaner = new HtmlCleaner()
        CleanerProperties props = cleaner.getProperties()

        props.setTranslateSpecialEntities(true)

        TagNode node = cleaner.clean(url)

        StringWriter captured = new StringWriter()

        XPather xpather = new XPather("//div[@class='tbl-cont']/table")
        Object[] table = xpather.evaluateAgainstNode(node)

        XmlSerializer serializer = new SimpleXmlSerializer(props)

        if (table.length != 1) {
            throw new DepartureInformationAvailabilityException()
        }

        serializer.write((TagNode)table[0], captured, 'utf-8')

        return new XmlSlurper().parseText(captured.toString())

    }
}
