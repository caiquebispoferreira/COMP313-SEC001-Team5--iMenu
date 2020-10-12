package ca.ibs.imenu.entity;

public enum Role {
    Administrator("Administrator"),Staff("Staff");

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
