using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ClassLibrary
{
    class DBConnection : IDisposable
    {
        private static string connectionString = "Data Source=OSKARS\\SQLEXPRESS;Initial Catalog=asp;Integrated Security=True";

        private static SqlConnection connection = null;

        private static object syncRoot = new Object();

        public static SqlConnection Connection { 
            get
            {
                if (connection == null)
                {
                    lock (syncRoot)
                    {
                        if (connection == null)
                        {
                            connection = new SqlConnection(connectionString);
                            Open();
                        }
                    }
                    
                }

                return connection;
            }
            set
            {
                connection = value;
            }
        }

        public static void Open()
        {
            try
            {
                connection.Open();
            }
            catch (Exception ex) { Console.Out.Write(ex); }
        }

        public void Dispose()
        {
            if (connection != null)
            {
                connection.Close();
                connection = null;
            }
        }
    }
}
