package keeperShip.validators;

public class DoubleValidator extends FieldValidator<String> {

	
	public DoubleValidator(String fieldName){
		type="doubleFormat";
		this.fieldName=fieldName;
	}
	
	@Override
	public String getError() {
		return "Error en "+ fieldName + ". Ingrese un numero real.";
	}

	@Override
	public boolean isCorrect(String value) {
		try{
			@SuppressWarnings("unused")
			Double aux = Double.parseDouble(value);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
