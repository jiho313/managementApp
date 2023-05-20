package dao;

import java.util.List;

import util.DaoHelper;
import vo.Customer;

public class CustomerDao {
	/**
	 * 고객 아이디를 입력받아 고객 정보를 삭제한다.
	 * @param custId 삭제할 고객의 아이디
	 */
	public void deleteCustomerById(String custId) {
		DaoHelper.update("customerDao.deleteCustomerById", custId);
	}
	
	/* SQL 직접적인 값을 넣어 DB에 반영하는 것은 보안상 좋지 않으므로, 변경된 Customer 객체의 값을 가져와
	*  SQL문에 반영하는 방법을 택했다.
	*  또한 객체의 변경된 값을 반영하기 때문에 해당 메서드를 재사용할 수 있다.
	*/
	/**
	 * 변경된 Customer객체의 필드 값을 데이터 베이스에 저장시킨다.
	 * @param customer 변경된 필드의 값이 담긴 Customer객체
	 */
	public void UpdateCustomer(Customer customer) {
		DaoHelper.update("customerDao.UpdateCustomer", customer.getCustDisabled(),
													   customer.getCustPassword(),
													   customer.getCustName(),
													   customer.getCustTel(),
													   customer.getCustEmail(),
													   customer.getCustUpdateDate(),
													   customer.getCustId());
	}
	
	/**
	 * 고객의 상세 정보를 출력한다.
	 * @param custId 상제 정보를 조회할 고객 아이디
	 * @return 고객의 상세 정보를 담은 List<Customer>객체
	 */
	public Customer getCustomerById(String custId) {
		return DaoHelper.selectOne("customerDao.getCustomerById", rs -> {
			Customer customer = new Customer();
			
			customer.setCustId(rs.getString("cust_id"));
			customer.setCustPassword(rs.getString("cust_password"));
			customer.setCustName(rs.getString("cust_name"));
			customer.setCustTel(rs.getString("cust_tel"));
			customer.setCustEmail(rs.getString("cust_email"));
			customer.setCustPoint(rs.getInt("cust_point"));
			customer.setCustDisabled(rs.getString("cust_disabled"));
			customer.setCustCreateDate(rs.getDate("cust_create_date"));
			customer.setCustUpdateDate(rs.getDate("cust_update_date"));
			
			return customer;
		}, custId);
	}
	
	/**
	 * 전체 고객목록을 출력한다.
	 * @return 전체 고객 목록
	 */
	public List<Customer> getCustomers() {
		return DaoHelper.selectList("customerDao.getCustomers", rs -> {
			Customer customer = new Customer();
			
			customer.setCustId(rs.getString("cust_id"));
			customer.setCustName(rs.getString("cust_name"));
			customer.setCustTel(rs.getString("cust_tel"));
			customer.setCustEmail(rs.getString("cust_email"));
			customer.setCustDisabled(rs.getString("cust_disabled"));
			
			return customer;
		});
	}
	
	/**
	 * 회원가입 폼에서 입력한 고객정보를 전달받아서 고객정보를 저장시킨다.
	 * @param customer 저장할 회원 정보를 담은 Customer 객체
	 */
	public void insertCustomer(Customer customer) {
		DaoHelper.update("customerDao.insertCustomer", customer.getCustId(),
													   customer.getCustPassword(),
													   customer.getCustName(),
													   customer.getCustTel(),
													   customer.getCustEmail());
		
	}

}
