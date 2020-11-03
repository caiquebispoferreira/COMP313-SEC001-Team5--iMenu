package ca.ibs.imenu.entity;

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
