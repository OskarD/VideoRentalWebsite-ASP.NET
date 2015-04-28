using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ClassLibrary
{
    [Serializable]
    public class Customer
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public string PhoneNumber { get; set; }
        public string LastLogin { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Admin { get; set; }

        public static Customer LogIn(string email, string password)
        {
            Customer customer = null;

            SqlCommand command = new SqlCommand("SELECT * FROM customer WHERE email = '" + email + "' AND password = '" + password + "'", DBConnection.Connection);

            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                customer = new Customer();
                customer.FirstName = reader.GetString(0);
                customer.LastName = reader.GetString(1);
                customer.Address1 = reader.GetString(2);
                customer.Address2 = reader.GetString(3);
                customer.City = reader.GetString(4);
                customer.Province = reader.GetString(5);
                customer.PostalCode = reader.GetString(6);
                customer.PhoneNumber = reader.GetString(7);
                customer.LastLogin = reader.GetString(8);
                customer.Password = reader.GetString(9);
                customer.Email = reader.GetString(10);
                customer.Id = reader.GetInt32(11);
                if (reader.IsDBNull(12))
                    customer.Admin = 0;
                else
                    customer.Admin = reader.GetInt32(12);
            }

            reader.Close();

            return customer;
        }

        public void Register()
        {
            SqlCommand command = new SqlCommand("INSERT INTO customer (first_name, last_name, address1, address2, city, province, pcode, phone, password, email) VALUES ('" + 
                FirstName + "', '" + 
                LastName + "', '" + 
                Address1 + "', '" + 
                Address2 + "', '" + 
                City + "', '" + 
                Province + "', '" + 
                PostalCode + "', '" + 
                PhoneNumber + "', '" +
                Password + "', '" + 
                Email + "')", DBConnection.Connection);

            command.ExecuteNonQuery();
        }

        public String ToHTML()
        {
            string output = 
                "<p><h2>Name</h2>" + FirstName + " " + LastName + "</p>" +
                "<p><h2>Address</h2> " + Address1 + "<br />" + Address2 + "</p>" +
                    City + "<br />" + Province + " " + PostalCode + "</p>" +
                "<p><h2>Phone</h2>" + PhoneNumber + "</p>" +
                "<p><h2>Email</h2>" + Email + "</p>";

            return output;
        }

    }
}
