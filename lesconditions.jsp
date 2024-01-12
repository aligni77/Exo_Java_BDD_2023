<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur A : <input type="text" id="inputValeur" name="valeurA">
    <p>Saisir la valeur B : <input type="text" id="inputValeur" name="valeurB">
    <p>Saisir la valeur C : <input type="text" id="inputC" name="valeurC"></p>
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeurA = request.getParameter("valeurA"); %>
    <% String valeurB = request.getParameter("valeurB"); %>
    <% String valeurC = request.getParameter("valeurC"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeurA != null && valeurB != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeurA = Integer.parseInt(valeurA); %>
        <% int intValeurB = Integer.parseInt(valeurB); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeurA > intValeurB) { %>
            <p>Valeur A est supérieure à Valeur B.</p>
        <% } else if (intValeurA < intValeurB) { %>
            <p>Valeur A est inférieure à Valeur B.</p>
        <% } else { %>
            <p>Valeur A est égale à Valeur B.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>

<%-- Vérification de la condition pour l'exercice 1 --%>
<% if (valeurA != null && valeurB != null && valeurC != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int integerValeurA = Integer.parseInt(valeurA); %>
    <% int integerValeurB = Integer.parseInt(valeurB); %>
    <% int integerValeurC = Integer.parseInt(valeurC); %>

    <%-- Condition if pour vérifier si C est compris entre A et B --%>
    <%
    if (integerValeurC >= integerValeurA && integerValeurC <= intValeurB) {
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

Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<form action="#" method="post">
    <p>Saisir un nombre : <input type="text" id="inputNombre" name="nombreValue"></p>
    <input type="submit" value="Vérifier">
</form>

<%-- Récupération du nombre pour l'exercice 2 --%>
<% String nombreValue = request.getParameter("nombreValue"); %>

<%-- Vérification de la parité pour l'exercice 2 --%>
<% if (nombreValue != null) { %>
    <%-- Conversion de la valeur en entier --%>
    <% int intNombre = Integer.parseInt(nombreValue); %>

    <%-- Condition if pour vérifier la parité --%>
    <%
    if (intNombre % 2 == 0) {
    %>
        <p>Le nombre est pair.</p>
    <%
    } else {
    %>
        <p>Le nombre est impair.</p>
    <%
    }
    %>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
