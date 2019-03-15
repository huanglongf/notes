package cn.boccfc.finace.invoice.action;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import redis.clients.jedis.Jedis;

public class RedisTest {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Jedis jedis = new Jedis("127.0.0.1");
		jedis.auth("0okm(IJN");
		//查看服务是否运行
		System.out.println("服务正在运行: "+jedis.ping());
		System.out.println("连接成功");

//		jedis.set("myKey2", "www.runoob.com");
//        System.out.println("redis 存储的字符串为: "+jedis.get("myKey2"));
//        
//        jedis.lpush("list", "11");//lpush 在list头部添加元素
//        jedis.lpush("list", "23");
//        jedis.lpush("list", "32");
//        List<String> list = jedis.lrange("list", 0 ,1);
//        for(String str : list) {
//        	 System.out.println("list列表项为: "+str);
//        }
//        
//        jedis.rpush("list2", "22");//rpush 在list尾部添加元素
//        jedis.rpush("list2", "33");
//        jedis.rpush("list2", "44");
//        List<String> list2 = jedis.lrange("list2", 0 ,1);
//        for(String str : list2) {
//        	 System.out.println("list2列表项为: "+str);
//        }
//        
		
        Set<String> keys = jedis.keys("*");
        
        for(String str : keys){
        	
        	System.out.print(str +" ");
        }
        
	}
}
