# Opentheso Docker

Opentheso Docker est une version _dockérisée_ d'Opentheso. Cela permet de tester
[Opentheso](https://opentheso.huma-num.fr/opentheso/) sur un poste local sans
installation complexe.

1. **Docker Desktop** — Il faut avoir [Docker
   Desktop](https://docs.docker.com/engine/install/) installé sur son poste.

2. **Opentheso Docker** — _Opentheso Docker_ doit être placé dans un repertoire de
   votre poste de travail.

3. **Images Docker** - En étant dans le répertoire d'_Opentheso Docker_, lancez
   la construction des images locales nécessaires au fonctionnement
   d'Opentheso:

   ```bash
   ./build.sh
   ```

   Cela génère deux images :

   - **opentheso/tomcat** : L'application Java Tomcat Opentheso.
   - **opentheso/postgres** : La base de données Postgres dans laquelle
     Opentheso stocke toutes les informations.

   La version d'Opentheso est sélectionnée dans le fichier `.env`. Il est
   possible de modifier cette valeur pour, par exemple, installer une version
   plus ancienne d'Opentheso.

4. **Containers Opentheso** — On démarre et on arrête Opentheso (les deux
   containers) avec les commandes suivantes :

   ```bash
   docker compose up -d
   docker compose down
   ```

   On accède à Opentheso dans un navigateur Internet : `http://localhost:8080`

5. **Volume** — Les données Postgres sont stockées dans un _volume_ docker :
   **opentheso_pg_data**. On peut réinitialiser sa base de données Opentheso en
   supprimant ce volume :

   ```bash
   docker volume rm opentheso_pg_data
   ```

