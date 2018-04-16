package reserva;

import java.util.Date;

public class Promocao {
    private int id;
    private String url, CNPJ_hotel;
    private float preço;
    private Date dataInicial, dataFinal;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getUrl() { return url; }

    public void setUrl(String url) { this.url = url; }

    public float getPreço() { return preço; }

    public void setPreço(float preço) { this.preço = preço; }

    public Date getDataInicial() { return dataInicial; }

    public void setDataInicial(Date dataInicial) { this.dataInicial = dataInicial; }

    public Date getDataFinal() { return dataFinal; }

    public void setDataFinal(Date dataFinal) { this.dataFinal = dataFinal; }  

    public String getCNPJ_hotel() { return CNPJ_hotel; }

    public void setCNPJ_hotel(String CNPJ_hotel) { this.CNPJ_hotel = CNPJ_hotel; }
    
}
