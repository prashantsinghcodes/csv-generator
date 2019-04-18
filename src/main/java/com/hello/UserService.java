package com.hello;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hello.User;
import com.opencsv.CSVWriter;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public void csvWrite() {
		List<User> userlist = (List<User>) userRepository.findAll();
		String filePath = "/home/prashantsingh/Documents/csvfile/file2.csv";
		File file = new File(filePath);
		try {
			FileWriter outputfile = new FileWriter(file);
			CSVWriter writer = new CSVWriter(outputfile);
			String[] header = { "id", "Email", "Name" };
			writer.writeNext(header);
			for (User user : userlist) {
				String[] data1 = { user.getId().toString(), user.getEmail(), user.getName() };
				writer.writeNext(data1);
			}
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
