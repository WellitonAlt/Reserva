package reserva;

import java.util.Date;

public class Promocao {
    private int id;
    private int site, hotel;
    private float preço;
    private Date dataInicial, dataFinal;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public int getSite() { return site; }

    public void setSite(int id_site) { this.site = id_site; }

    public int getHotel() { return hotel; }

    public void setHotel(int CNPJ_hotel) { this.hotel = CNPJ_hotel; }

    public float getPreço() { return preço; }

    public void setPreço(float preço) { this.preço = preço; }

    public Date getDataInicial() { return dataInicial; }

    public void setDataInicial(Date dataInicial) { this.dataInicial = dataInicial; }

    public Date getDataFinal() { return dataFinal; }

    public void setDataFinal(Date dataFinal) { this.dataFinal = dataFinal; }
}
