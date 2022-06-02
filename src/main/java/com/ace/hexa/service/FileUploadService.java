package com.ace.hexa.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public void fileUpload(MultipartFile file) throws IllegalStateException, IOException {
		file.transferTo(
				new File("C:\\Users\\Ahkar Toe Maw\\eclipse-workspace\\hexaProject\\src\\main\\resources\\static\\img\\"
						+ file.getOriginalFilename()));
	}

}
