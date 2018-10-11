package org.openapitools.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.time.OffsetDateTime;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * HumanReviewItem
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

public class HumanReviewItem   {
  @JsonProperty("stix_id")
  private String stixId = null;

  @JsonProperty("field_name")
  private String fieldName = null;

  @JsonProperty("field_value")
  private String fieldValue = null;

  @JsonProperty("date")
  private OffsetDateTime date = null;

  @JsonProperty("object_type")
  private String objectType = null;

  @JsonProperty("status")
  private String status = null;

  /**
   * Gets or Sets action
   */
  public enum ActionEnum {
    CONFIRM_RISK("Confirm Risk"),
    
    EDIT("Edit"),
    
    NOT_PII("Not PII"),
    
    REDACT("Redact");

    private String value;

    ActionEnum(String value) {
      this.value = value;
    }

    @Override
    @JsonValue
    public String toString() {
      return String.valueOf(value);
    }

    @JsonCreator
    public static ActionEnum fromValue(String text) {
      for (ActionEnum b : ActionEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      throw new IllegalArgumentException("Unexpected value '" + text + "'");
    }
  }

  @JsonProperty("action")
  private ActionEnum action = null;

  public HumanReviewItem stixId(String stixId) {
    this.stixId = stixId;
    return this;
  }

  /**
   * Get stixId
   * @return stixId
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getStixId() {
    return stixId;
  }

  public void setStixId(String stixId) {
    this.stixId = stixId;
  }

  public HumanReviewItem fieldName(String fieldName) {
    this.fieldName = fieldName;
    return this;
  }

  /**
   * Get fieldName
   * @return fieldName
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getFieldName() {
    return fieldName;
  }

  public void setFieldName(String fieldName) {
    this.fieldName = fieldName;
  }

  public HumanReviewItem fieldValue(String fieldValue) {
    this.fieldValue = fieldValue;
    return this;
  }

  /**
   * Get fieldValue
   * @return fieldValue
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getFieldValue() {
    return fieldValue;
  }

  public void setFieldValue(String fieldValue) {
    this.fieldValue = fieldValue;
  }

  public HumanReviewItem date(OffsetDateTime date) {
    this.date = date;
    return this;
  }

  /**
   * Get date
   * @return date
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull

  @Valid

  public OffsetDateTime getDate() {
    return date;
  }

  public void setDate(OffsetDateTime date) {
    this.date = date;
  }

  public HumanReviewItem objectType(String objectType) {
    this.objectType = objectType;
    return this;
  }

  /**
   * Get objectType
   * @return objectType
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getObjectType() {
    return objectType;
  }

  public void setObjectType(String objectType) {
    this.objectType = objectType;
  }

  public HumanReviewItem status(String status) {
    this.status = status;
    return this;
  }

  /**
   * Get status
   * @return status
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public HumanReviewItem action(ActionEnum action) {
    this.action = action;
    return this;
  }

  /**
   * Get action
   * @return action
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public ActionEnum getAction() {
    return action;
  }

  public void setAction(ActionEnum action) {
    this.action = action;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    HumanReviewItem humanReviewItem = (HumanReviewItem) o;
    return Objects.equals(this.stixId, humanReviewItem.stixId) &&
        Objects.equals(this.fieldName, humanReviewItem.fieldName) &&
        Objects.equals(this.fieldValue, humanReviewItem.fieldValue) &&
        Objects.equals(this.date, humanReviewItem.date) &&
        Objects.equals(this.objectType, humanReviewItem.objectType) &&
        Objects.equals(this.status, humanReviewItem.status) &&
        Objects.equals(this.action, humanReviewItem.action);
  }

  @Override
  public int hashCode() {
    return Objects.hash(stixId, fieldName, fieldValue, date, objectType, status, action);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HumanReviewItem {\n");
    
    sb.append("    stixId: ").append(toIndentedString(stixId)).append("\n");
    sb.append("    fieldName: ").append(toIndentedString(fieldName)).append("\n");
    sb.append("    fieldValue: ").append(toIndentedString(fieldValue)).append("\n");
    sb.append("    date: ").append(toIndentedString(date)).append("\n");
    sb.append("    objectType: ").append(toIndentedString(objectType)).append("\n");
    sb.append("    status: ").append(toIndentedString(status)).append("\n");
    sb.append("    action: ").append(toIndentedString(action)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }
}

