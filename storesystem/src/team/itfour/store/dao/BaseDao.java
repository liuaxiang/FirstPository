package team.itfour.store.dao;


import java.util.List;

import team.itfour.store.entity.Pager;

/**
* @author Fighter
* @date 创建时间：2020年7月3日 上午11:29:15
* @Description 通用的Dao基础接口
*/
public interface BaseDao<T> {
	/**
	 * 通用的新增方法
	 * @param object
	 * @return
	 */
	public boolean add(T object);
	
	/**
	 * 通用的修改方法
	 * @param object
	 * @return
	 */
	public boolean edit(T object);
	
	/**
	 * 通用的删除方法
	 * @param object
	 * @return
	 */
	public boolean delete(T object);
	
	/**
	 * 带条件查询的分页类
	 * @param paper
	 * @return
	 */
	public List<T> findByPager(Pager<T> pager);
	
	/**
	 * 统计查询条件下的记录总数
	 * @param paper
	 * @return
	 */
	public Integer findTotalByPager(Pager<T> pager);
}
