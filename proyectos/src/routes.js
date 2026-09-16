import express from "express"
import { agregarNumero, editarPromoEmail, eliminarNumero, obtenerPaises, obtenerPersonasPorTTelefono } from "./controllers.js"

const router = express.Router()
/**
 * Rutas de los endpoints de la API
 */
router.get("/paises/:criterio", obtenerPaises)
router.get("/personas/telefono/:tipo", obtenerPersonasPorTTelefono)
router.put("/personas/:businessE/promocion-email", editarPromoEmail)
router.post("/telefonos", agregarNumero)
router.delete("/telefonos/:telefono", eliminarNumero)

export default router