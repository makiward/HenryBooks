
package business;

/**
 *
 * @author Heather Ward
 */
public class Book {
    private String bookID, title, author;   //BOOKID MUST BE A STRING!!
    private int onHand;
    private double price;
    
    public Book(String bookID, String title, String author, double price, int onHand) {
        this.bookID = bookID;
        this.title = title;
        this.author = author;
        this.price = price;
        this.onHand = onHand;
        
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public int getOnHand() {
        return onHand;
    }

    public void setOnHand(int onHand) {
        this.onHand = onHand;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
