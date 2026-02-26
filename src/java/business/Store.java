
package business;

/**
 *
 * @author Heather Ward
 */
public class Store {
    private int storeID, storeEmp;
    private String storeName, storeAddress;
    
    public Store() {
        this.storeID = 0;
        this.storeEmp = 0;
        this.storeName = "";
        this.storeAddress = "";
    }

    public int getStoreID() {
        return storeID;
    }

    public void setStoreID(int storeID) {
        this.storeID = storeID;
    }

    public int getStoreEmp() {
        return storeEmp;
    }

    public void setStoreEmp(int storeEmp) {
        this.storeEmp = storeEmp;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }
}
