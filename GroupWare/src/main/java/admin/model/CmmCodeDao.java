package admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("CmmCodeDao")
public class CmmCodeDao {
	
		private final String namespace = "admin.model.Admin";
		@Autowired
		SqlSessionTemplate sqlSessionTemplate;

		public List<CmmCodeBean> getAllCmmCode() {

			List<CmmCodeBean> lists = sqlSessionTemplate.selectList(namespace+".getAllCmmCode");
			
			return lists;
		}
		
}
