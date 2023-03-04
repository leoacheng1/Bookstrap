package com.bookstrap.harry.service;

import java.io.FileInputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.SpineReference;
import nl.siegmann.epublib.epub.EpubReader;

@Service
@Transactional
public class EpubService {
		
	
//	public String getBookHtml(String filePath) {
//        try (FileInputStream fis = new FileInputStream(filePath)) {
//            Book book = (new EpubReader()).readEpub(fis);
//            String html = new String(book.getContents().get(0).getData());
//            return html;
//        } catch (IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
	
	
	 public String getBookHtml(String filePath) {
	        try (FileInputStream fis = new FileInputStream(filePath)) {
	            Book book = (new EpubReader()).readEpub(fis);
	            String html = "<html><head><title>" + book.getTitle() + "</title></head><body>";
	            for (SpineReference spine : book.getSpine().getSpineReferences()) {
	                Resource resource = spine.getResource();
	                String content = new String(resource.getData());
	                html += "<h1>" + resource.getTitle() + "</h1><div>" + content + "</div>";
	            }
	            html += "</body></html>";
	            return html;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	
	
	
}
