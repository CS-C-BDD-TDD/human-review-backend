package org.openapitools.model.humanreview;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.Valid;
import javax.validation.constraints.*;

import org.openapitools.model.humanreview.APIEndpointParameters;

/**
 * APIOptionsVerb
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

public class APIOptionsVerb   {
  @JsonProperty("description")
  private String description = null;

  @JsonProperty("parameters")
  private APIEndpointParameters parameters = null;

  @JsonProperty("example")
  private Object example = null;

  public APIOptionsVerb description(String description) {
    this.description = description;
    return this;
  }

  /**
   * Get description
   * @return description
  **/
  @ApiModelProperty(value = "")


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public APIOptionsVerb parameters(APIEndpointParameters parameters) {
    this.parameters = parameters;
    return this;
  }

  /**
   * Get parameters
   * @return parameters
  **/
  @ApiModelProperty(value = "")

  @Valid

  public APIEndpointParameters getParameters() {
    return parameters;
  }

  public void setParameters(APIEndpointParameters parameters) {
    this.parameters = parameters;
  }

  public APIOptionsVerb example(Object example) {
    this.example = example;
    return this;
  }

  /**
   * Get example
   * @return example
  **/
  @ApiModelProperty(value = "")


  public Object getExample() {
    return example;
  }

  public void setExample(Object example) {
    this.example = example;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    APIOptionsVerb apIOptionsVerb = (APIOptionsVerb) o;
    return Objects.equals(this.description, apIOptionsVerb.description) &&
        Objects.equals(this.parameters, apIOptionsVerb.parameters) &&
        Objects.equals(this.example, apIOptionsVerb.example);
  }

  @Override
  public int hashCode() {
    return Objects.hash(description, parameters, example);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class APIOptionsVerb {\n");
    
    sb.append("    description: ").append(toIndentedString(description)).append("\n");
    sb.append("    parameters: ").append(toIndentedString(parameters)).append("\n");
    sb.append("    example: ").append(toIndentedString(example)).append("\n");
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

