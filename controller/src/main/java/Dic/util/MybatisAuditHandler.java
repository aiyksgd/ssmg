package Dic.util;


import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;

import java.util.Date;


public class MybatisAuditHandler implements MetaObjectHandler {
@Override
public void insertFill(MetaObject metaObject) {
  // 声明自动填充字段
 
	Date now = new Date();
    setFieldValByName("create_time", now, metaObject);
    setFieldValByName("logicFlag", 1, metaObject);
 }



 @Override
 public void updateFill(MetaObject metaObject) {
  // 声明自动填充字段
	
	 setFieldValByName("update_time", new Date(), metaObject);

	 
 }
}

