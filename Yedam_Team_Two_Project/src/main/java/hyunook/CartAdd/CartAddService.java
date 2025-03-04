package hyunook.CartAdd;

public interface CartAddService {
   boolean cartAdd(AddCart addcart);
   int cartCheck(AddCart addcart);
   int purchaseCheck(AddCart addcart);
}
