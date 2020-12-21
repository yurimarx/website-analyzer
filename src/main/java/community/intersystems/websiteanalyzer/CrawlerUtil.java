package community.intersystems.websiteanalyzer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Pattern;

import edu.uci.ics.crawler4j.crawler.Page;
import edu.uci.ics.crawler4j.crawler.WebCrawler;
import edu.uci.ics.crawler4j.parser.HtmlParseData;
import edu.uci.ics.crawler4j.url.WebURL;

public class CrawlerUtil extends WebCrawler {

	private final static Pattern FILTERS = Pattern.compile(".*(\\.(css|js|gif|jpg|png|mp3|mp4|zip|gz))$");

	@Override
	public boolean shouldVisit(Page referringPage, WebURL url) {
		System.out.println("shouldVisit: " + url.getURL().toLowerCase());

		String href = url.getURL().toLowerCase();
		boolean result = !FILTERS.matcher(href).matches();

		if (result)
			System.out.println("URL Should Visit");
		else
			System.out.println("URL Should not Visit");

		return result;
	}

	@Override
    public void visit(Page page) {
        String url = page.getWebURL().getURL();
        System.out.println("URL: " + url);

        if (page.getParseData() instanceof HtmlParseData) {
            HtmlParseData htmlParseData = (HtmlParseData) page.getParseData();      
            String text = htmlParseData.getText(); //extract text from page
            String html = htmlParseData.getHtml(); //extract html from page
            Set<WebURL> links = htmlParseData.getOutgoingUrls();

            System.out.println("---------------------------------------------------------");
            System.out.println("Page URL: " + url);
            System.out.println("Text length: " + text.length());
            System.out.println("Html length: " + html.length());
            System.out.println("Number of outgoing links: " + links.size());
            System.out.println("---------------------------------------------------------");
            
            final String OS = System.getProperty("os.name").toLowerCase();
    		
            FileOutputStream outputStream;
            
            File file;
			
            try {
				
				if(OS.indexOf("win") >= 0) {
					file = new File("c:\\crawler\\nlp" + UUID.randomUUID().toString() + ".txt");
				} else {
					file = new File("/var/crawler/nlp/" + UUID.randomUUID().toString() + ".txt");
				}
				
				outputStream = new FileOutputStream(file);
				
				byte[] strToBytes = text.getBytes();
	            
				outputStream.write(strToBytes);
	            
				outputStream.close();
	            
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
    }
}
