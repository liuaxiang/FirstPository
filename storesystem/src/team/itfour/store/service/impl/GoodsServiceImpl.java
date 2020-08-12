package team.itfour.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.itfour.store.dao.GoodsDao;
import team.itfour.store.entity.Goods;
import team.itfour.store.service.GoodsService;

@Service
@Transactional(rollbackFor = Exception.class)
public class GoodsServiceImpl extends AbstractServiceImpl<Goods> implements GoodsService {
	@Autowired
	private GoodsDao goodsDao;
}
