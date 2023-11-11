package com.feedback;

public class FeedbackData {
    private String subject;
    private String section;
    private String percentage;
    private String academicYear;
    private String cycle;

    public FeedbackData(String subject, String section, String percentage, String academicYear, String cycle) {
        this.subject = subject;
        this.section = section;
        this.percentage = percentage;
        this.academicYear = academicYear;
        this.cycle = cycle;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    public String getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(String academicYear) {
        this.academicYear = academicYear;
    }

    public String getCycle() {
        return cycle;
    }

    public void setCycle(String cycle) {
        this.cycle = cycle;
    }
}
