package team.itfour.store.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.itfour.store.entity.GoodsType;
import team.itfour.store.entity.Pager;
import team.itfour.store.entity.Result;
import team.itfour.store.service.GoodsTypeService;


@RestController
@RequestMapping("/sys/goodsType")
public class GoodsTypeController {
	@Autowired
	private GoodsTypeService goodsTypeService;
	
	
	@RequestMapping("goodstypelist")
	public List<GoodsType> goodsTypeList() {	
		System.out.println("类型查询");
		List<GoodsType> list = goodsTypeService.findByPager(null);
		// 返回的对象网页或浏览器 不能识别，需要转成json字符串；使用jackson进行转换
		return list;
	}
	
	//商品类型查询
	@RequestMapping("list")
	public Pager<GoodsType> searchGoodsTypet(GoodsType goodsType,@RequestParam(name = "page" ,defaultValue = "1") Integer page, @RequestParam(name = "rows" ,defaultValue = "10") Integer size) {	
		Pager<GoodsType> paper = new Pager<>(page, size);
		System.out.println("类型查询："+goodsType);
		paper.setCondition(goodsType);
		List<GoodsType> list = goodsTypeService.findByPager(paper);
		int total = goodsTypeService.findTotalByPager(paper);
		paper.setTotal(total);
		paper.setRows(list);
		return paper;
	}
	
	
	
	//添加商品类型
	@RequestMapping("add")
	public Result addGoodsTpye(GoodsType goodsType) {
		System.out.println("添加商品类型:"+goodsType);
		Result result = new Result(false, "新增失败,商品类型已存在");
		boolean ret = goodsTypeService.add(goodsType);
		if (ret) {
			result = new Result(true, "新增成功");
		}
		return result;
	}
	
	//修改商品类型
	@RequestMapping("edit")
	public Result editGoodsTpye(GoodsType goodsType) {
		System.out.println("修改商品类型:"+goodsType);
		Result result = new Result(false, "修改失败");
		boolean ret = goodsTypeService.edit(goodsType);
		if (ret) {
			result = new Result(true, "修改成功");
		}
		return result;
	}
	
	//删除商品类型
	@RequestMapping("delete")
	public Result deleteGoodsTpye(GoodsType goodsType) {
		Result result = new Result(false, "删除失败");
		boolean ret = goodsTypeService.delete(goodsType);
		if (ret) {
			result = new Result(true, "删除成功");
		}
		return result;
	}

}
