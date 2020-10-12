package ca.ibs.imenu.entity;

public enum Status {
    OPEN("Open"),IN_PROGRESS("In progress"),DELIVERED("Delivered"),PAID("Paid");

    private String value;

    private Status(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public String toString() {
        return value;
    }
}
