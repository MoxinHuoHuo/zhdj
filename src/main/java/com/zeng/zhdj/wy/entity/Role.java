package com.zeng.zhdj.wy.entity;

public class Role {
    private Integer roleId;//角色id

    private String roleName;//角色名称

    private String rolePower;//角色id

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRolePower() {
        return rolePower;
    }

    public void setRolePower(String rolePower) { this.rolePower = rolePower == null ? null : rolePower.trim(); }
}