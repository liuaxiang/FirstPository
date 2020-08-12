package team.itfour.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import team.itfour.store.entity.Goods;
import team.itfour.store.entity.Pager;
import team.itfour.store.entity.Result;
import team.itfour.store.service.GoodsService;
import team.itfour.store.util.FileResult;
import team.itfour.store.util.Fileuploadutil;


@RestController
@RequestMapping("/sys/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	//查询商品
	@RequestMapping("list")
	public Pager<Goods> findList(Goods goods,@RequestParam(name = "page" ,defaultValue = "1")   Integer page, @RequestParam(name = "rows" ,defaultValue = "10")    Integer size) {	
		Pager<Goods> pager = new Pager<>(page, size);
		System.out.println("商品查询");
		pager.setCondition(goods);
		List<Goods> list = goodsService.findByPager(pager);
		int total = goodsService.findTotalByPager(pager);
		pager.setTotal(total);
		pager.setRows(list);
		System.out.println(pager);
		
		//返回的对象网页或浏览器 不能识别，需要转成json字符串；使用jackson进行转换
		return pager;
	}
	
	//添加商品
	@RequestMapping("add")
	public Result add(Goods goods,MultipartFile imageFile,HttpServletRequest request) {
		Result result = new Result(false, "新增失败,商品名已存在");
		System.out.println("add:"+goods);
		if (imageFile != null && !imageFile.isEmpty()) {//Fileuploadutil.java
			FileResult fileResult = Fileuploadutil.uploadFile(request.getServletContext(), imageFile);
			if (!fileResult.getSuccess()) {
				return new Result(false, fileResult.getMsg());				
			}
			String serverFileString = fileResult.getServerPath();
			System.out.println(fileResult.getServerPath());
			goods.setMainFigure(serverFileString);
		}
		
		try {
			
			boolean ret = goodsService.add(goods);
			if (ret) {
				result = new Result(true, "新增成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("edit")
	public Result edit(Goods goods,MultipartFile imageFile,HttpServletRequest request) {
		
		if (imageFile != null && !imageFile.isEmpty()) {//Fileuploadutil.java
			FileResult fileResult = Fileuploadutil.uploadFile(request.getServletContext(), imageFile);
			if (!fileResult.getSuccess()) {
				return new Result(false, fileResult.getMsg());				
			}
			String serverFileString = fileResult.getServerPath();
			System.out.println("图片名"+fileResult.getServerPath());
			goods.setMainFigure(serverFileString);
		}
		
		System.out.println("进来：edit" +goods);
		Result result = new Result(false, "修改失败");
		try {
			boolean ret = goodsService.edit(goods);
			if(ret) {
				result = new Result(true, "修改成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("delete")
	public Result delete(Goods goods) {
		System.out.println("delete:"+goods);
		Result result = new Result(false, "删除失败");
		try {
			boolean ret = goodsService.delete(goods);
			if(ret) {
				result = new Result(true, "删除成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
