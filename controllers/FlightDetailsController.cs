using Airline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Airline.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class FlightDetailsController : ApiController
    {
        ProjectGladiatorEntities db = new ProjectGladiatorEntities();
        // GET: api/FlightDetails
        public IEnumerable<string> Get([FromUri] string tripType, [FromUri] string deptCityName)
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/FlightDetails/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/FlightDetails
        public IEnumerable<proc_FlightSelect_Result> Post([FromBody] FlightSearch value)
        {
            //var x = DateTime.ParseExact(value.deptdate, "yyyy-MM-DD", CultureInfo.InvariantCulture);

            return db.proc_FlightSelect(value.deptCityName, value.arrivalCityName, value.deptdate.Date, value.returndate.Date, value.Passenger);
        }

        // PUT: api/FlightDetails/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/FlightDetails/5
        public void Delete(int id)
        {
        }
    }
}
