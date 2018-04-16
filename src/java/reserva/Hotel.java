package reserva;


import javax.swing.text.MaskFormatter;
import java.text.ParseException;  

public class Hotel {
    private int id;
    private String CNPJ, nome, senha, cidade; 

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getCNPJ() { return CNPJ; }
    
    public String getCNPJMascara(){
        try{
            MaskFormatter mask = new MaskFormatter("AA.AAA.AAA/AAAA-AA"); 
            mask.setValueContainsLiteralCharacters(false);  
            return mask.valueToString(CNPJ);
        }catch(ParseException e){}
        return "";
    }

    public void setCNPJ(String CNPJ) { this.CNPJ = CNPJ; }

    public String getNome() { return nome; }

    public void setNome(String nome) { this.nome = nome; }

    public String getSenha() { return senha; }

    public void setSenha(String senha) { this.senha = senha; }

    public String getCidade() { return cidade; }

    public void setCidade(String cidade) { this.cidade = cidade; }
    
   
}
