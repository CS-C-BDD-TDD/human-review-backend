package org.openapitools.model.humanreview;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * a hr field is being updated
 */
@ApiModel(description = "a hr field is being updated")
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

public class FieldUpdatePutBody   {
  @JsonProperty("original_value")
  private String originalValue = null;

  @JsonProperty("accepted_value")
  private String acceptedValue = null;

  @JsonProperty("field_name")
  private String fieldName = null;

  @JsonProperty("action_type")
  private String actionType = null;

  public FieldUpdatePutBody originalValue(String originalValue) {
    this.originalValue = originalValue;
    return this;
  }

  /**
   * Get originalValue
   * @return originalValue
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getOriginalValue() {
    return originalValue;
  }

  public void setOriginalValue(String originalValue) {
    this.originalValue = originalValue;
  }

  public FieldUpdatePutBody acceptedValue(String acceptedValue) {
    this.acceptedValue = acceptedValue;
    return this;
  }

  /**
   * Get acceptedValue
   * @return acceptedValue
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getAcceptedValue() {
    return acceptedValue;
  }

  public void setAcceptedValue(String acceptedValue) {
    this.acceptedValue = acceptedValue;
  }

  public FieldUpdatePutBody fieldName(String fieldName) {
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

  public FieldUpdatePutBody actionType(String actionType) {
    this.actionType = actionType;
    return this;
  }

  /**
   * Get actionType
   * @return actionType
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getActionType() {
    return actionType;
  }

  public void setActionType(String actionType) {
    this.actionType = actionType;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    FieldUpdatePutBody fieldUpdatePutBody = (FieldUpdatePutBody) o;
    return Objects.equals(this.originalValue, fieldUpdatePutBody.originalValue) &&
        Objects.equals(this.acceptedValue, fieldUpdatePutBody.acceptedValue) &&
        Objects.equals(this.fieldName, fieldUpdatePutBody.fieldName) &&
        Objects.equals(this.actionType, fieldUpdatePutBody.actionType);
  }

  @Override
  public int hashCode() {
    return Objects.hash(originalValue, acceptedValue, fieldName, actionType);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class FieldUpdatePutBody {\n");
    
    sb.append("    originalValue: ").append(toIndentedString(originalValue)).append("\n");
    sb.append("    acceptedValue: ").append(toIndentedString(acceptedValue)).append("\n");
    sb.append("    fieldName: ").append(toIndentedString(fieldName)).append("\n");
    sb.append("    actionType: ").append(toIndentedString(actionType)).append("\n");
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

