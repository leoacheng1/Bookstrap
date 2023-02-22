package com.bookstrap.imafraid.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstrap.imafraid.bean.BlogParagraph;
import com.bookstrap.imafraid.model.BlogParagraphRepository;

@Controller
public class BlogParagraphController {

	@Autowired
	private BlogParagraphRepository BlogParaDao;
	@ResponseBody
	@PostMapping("/blog/newpost")
	public BlogParagraph insert1(){
		BlogParagraph para1 = new BlogParagraph();
		para1.setParagraphCatagory("馬欣｜孤獨眾生相");
		para1.setParagraphTitle("【馬欣專欄】因為愛，我在你的隆冬看到了風和日麗──《日麗》");
		para1.setParagraphAuther("馬欣");
		para1.setParagraphdiv01("童年的回憶何以能影響人一輩子，這部電影足以給人解答。\r\n"
				+ "\r\n"
				+ "《日麗》是以極為幻美而真實的手法，讓你回望回憶好似是被風沙侵蝕，卻留有鋼筋結構的龐然大物。之後它以一顆小砂石的重量，看似輕柔卻足以壓垮你，宛如空中飄飛的「最後一根稻草」。\r\n"
				+ "\r\n"
				+ "這部描述回憶的不確實，但仍將成年後的你一網成擒，充滿了感官與身體的記憶回放，讓你感受到電影名「日麗」那年夏天淡淡的汗味，鹽味蒸發的海岸、看似無聊漫長最後卻一球入袋的假日、父親語焉不詳的笑容、周遭年輕人壯美卻聊賴的青春，其感官意象之豐盛，讓觀眾明確感受到主角雖正在經歷她的夏天，但同時又充滿了「回放」的後座力。\r\n"
				+ "\r\n"
				+ "於是觀眾在看《日麗》彷彿處於兩種時差之間，企圖回望與捕捉當時的吉光片羽。導演都以搖曳的鏡頭與粗粒子的畫面，並穿插回憶，讓你在下一幕就驚覺適才的「當下」就已是「不再」。");
		para1.setParagraphdiv02("在後半生不可能再複製同一個夏天、同一身邊人、同一個懵懂但實則有預感到「童年」將告別的自己，因為它看似是如此平凡無奇的小度假，在一個妝點俗氣的度假村。");
		para1.setParagraphdiv03("但就因為渡假村與度日方式都如平凡，才知道「幸福」本身五味雜陳。\r\n"
				+ "\r\n"
				+ "英文片名《Aftersun》其實更貼切於這電影的故事，因為女主角是一個11歲的孩童，這是非常棒的設定，因為11歲這年齡，看東西仍有動物的直覺且不會迴避，同時還是對大人仍一知半解的年齡。因此孩童的視角所還原的當下，是比攝影機還要直白赤裸的，充滿動物預知自然規律將被改變的強烈直覺。");
		BlogParagraph response = BlogParaDao.save(para1);
		
		return response;
	}
		
	}
