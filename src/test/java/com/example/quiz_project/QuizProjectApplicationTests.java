package com.example.quiz_project;

import com.example.quiz_project.dao.QuizQuestionDao;
import com.example.quiz_project.domain.QuizQuestion;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@SpringBootTest
class QuizProjectApplicationTests {
	@Autowired
	private QuizQuestionDao quizQuestionDao;
	@Test
	void contextLoads() {
	}
	@Test
	public void test01() {
		List<QuizQuestion> qqList = new ArrayList<>();
		QuizQuestion qq = new QuizQuestion();
		qq.setQuizId(4);
		qq.setChoiceId(1);
		qq.setQuestionId(1);
		qqList.add(qq);
		QuizQuestion qq1 = new QuizQuestion();
		qq1.setQuizId(4);
		qq1.setChoiceId(6);
		qq1.setQuestionId(2);
		qqList.add(qq1);

		//quizQuestionDao.addBatch(qqList);
	}

	@Test
	public void test02() {
		List<Map<String,Object>> r =quizQuestionDao.getScoreByQuiz(4);
		System.out.println(r.size());
		System.out.println(r);
	}

	@Test
	public void test03() {
		System.out.println(isNumeric("1"));
		System.out.println(isNumeric("01"));
		System.out.println(isNumeric("10"));
	}

	public boolean isNumeric(String str) {
		return str != null && str.matches("-?\\d+(\\.\\d+)?");
	}
}
