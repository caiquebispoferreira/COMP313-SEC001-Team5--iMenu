package ca.ibs.imenu.entity;

/**
 * Role - This is an ENUM limiting the roles that can be used in the application
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
public enum Role {
    ADMINISTRATOR("Administrator"),STAFF("Staff");

    private String value;

    private Role(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public String toString() {
        return value;
    }
}
