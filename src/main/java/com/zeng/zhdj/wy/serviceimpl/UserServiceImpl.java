package com.zeng.zhdj.wy.serviceimpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zeng.zhdj.unity.Page;
import com.zeng.zhdj.wy.dao.UserMapper;
import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.service.UserService;
@Service
public class UserServiceImpl implements UserService{
@Resource
private UserMapper usermapper;
	@Override
	public int insert(User entity) throws Exception {
		
		return usermapper.insert(entity);
	}

	@Override
	public int update(User entity) throws Exception {
		
		return usermapper.update(entity);
	}

	@Override
	public int delete(User entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User select(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public Page<User> selectPageUseDyc(Page<User> page) {
		List<User> list = usermapper.selectPageListUseDyc(page);
		
		int count = usermapper.selectPageCount(page);
		page.setList(list);
		page.setTotalRecord(count);
		return page;
	}

	@Override
	public int checkTel(String tel) {
	
		return usermapper.checkTel(tel);
	}

	@Override
	public User login(User user) {
		
		return usermapper.selectlogin(user);
	}

	@Override
	public Page<User> selectPage(Page<User> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> SelectByName(String UserName) {
		
		return usermapper.SelectByName(UserName);
	}

	@Override
	public int makeHistory(User user) {
		
		return usermapper.makeHistory(user);
	}

	@Override
	public User selcetByTel(String tel) {
		
		return usermapper.selectByTel(tel);
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return usermapper.selectByPrimaryKey(id);
	}

	@Override
	public int Admin(User user) {
		// TODO Auto-generated method stub
		return  usermapper.Admin(user);
	}

	@Override
	public int deleteByPrimaryKey(int userId) {
		// TODO Auto-generated method stub
		return usermapper.deleteByPrimaryKey(userId);
	}

	@Override
	
		public List<Integer> selectPowerId(int []userId){
			List<User>list=usermapper.selectPowerId(userId);
			List<Integer>listPower=new ArrayList<Integer>();
			for(int i=0;i<list.size();i++){
			int id=list.get(i).getNode().getPowerId();
			listPower.add(id);
			}
			return listPower;
			
			
		}

	@Override
	public List<Integer> selectUserId(int treeId) {
		// TODO Auto-generated method stub
		return usermapper.selectUserId(treeId);
	}

	@Override
	public Page<User> selectPageUseDycI(Page<User> page, String distinction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getAdminMsgByTreeId(int treeId) {
		
		return usermapper.getAdminMsgByTreeId(treeId);
	}

	@Override
	public User getSecretaryMsyByTreeId(int treeId) {
		// TODO Auto-generated method stub
		return usermapper.getSecretaryMsyByTreeId(treeId);
	}

	@Override
	public List<User> selectAllAdmin() {
		// TODO Auto-generated method stub
		return usermapper.selectAllAdmin();
	}

	@Override
	public int deleteByTreeId(int treeeId) {
		// TODO Auto-generated method stub
		return usermapper.deleteByTreeId(treeeId);
	}
	}

	


