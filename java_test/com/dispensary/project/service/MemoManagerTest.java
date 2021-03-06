/*
 */

package com.dispensary.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Test;

import cn.org.rapid_framework.test.context.TestMethodContext;
import static junit.framework.Assert.*;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.dispensary.project.model.*;
import com.dispensary.project.dao.*;
import com.dispensary.project.service.*;
import com.dispensary.project.vo.query.*;

/**
 * @author jxx
 * @version 1.0
 * @since 1.0
 */


public class MemoManagerTest extends BaseManagerTestCase{

	private MemoManager manager;
	
	@Autowired
	public void setMemoManager(MemoManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/Memo.xml",
                            "classpath:testdata/Memo_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		Memo obj = newMemo();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getId());
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	
	}
	
	public static Memo newMemo() {
		Memo obj = new Memo();
		
	  	obj.setUserId(new java.lang.Integer("1"));
	  	obj.setTitle(new java.lang.String("1"));
	  	obj.setContent(new java.lang.String("1"));
	  	obj.setAttachment(new java.lang.String("1"));
	  	obj.setDate(new java.util.Date(System.currentTimeMillis()));
	  	obj.setStatus(new java.lang.Integer("1"));
		return obj;
	}
}
