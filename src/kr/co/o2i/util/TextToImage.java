package kr.co.o2i.util;

import java.util.Map;

import gui.ava.html.image.generator.HtmlImageGenerator;

public class TextToImage {

	
	public static String generator(Map<String, Object> view){
		String url = "";
		
		HtmlImageGenerator imageGenerator = new HtmlImageGenerator();
		imageGenerator.loadHtml(StringUtil.StringNull(view.get("CONTENT")));
		imageGenerator.saveAsImage("hello-world2.png");
		imageGenerator.saveAsHtmlWithMap("hello-world.html", "hello-world2.png");
		imageGenerator.saveAsImage("C:/hello-world2.png");
		return url;
	}
	
}
