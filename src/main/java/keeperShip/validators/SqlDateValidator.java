package keeperShip.validators;

import java.sql.Date;

public class SqlDateValidator extends FieldValidator<String> {

	
	public SqlDateValidator(String fieldName){
		type="DateFormat";
		this.fieldName=fieldName;
	}
	
	@Override
	public String getError() {
		return "Error en "+ fieldName + ". Ingrese una fecha en el formato yyyy-mm-dd.";
	}

	@Override
	public boolean isCorrect(String value) {
		try{
			Date.valueOf(value);
				return true;
		}catch(Exception e){
			return false;
		}
	}

}
