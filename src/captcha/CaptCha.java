package captcha;
 
import static nl.captcha.Captcha.NAME;
 
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;
 
public class CaptCha {
    private static final long serialVersionUID = 1L;
    private static int _width = 150; //�̹��� ����ũ��
    private static int _height = 50; //�̹��� ����
    private static int _fontsize = 44; //��Ʈũ��
    /*private static final String NAME = "captcha";*/
 
    public CaptCha() {
        super();
    }
 
    public void getCaptCha(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        try {
                
            // ��Ʈ ���� =========================================================
            List<Font> fontList = new ArrayList<Font>();
            fontList.add(new Font("", Font.HANGING_BASELINE, 40));//
            fontList.add(new Font("Courier", Font.ITALIC, 40));
            fontList.add(new Font("", Font.PLAIN, 40));
 
            List<Color> colorList = new ArrayList<Color>();
            // colorList.add(Color.green);
            // colorList.add(Color.pink);
            // colorList.add(Color.gray);
            colorList.add(Color.black);
            // colorList.add(Color.blue);
            // ��Ʈ ���� =========================================================
 
            Captcha captcha = new Captcha.Builder( _width, _height)
                    // .addText(wordRenderer)                    
                    .addText(new NumbersAnswerProducer(6), //6�ڸ� ���ڷ� �� ���ڸ� �߰�
                    new DefaultWordRenderer(colorList, fontList)) //���� �ٹ̱�(����, ��Ʈ)
                    .gimp(new DropShadowGimpyRenderer()).gimp()
                    // BlockGimpyRenderer,FishEyeGimpyRenderer,RippleGimpyRenderer,ShearGimpyRenderer,StretchGimpyRenderer
                    .addNoise().addNoise().addBorder()
                    .addBackground(new GradiatedBackgroundProducer()) 
                    // FlatColorBackgroundProducer,SquigglesBackgroundProducer,TransparentBackgroundProducer
                    .build();
 
            req.getSession().setAttribute(NAME, captcha);
            CaptchaServletUtil.writeImage(resp, captcha.getImage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void makeTextImage(HttpServletRequest request, 
			HttpServletResponse response, String textType)
					throws ServletException, IOException {
		
		List<java.awt.Color> textColors = Arrays.asList(Color.DARK_GRAY);
		List<java.awt.Font> textFonts = Arrays.asList(
		new Font("Arial", Font.ITALIC, 40), 
		new Font("Courier", Font.PLAIN, 40));			

		Captcha captcha = new Captcha.Builder(140, 60)

		.addText(new NumbersAnswerProducer(5), new DefaultWordRenderer(textColors,textFonts))
		.gimp()
		.addBackground()
		.build();	

		request.getSession().setAttribute(Captcha.NAME, captcha.getAnswer());
		CaptchaServletUtil.writeImage(response, captcha.getImage());

	}
	
	public static void makeTextAudio(HttpServletRequest request,
			HttpServletResponse response, String textType)
					throws ServletException, IOException {

		String capAnswer = (String)request.getSession().getAttribute(Captcha.NAME);
		if(capAnswer != null && !"".trim().equals(capAnswer)){
			SetKorVoiceProducer vProd = new SetKorVoiceProducer();		
			AudioCaptcha ac = new AudioCaptcha.Builder()
			.addAnswer(new SetTextProducer(capAnswer))
			.addVoice(vProd)
			//.addNoise()
			.build();
			CaptchaServletUtil.writeAudio(response, ac.getChallenge());
		}else{
			// ������ �̹����� ����
		}
	}
}