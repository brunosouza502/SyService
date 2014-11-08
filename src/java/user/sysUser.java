/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Bruno
 */
public class sysUser {
    /**
     *
     */
    private String name;
    private String sname;
    private String password;
    private String login;
    private String categoria;
    private String idCategoria;
    private String servico;
    private String endereco;
    private String email;
    private String sexo;
    private String telefone;
    private String celular;
    private String descricao; //descrição de serviço
    private String id;
    private String cpf;
    private String cidade;
    private String desc_pedido;//descrição para cliente especificar o tipo de servico que quer
    private String recusa;//motivo de recusar pedido
    private Date dt_inicio;//inicio da requisição
    private Timestamp horaAgendamento;
    private Date dtInicioagendamento; //inicio agendamento
    private Date dtFimagendamento;
    private Double precoEstimado;
    private Timestamp horaAvaliacao;
    private double notaPagamento;
    private Date dt_termino;//termino do serviço
    private String cliente;//cliente requisitando servico
    private String prestador;//prestador requisitado
    private double notaPreco;//avaliar prestadores
    private double notaRespeitoprazo;//avaliar prestadores
    private double notaQualidadeservico;//avaliar prestadores
    private double notaQualidadeatendimento;//avaliar prestadores
    private double notaPagamentoadequado;//avaliar cliente
    private double notaFornecimentomateriais;//avaliar cliente
    private double notaFacilidadetrato;//avaliar cliente
    private String statusServico;//estado em que se encontra o processo
    private String textolivre;//Comentarios sobre o cliente e o prestador feitos na avaliação
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
    
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSexo() {
        return sexo;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCelular() {
        return celular;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }
    
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    public String getServico() {
        return servico;
    }

    public void setServico(String servico) {
        this.servico = servico;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getDesc_pedido() {
        return desc_pedido;
    }

    public void setDesc_pedido(String desc_pedido) {
        this.desc_pedido = desc_pedido;
    }

    public String getRecusa() {
        return recusa;
    }

    public void setRecusa(String recusa) {
        this.recusa = recusa;
    }

    public Date getDt_inicio() {
        return dt_inicio;
    }

    public void setDt_inicio(Date dt_inicio) {
        this.dt_inicio = dt_inicio;
    }

    public Date getDt_termino() {
        return dt_termino;
    }

    public void setDt_termino(Date dt_termino) {
        this.dt_termino = dt_termino;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getPrestador() {
        return prestador;
    }

    public void setPrestador(String prestador) {
        this.prestador = prestador;
    }

    public Timestamp getHoraAgendamento() {
        return horaAgendamento;
    }

    public void setHoraAgendamento(Timestamp horaAgendamento) {
        this.horaAgendamento = horaAgendamento;
    }

    public Date getDtInicioagendamento() {
        return dtInicioagendamento;
    }

    public void setDtInicioagendamento(Date dtInicioagendamento) {
        this.dtInicioagendamento = dtInicioagendamento;
    }

    public Date getDtFimagendamento() {
        return dtFimagendamento;
    }

    public void setDtFimagendamento(Date dtFimagendamento) {
        this.dtFimagendamento = dtFimagendamento;
    }

    public Double getPrecoEstimado() {
        return precoEstimado;
    }

    public void setPrecoEstimado(Double precoEstimado) {
        this.precoEstimado = precoEstimado;
    }

    public Timestamp getHora_avaliacao() {
        return horaAvaliacao;
    }

    public void setHora_avaliacao(Timestamp hora_avaliacao) {
        this.horaAvaliacao = hora_avaliacao;
    }

    public double getNotaPagamento() {
        return notaPagamento;
    }

    public void setNotaPagamento(double notaPagamento) {
        this.notaPagamento = notaPagamento;
    }

    public Timestamp getHoraAvaliacao() {
        return horaAvaliacao;
    }

    public void setHoraAvaliacao(Timestamp horaAvaliacao) {
        this.horaAvaliacao = horaAvaliacao;
    }

    public double getNotaPreco() {
        return notaPreco;
    }

    public void setNotaPreco(double notaPreco) {
        this.notaPreco = notaPreco;
    }

    public double getNotaRespeitoprazo() {
        return notaRespeitoprazo;
    }

    public void setNotaRespeitoprazo(double notaRespeitoprazo) {
        this.notaRespeitoprazo = notaRespeitoprazo;
    }

    public double getNotaQualidadeservico() {
        return notaQualidadeservico;
    }

    public void setNotaQualidadeservico(double notaQualidadeservico) {
        this.notaQualidadeservico = notaQualidadeservico;
    }

    public double getNotaQualidadeatendimento() {
        return notaQualidadeatendimento;
    }

    public void setNotaQualidadeatendimento(double notaQualidadeatendimento) {
        this.notaQualidadeatendimento = notaQualidadeatendimento;
    }

    public double getNotaPagamentoadequado() {
        return notaPagamentoadequado;
    }

    public void setNotaPagamentoadequado(double notaPagamentoadequado) {
        this.notaPagamentoadequado = notaPagamentoadequado;
    }

    public double getNotaFornecimentomateriais() {
        return notaFornecimentomateriais;
    }

    public void setNotaFornecimentomateriais(double notaFornecimentomateriais) {
        this.notaFornecimentomateriais = notaFornecimentomateriais;
    }

    public double getNotaFacilidadetrato() {
        return notaFacilidadetrato;
    }

    public void setNotaFacilidadetrato(double notaFacilidadetrato) {
        this.notaFacilidadetrato = notaFacilidadetrato;
    }

    public String getStatusServico() {
        return statusServico;
    }

    public void setStatusServico(String statusServico) {
        this.statusServico = statusServico;
    }

    public String getTextolivre() {
        return textolivre;
    }

    public void setTextolivre(String textolivre) {
        this.textolivre = textolivre;
    }
       
    
    
}
