package reserva.dao;

import reserva.Hotel;
import reserva.Promocao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PromocaoDAO {

    private final static String CRIAR_PROMOCAO_SQL = "insert into Palpite"
            + " (url, preco, dataInicial, dataFinal, hotel)"
            + " values (?,?,?,?,?)";

    private final static String LISTAR_PROMOCAO_SQL = "select"
            + " p.id as promocaoId, p.url, p.preco, p.dataInicial, p.dataFinal"
            + " h.id as hotelId, h.nome, h.cnpj, h.cidade"
            + " from Promocao p inner join Hotel h on p.hotel = h.id";

        DataSource dataSource;

    public PromocaoDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Promocao gravarPromocao(Promocao promocao) throws SQLException, NamingException {
        try (Connection con = dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement(CRIAR_PROMOCAO_SQL, Statement.RETURN_GENERATED_KEYS);) {
            ps.setString(1, promocao.getUrl());
            ps.setFloat(2, promocao.getPreço());
            ps.setDate(3, new java.sql.Date(promocao.getDataInicial().getTime()));
            ps.setDate(4, new java.sql.Date(promocao.getDataFinal().getTime()));
           // ps.setInt(5, promocao.getHotel().getId());
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
                    Hotel hotel = new Hotel();
                    //(url, preco, dataInicial, dataFinal, hotel)
                    promocao.setId(rs.getInt("promocaoId"));
                    promocao.setUrl(rs.getString("url"));
                    promocao.setDataInicial(rs.getDate("dataInicial"));
                    promocao.setDataFinal(rs.getDate("dataInicial"));
                    
                    hotel.setId(rs.getInt("HotelId"));
                    hotel.setCNPJ(rs.getString("cnpj"));
                    hotel.setNome(rs.getString("nome"));
                    hotel.setCidade(rs.getString("cidade"));
                    
                    //promocao.setHotel(hotel);
                    ret.add(promocao);
                }
            }
        }
        return ret;
    }
}
