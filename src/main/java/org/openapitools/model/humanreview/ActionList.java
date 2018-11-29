package org.openapitools.model.humanreview;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * ActionList
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

public class ActionList   {
  @JsonProperty("actions")
  @Valid
  private List<String> actions = new ArrayList<>();

  public ActionList actions(List<String> actions) {
    this.actions = actions;
    return this;
  }

  public ActionList addActionsItem(String actionsItem) {
    this.actions.add(actionsItem);
    return this;
  }

  /**
   * Get actions
   * @return actions
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public List<String> getActions() {
    return actions;
  }

  public void setActions(List<String> actions) {
    this.actions = actions;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ActionList actionList = (ActionList) o;
    return Objects.equals(this.actions, actionList.actions);
  }

  @Override
  public int hashCode() {
    return Objects.hash(actions);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ActionList {\n");
    
    sb.append("    actions: ").append(toIndentedString(actions)).append("\n");
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

