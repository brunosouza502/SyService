/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sysDatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import user.sysUser;
/**
 *
 * @author Bruno
 */
public class ConnectBD{
    
    private String dbHost = "jdbc:postgresql://localhost:5432/Bruno";
    private String dbUser = "postgres";
    private String dbPwd = "admin";
    
    public ConnectBD()
    {
         try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectBD.class.getName()).log(Level.SEVERE, null, ex);
        } 
    };
            
    public Connection getConnection() throws SQLException {
        Connection conn;
        sysUser u = new sysUser();
        conn = DriverManager.getConnection(dbHost, dbUser, dbPwd);
        ResultSet result;

        return conn;
    }
    
    public sysUser validate(sysUser u, String login, String psw)
    {
        
        try{
        Connection conn;
        conn = getConnection();
        PreparedStatement ps;
        String query = "SELECT * FROM syservice.user WHERE login = ? AND senha = ?";
        
        ps = conn.prepareStatement(query);
        ps.setString(1, login);
        ps.setString(2, psw);
        ps.executeQuery();
        
        ResultSet result = ps.executeQuery();
        
            if(result.next()) {
                u.setName(result.getString("nome"));
                u.setCidade(result.getString("cidade"));
                return u;
            }
            else
                return null;

        }catch (Exception e) {
            e.printStackTrace();
            //return u;
            return null;
    }

    };

//===================ADMINISTRADOR========================================================
    
    public sysUser validateAdmin(sysUser u, String login, String pass){
        try{
        Connection conn;
        conn = getConnection();
        PreparedStatement ps;
        String query = "SELECT * FROM syservice.admin WHERE login = ? AND senha = ?";
        
        ps = conn.prepareStatement(query);
        ps.setString(1, login);
        ps.setString(2, pass);
        ps.executeQuery();
        
        ResultSet result = ps.executeQuery();
        
            if(result.next()) {
                u.setLogin(result.getString("login"));
                u.setName(result.getString("nome"));
                u.setPassword(result.getString("senha"));
                return u;
            }
            else
                return null;

        }catch (Exception e) {
            e.printStackTrace();
            //return u;
            return null;
    }
    }
    
