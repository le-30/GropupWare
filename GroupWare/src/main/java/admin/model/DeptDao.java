package admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("DeptDao")
public class DeptDao {
		
		private final String namespace = "admin.model.Admin";
		@Autowired
		SqlSessionTemplate sqlSessionTemplate;

		public List<DeptBean> getAllDept() {
			
			List<DeptBean> lists = sqlSessionTemplate.selectList(namespace+".getAllDept");
			
			return lists;
		}
		
}
