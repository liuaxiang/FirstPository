package team.itfour.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.itfour.store.dao.GoodsTypeDao;
import team.itfour.store.entity.GoodsType;
import team.itfour.store.service.GoodsTypeService;

@Service
@Transactional(rollbackFor = Exception.class)
public class GoodsTypeServiceImpl extends AbstractServiceImpl<GoodsType> implements GoodsTypeService {
	@Autowired
	private GoodsTypeDao goodsTypeDao;
}