//===================ADMINISTRADOR========================================================
    
    public sysUser search(sysUser u, String login)
    {
        
        try{
        Connection conn;
        conn = getConnection();
        PreparedStatement ps;
        String query = "SELECT * FROM syservice.trab_em WHERE prest_login = ? ";
        
        ps = conn.prepareStatement(query);
        ps.setString(1, login);

        ResultSet result = ps.executeQuery();
        
            if(result.next()) {
                u.setServico(result.getString("nome_serv"));
                u.setCategoria(result.getString("nome_categ_pai"));
                u.setDescricao(result.getString("descricao_serv"));
                return u;
            }
            else
                return null;

        }catch (Exception e) {
            e.printStackTrace();
            return null;
    }
    };
    
    public sysUser editar(sysUser u, String servico, String categoria, String desc, String login)
    {
        try{
            String query = "UPDATE syservice.trab_em SET nome_serv = ?, nome_categ_pai = ?, descricao_serv = ? WHERE prest_login  = ?";
            
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            ps.setString(1, servico);
            ps.setString(2, categoria);
            ps.setString(3, desc);
            ps.setString(4, login);
            
            ResultSet result = ps.executeQuery();
            if(result.next()){
                return u;
            }else
                return null;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    //retorna lista de categorias
    public List<sysUser> listCategoria()
    {
        List<sysUser> users = new ArrayList<sysUser>();
        //String query = "SELECT * FROM syservice.user";
        String query = "SELECT * FROM syservice.servico";
        try{
            
            //sysUser u = new sysUser();
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                sysUser listusr = new sysUser();
                //listusr.setLogin(result.getString("login"));
                listusr.setCategoria(result.getString("nome"));
                users.add(listusr);
            }
            /*if(result.next()){
                u.setLogin(result.getString("login"));
                return u;
            }else
                return null;*/
            return users;
            //conn.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public sysUser checkReq(sysUser u, String login)
    {
        
        try{
            String query = "SELECT * FROM syservice.requisita WHERE prestador = ?";
            //sysUser u = new sysUser();
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, login);
            ResultSet result = ps.executeQuery();
            
            if(result.next()){
                u.setPrestador(result.getString("prestador"));
                u.setCliente(result.getString("cliente"));
                u.setDesc_pedido(result.getString("descricao"));
                return u;
            }else
                return null;
            //conn.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<sysUser> req(String rprest)//verificar quem requisita meus serviços
    {
        List<sysUser> users = new ArrayList<sysUser>();
        //String query = "SELECT * FROM syservice.user";
        String query = "SELECT * FROM syservice.requisita WHERE prestador = ? ORDER BY dtreq desc";
        try{
            
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            ps.setString(1, rprest);
            
            ResultSet result = ps.executeQuery();
            
            while(result.next()){
                sysUser requser = new sysUser();
                //listusr.setLogin(result.getString("login"));
                requser.setPrestador(result.getString("prestador"));
                requser.setCliente(result.getString("cliente"));
                requser.setDesc_pedido(result.getString("descricao"));
                requser.setDt_inicio(result.getDate("dtreq"));
                users.add(requser);
            }
            return users;
            //conn.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> myreq(String cliente)//verificar quem eu requisitei
    {
        List<sysUser> users = new ArrayList<sysUser>();
        String query = "SELECT * FROM syservice.requisita WHERE cliente = ? ORDER BY dtreq desc";
        try{
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            ps.setString(1, cliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                sysUser u = new sysUser();
                u.setPrestador(rs.getString("prestador"));
                //u.setCliente(rs.getString("cliente"));
                u.setDesc_pedido(rs.getString("descricao"));
                u.setDt_inicio(rs.getDate("dtreq"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> servAgendado(String agendaprest)//Qual(is) prestadore(s) aceitaram o pedido e agendaram o servico
    {
        
        List<sysUser> users = new ArrayList<sysUser>();
        String query = "SELECT * FROM syservice.agendamento WHERE client_login = ?";
        try{
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            ps.setString(1, agendaprest);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                sysUser u = new sysUser();
                u.setPrestador(rs.getString("prest_login"));
                u.setPrecoEstimado(rs.getDouble("preco"));
                u.setDtInicioagendamento(rs.getDate("dt_inicio"));
                u.setDtFimagendamento(rs.getDate("dt_fim"));
                users.add(u);
                //u.setDtInicioagendamento(null);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> listprest(String act)//Listar prestadores por categoria
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT * FROM syservice.trab_em WHERE nome_categ_pai = ?";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            ps.setString(1, act);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                sysUser listusr = new sysUser();
                listusr.setPrestador(rs.getString("prest_login"));
                users.add(listusr);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public sysUser userpage(sysUser usr)
    {
        try{
            String query = "SELECT * FROM syservice.trab_em WHERE prest_login = ?"; 
            String qry = "SELECT u.nome, u.snome, t.nome_categ_pai, t.nome_serv, t.descricao_serv FROM syservice.user u JOIN syservice.trab_em t ON (u.login = ? AND t.prest_login = ?)";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(qry);
            ps.setString(1, usr.getLogin());
            ps.setString(2, usr.getLogin());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                usr.setName(rs.getString("nome"));
                usr.setSname(rs.getString("snome"));
                usr.setCategoria(rs.getString("nome_categ_pai"));
                usr.setServico(rs.getString("nome_serv"));
                usr.setDescricao(rs.getString("descricao_serv"));
                return usr;
            }else
                return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public sysUser verificarConclusao(String cliente)//avisa quando o servico esta concluido
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT * FROM syservice.concluido WHERE cliente = ?";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, cliente);
            ResultSet result = ps.executeQuery();
            
            if(result.next()){
                sysUser u = new sysUser();
                u.setCliente(result.getString("cliente"));
                //u.setPrestador(result.getString("prestador"));
                u.setDt_termino(result.getDate("dtconclusao"));
                u.setStatusServico(result.getString("status"));
                return u;
            }else
                return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> avaliacoesServico(String prest)//verificar as avaliações do meu servico
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT * FROM syservice.avaliar_prestador WHERE prestador_login = ?";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, prest);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setCliente(result.getString("cliente_login"));
                u.setNotaPreco(result.getDouble("nota_preco"));
                u.setNotaRespeitoprazo(result.getDouble("nota_prazo_cobrado"));
                u.setNotaQualidadeservico(result.getDouble("nota_servico"));
                u.setNotaQualidadeatendimento(result.getDouble("nota_atendimento"));
                u.setHoraAvaliacao(result.getTimestamp("datatermino"));
                u.setTextolivre(result.getString("textolivre"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

        public List<sysUser> avaliacoesCliente(String client)//verificar as minhas avaliações como cliente
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT * FROM syservice.avaliar_cliente WHERE client_login = ?";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, client);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prest_login"));
                u.setTextolivre(result.getString("textolivre"));
                u.setNotaPagamento(result.getDouble("nota_pagamento"));
                u.setNotaFornecimentomateriais(result.getDouble("nota_material_fornecido"));
                u.setNotaFacilidadetrato(result.getDouble("nota_facilidade_trato_cliente"));
                u.setHoraAvaliacao(result.getTimestamp("data_hora_avaliacao"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
//==============================homepage=============================================
    public List<sysUser> ranknotaprecoprestadoresHome(String categ)//rank de prestadores com melhores precos na homepage
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_preco, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY nota_preco USING > limit 1";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
        public List<sysUser> ranknotaprazoprestadoresHome(String categ)//rank de prestadores com melhores prazos na homepage
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_prazo_cobrado, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY nota_prazo_cobrado USING > limit 1";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaRespeitoprazo(result.getDouble("nota_prazo_cobrado"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> ranknotaservicoprestadoresHome(String categ)//rank de prestadores com melhores servicos na homepage
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_servico, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY nota_servico USING > limit 1";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

      public List<sysUser> ranknotaatendimentoprestadoresHome(String categ)//rank de prestadores com melhor atendimento na homepage
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_atendimento, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY p.nota_atendimento USING > limit 1";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<sysUser> ultimosCadastradoHome()
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT prest_login, dtcadastrocateg, nome_categ_pai FROM syservice.trab_em ORDER BY dtcadastrocateg USING > limit 5";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            //ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prest_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
        public List<sysUser> ultimosContratadosHome()
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT r.prestador, r.cliente, r.dtreq, t.nome_categ_pai FROM syservice.requisita r JOIN syservice.trab_em t ON r.prestador = t.prest_login ORDER BY r.dtreq USING > LIMIT 10";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            //ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador"));
                u.setCategoria(result.getString("nome_categ_pai"));
                u.setCliente(result.getString("cliente"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<sysUser> topprestHome(String categ)//Combinação linear considerando os criterios
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT  a.nome_categ_pai, b.* FROM syservice.trab_em a	JOIN (SELECT  prestador_login, ((AVG(nota_preco)+AVG(nota_prazo_cobrado)+AVG(nota_servico)+AVG(nota_atendimento))/4) AS media FROM syservice.avaliar_prestador GROUP BY prestador_login) AS b ON a.prest_login = b.prestador_login WHERE a.nome_categ_pai = ? ORDER BY b.media DESC LIMIT 1 ";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
        
//==============================homepage=============================================   
    public List<sysUser> ranknotaprecoprestadoresCateg(String categ)//rank de prestadores com melhores precos na pag de tal categoria
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_preco, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY nota_preco USING > limit 5";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> ranknotaprazoprestadoresCateg(String categ)//rank de prestadores com melhores prazos na pag de tal categoria
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_prazo_cobrado, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY nota_prazo_cobrado USING > limit 5";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                //u.setNotaRespeitoprazo(result.getDouble("nota_prazo_cobrado"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
     
    public List<sysUser> ranknotaservicoprestadoresCateg(String categ)//rank de prestadores com melhores servicos na pag de tal categoria
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_servico, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY nota_servico USING > limit 5";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> ranknotaatendimentoprestadoresCateg(String categ)//rank de prestadores com melhor atendimento na pag de tal categoria
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT p.prestador_login, p.nota_atendimento, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = ? ORDER BY p.nota_atendimento USING > limit 5";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> ultimosCadastrado(String categ)
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT prest_login, dtcadastrocateg, nome_categ_pai FROM syservice.trab_em WHERE nome_categ_pai = ? ORDER BY dtcadastrocateg USING > limit 10";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prest_login"));
                u.setCategoria(result.getString("nome_categ_pai"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public List<sysUser> ultimosContratadoscateg(String categ)
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT r.prestador, r.cliente, r.dtreq, t.nome_categ_pai FROM syservice.requisita r JOIN syservice.trab_em t ON r.prestador = t.prest_login WHERE t.nome_categ_pai = ? ORDER BY r.dtreq USING > LIMIT 10";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador"));
                u.setCategoria(result.getString("nome_categ_pai"));
                u.setCliente(result.getString("cliente"));
                //u.setNotaPreco(result.getDouble("nota_preco"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
        public List<sysUser> topprestCateg(String categ)//Combinação linear considerando os criterios
    {
        List<sysUser> users = new ArrayList<sysUser>();
        try{
            String query = "SELECT  a.nome_categ_pai, b.* FROM syservice.trab_em a	JOIN (SELECT  prestador_login, ((AVG(nota_preco)+AVG(nota_prazo_cobrado)+AVG(nota_servico)+AVG(nota_atendimento))/4) AS media FROM syservice.avaliar_prestador GROUP BY prestador_login) AS b ON a.prest_login = b.prestador_login WHERE a.nome_categ_pai = ? ORDER BY b.media DESC LIMIT 5 ";
            Connection conn;
            conn = getConnection();
            PreparedStatement ps;
            ps = conn.prepareStatement(query);
            
            ps.setString(1, categ);
            ResultSet result = ps.executeQuery();
            while(result.next()){
                sysUser u = new sysUser();
                u.setPrestador(result.getString("prestador_login"));
                //u.setCategoria(result.getString("nome_categ_pai"));
                users.add(u);
            }
            return users;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public ConnectBD getInstance() {
        return new ConnectBD();
    }
}
