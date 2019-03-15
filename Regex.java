package cn.boccfc.finace.invoice.action;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regex {

//	private static final String REGEX = "foo";
//    private static final String INPUT = "fooooooooooooooooo";
//    private static final String INPUT2 = "ooooofoooooooooooo";
    private static Pattern pattern;
    private static Matcher matcher;
//    private static Matcher matcher2;
    
//    private static String REGEX = "dog";
//    private static String INPUT = "The dog says meow. " + "All dogs say meow.";
//    private static String REPLACE = "cat";
    private static String REGEX = "a*b";
    private static String INPUT = "aabfooaabfooabfoobkkk";
    private static String REPLACE = "-";
    
	public static void main(String[] args) {
		
		pattern = Pattern.compile(REGEX);
		matcher = pattern.matcher(INPUT);
		
		  INPUT = matcher.replaceAll(REPLACE);
		  StringBuffer sb = new StringBuffer();
	      while(matcher.find()){
	    	  matcher.appendReplacement(sb,REPLACE);
	      }
	      matcher.appendTail(sb);
	      System.out.println(sb.toString());
		
//		pattern = Pattern.compile(REGEX);
//		matcher = pattern.matcher(INPUT);
//		INPUT = matcher.replaceFirst(REPLACE);
//		INPUT = matcher.replaceAll(REPLACE);
//		System.out.println(INPUT);
		
//		String regex = "\\bcat\\b";
//		String str = "you like the cat, the cat is very cute! ";
//		
//		Pattern p = Pattern.compile(regex);
//		Matcher m = p.matcher(str);
//		
//		int count = 0;
//        while(m.find()) {
//        	count++;
//        	System.out.println("start : "+m.start());
//        	System.out.println("end : "+m.end());
//        }
        
       
        
//        pattern = Pattern.compile(REGEX);
//        matcher = pattern.matcher(INPUT);
//        matcher2 = pattern.matcher(INPUT2);
//        System.out.println("lookingAt(): "+matcher.lookingAt()); //能匹配到就行
//        System.out.println("matches(): "+matcher.matches()); //整个string都得匹配到
//        System.out.println("lookingAt(): "+matcher2.lookingAt());
	}

}
