package hyunook.CartAdd;

public interface CartAddMapper {
  int addCart(AddCart addcart); 
  int checkCart(AddCart addcart);
  int purchaseCheck(AddCart addcart);
}
