package reserva.dao;

import reserva.Hotel;
import reserva.Promocao;
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
import java.util.Date;

public class PromocaoDAO {
 
    private final static String CRIAR_PROMOCAO_SQL = "insert into Promocao"
            + " (preco, dataInicial, dataFinal, site, hotel)"
            + " values (?,?,?,?,?)";

    private final static String LISTAR_PROMOCAO_SQL = "select"
            + " p.id as promocaoId, p.url, p.preco, p.dataInicial, p.dataFinal"
            + " h.id as hotelId, h.nome, h.cnpj, h.cidade"
            + " s.id as siteId, s.nome, s.telefone"
            + " from Promocao p"
            + " inner join Hotel h on p.hotel = h.id"
            + " inner join Site s on p.site = s.id";
    
    private final static String VERIFICA_DATA_SQL = "select"
            + " dataInicial, dataFinal, hotel"
            + " from Promocao "
            + " where "
            + " hotel = ? and"
            + " dataInicial = ? and"
            + " dataFinal = ?";

        DataSource dataSource;

    public PromocaoDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Promocao gravarPromocao(Promocao promocao) throws SQLException, NamingException {
        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(CRIAR_PROMOCAO_SQL, Statement.RETURN_GENERATED_KEYS);) {
            
            ps.setFloat(1, promocao.getPreco());
            ps.setDate(2, new java.sql.Date(promocao.getDataInicial().getTime()));
            ps.setDate(3, new java.sql.Date(promocao.getDataFinal().getTime()));
            ps.setInt(4, promocao.getSite());
            ps.setInt(5, promocao.getHotel());
            ps.execute();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                rs.next();
                promocao.setId(rs.getInt(1));
            }
        }
        return promocao;
    }

    public List<Promocao> listarTodasPromocoes() throws SQLException, NamingException {
        List<Promocao> ret = new ArrayList<>();
        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(LISTAR_PROMOCAO_SQL)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Promocao promocao = new Promocao();
                    
                    //(url, preco, dataInicial, dataFinal, hotel)
                    promocao.setId(rs.getInt("promocaoId"));
                    promocao.setSite(rs.getInt("siteID"));
                    promocao.setHotel(rs.getInt("hotelId"));
                    promocao.setPreco(rs.getFloat("preco"));
                    promocao.setDataInicial(rs.getDate("dataInicial"));
                    promocao.setDataFinal(rs.getDate("dataInicial"));
                    
                    ret.add(promocao);
                }
            }
        }
        return ret;
    }
    
    public boolean verificaData(Date dataInicial, Date dataFinal, int hotel) throws SQLException, NamingException {
         try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(VERIFICA_DATA_SQL)) {
            
             
            java.sql.Date sqlDataInicial = new java.sql.Date(dataInicial.getTime());
            java.sql.Date sqlDataFinal = new java.sql.Date(dataFinal.getTime());
            
            ps.setInt(1, hotel);
            ps.setDate(2, sqlDataInicial);
            ps.setDate(3, sqlDataFinal); 
            
            try (ResultSet rs = ps.executeQuery()) {
               if(rs.next())
                   return true;
               else
                   return false;
            }
        }
        
    }
}
