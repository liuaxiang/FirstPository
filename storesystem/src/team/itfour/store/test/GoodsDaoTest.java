package team.itfour.store.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import team.itfour.store.dao.GoodsDao;
import team.itfour.store.entity.Goods;
import team.itfour.store.entity.Pager;

public class GoodsDaoTest {
	private GoodsDao goodsDao=null;
	SqlSession session=null;
	
	@Before
	public void inti() {
		try {
			//1.实例化mybaits运行环境
			String resource ="config/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory =new SqlSessionFactoryBuilder().build(inputStream);		
			//2.通过mybatis的bean 工厂获取接口实例 
			//SqlSession是jdbc连接的connection，进行数据库连接
			session=sqlSessionFactory.openSession();
			//使用反射机制实例化数据操作接口,这里使用了工厂设计模式		
			goodsDao =session.getMapper(GoodsDao.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@After 
	public void close() {
		System.out.println("============@After===================="); 
		//5.更新操作需要编码提交事务！ //更新操作代码验证成功后，需要关闭事务！避免发生数据异常，导致测试失败！ - mock测试 
		session.commit(); 
		session.rollback(); 
	}
	
	
	@Test
	public void testFind() {	
		//3.调用接口执行数据库操作
		Pager<Goods> pager = new Pager<>(1, 10);
		pager.setCondition(new Goods());
		List<Goods> list =goodsDao.findByPager(pager);
		//4.处理数据返回结果
		int total=goodsDao.findTotalByPager(pager);
		if(total !=0) {
			System.out.println("查询记录数："+total);
		}
		for(Goods lists : list) {
			System.out.println(lists);
		}
	}
	
	
	public void AddGoods() {			
		Goods object =new Goods(5, "小鱼仔", null, 35, 1.5, null,null,null);
		boolean ret = goodsDao.add(object);
		System.out.println(ret);
		//4.处理数据返回结果 
		if(ret) { 
			System.out.println("新增成功"); 
		}else {
				System.out.println("新增失败！"); 
		}
		//5.更新操作需要编码提交事务！
		//更新操作代码验证成功后，需要关闭事务！避免发生数据异常，导致测试失败！ - mock 测试 //
	}
	
	
	public void EditUser() {
		Goods object =new Goods(10000, "大鱼仔", "ssss", 30,2.0,"不好吃",null,null);
		boolean ret = goodsDao.edit(object);
		System.out.println(ret);
		//4.处理数据返回结果 
		if(ret) { 
			System.out.println("更改成功"); 
		}else {
				System.out.println("更改失败！"); 
		}
	}
	

	public void DeleteUser() {
		Goods object =new Goods(10000);
		boolean ret = goodsDao.delete(object);
		System.out.println(ret);
		//4.处理数据返回结果 
		if(ret) { 
			System.out.println("删除成功"); 
		}else {
				System.out.println("删除失败！"); 
		}
	}
}
