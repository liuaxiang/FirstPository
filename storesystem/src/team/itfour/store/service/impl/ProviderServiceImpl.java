package team.itfour.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.itfour.store.dao.ProviderDao;
import team.itfour.store.entity.Provider;
import team.itfour.store.service.ProviderService;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProviderServiceImpl extends AbstractServiceImpl<Provider> implements ProviderService{
	@Autowired
	private ProviderDao providerDao;
}
