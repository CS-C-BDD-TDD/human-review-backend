package org.openapitools.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.openapitools.model.APIOptionsVerb;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * APIOptionsResultList
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-09-28T12:48:27.866-04:00[America/New_York]")

public class APIOptionsResultList   {
  @JsonProperty("POST")
  private APIOptionsVerb POST = null;

  @JsonProperty("GET")
  private APIOptionsVerb GET = null;

  @JsonProperty("PUT")
  private APIOptionsVerb PUT = null;

  @JsonProperty("DELETE")
  private APIOptionsVerb DELETE = null;

  @JsonProperty("OPTIONS")
  private APIOptionsVerb OPTIONS = null;

  public APIOptionsResultList POST(APIOptionsVerb POST) {
    this.POST = POST;
    return this;
  }

  /**
   * Get POST
   * @return POST
  **/
  @ApiModelProperty(value = "")

  @Valid

  public APIOptionsVerb getPOST() {
    return POST;
  }

  public void setPOST(APIOptionsVerb POST) {
    this.POST = POST;
  }

  public APIOptionsResultList GET(APIOptionsVerb GET) {
    this.GET = GET;
    return this;
  }

  /**
   * Get GET
   * @return GET
  **/
  @ApiModelProperty(value = "")

  @Valid

  public APIOptionsVerb getGET() {
    return GET;
  }

  public void setGET(APIOptionsVerb GET) {
    this.GET = GET;
  }

  public APIOptionsResultList PUT(APIOptionsVerb PUT) {
    this.PUT = PUT;
    return this;
  }

  /**
   * Get PUT
   * @return PUT
  **/
  @ApiModelProperty(value = "")

  @Valid

  public APIOptionsVerb getPUT() {
    return PUT;
  }

  public void setPUT(APIOptionsVerb PUT) {
    this.PUT = PUT;
  }

  public APIOptionsResultList DELETE(APIOptionsVerb DELETE) {
    this.DELETE = DELETE;
    return this;
  }

  /**
   * Get DELETE
   * @return DELETE
  **/
  @ApiModelProperty(value = "")

  @Valid

  public APIOptionsVerb getDELETE() {
    return DELETE;
  }

  public void setDELETE(APIOptionsVerb DELETE) {
    this.DELETE = DELETE;
  }

  public APIOptionsResultList OPTIONS(APIOptionsVerb OPTIONS) {
    this.OPTIONS = OPTIONS;
    return this;
  }

  /**
   * Get OPTIONS
   * @return OPTIONS
  **/
  @ApiModelProperty(value = "")

  @Valid

  public APIOptionsVerb getOPTIONS() {
    return OPTIONS;
  }

  public void setOPTIONS(APIOptionsVerb OPTIONS) {
    this.OPTIONS = OPTIONS;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    APIOptionsResultList apIOptionsResultList = (APIOptionsResultList) o;
    return Objects.equals(this.POST, apIOptionsResultList.POST) &&
        Objects.equals(this.GET, apIOptionsResultList.GET) &&
        Objects.equals(this.PUT, apIOptionsResultList.PUT) &&
        Objects.equals(this.DELETE, apIOptionsResultList.DELETE) &&
        Objects.equals(this.OPTIONS, apIOptionsResultList.OPTIONS);
  }

  @Override
  public int hashCode() {
    return Objects.hash(POST, GET, PUT, DELETE, OPTIONS);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class APIOptionsResultList {\n");
    
    sb.append("    POST: ").append(toIndentedString(POST)).append("\n");
    sb.append("    GET: ").append(toIndentedString(GET)).append("\n");
    sb.append("    PUT: ").append(toIndentedString(PUT)).append("\n");
    sb.append("    DELETE: ").append(toIndentedString(DELETE)).append("\n");
    sb.append("    OPTIONS: ").append(toIndentedString(OPTIONS)).append("\n");
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

