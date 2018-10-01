package org.openapitools.model;

import java.util.Objects;
import io.swagger.annotations.ApiModel;
import com.fasterxml.jackson.annotation.JsonValue;
import javax.validation.Valid;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonCreator;

/**
 * Sort order:   * `approve_all` - Approve entire group as not having PII   * `disseminate` - Mark as resolved and available for dissemination   * `do_not_disseminate` - Mark as resolved and NOT to be disseminated 
 */
public enum GroupAction {
  
  DISSEMINATE("disseminate"),
  
  DO_NOT_DESSIMINATE("do_not_dessiminate"),
  
  APPROVE_ALL("approve_all");

  private String value;

  GroupAction(String value) {
    this.value = value;
  }

  @Override
  @JsonValue
  public String toString() {
    return String.valueOf(value);
  }

  @JsonCreator
  public static GroupAction fromValue(String text) {
    for (GroupAction b : GroupAction.values()) {
      if (String.valueOf(b.value).equals(text)) {
        return b;
      }
    }
    throw new IllegalArgumentException("Unexpected value '" + text + "'");
  }
}

