
package reserva.dao;

import reserva.Site;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SiteDAO {
    private final static String CRIAR_SITE_SQL = "insert into Site"
            + " (url, senha, nome, telefone)"
            + " values (?,?,?,?)";
    
    private final static String BUSCAR_SITE_SQL = "select"
            + " id, nome"
            + " from Site";
    
    DataSource dataSource;

    public SiteDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    public Site gravarSite(Site site) throws SQLException, NamingException {
        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(CRIAR_SITE_SQL, Statement.RETURN_GENERATED_KEYS);) {
            ps.setString(1, site.getUrl());
            ps.setString(2, site.getSenha());
            ps.setString(3, site.getNome());
            ps.setString(4, site.getTelefone());
            ps.execute();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                rs.next();
                site.setId(rs.getInt(1));
            }
        }
        return site;
    }
    
        public List<Site> listarTodasSites() throws SQLException, NamingException {
        List<Site> ret = new ArrayList<>();
        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(BUSCAR_SITE_SQL)) {
            
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Site site = new Site();
                    site.setId(rs.getInt("id"));
                    site.setNome(rs.getString("nome"));                  
                    ret.add(site);
                }
            }
        }
        return ret;
    }
}
