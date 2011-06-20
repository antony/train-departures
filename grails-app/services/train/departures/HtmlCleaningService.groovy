package train.departures

import org.htmlcleaner.HtmlCleaner
import org.htmlcleaner.TagNode
import org.w3c.dom.xpath.XPathResult
import groovy.util.slurpersupport.GPathResult
import org.htmlcleaner.CleanerProperties
import org.htmlcleaner.HtmlSerializer
import org.htmlcleaner.SimpleHtmlSerializer
import org.htmlcleaner.XPather
import org.htmlcleaner.XmlSerializer
import org.htmlcleaner.SimpleXmlSerializer

class HtmlCleaningService {

    static transactional = true

    GPathResult clean(URL url) {

        HtmlCleaner cleaner = new HtmlCleaner()
        CleanerProperties props = cleaner.getProperties()

        props.setTranslateSpecialEntities(true)

        TagNode node = cleaner.clean(url)

        StringWriter captured = new StringWriter()

        XPather xpather = new XPather("//div[@class='tbl-cont']/table")
        Object[] table = xpather.evaluateAgainstNode(node)

        XmlSerializer serializer = new SimpleXmlSerializer(props)

        serializer.write((TagNode)table[0], captured, 'utf-8')

        return new XmlSlurper().parseText(captured.toString())

    }
}
