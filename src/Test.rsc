module Test

import IO;
import List;
import Map;
import Relation;
import Set;
import analysis::graphs::Graph;
import util::Resources;
import lang::java::jdt::m3::Core;
import lang::java::m3::AST;
import vis::Figure;
import vis::Render;
import vis::KeySym;


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
	
	println("(8d)");
	println((graph+)["A"]);
	
	println("(8e)");
	println(alles - (graph*)["C"]);
	
	println("(8f)");
	println((a:size(invert(graph)[a]) | a <- alles));
}

public set[loc] javaBestanden(Resource project) {
   return { a | /file(a) <- project, a.extension == "java" };
}

public void exercise9(){
	Resource jabber = getProject(|project://JabberPoint/|);
	set[loc] bestanden = javaBestanden(jabber);
	
	println("(9a)");
	println(size(bestanden));
	
	println("(9b)");
	map[loc, int] regels = ( a:size(readFileLines(a)) | a <- bestanden );
   	for (<a, b> <- sort(toList(regels), bool(tuple[&a, num] x, tuple[&a, num] y){ return x[1] > y[1]; }))
      println("<a.file>: <b> regels");
   	
   	
   	println("(9c)");
   	M3 model = createM3FromEclipseProject(|project://JabberPoint/|);
   	methoden =  { <x,y> | <x,y> <- model.containment
                       , x.scheme=="java+class"
                       , y.scheme=="java+method" || y.scheme=="java+constructor" 
                       };
    telMethoden = { <a, size(methoden[a])> | a <- domain(methoden) };
   	for (<a,n> <- sort(telMethoden, bool(tuple[&a, num] x, tuple[&a, num] y){ return x[1] > y[1]; }))
     	println("<a>: <n> methoden");
   	
	println("(9d)");
    subklassen = invert(model.extends);
    telKinderen = { <a, size((subklassen+)[a])> | a <- domain(subklassen) };
    for (<a, n> <- sort(telKinderen, bool(tuple[&a, num] x, tuple[&a, num] y){ return x[1] > y[1]; }))
       println("<a>: <n> subklassen");

}

public list[&T] copy(int n, &T element) {
   return [ element | _ <- [0..n] ];
}

Figure redSquares  = hcat(copy(10, box(size(40), fillColor("red"))), gap(30), resizable(false));

public void exercise10a() {
   render("red squares", redSquares);
} 

public Figure shapeSwitch() {
   bool status = true;
   
   // local call-back function
   bool changeStatus(int butnr, map[KeyModifier,bool] modifiers) { 
      status = !status; 
      return true;
   };
   
   Figure s1 = box(size(40), fillColor("red"), resizable(false), onMouseDown(changeStatus));
   Figure s2 = ellipse(size(40), fillColor("green"), resizable(false), onMouseDown(changeStatus));
   
   return computeFigure(Figure() {return status ? s1 : s2;});
}

public void exercise10b() {
   render("click on square", shapeSwitch());
} 

map[str, int] jabberSizes = 
   ("AboutBox.java":28, "Accessor":30, "BitmapItem":67, "DemoPresentation":50,
    "JabberPoint":37, "KeyController":44, "MenuController":109, "Presentation":107,
    "Slide":85, "SlideItem": 38, "SlideViewerComponent":62, "SlideViewerFrame":36,
    "Style.java":57, "TextItem.java":108, "XMLAccessor":112);

Figure jabberTreemap = treemap([ box(text(s),area(n),fillColor(arbColor())) | <s,n> <- toRel(jabberSizes) ]);

public void exercise10c() {
   render("JabberPoint treemap", jabberTreemap);
}




