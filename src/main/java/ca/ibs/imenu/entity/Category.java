package ca.ibs.imenu.entity;
/**
 * Category - This is an ENUM limiting the categories that can be used for a product
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
public enum Category {
    APPETIZER("Appetizer"),
    BEVERAGE("Beverage"),
    MAIN_COURSE("Main Course");
    private String value;

    private Category(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public String toString() {
        return value;
    }
}
