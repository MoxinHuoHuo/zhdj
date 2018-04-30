package com.zeng.zhdj.unity;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface ExcelField {
	/**
	 * 导出到excel中的名字
	 */
	public abstract String name();

	/**
	 * 配置列的名称，对应A,B,C,D
	 */
	public abstract String column();

	/**
	 * 提示信息
	 */
	public abstract String prompt() default "";

	/**
	 * 设置只能选择不能输入的内容
	 */
	public abstract String[] combo() default {};

	/**
	 * 是否导出数据
	 */
	public abstract boolean isExport() default true;
}
