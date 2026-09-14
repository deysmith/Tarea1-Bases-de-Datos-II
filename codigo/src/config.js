export const config = {
  production: {
    driver: "msnodesqlv8",
    connectionString:
      `Driver={ODBC Driver 18 for SQL Server};` +
      `Server=${process.env.DB_SERVER},${process.env.DB_PORT};` +
      `Database=${process.env.DB_DATABASE};` +
      `UID=${process.env.DB_USER};` +
      `PWD=${process.env.DB_PASSWORD};` +
      `TrustServerCertificate=yes`
  }
}