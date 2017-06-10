package cakes.dao;
import cakes.pojo.Sorder;

import java.sql.Connection;
import java.sql.SQLException;

public interface ISorder {

	public void saveSorder(Sorder sorder,int fid,Connection conn) throws SQLException;
}
