package validation;
//Class Code to validate Email entered by user in registration form.
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ValidEmail2 implements ConstraintValidator<ValidEmail, String> 
{
	private int min;

	@Override
	public void initialize(ValidEmail constraintAnnotation) 
	{
		min = constraintAnnotation.min();
	}
	
	@Override
	public boolean isValid(String email, ConstraintValidatorContext context) 
	{
		if(email.length() >= min) 
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	
}
