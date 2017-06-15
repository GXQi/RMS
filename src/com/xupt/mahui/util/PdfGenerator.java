package com.xupt.mahui.util;

import java.io.ByteArrayInputStream;  
import java.io.OutputStream;  
import javax.xml.parsers.DocumentBuilder;  
import javax.xml.parsers.DocumentBuilderFactory;  
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;
import com.lowagie.text.pdf.BaseFont;  


public class PdfGenerator {
	 /** 
     * Output a pdf to the specified outputstream 
     *  
     * @param htmlStr the htmlstr 
     * @param out the specified outputstream 
     * @throws Exception 
     */  
    public static void generate(String htmlStr, OutputStream out)  
            throws Exception {  
        DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();  
        Document doc = builder.parse(new ByteArrayInputStream(htmlStr.getBytes()));  
        ITextRenderer renderer = new ITextRenderer(); 
        renderer.setDocument(doc, null); 
        ITextFontResolver fontResolver = renderer.getFontResolver();  
        fontResolver.addFont(Config.template+"simsun.ttc", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        renderer.getSharedContext().setBaseURL(Config.image); 
        renderer.layout();  
        renderer.createPDF(out);  
        out.flush();
        out.close();  
    }  
  
}
