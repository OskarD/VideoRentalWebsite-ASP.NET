using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class MovieSearch
    {
        public static LinkedList<Movie> Search(string category, string search)
        {
            LinkedList<Movie> movies = new LinkedList<Movie>();

            string query = "SELECT * FROM dbo.allmovies WHERE " + category + " LIKE '%" + search + "%'";

            SqlCommand command = new SqlCommand(query, DBConnection.Connection);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                Movie movie = new Movie();
                movie.Id = reader.GetInt32(0);
                movie.Title = reader.GetString(1);
                movie.Company = reader.GetString(2);
                movie.Director = reader.GetString(3);
                movie.Editor = reader.GetString(4);
                movies.AddLast(movie);
            }

            reader.Close();

            return movies;
        }


    }
}
