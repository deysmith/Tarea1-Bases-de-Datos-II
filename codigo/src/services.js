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