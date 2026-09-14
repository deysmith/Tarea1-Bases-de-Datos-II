import express from "express"
import { obtenerPaises } from "./controllers.js"

const router = express.Router()

router.get("/paises/:criterio", obtenerPaises)

export default router