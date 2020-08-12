package team.itfour.store.entity;
/**
 * 
 * @author gao
 *
 */
public class GoodsType {
		//商品编号
		private Integer typeNo; 
		//商品名称
		private String typeName;
		
		
		
		
		public Integer getTypeNo() {
			return typeNo;
		}
		public void setTypeNo(Integer typeNo) {
			this.typeNo = typeNo;
		}
		public String getTypeName() {
			return typeName;
		}
		public void setTypeName(String typeName) {
			this.typeName = typeName;
		}
		public GoodsType(Integer typeNo, String typeName) {
			super();
			this.typeNo = typeNo;
			this.typeName = typeName;
		}
		public GoodsType() {
			super();
		}
		@Override
		public String toString() {
			return "GoodsType [typeNo=" + typeNo + ", typeName=" + typeName + "]";
		}
	
}
