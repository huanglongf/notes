## 1. 用switch
```
switch(invoiceInformation.getCheckedStatus()){
			case InvoiceMoreCheck.NOT_CHECK_INVOICE:
				model.addAttribute(ISCHECK,FAILURE_FLAG);
				model.addAttribute(Constants.RESULT_DATA, invoiceInformation);
				break;
			case InvoiceMoreCheck.CAN_CHECK_INVOICE:
				model = this.compareTo(invoiceInformation, model,nextMorningZeroDate);
				break;
			case InvoiceMoreCheck.THE_NEXT_MORNING_AT_TWO_AM:
				model = this.compareTo(invoiceInformation, model,nextMorningTwoDate);
				break;
			case InvoiceMoreCheck.TWENTY_FOUR_HOURS_LATER:
				model = this.compareTo(invoiceInformation, model,twentyFourHoursDate);
				break;
			case InvoiceMoreCheck.ONE_HOURS_LATER:
				model = this.compareTo(invoiceInformation, model,oneHourDate);
				break;
			case InvoiceMoreCheck.AMOUNT_MODIFY:
				String checkAmount = invoiceInformationService.getFinaceInvoiceAmount();
				invoiceInformation.setErrorCode("目前仅支持单张大于"+checkAmount+"元的发票查验，感谢您的使用！");
				model.addAttribute(ISCHECK,SUCCESS_FLAG);
				model.addAttribute(Constants.RESULT_DATA, invoiceInformation);
				break;
			case InvoiceMoreCheck.ZERO_HOURS_LATER:
				model = this.compareTo(invoiceInformation, model,nextMorningZeroDate);
				break;
				default:
			}
```
## 2. 将公共的部分提取出来 新建一个函数
```
private ModelMap compareTo(InvoiceInformation invoiceInformation,ModelMap model,String compareDate){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNow=sdf.format(new Date(System.currentTimeMillis()));
		
		if(dateNow.compareTo(compareDate) >= 0){
			model.addAttribute(ISCHECK,SUCCESS_FLAG);
			model.addAttribute(Constants.RESULT_DATA, invoiceInformation);
			return model;
		}
		model.addAttribute(ISCHECK,FAILURE_FLAG);
		model.addAttribute(Constants.RESULT_DATA, invoiceInformation);
		return model;
		
	}
```
```
case InvoiceMoreCheck.CAN_CHECK_INVOICE:
				model = this.compareTo(invoiceInformation, model,nextMorningZeroDate);
				break;
			case InvoiceMoreCheck.THE_NEXT_MORNING_AT_TWO_AM:
				model = this.compareTo(invoiceInformation, model,nextMorningTwoDate);
				break;
			case InvoiceMoreCheck.TWENTY_FOUR_HOURS_LATER:
				model = this.compareTo(invoiceInformation, model,twentyFourHoursDate);
				break;
			case InvoiceMoreCheck.ONE_HOURS_LATER:
				model = this.compareTo(invoiceInformation, model,oneHourDate);
				break;
```