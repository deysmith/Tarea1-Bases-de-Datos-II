import sql from "mssql/msnodesqlv8.js"
import { config } from "./config.js"

const sqlConfig = config.production

/**
 * Establecer la conexión con SQL Server
 */
export const connection = new sql.ConnectionPool(sqlConfig, (err) => {
  if (err) {
    console.error(err)
    return
  }

  console.log("Conectado")
})
