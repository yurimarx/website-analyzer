package community.intersystems.websiteanalyzer;

import edu.uci.ics.crawler4j.crawler.CrawlConfig;
import edu.uci.ics.crawler4j.crawler.CrawlController;
import edu.uci.ics.crawler4j.fetcher.PageFetcher;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtConfig;
import edu.uci.ics.crawler4j.robotstxt.RobotstxtServer;

public class CrawlerLocalTest {

	public static void main(String[] args) {
		final int MAX_CRAWL_DEPTH = 0;
		final int NUMBER_OF_CRAWELRS = 2;
		final String CRAWL_STORAGE = "c:\\crawler\\storage";

		/*
		 * Instantiate crawl config
		 */
		CrawlConfig config = new CrawlConfig();
		config.setCrawlStorageFolder(CRAWL_STORAGE);
		config.setMaxDepthOfCrawling(MAX_CRAWL_DEPTH);

		/*
		 * Instantiate controller for this crawl.
		 */
		PageFetcher pageFetcher = new PageFetcher(config);
		RobotstxtConfig robotstxtConfig = new RobotstxtConfig();
		RobotstxtServer robotstxtServer = new RobotstxtServer(robotstxtConfig, pageFetcher);

		CrawlController controller;
		try {
			controller = new CrawlController(config, pageFetcher, robotstxtServer);
			/*
			 * Add seed URLs
			 */
			controller.addSeed("http://srilanka.travel-culture.com/sri-lanka-gov-links.shtml");

			/*
			 * Start the crawl.
			 */
			controller.start(CrawlerUtil.class, NUMBER_OF_CRAWELRS);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
