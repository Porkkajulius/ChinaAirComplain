package com.ChinaForm.application.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

import javax.imageio.ImageIO;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import sun.misc.BASE64Decoder;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.ChinaForm.application.util.SendMail;


@Controller
@RequestMapping(value = "/")
public class FormController {

	@Autowired
	private SendMail sposti;
	

	 String applicantInformation=null;
	 
	 String name="";
	 String id="";
	 String aircraftName="";
	 String passport="";
	

		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String sentUserInformation(Model model) throws IOException {
			
			model.addAttribute("applicantInformation", applicantInformation);
			return "index";
		}


		@RequestMapping(value = "/", method = RequestMethod.POST)
		public String getUserInformation(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("aircraftName") String aircraftName,@RequestParam("passportImageBase64") String passport) throws DocumentException, IOException {

			this.name=name;
			this.id=id;
			this.aircraftName=aircraftName;
			this.passport=passport;
			
			System.out.println(name);
			System.out.println(passport);
			return "redirect:/sign";
		}
		
		@RequestMapping(value = "/sign", method = RequestMethod.GET)
		public String sentSign(Model model) throws IOException {
			
			model.addAttribute("applicantInformation", applicantInformation);
			return "signForm";
		}


		@RequestMapping(value = "/sign", method = RequestMethod.POST)
		public String getSigned(String signature) throws DocumentException, IOException {
			
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream("testi.pdf"));
			
			document.open();
			Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
			Chunk chunk = new Chunk(name+id+aircraftName,font);
			
			Paragraph pEmail = new Paragraph(name);
			Paragraph pId = new Paragraph(id);
			Paragraph pAircraftName = new Paragraph(aircraftName);
			
			String signatureData = signature;			
			String base64ImageSignature = signatureData.split(",")[1];
			byte[] imageBytesSignature = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64ImageSignature);
			
			String passportData = passport;			
			String base64ImagePassport = passportData.split(",")[1];
			byte[] imageBytesPassport = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64ImagePassport);

			Image imageSignature = Image.getInstance(imageBytesSignature);
			Image imagePassport = Image.getInstance(imageBytesPassport);
			
			document.add(pEmail);
			document.add(pId);
			document.add(pAircraftName);
			document.add(imageSignature);
			document.add(imagePassport);
			document.close();
			
			System.out.println("Nimi lomakkeelta: "+name);	
			System.out.println("signature: "+signature.toString());
			  String to = name;
		      String subject = (id);
		      String body = (aircraftName);	      
		      File f = new File("testi.pdf");
			      sposti.sendMail(to, subject, body, f);

			return "redirect:/thankYouPage";
		}
		
		@RequestMapping(value = "/thankYouPage", method = RequestMethod.GET)
		public String getThankYouPage(Model model) throws IOException {
			model.addAttribute("applicantInformation", applicantInformation);
			return "thankYouPage";
		}
	

}