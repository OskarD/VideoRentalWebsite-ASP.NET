using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ClassLibrary
{
    public class Reservation
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int MovieId { get; set; }

        public void Reserve()
        {
            SqlCommand command = new SqlCommand("INSERT INTO reservations (customer_id, movie_id) VALUES (" + CustomerId + ", " + MovieId + ")", DBConnection.Connection);

            command.ExecuteNonQuery();

            command = new SqlCommand("UPDATE movies SET inventory = (inventory - 1), times_reserved = (times_reserved + 1) FROM movies INNER JOIN allmovies ON movies.title = allmovies.title WHERE allmovies.id = " + MovieId,  DBConnection.Connection);

            command.ExecuteNonQuery();

        }

        public void Reserve(string movieTitle)
        {
            SqlCommand command = new SqlCommand("SELECT id FROM allmovies WHERE title = '" + movieTitle + "'", DBConnection.Connection);

            SqlDataReader reader = command.ExecuteReader();

            if(!reader.Read())
            {
                reader.Close();
                throw new Exception("Could not find movie with this title: " + movieTitle);
            }

            MovieId = reader.GetInt32(0);
            reader.Close();

            Reserve();
        }
    }
}
