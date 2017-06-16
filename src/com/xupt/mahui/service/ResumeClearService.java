package com.xupt.mahui.service;

import org.apache.ibatis.session.SqlSession;

import com.xupt.mahui.dao.ResumeDao;
import com.xupt.mahui.util.SqlSessionFactoryUtil;

/**
 * 简历数据库信息清除业务逻辑层的处理
 * @author zhangxinyu
 *
 */

public class ResumeClearService {
	/**
	 * 通过电话号码清空数据库中简历的所有信息
	 * @param phonenumber
	 * @return 基本信息
	 */
	public static void ClearAllDataFromPhoneNumber(String phone) {
		SqlSession session = SqlSessionFactoryUtil.getSqlSession();
		ResumeDao resumeDao = session.getMapper(ResumeDao.class);
		resumeDao.deleteEductionExperience(phone);
		resumeDao.deleteProjectExperience(phone);
		resumeDao.deleteWorkExperience(phone);
		resumeDao.deleteResume(phone);
		session.commit();
		
	}
}
