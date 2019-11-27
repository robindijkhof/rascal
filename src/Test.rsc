module Test

import IO;
import List;
import Map;
import Relation;
import Set;

import analysis::graphs::Graph;


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
	
	println("(7b)");
	rel[int, int] d = delers(100);
   	map[int, int] m = (a:size(d[a]) | a <- domain(d));
   	int maxAantal = max(range(m)); 
   	println({ x | x <- domain(d), m[x] == maxAantal });
   	
   	println("(7c)");
	println(sort([ a | a <- domain(m), m[a] == 2 ]));
}

public void exercise8() {
	Graph[str] graph = {<"A","B">, <"A","D">, <"B","D">, <"B","E">, <"C","E">, <"C","F">, <"E","D">, <"E","F">};
	
	println("(8a)");
	set[str] alles = carrier(graph);
	println(size(alles));
	
	println("(8b)");
	println(size(graph));
	
	println("(8c)");
	println(top(graph));
	
	

}




