<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/Header.jsp"%>
<s:form action="model_list" id="ec">
    <div style="width:100%">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="talbe_gray_border">
            <tr>
                <td align="right" width="8%"><fmt:message key="model.name" /><fmt:message key="global.colon" /></td>
                <td align="left" width="20%">
                    <s:textfield name="name" value="%{model.name}" cssClass="textInput" cssStyle="width:98%" />
                </td>
                <td align="right" width="8%"><fmt:message key="model.gradeMenu" /><fmt:message key="global.colon" /></td>
                <td align="left" width="20%">
                    <s:select name="grade" value="%{model.grade}"  cssStyle="width:98%"
                              list="#{0:'全部菜单',1:'一级菜单',2:'二级菜单',3:'三级菜单',4:'四级菜单',5:'五级菜单'}"/>
                </td>
                <td align="right" width="8%"><fmt:message key="model.scription" /><fmt:message key="global.colon" /></td>
                <td align="left" width="20%">
                    <s:textfield name="scription" value="%{model.scription}" cssClass="textInput" cssStyle="width:98%" />
                </td>
                <td width="8%" align="center">
                    <input type="submit" value="<fmt:message key="global.query" />" class="buttonStyle"/>
                </td>
            </tr>
        </table>
        <ec:table items="models" var="model" action="${pageContext.request.contextPath}/model_list.htm" retrieveRowsCallback="limit" filterRowsCallback="limit" title="">
            <%-- <ec:exportXls fileName="Demo.xls" />
            <ec:exportPdf fileName="test.pdf" />
            <ec:exportCsv fileName="test.csv" />--%>
            <ec:row>
                <ec:column alias="num" title="global.serialNumber" cell="rowCount" width="3%" sortable="false" styleClass="tdCenter"/>
                <ec:column property="name" title="model.name" styleClass="tdLeft" width="17%" />
                <ec:column property="grade" title="model.gradeMenu" styleClass="tdLeft" width="15%" >
                    <c:choose>
                        <c:when test="${model.grade eq 0}">
                            顶级菜单
                        </c:when>
                        <c:when test="${model.grade eq 1}">
                            一级菜单
                        </c:when>
                        <c:when test="${model.grade eq 2}">
                            二级菜单
                        </c:when>
                        <c:when test="${model.grade eq 3}">
                            三级菜单
                        </c:when>
                        <c:when test="${model.grade eq 4}">
                            四级菜单
                        </c:when>
                        <c:otherwise>
                            五级菜单
                        </c:otherwise>
                    </c:choose>
                </ec:column>
                <ec:column property="url" title="model.url" styleClass="tdLeft" width="35%" />
                <ec:column property="scription" title="model.scription" styleClass="tdLeft" width="30%"/>
            </ec:row>
        </ec:table>
    </div>
</s:form>
<%@ include file="/common/footer.jsp"%>