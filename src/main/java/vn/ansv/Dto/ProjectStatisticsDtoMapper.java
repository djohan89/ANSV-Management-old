package vn.ansv.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProjectStatisticsDtoMapper implements RowMapper<ProjectStatisticsDto> {

	public ProjectStatisticsDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		ProjectStatisticsDto statistics = new ProjectStatisticsDto();
		
		statistics.setType(rs.getString("type"));
		statistics.setPriority(rs.getString("priority"));
		statistics.setStatus(rs.getString("status"));
		
		return statistics;
	}

}
