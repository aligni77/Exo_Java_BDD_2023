<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
<h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>
    <h2>Exercice 1 : Les films entre 2000 et 2015</h2>
    <p>Extraire les films dont l'année est supérieure à l'année 2000 et inférieure à 2015.</p>
    
    <% 
    String url1 = "jdbc:mariadb://localhost:3306/films";
    String user1 = "mysql";
    String password1 = "mysql";

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn1 = DriverManager.getConnection(url1, user1, password1);
        String sql1 = "SELECT idFilm, titre, année FROM Film WHERE année > 2000 AND année < 2015";
        try (PreparedStatement pstmt1 = conn1.prepareStatement(sql1);
             ResultSet rs1 = pstmt1.executeQuery()) {

            while (rs1.next()) {
                String colonne1 = rs1.getString("idFilm");
                String colonne2 = rs1.getString("titre");
                int colonne3 = rs1.getInt("année");

                out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
            }
        }
        conn1.close();
    } catch (ClassNotFoundException | SQLException e) {
        // Gérer les exceptions
        e.printStackTrace();
    }
    %>

<h2>Exercice 2 : Année de recherche</h2>
    <p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>
    <%
    int anneeRecherche = 0; // Initialiser la variable pour la recherche d'année

    // Vérifier si le formulaire a été soumis
    if (request.getParameter("anneeRecherche") != null) {
        anneeRecherche = Integer.parseInt(request.getParameter("anneeRecherche"));
    }
    %>
    <form method="get" action="">
        <label for="anneeRecherche">Année de recherche :</label>
        <input type="text" name="anneeRecherche" id="anneeRecherche" value="<%= anneeRecherche %>">
        <input type="submit" value="Rechercher">
    </form>

    <% 
    String url2 = "jdbc:mariadb://localhost:3306/films";
    String user2 = "mysql";
    String password2 = "mysql";

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn2 = DriverManager.getConnection(url2, user2, password2);
        String sql2 = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
        try (PreparedStatement pstmt2 = conn2.prepareStatement(sql2)) {
            pstmt2.setInt(1, anneeRecherche);
            try (ResultSet rs2 = pstmt2.executeQuery()) {
                while (rs2.next()) {
                    String colonne1 = rs2.getString("idFilm");
                    String colonne2 = rs2.getString("titre");
                    int colonne3 = rs2.getInt("année");

                    out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
                }
            }
        }
        conn2.close();
    } catch (ClassNotFoundException | SQLException e) {
        // Gérer les exceptions
        e.printStackTrace();
    }
    %>

<h2>Exercice 3 : Modification du titre du film</h2>
    <p>Créer un formulaire permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>
    <form method="post" action="">
        <label for="filmId">ID du film à modifier :</label>
        <input type="text" name="filmId" id="filmId">
        <br>
        <label for="nouveauTitre">Nouveau titre :</label>
        <input type="text" name="nouveauTitre" id="nouveauTitre">
        <br>
        <input type="submit" value="Modifier le titre">
    </form>

    <% 
    String url3 = "jdbc:mariadb://localhost:3306/films";
    String user3 = "mysql";
    String password3 = "mysql";

    // Vérifier si le formulaire a été soumis
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String filmIdStr = request.getParameter("filmId");
        String nouveauTitre = request.getParameter("nouveauTitre");

        if (filmIdStr != null && nouveauTitre != null) {
            try {
                int filmId = Integer.parseInt(filmIdStr);

                Class.forName("org.mariadb.jdbc.Driver");
                Connection conn3 = DriverManager.getConnection(url3, user3, password3);
                String sql3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
                
                try (PreparedStatement pstmt3 = conn3.prepareStatement(sql3)) {
                    pstmt3.setString(1, nouveauTitre);
                    pstmt3.setInt(2, filmId);
                    int rowsUpdated = pstmt3.executeUpdate();
                    
                    if (rowsUpdated > 0) {
                        out.println("Le titre du film a été modifié avec succès.");
                    } else {
                        out.println("Aucun film trouvé avec l'ID spécifié.");
                    }
                }

                conn3.close();
            } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
                // Gérer les exceptions
                e.printStackTrace();
            }
        }
    }
    %>

<h2>Exercice 4 : Ajouter un nouveau film</h2>
    <p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>
    <form method="post" action="">
        <label for="nouveauTitre">Titre du nouveau film :</label>
        <input type="text" name="nouveauTitre" id="nouveauTitre">
        <br>
        <label for="nouvelleAnnee">Année du nouveau film :</label>
        <input type="text" name="nouvelleAnnee" id="nouvelleAnnee">
        <br>
        <input type="submit" value="Ajouter le film">
    </form>

    <% 
    String url4 = "jdbc:mariadb://localhost:3306/films";
    String user4 = "mysql";
    String password4 = "mysql";

    // Vérifier si le formulaire a été soumis
    if (request.getMethod().equalsIgnoreCase("POST")) {
        out.println("Formulaire soumis avec succès."); // Message de débogage

        String nouveauTitre = request.getParameter("nouveauTitre");
        String nouvelleAnneeStr = request.getParameter("nouvelleAnnee");

        out.println("Nouveau Titre : " + nouveauTitre); // Message de débogage
        out.println("Nouvelle Année : " + nouvelleAnneeStr); // Message de débogage

        if (nouveauTitre != null && nouvelleAnneeStr != null) {
            try {
                int nouvelleAnnee = Integer.parseInt(nouvelleAnneeStr);

                Class.forName("org.mariadb.jdbc.Driver");
                Connection conn4 = DriverManager.getConnection(url4, user4, password4);
                String sql4 = "INSERT INTO Film (titre, année) VALUES (?, ?)";
                out.println("Requête SQL : " + sql4); // Message de débogage
                try (PreparedStatement pstmt4 = conn4.prepareStatement(sql4)) {
                    pstmt4.setString(1, nouveauTitre);
                    pstmt4.setInt(2, nouvelleAnnee);
                    int rowsInserted = pstmt4.executeUpdate();
                    
                    if (rowsInserted > 0) {
                        out.println("Le nouveau film a été ajouté avec succès.");
                    } else {
                        out.println("Erreur lors de l'ajout du nouveau film.");
                    }
                }

                conn4.close();
                } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
                    // Gérer les exceptions
                    e.printStackTrace();
                    out.println("Erreur SQL : " + e.getMessage()); // Afficher le détail de l'erreur SQL
                }
        }
    }
    %>

</body>
</html>
