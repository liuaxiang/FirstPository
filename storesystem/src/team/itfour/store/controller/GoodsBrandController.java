package team.itfour.store.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import team.itfour.store.entity.GoodsBrand;
import team.itfour.store.entity.Pager;
import team.itfour.store.entity.Result;
import team.itfour.store.service.GoodsBrandService;

@RestController
@RequestMapping("/sys/goodsBrand")
public class GoodsBrandController {
	@Autowired
	private GoodsBrandService goodsBrandService;
	
	
	@RequestMapping("goodsBrandList")
	public List<GoodsBrand> goodsBrandList() {	
		System.out.println("品牌查询");
		List<GoodsBrand> list =goodsBrandService.findByPager(null);
		// 返回的对象网页或浏览器 不能识别，需要转成json字符串；使用jackson进行转换
		return list;
	}
	
	@RequestMapping("list")
	public Pager<GoodsBrand> findList(GoodsBrand goodsBrand,@RequestParam(name = "page" ,defaultValue = "1")   Integer page, @RequestParam(name = "rows" ,defaultValue = "10")    Integer size) {	
		Pager<GoodsBrand> pager = new Pager<>(page, size);
		System.out.println("商品查询");
		pager.setCondition(goodsBrand);
		List<GoodsBrand> list = goodsBrandService.findByPager(pager);
		int total = goodsBrandService.findTotalByPager(pager);
		pager.setTotal(total);
		pager.setRows(list);
		System.out.println(pager);		
		//返回的对象网页或浏览器 不能识别，需要转成json字符串；使用jackson进行转换
		return pager;
	}
	
	
	//添加商品品牌
	@RequestMapping("add")
	public Result addGoodsTpye(GoodsBrand goodsBrand) {
		System.out.println("添加商品品牌:"+goodsBrand);
		Result result = new Result(false, "新增失败");
		boolean ret = goodsBrandService.add(goodsBrand);
		if (ret) {
			result = new Result(true, "新增成功");
		}
		return result;
	}
		
	//修改商品品牌
	@RequestMapping("edit")
	public Result editGoodsBrand(GoodsBrand goodsBrande) {
		System.out.println("修改商品品牌:"+goodsBrande);
		Result result = new Result(false, "修改失败");
		boolean ret = goodsBrandService.edit(goodsBrande);
		if (ret) {
			result = new Result(true, "修改成功");
		}
		return result;
	}
	

	//删除商品品牌
	@RequestMapping("delete")
	public Result deleteBrandTpye(GoodsBrand goodsBrande) {
		Result result = new Result(false, "删除失败");
		boolean ret = goodsBrandService.delete(goodsBrande);
		if (ret) {
			result = new Result(true, "删除成功");
		}
		return result;
	}
}
