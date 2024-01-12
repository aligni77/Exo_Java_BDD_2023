<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur A : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur B : <input type="text" id="inputValeur" name="valeur2">
    <p>Saisir la valeur C : <input type="text" id="inputValeur" name="valeur3">
    <p>Saisir la valeur Paire/Impaire : <input type="text" id="inputValeur" name="valeur4">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>
    <% String valeur3 = request.getParameter("valeur3"); %>
    <% String valeur4 = request.getParameter("valeur4"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur A est supérieure à Valeur B.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur A est inférieure à Valeur B.</p>
        <% } else { %>
            <p>Valeur A est égale à Valeur B.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>

<%-- Récupération des valeurs pour l'exercice 1 --%>
<% String valeurA = request.getParameter("valeur1"); %>
<% String valeurB = request.getParameter("valeur2"); %>
<% String valeurC = request.getParameter("valeur3"); %>

<%-- Vérification de la condition pour l'exercice 1 --%>
<% if (valeurA != null && valeurB != null && valeurC != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeurA = Integer.parseInt(valeurA); %>
    <% int intValeurB = Integer.parseInt(valeurB); %>
    <% int intValeurC = Integer.parseInt(valeurC); %>

    <%-- Condition if pour vérifier si C est compris entre A et B --%>
    <%
    if (intValeurC > intValeurA && intValeurC < intValeurB) {
    %>
        <p>Oui, C est compris entre A et B.</p>
    <%
    }
    else if(intValeurC > intValeurB && intValeurC < intValeurA) {
    %>
        <p>Oui, C est compris entre A et B.</p>
    <%
    }
    else {
    %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <%
    }
    %>
<% } %>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<%-- Récupération du nombre pour l'exercice 2 --%>
<% String nombreValue = request.getParameter("valeur4"); %>

<%-- Vérification de la parité pour l'exercice 2 --%>
<% if (nombreValue != null) { %>
    <%-- Conversion de la valeur en entier --%>
    <% int intNombre = Integer.parseInt(nombreValue); %>
    <%if (intNombre % 2 == 0) {%>
            <p>Le nombre est pair.</p>
    <%} else {%>
        <p>Le nombre est impair.</p>
    <%}%>
<%}%>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
