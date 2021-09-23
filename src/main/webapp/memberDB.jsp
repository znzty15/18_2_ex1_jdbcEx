<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
   //객체선언하기
   Connection connection; //DB연결,접속 하는 객체
   Statement statement;   //query에 관한 객체
   ResultSet resultset;   //query에 대한 결과가 저장되는 객체
   
   String driver = "oracle.jdbc.driver.OracleDriver";   //driver 주소
   String url = "jdbc:oracle:thin:@localhost:1521:xe";  //url 주소
   String uid = "scott";                      			//user id
   String upw = "tiger";                       			//user pw
   String query = "select * from member";            	//query 값
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberDB.jsp</title>
</head>
<body>
   <%
      try{ //실행하는곳
         Class.forName(driver);
         connection = DriverManager.getConnection(url, uid, upw);//연결하기
         statement = connection.createStatement();            	 //데이터 가져오기
         resultset = statement.executeQuery(query);            	 //실행 결과 값
         //resultset = statement.executeUpdate(sql);			 //update시 사용(update, delete등 값을 수정할때)
         while(resultset.next()){ //데이터를 차례대로 불러옴(데이터가 있으면 참, 없으면(null) 거짓)
            String id = resultset.getString("id");
            String pw = resultset.getString("pw");
            String name = resultset.getString("name");
            String ph = resultset.getString("ph");
            
            out.println("아이디 : " + id + "<br>");
            out.println("비밀번호 : " + pw + "<br>");
            out.println("이름 : " + name + "<br>");
            out.println("전화번호 : " + ph + "<br>");
            out.println("=========================<br>");
         }
      } catch(Exception e) { //에러나면 실행
   
      } finally { //무조건 실행
         
         try{ //무조건 실행이기 때문에 오류가 나면 다시 예외처리
            //연결 순서 중요
            if(resultset != null) resultset.close();
            if(statement != null) statement.close();
            if(connection != null) connection.close();
         } catch(Exception e) {
            
         }
      }
   %>
</body>
</html>