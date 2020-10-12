package ca.ibs.imenu.entity;

public enum Category {
    APPETIZERS("Appetizers"),
    BEVERAGE("Beverages"),
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
