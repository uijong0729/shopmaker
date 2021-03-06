package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bproducttable;

@Repository
public class BproducttableDAO implements BproducttableMapper {

	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bproducttable> selectbproducttable(int productcode) {
		// TODO Auto-generated method stub

		return session.getMapper(BproducttableMapper.class).selectbproducttable(productcode);
	}
	

	@Override
	public ArrayList<Bproducttable> selectkind() {
		// TODO Auto-generated method stub
		return session.getMapper(BproducttableMapper.class).selectkind();
	}

	@Override
	public ArrayList<Bproducttable> selectkindproduct(String productkind) {
		// TODO Auto-generated method stub
		System.out.println(productkind);
		return session.getMapper(BproducttableMapper.class).selectkindproduct(productkind);
	}

	@Override
	public ArrayList<Bproducttable> selectallbproducttable() {
		// TODO Auto-generated method stub

		return session.getMapper(BproducttableMapper.class).selectallbproducttable();
	}

	@Override
	public ArrayList<Bproducttable> getProductdetailListByName(String productname) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BproducttableMapper.class).getProductdetailListByName(productname);
	}

	@Override
	public int insertbproducttable(Bproducttable bproducttable) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BproducttableMapper.class).insertbproducttable(bproducttable);
	}

	public int delProduct(String pc) {
		return session.getMapper(BproducttableMapper.class).delProduct(pc);
	}


	@Override
	public ArrayList<Bproducttable> getCart(String customercode) {
		// TODO Auto-generated method stub
		return session.getMapper(BproducttableMapper.class).getCart(customercode);
	}

}
