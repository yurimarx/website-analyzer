package community.intersystems.websiteanalyzer;

import com.intersystems.enslib.pex.BusinessOperation;
import com.intersystems.gateway.GatewayContext;
import com.intersystems.jdbc.IRIS;
import com.intersystems.jdbc.IRISObject;


import edu.uci.ics.crawler4j.crawler.CrawlConfig;
import edu.uci.ics.crawler4j.crawler.CrawlController;
import edu.uci.ics.crawler4j.fetcher.PageFetcher;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtConfig;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtServer;


public class WebsiteAnalyzerOperation extends BusinessOperation {

	// Connection to InterSystems IRIS
    private IRIS iris;

	@Override
	public void OnInit() throws Exception {
		iris = GatewayContext.getIRIS();
	}
	
	@Override
	public Object OnMessage(Object request) throws Exception {
		IRISObject req = (IRISObject) request;
		
		String website = req.getString("Website");
		Long depth = req.getLong("Depth");
		Long pages = req.getLong("Pages");
		
		String result = executeCrawler(website, depth, pages);
		IRISObject response = (IRISObject)(iris.classMethodObject("Ens.StringContainer","%New", result));
        
		return response;
	}
	
	public String executeCrawler(String website, Long depth, Long pages) {

		final int MAX_CRAWL_DEPTH = depth.intValue();
		final int NUMBER_OF_CRAWELRS = pages.intValue();
		
		final String OS = System.getProperty("os.name").toLowerCase();
		
		String CRAWL_STORAGE = "";
		
		if(OS.indexOf("win") >= 0) {
			CRAWL_STORAGE = "c:\\crawler\\storage";
		} else {
			CRAWL_STORAGE = "/var/crawler/storage";
		}

		CrawlConfig config = new CrawlConfig();
		config.setCrawlStorageFolder(CRAWL_STORAGE);
		config.setMaxDepthOfCrawling(MAX_CRAWL_DEPTH);

		PageFetcher pageFetcher = new PageFetcher(config);
		RobotstxtConfig robotstxtConfig = new RobotstxtConfig();
		RobotstxtServer robotstxtServer = new RobotstxtServer(robotstxtConfig, pageFetcher);

		CrawlController controller;
		try {
			controller = new CrawlController(config, pageFetcher, robotstxtServer);

			controller.addSeed(website);

			controller.start(CrawlerUtil.class, NUMBER_OF_CRAWELRS);
			
			return "website extracted with success";

		} catch (Exception e) {
			return e.getMessage();
		}

	}

	@Override
	public void OnTearDown() throws Exception {
		
	}

}
