import { obtenerPaisesPorCoincidenciaCodigo } from "./services.js"

export async function obtenerPaises(req, res) {
    try {
        const { criterio } = req.params
        const paises = await obtenerPaisesPorCoincidenciaCodigo(criterio)
        res.json(paises)
    } catch (error) {
        res.status(500).json({
            error: "Error"
        })
    }
}