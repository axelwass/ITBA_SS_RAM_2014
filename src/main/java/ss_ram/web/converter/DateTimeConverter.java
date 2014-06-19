package ss_ram.web.converter;



import org.joda.time.DateTime;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;




@Component
public class DateTimeConverter implements Converter<DateTime, String>{
	
	
	public DateTimeConverter() {

	}

	@Override
	public String convert(DateTime arg0) {
		// TODO Auto-generated method stub
		return arg0.getDayOfMonth() + "/" + arg0.getMonthOfYear() +"/"+ arg0.getYear();
	}


}
