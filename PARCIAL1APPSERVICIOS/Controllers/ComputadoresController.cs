using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PARCIAL1APPSERVICIOS.Models;
using PARCIAL1APPSERVICIOS.Clases;


namespace PARCIAL1APPSERVICIOS.Controllers
{
    [RoutePrefix("api/Computadores")]
    public class ComputadoresController : ApiController
    {
        // GET: Consultar todos los computadores
        [HttpGet]
        [Route("ConsultarTodos")]
        public List<Computador> ConsultarTodos()
        {
            ClsComputador computador = new ClsComputador();
            return computador.ConsultarTodos();
        }

        // GET: Consultar un computador por id_computador
        [HttpGet]
        [Route("ConsultarPorId")]
        public Computador Consultar(int id_computador)
        {
            ClsComputador computador = new ClsComputador();
            return computador.Consultar(id_computador);
        }

        // POST: Insertar un computador
        [HttpPost]
        [Route("Insertar")]
        public string Insertar([FromBody] Computador computador)
        {
            ClsComputador objComputador = new ClsComputador();
            objComputador.computador = computador;
            return objComputador.Insertar();
        }

        // PUT: Modificar un computador
        [HttpPut]
        [Route("Modificar")]
        public string Modificar([FromBody] Computador computador)
        {
            ClsComputador objComputador = new ClsComputador();
            objComputador.computador = computador;
            return objComputador.Modificar();
        }

        // DELETE: Eliminar un computador por id_computador
        [HttpDelete]
        [Route("Eliminar")]
        public string Eliminar(int id_computador)
        {
            ClsComputador objComputador = new ClsComputador();
            return objComputador.Eliminar(id_computador);
        }
    }
}
