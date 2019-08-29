package cart;
import java.util.*;
import java.io.*;

public class ShoppingCart implements java.io.Serializable
{
// The shopping cart items are stored in a Vector.
    protected Vector items;

    public ShoppingCart()
    {
        items = new Vector();
    }

/** Returns a Vector containing the items in the cart. The Vector
 *  returned is a clone, so modifying the vector won't affect the
 *  contents of the cart.
 */
    public Vector getItems()
    {
        return (Vector) items.clone();
    }

    public void addItem(Item newItem)
    {
        items.addElement(newItem);
    }

    public void removeItem(int itemIndex)
    {
        items.removeElementAt(itemIndex);
    }


   
    
}