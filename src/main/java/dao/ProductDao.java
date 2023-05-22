package dao;

import java.util.List;

import util.DaoHelper;
import vo.Category;
import vo.Product;

public class ProductDao {
	
	public void updateProduct(Product product) {
		DaoHelper.update("productDao.updateProduct", product.getName(),
													 product.getMaker(),
													 product.getPrice(),
													 product.getDiscountPrice(),
													 product.getStock(),
													 product.getDescription(),
													 product.getOnSell(),
													 product.getCategory().getNo(),
													 product.getNo());
	}
	
	/**
	 * 전달받은 상품정보에 해당하는 상품정보를 삭제한다.
	 * @param productNo 삭제할 상품번호
	 */
	public void deleteProduct(int productNo) {
		DaoHelper.update("productDao.deleteProduct", productNo);
	}
	
	/**
	 * 전달받은 상품번호에 해당하는 상품정보를 조회해서 반환한다.
	 * @param productNo 조회할 상품의 번호
	 * @return 상품번호
	 */
	public Product getProductByNo(int productNo) {
		return DaoHelper.selectOne("productDao.getProductByNo", rs -> {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setMaker(rs.getString("product_maker"));
			product.setDescription(rs.getString("product_description"));
			product.setPrice(rs.getInt("product_price"));
			product.setDiscountPrice(rs.getInt("product_discount_price"));
			product.setOnSell(rs.getString("product_on_sell"));
			product.setStock(rs.getInt("product_stock"));
			product.setUpdateDate(rs.getDate("product_update_date"));
			product.setCreateDate(rs.getDate("product_create_date"));
			
			Category cat= new Category();
			cat.setNo(rs.getInt("cat_no"));
			cat.setName(rs.getString("cat_name"));
			product.setCategory(cat);
			
			return product;
		}, productNo);
	}
	
	/**
	 * 새 상품정보를 전달받아서 테이블에 저장한다.
 	 * @param product 새 상품정보가 포함된 Product객체
	 */
	public void insertProduct(Product product) {
		DaoHelper.update("productDao.insertProduct", product.getName(),
													 product.getMaker(),
													 product.getDescription(),
													 product.getPrice(),
													 product.getDiscountPrice(),
													 product.getStock(),
													 product.getCategory().getNo());
		
	}
	
	/**
	 * 전체 상품목록을 반환한다.
	 * @return 전체 상품 목록
	 */
	public List<Product> getProducts (){
		return DaoHelper.selectList("productDao.getProducts", rs -> {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setMaker(rs.getString("product_maker"));
			product.setPrice(rs.getInt("product_price"));
			product.setDiscountPrice(rs.getInt("product_discount_price"));
			
			return product;
		});
	}

}
