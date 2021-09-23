<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
   //��ü�����ϱ�
   Connection connection; //DB����,���� �ϴ� ��ü
   Statement statement;   //query�� ���� ��ü
   ResultSet resultset;   //query�� ���� ����� ����Ǵ� ��ü
   
   String driver = "oracle.jdbc.driver.OracleDriver";   //driver �ּ�
   String url = "jdbc:oracle:thin:@localhost:1521:xe";  //url �ּ�
   String uid = "scott";                      			//user id
   String upw = "tiger";                       			//user pw
   String query = "select * from member";            	//query ��
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberDB.jsp</title>
</head>
<body>
   <%
      try{ //�����ϴ°�
         Class.forName(driver);
         connection = DriverManager.getConnection(url, uid, upw);//�����ϱ�
         statement = connection.createStatement();            	 //������ ��������
         resultset = statement.executeQuery(query);            	 //���� ��� ��
         //resultset = statement.executeUpdate(sql);			 //update�� ���(update, delete�� ���� �����Ҷ�)
         while(resultset.next()){ //�����͸� ���ʴ�� �ҷ���(�����Ͱ� ������ ��, ������(null) ����)
            String id = resultset.getString("id");
            String pw = resultset.getString("pw");
            String name = resultset.getString("name");
            String ph = resultset.getString("ph");
            
            out.println("���̵� : " + id + "<br>");
            out.println("��й�ȣ : " + pw + "<br>");
            out.println("�̸� : " + name + "<br>");
            out.println("��ȭ��ȣ : " + ph + "<br>");
            out.println("=========================<br>");
         }
      } catch(Exception e) { //�������� ����
   
      } finally { //������ ����
         
         try{ //������ �����̱� ������ ������ ���� �ٽ� ����ó��
            //���� ���� �߿�
            if(resultset != null) resultset.close();
            if(statement != null) statement.close();
            if(connection != null) connection.close();
         } catch(Exception e) {
            
         }
      }
   %>
</body>
</html>