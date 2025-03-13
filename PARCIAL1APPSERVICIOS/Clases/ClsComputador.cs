using PARCIAL1APPSERVICIOS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace PARCIAL1APPSERVICIOS.Clases
{
	public class ClsComputador
	{
		private ITMEntities itm = new ITMEntities();
		public Computador computador { get; set; }
		public string Insertar()
		{
			try
			{
				itm.Computadors.Add(computador);
				itm.SaveChanges();
				return "Computador registrado correctamente";
			}
			catch (Exception ex)
			{
				return "Error al registrar el computador: " + ex.Message;
			}
		}
		public string Modificar()
		{
			try
			{
				Computador comp = Consultar(computador.id_computador);
				if (comp == null)
				{
					return "El computador correspondiente no existe, por tal motivo no se puede actualizar";
				}
				itm.Computadors.AddOrUpdate(computador);
				itm.SaveChanges();
				return "Computador actualizado correctamente";

			}
			catch (Exception ex)
			{
				return "Error al actualizar el computador: " + ex.Message;
			}
		}
		public List<Computador> ConsultarTodos()
        {
			return itm.Computadors
				.OrderByDescending(c => c.id_computador)
				.ToList();
        }

        public Computador Consultar(int id_computador)
		{
			return itm.Computadors.FirstOrDefault(c => c.id_computador == id_computador);
		}
		public string Eliminar(int id_computador)
		{
			try
			{
				Computador comp = Consultar(id_computador);
				if (comp == null)
				{
					return "El computador correspondiente no existe, por tal motivo no se puede Eliminar";
				}
				itm.Computadors.Remove(comp);//Elimina el computador que busca no el que se envia
				itm.SaveChanges();
				return "Computador Eliminado correctamente";

			}
			catch (Exception ex)
			{
				return "Error al Eliminar el computador: " + ex.Message;
			}


		}
	}
}