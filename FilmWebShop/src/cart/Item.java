package cart;


public class Item implements java.io.Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String productCode;
	public String name;
    public String description;
    public String genre;
    public String duration;
    public double price;
    public int year;

    public Item()
    {
    }

    public Item(String aProductCode, String aDescription, String aName, String aGenre, String aDuration,
        double aPrice, int aYear)
    {
        productCode = aProductCode;
        description = aDescription;
        name = aName;
        genre = aGenre;
        duration = aDuration;
        price = aPrice;
        year = aYear;
    }

// Make get/set methods so the attributes will appear
// as bean attributes.

    public String getProductCode() { return productCode; }
    public void setProductCode(String aProductCode) {
        productCode = aProductCode; }
    
    public String getName() { return name; }
    public void setName(String aName) {
        name = aName; }
    
    public String getGenre() { return genre; }
    public void setGenre(String aGenre) {
        genre = aGenre; }
    
    
    public String getDuration() { return duration; }
    public void setDuration(String aDuration) {
        duration = aDuration; }

    public String getDescription() { return description; }
    public void setDescription(String aDescription) {
        description = aDescription; }

    public double getPrice() { return price; }
    public void setPrice(double aPrice) { price = aPrice; }

    public int getQuantity() { return year; }
    public void setQuantity(int aYear) { year = aYear; }
}
