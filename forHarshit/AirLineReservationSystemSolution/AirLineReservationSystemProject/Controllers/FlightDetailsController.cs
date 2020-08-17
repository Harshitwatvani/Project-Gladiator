using AirLineReservationSystemProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
namespace AirLineReservationSystemProject.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class FlightDetailsController : ApiController
    {
        projectGladitorEntities db = new projectGladitorEntities();
        //DateTime deptdate= 

        // GET: api/FlightDetails
        //public IEnumerable<proc_FlightSelect_Result> Get( )
        //{
            //deptdate=deptdate.ToShortDateString();

            //return db.proc_FlightSelect(deptCityName,arrivalCityName,deptdate,returndate,Passenger);
        //}

        // GET: api/FlightDetails/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/FlightDetails
        public IEnumerable<proc_FlightSelect_Result> Post([FromBody]FlightSearch value)
        {
           

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
