module Test

import IO;

public void exercise5() {
	println("Hello");
}

public void exercise6(){
	list[str] eu = ["Austria", "Belgium", "Bulgaria", "Czech Republic",
"Cyprus", "Denmark", "Estonia", "Finland", "France", "Germany",
"Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania",
"Luxembourg", "Malta", "The Netherlands", "Poland",
"Portugal", "Romania", "Slovenia", "Slovakia", "Spain",
"Sweden", "United Kingdom"];


	println("(6a)");
	println({ x | x <- eu, /s/i := x });
	println("(6b)");
	println({ x | x <- eu, /e.e/i := x });
	println("(6c)");
	
	println("(6d)");
	
	println("(6e)");
	
	println("(6f)");
	
}

public rel[int, int] delers(int maxnum) {
   return { <a, b> | a <- [1..maxnum], b <- [1..a+1], a%b==0 };
}

public void exercise7() {
	println("(7a)");
	println(delers(100));
	
	
}



