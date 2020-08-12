package team.itfour.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.itfour.store.dao.GoodsBrandDao;
import team.itfour.store.entity.GoodsBrand;
import team.itfour.store.service.GoodsBrandService;

@Service
@Transactional(rollbackFor = Exception.class)
public class GoodsBrandServiceImpl extends AbstractServiceImpl<GoodsBrand> implements GoodsBrandService{
	@Autowired
	private GoodsBrandDao goodsBrandDao;
}
