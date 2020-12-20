package community.intersystems.websiteanalyzer;

import edu.uci.ics.crawler4j.crawler.CrawlConfig;
import edu.uci.ics.crawler4j.crawler.CrawlController;
import edu.uci.ics.crawler4j.fetcher.PageFetcher;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtConfig;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtServer;

public class CrawlerService {

	public String execute(String website, Integer depth, Integer pages) {
		final int MAX_CRAWL_DEPTH = depth;
		final int NUMBER_OF_CRAWELRS = pages;
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
			
			return "success";

		} catch (Exception e) {
			return e.getMessage();
		}

	}

}
