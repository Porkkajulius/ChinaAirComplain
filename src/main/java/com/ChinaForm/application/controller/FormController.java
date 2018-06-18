package com.ChinaForm.application.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

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
import com.itextpdf.text.pdf.PdfWriter;
import com.ChinaForm.application.util.SendMail;


@Controller
@RequestMapping(value = "/")
public class FormController {

	@Autowired
	private SendMail sposti;
	

	 String applicantInformation=null;
	

		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String sentHetu(Model model) throws IOException {
			
			model.addAttribute("applicantInformation", applicantInformation);
			return "index";
		}


		@RequestMapping(value = "/", method = RequestMethod.POST)
		public String getHetu(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("aircraftName") String aircraftName) throws DocumentException, IOException {

			
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream("iTextHelloWorld.pdf"));
			 
			document.open();
			Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
			Chunk chunk = new Chunk(name+id+aircraftName,font);
			 
			document.add(chunk);
			document.close();
			
			System.out.println("Nimi lomakkeelta: "+name);	
			
			  String to = name;
		      String subject = (id);
		      String body = (aircraftName);	      
			      sposti.sendMail(to, subject, body);

		  
			return "redirect:/";
		}
	

}