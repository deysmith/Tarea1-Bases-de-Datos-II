import sql from "mssql/msnodesqlv8.js"
import { connection } from "./connection.js"

/**
 * Obtiene los países cuyo código comienza con el criterio indicado
 * @param {string} criterio - Criterio de búsqueda
 * @returns Lista de países encontrados
 */
export async function obtenerPaisesPorCoincidenciaCodigo(criterio) {
  const result = await connection.request()
    .input("Criterio", sql.NVarChar(1), criterio)
    .execute("ObtenerPaisesPorCoincidenciaCodigo")

  return result.recordset
}

/**
 * Obtiene a las personas que tienen un número teléfonico del tipo indicado
 * @param {string} tipo - Tipo de teléfono
 * @returns Lista de personas y sus números de teléfono
 */
export async function obtenerPersonasPorTipoTelefono(tipo) {
  const result = await connection.request()
    .input("Tipo", sql.NVarChar(50), tipo)
    .execute("GetPersonasPorTipoTelefono")

    return result.recordset
}

/**
 * Edita la preferencia de promociones por correo electrónico de una persona
 * @param {number} businessE - Identificador de la persona
 * @param {number} promocionE - Nueva preferencia de promociones por correo 
 */
export async function editarPromocionEmail(businessE, promocionE) {
  await connection.request()
    .input("BusinessEntity", sql.Int, businessE)
    .input("PromocionEmail", sql.Int, promocionE)
    .execute("EditarPromocionEmail")
}

/**
 * Añade un nuevo número telefónico a una persona
 * @param {number} businessE - Identificador de la persona
 * @param {string} telefono - Número de telefónico que se desea registrar
 * @param {string} tipo - Tipo de número telefónico
 */
export async function agregarNumeroTelefonico(businessE, telefono, tipo) {
  await connection.request()
    .input("BusinessEntity", sql.Int, businessE)
    .input("Telefono", sql.NVarChar(25), telefono)
    .input("Tipo", sql.NVarChar(50), tipo)
    .execute("AgregarNumeroTelefonico")
}

/**
 * Elimina un número telefónico de la bd
 * @param {string} telefono - Número telefónico que se desea eliminar
 */
export async function eliminarNumeroTelefonico(telefono) {
  await connection.request()
    .input("Telefono", sql.NVarChar(25), telefono)
    .execute("EliminarNumeroTelefonico")
}