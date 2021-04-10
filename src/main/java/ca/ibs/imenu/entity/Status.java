package ca.ibs.imenu.entity;

/**
 * Status - This is an ENUM limiting the statuses that are used for orders in the application
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
public enum Status {
    OPEN("Open"),CONFIRMED("Confirmed"), IN_PROGRESS("In progress"),DELIVERED("Delivered"),PAID("Paid");

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
