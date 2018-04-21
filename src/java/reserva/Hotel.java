package reserva;


import javax.swing.text.MaskFormatter;
import java.text.ParseException;  
import java.util.ArrayList;
import java.util.List;

public class Hotel {
    private int id;
    private String cnpj, senha, nome, cidade; 

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getCNPJMascara(){
        try{
            MaskFormatter mask = new MaskFormatter("AA.AAA.AAA/AAAA-AA"); 
            mask.setValueContainsLiteralCharacters(false);  
            return mask.valueToString(cnpj);
        }catch(ParseException e){}
        return "";
    }

    public String getCnpj() { return cnpj; }

    public void setCnpj(String cnpj) { this.cnpj = cnpj; }

    public String getNome() { return nome; }

    public void setNome(String nome) { this.nome = nome; }

    public String getSenha() { return senha; }

    public void setSenha(String senha) { this.senha = senha; }

    public String getCidade() { return cidade; }

    public void setCidade(String cidade) { this.cidade = cidade; }
    
    public List<String> validar() {
        List<String> mensagens = new ArrayList<>();
               
        if (cnpj.trim().length() == 0) {
            mensagens.add("CNPJ não pode ser vazio!");
        }
        if (cnpj.length() < 14 || cnpj.length() > 15 ){
            mensagens.add("CNPJ deve conter 14 digitos!. Ex: 72629140000134");       
        }
        if (nome.trim().length() == 0) {
            mensagens.add("Nome não pode ser vazio!");
        }
        if (senha.trim().length() == 0) {
            mensagens.add("Senha não pode ser vazio!");
        }
        if (cidade.trim().length() == 0) {
            mensagens.add("Cidade não pode ser vazio!");
        }
        
        return (mensagens.isEmpty() ? null : mensagens);
    }   
}
