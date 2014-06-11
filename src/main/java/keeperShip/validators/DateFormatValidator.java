package keeperShip.validators;

import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class DateFormatValidator extends FieldValidator<String> {

	DateTimeFormatter dateTimeParser =
		    DateTimeFormat.forPattern("dd/MM/yyyy");
	
	public DateFormatValidator(String fieldName) {
		this.type = "DateFormat";
		this.fieldName = fieldName;
	}
	
	@Override
	public String getError() {
		return "El campo "+fieldName+" no tiene formato de fecha.";
	}

	
	@Override
	public boolean isCorrect(String value) {
		try{
			dateTimeParser.parseDateTime(value);
		}catch(IllegalArgumentException e){
			return false;
		}
		return true;
	}

}
