package com.zeng.zhdj.shiro.action;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.zeng.zhdj.wy.entity.User;
import com.zeng.zhdj.wy.entity.flowUser;
import com.zeng.zhdj.wy.service.UserService;
import com.zeng.zhdj.wy.service.flowUserService;

public class FlowRealm extends AuthorizingRealm {

	@Resource
	private UserService userservice;
	@Resource
	private flowUserService flowuserservice;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		String tel = (String) principals.getPrimaryPrincipal();
		if (userservice.selcetByTel(tel) != null) {

			User user = userservice.selcetByTel(tel);
			// 将权限存入set
			String[] jurisdiction = StringUtils.split(user.getRole()
					.getRolePower(), ",");

			Set<String> privilegeSet = new HashSet<String>();
			for (int i = 0; i < jurisdiction.length; i++) {
				privilegeSet.add(jurisdiction[i]);
			}
			Set<String> roleSet = new HashSet<String>();
			roleSet.add(String.valueOf(user.getRole().getRoleName()));
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.setRoles(roleSet);// 角色
			info.setStringPermissions(privilegeSet);// 权限
			System.out.println("见风使舵即可发送即可很快"+roleSet+privilegeSet);
			return info;
		}else{
			flowUser flowuser=new flowUser();
			flowuser.setFlowUserTel(tel);
			flowUser user = flowuserservice.selectByinformation(flowuser);
			// 将权限存入set
			String[] jurisdiction = StringUtils.split(
					user.getRole().getRolePower(), ",");

			Set<String> privilegeSet = new HashSet<String>();
			for (int i = 0; i < jurisdiction.length; i++) {
				privilegeSet.add(jurisdiction[i]);
			}
			Set<String> roleSet = new HashSet<String>();
			roleSet.add(String.valueOf(user.getRole().getRoleName()));
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.setRoles(roleSet);// 角色
			info.setStringPermissions(privilegeSet);// 权限
			System.out.println("见风使舵即可发送即可很快");
			return info;
			}
			
		
	}
		
		
	

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		flowUser user = new flowUser();

		// 1. 把AuthenticationToken转换为CustomizedToken
		CustomizedToken customizedToken = (CustomizedToken) token;
		// 2. 从CustomizedToken中获取tel
		String tel = customizedToken.getUsername();
		user.setFlowUserTel(tel);
		// 3. 若用户不存在，抛出UnknownAccountException异常
		user = flowuserservice.selectByinformation(user);
		if (user == null)
			throw new UnknownAccountException("用户不存在！");
		// 4.
		// 根据用户的情况，来构建AuthenticationInfo对象并返回，通常使用的实现类为SimpleAuthenticationInfo
		// 以下信息从数据库中获取
		// （1）principal：认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
		Object principal = tel;
		// （2）credentials：密码
		Object credentials = user.getFlowUserPassword();
		// （3）realmName：当前realm对象的name，调用父类的getName()方法即可
		String realmName = getName();

		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,
				credentials, realmName);
		
		return info;
	}

}