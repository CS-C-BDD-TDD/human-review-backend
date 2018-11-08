package org.openapitools.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

import io.swagger.annotations.ApiModelProperty;

/**
 * HumanReviewItem
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@Entity
@Table(name = "Json_Data")

@SqlResultSetMapping(name="updateResult", columns = { @ColumnResult(name = "count")})

@NamedNativeQueries({
    @NamedNativeQuery(
            name    =   "redactPIIinTitle",
            query   =   "UPDATE json_data \n" +
                    "SET original_json = JSON_REPLACE(original_json, '$.specifications.title', 'PII REDACTED') \n" +
                    "WHERE id=?;"
            ,resultSetMapping = "updateResult"
    ),
    @NamedNativeQuery(
            name    =   "editPIIinTitle",
            query   =   "UPDATE Json_Data \n" +
                    "SET modified_json = JSON_REPLACE(modified_json, ?, ?) \n" +
                    "WHERE stix_id=?;"
            ,resultSetMapping = "updateResult"
    )
})

public class JsonData {
	//@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//private Long id;
	
	@Id
	@Column(name = "stix_id")
	@JsonProperty("stix_id")
	private String stixId = null;
	
	@Column(name = "original_json")
	@JsonProperty("original_json")
	private String originalJson = null;
	
	@Column(name = "modified_json")
	@JsonProperty("modified_json")
	private String modifiedJson = null;

	/**
	 * Gets or Sets action
	 */
	
	/**
	 * Get stixId
	 * 
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
	
	public JsonData stixId(String stixId) {
		this.stixId = stixId;
		return this;
	}
	
	public JsonData originalJson(String originalJson) {
		this.originalJson = originalJson;
		return this;
	}
	
	public String getOriginalJson() {
		return originalJson;
	}

	public void setOriginalJson(String originalJson) {
		this.originalJson = originalJson;
	}

	public JsonData modifiedJson(String modifiedJson) {
		this.modifiedJson = modifiedJson;
		return this;
	}
	
	public String getModifiedJson() {
		return modifiedJson;
	}

	public void setModifiedJson(String modifiedJson) {
		this.modifiedJson = modifiedJson;
	}

	@Override
	public boolean equals(java.lang.Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}
		JsonData humanReviewItem = (JsonData) o;
		return Objects.equals(this.originalJson, humanReviewItem.originalJson)
				&& Objects.equals(this.modifiedJson, humanReviewItem.modifiedJson);
	}

	@Override
	public int hashCode() {
		return Objects.hash( originalJson, modifiedJson);
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("class HumanReviewItem {\n");
		sb.append("    originalJson: ").append(toIndentedString(originalJson)).append("\n");
		sb.append("    modifiedJson: ").append(toIndentedString(modifiedJson)).append("\n");
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
