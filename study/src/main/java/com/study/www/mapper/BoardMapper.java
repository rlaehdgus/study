package com.study.www.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.study.www.dto.BoardVO;
import com.study.www.service.BoardPager;

@Repository
public class BoardMapper {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.study.www.mapper.BoardMapper";
	
	//게시글 목록 조회
	public List<BoardVO> BoardList(int start, int end, String searchOption, String keyword) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		// BETWEEN #{start}, #{end}에 입력될 값을 맵에 저장
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(Namespace+".BoardList", map);
	}
	
	//게시글 등록
	public void write_add(BoardVO boardVo) throws Exception {
		
		sqlSession.insert(Namespace+".write_add", boardVo);
	}
	
	//게시글 레코드 개수
	public int countArticle(String searchOption, String keyword) throws Exception {

		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectOne(Namespace + ".countArticle", map);
	}
	
	public BoardVO boardInfo(BoardVO boardVo) throws Exception {
		
		return sqlSession.selectOne(Namespace+".BoardInfo", boardVo);
	}
	
	public void write_update(BoardVO boardVo) throws Exception {
		
		sqlSession.update(Namespace+".write_update", boardVo);
	}
}
