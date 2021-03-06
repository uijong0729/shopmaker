package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Atemplate;
@Repository
public class AtemplateDAO implements AtemplateMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Atemplate> selectatemplate(int templatecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AtemplateMapper.class).selectatemplate(templatecode);
	

	}

	public void savepage(Atemplate at) {
		AtemplateMapper mapper = session.getMapper(AtemplateMapper.class);
		try {
			mapper.savepage(at);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Atemplate loadpage(String string) {
		AtemplateMapper mapper = session.getMapper(AtemplateMapper.class);
		Atemplate at = new Atemplate();
		try {
			at = mapper.loadpage(string);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return at;
	}

	public void deleteShop(String membercode) {
		AtemplateMapper mapper = session.getMapper(AtemplateMapper.class);
		try {
			mapper.deleteShop(membercode);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Atemplate getPage(String link) {
		// TODO Auto-generated method stub
		AtemplateMapper mapper = session.getMapper(AtemplateMapper.class);
		Atemplate at = new Atemplate();
		try {
			at = mapper.getPage(link);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return at;
	}
	

}
