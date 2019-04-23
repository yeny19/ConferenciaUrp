/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tag;

import comun.Parametros;
import dao.DaoFactory;
import dao.DaoTipoConferencia;
import dto.dtoTipoConferencia;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
import static javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE;

/**
 *
 * @author Christian
 */
public class CboTipoConferencia implements Tag{

    PageContext pageContext;
    
    @Override
    public void setPageContext(PageContext pageContext) {
        this.pageContext = pageContext;

    }

    @Override
    public void setParent(Tag t) {
    }

    @Override
    public Tag getParent() {
        return null;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
        try {
            DaoFactory objDF = DaoFactory.getDaoFactory(DaoFactory.ORACLE);
            DaoTipoConferencia objDTC = objDF.getDaoTipoConferencia();
            
            Iterator iterator = objDTC.ListaTipoConferencia().iterator();
            while (iterator.hasNext()) {
                dtoTipoConferencia dtoTC = (dtoTipoConferencia) iterator.next();
                out.println("<option value=" + dtoTC.getCTCONF_CODIGO()+ ">" + dtoTC.getVTCONF_DESLARGA()+ "</option>");
            }
            
        } catch (IOException | SQLException e) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + e.toString());
        } catch (Exception ex) {
            System.out.println(Parametros.S_APP_NOMBRE + " - " + getClass() + ": " + ex.toString());
        }
        return EVAL_BODY_INCLUDE;
    }

    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    @Override
    public void release() {
        
    }
    
}
