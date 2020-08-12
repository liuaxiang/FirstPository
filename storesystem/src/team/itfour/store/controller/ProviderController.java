package team.itfour.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import team.itfour.store.entity.GoodsType;
import team.itfour.store.entity.Pager;
import team.itfour.store.entity.Provider;
import team.itfour.store.entity.Result;
import team.itfour.store.service.ProviderService;

@RestController
@RequestMapping("/sys/Provider")
public class ProviderController {
	@Autowired
	private ProviderService providerService;
	
	@RequestMapping("providerList")
	public List<Provider> goodsBrandList() {	
		System.out.println("品牌查询");
		List<Provider> list =providerService.findByPager(null);
		return list;
	}
	
	//供应商查询
	@RequestMapping("list")
	public Pager<Provider> searchGoodsProvider(Provider provider,@RequestParam(name = "page" ,defaultValue = "1") Integer page, @RequestParam(name = "rows" ,defaultValue = "10") Integer size) {	
		Pager<Provider> paper = new Pager<>(page, size);
		System.out.println("供应商查询："+provider);
		paper.setCondition(provider);
		List<Provider> list = providerService.findByPager(paper);
		int total = providerService.findTotalByPager(paper);
		paper.setTotal(total);
		paper.setRows(list);
		return paper;
	}
	
	//添加供应商
	@RequestMapping("add")
	public Result addGoodsProvider(Provider provider) {
		System.out.println("添加供应商:"+provider);
		Result result = new Result(false, "新增失败,商品类型已存在");
		boolean ret = providerService.add(provider);
		if (ret) {
			result = new Result(true, "新增成功");
		}
		return result;
	}
	
	
	//修改供应商
	@RequestMapping("edit")
	public Result editGoodsProvider(Provider provider) {
		System.out.println("修改供应商:"+provider);
		Result result = new Result(false, "修改失败");
		boolean ret = providerService.edit(provider);
		if (ret) {
			result = new Result(true, "修改成功");
		}
		return result;
	}
	
	//删除供应商
	@RequestMapping("delete")
	public Result deleteGoodsProvider(Provider provider) {
		Result result = new Result(false, "删除失败");
		boolean ret = providerService.delete(provider);
		if (ret) {
			result = new Result(true, "删除成功");
		}
		return result;
	}
}
