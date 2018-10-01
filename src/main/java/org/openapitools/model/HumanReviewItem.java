package org.openapitools.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * HumanReviewItem
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-09-28T12:48:27.866-04:00[America/New_York]")

public class HumanReviewItem   {
  @JsonProperty("stix_id")
  private Integer stixId = null;

  public HumanReviewItem stixId(Integer stixId) {
    this.stixId = stixId;
    return this;
  }

  /**
   * Get stixId
   * @return stixId
  **/
  @ApiModelProperty(value = "")


  public Integer getStixId() {
    return stixId;
  }

  public void setStixId(Integer stixId) {
    this.stixId = stixId;
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
    return Objects.equals(this.stixId, humanReviewItem.stixId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(stixId);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class HumanReviewItem {\n");
    
    sb.append("    stixId: ").append(toIndentedString(stixId)).append("\n");
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

