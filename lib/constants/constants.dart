const PAYMENT_URL = 'http://10.0.2.2:5000/fire-a0276/us-central1/customFunctions/payment';
const ORDER_DATA = 
{
	"custID":"CUST_123456789",
	"custEmail":"abc@abc.com",
	"custPhone":"1111111111"
};
const STATUS_LOADING = "PAYMENT_LOADING";
const STATUS_SUCCESSFUL = "PAYMENT_SUCCESSFUL";
const STATUS_PENDING = "PAYMENT_PENDING";
const STATUS_FAILED = "PAYMENT_FAILED";
const STATUS_CHECKSUM_FAILED = "PAYMENT_CHECKSUM_FAILED";