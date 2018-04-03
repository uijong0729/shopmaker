package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bordertable;
@Repository
public class BordertableDAO implements BordertableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bordertable> selectbordertable(int ordercode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BordertableMapper.class).selectbordertable(ordercode);
	

	}

}