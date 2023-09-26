package com.marondal.marondalgram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	public static final String FILE_UPLOAD_PATH = "/home/ec2-user/upload";
	
	private static Logger logger = LoggerFactory.getLogger(FileManager.class);
	
	// 파일 저장 -> 경로 리턴 
	public static String saveFile(int userId, MultipartFile file) {
		
		
		if(file == null) {
			logger.error("saveFile :: 파일이 없음");
			return null;
		}
		
		// 같은 이름의 파일이 구분되어서 저장되도록 구성
		// 폴더를 만들어서 파일을 저장
		// user Id 값을 폴더 이름에 포함
		// 시간정보를 폴더이름에 포함
		// UNIX TIME : 1970년 1월 1일 부터 흐른 시간을 milli second 로 표현한 방식
		// 폴더 이름 예시 : /10_24654564654/
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 폴더 생성 (디렉토리생성)
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			// 디렉토리 생성 실패
			logger.error("saveFile :: 디렉토리 생성 에러 - 경로 : " + directoryPath);
			return null;
		}
		
		// 파일저장 
		String filePath = null;
		try {
			byte[] bytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			logger.error("saveFile :: 파일 저장 에러 - 경로 : " + filePath);
			e.printStackTrace();
			
			// 파일 저장 실패 
			return null;
		}
		
		// 클라이언트에서 접근하는 경로 문자열
		// 경로 규칙 : /images/10_24654564654/test.png
		// locahost:8080/images/10_24654564654/test.png
		
		return "/images" + directoryName + file.getOriginalFilename();
	}
	
	public static boolean removeFile(String filePath) { // /images/1_1691749458813/cat-8042342_640.jpg
		
		// 파일 정보가 없는경우 
		if(filePath == null) {
			return false;
		}
		
		// 실제 파일이 저장된 파일 경로 만들기 
		// /images/1_1691749458813/cat-8042342_640.jpg
		// D:\\김인규 강사\\web\\20230412\\springProject\\upload\\memo/1_1691749458813/cat-8042342_640.jpg
		// /images 제거하고, 전체 경로에 이어 붙인다. 
		
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(fullFilePath);
		
		// 파일이 존재하는지 
		if(Files.exists(path)) {
			
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;	
			}
		}
		
		Path dirPath = path.getParent();
		
		if(Files.exists(dirPath)) {
			
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return false;
			}
		}
		
		
		return true;
		
	}

}
