/**
 * Estas funciones se encargan de recibir las solicitudes realizados a los
 * endpoints, enviar los datos necesarias a los funciones que se encuentran
 * en services.js y reciben las respuestas para enviarlas nuevamente
 */

import { agregarNumeroTelefonico, editarPromocionEmail, eliminarNumeroTelefonico, obtenerPaisesPorCoincidenciaCodigo, obtenerPersonasPorTipoTelefono } from "./services.js"

export async function obtenerPaises(req, res) {
  try {
    const { criterio } = req.params
    const paises = await obtenerPaisesPorCoincidenciaCodigo(criterio)
      res.json(paises)
  } catch (error) {
    res.status(500).json({
      error: error.message
    })
  }
}

export async function obtenerPersonasPorTTelefono(req, res) {
  try {
    const { tipo } = req.params
    const personas = await obtenerPersonasPorTipoTelefono(tipo)
    res.json(personas)
  } catch (error) {
    res.status(500).json({
      error: error.message
    })
  }
}

export async function editarPromoEmail(req, res) {
  try {
    const { businessE } = req.params
    const { promocionE } = req.body
    await editarPromocionEmail(businessE, promocionE)
    res.json({
      resultado: "La preferencia de promociones ha sido actualizada correctamente"
    })
  } catch (error) {
    res.status(500).json({
      error: error.message
    })
  }
}

export async function agregarNumero(req, res) {
  try {
    const { businessE, telefono, tipo } = req.body
    await agregarNumeroTelefonico(businessE, telefono, tipo)
    res.json({
      resultado: "El número fue agregado correctamente"
    })
  } catch (error) {
    res.status(500).json({
      error: error.message
    })
  }
}

export async function eliminarNumero(req, res) {
  try {
    const { telefono } = req.params
    await eliminarNumeroTelefonico(telefono)
    res.json({
      resultado: "El número fue eliminado correctamente"
    })
  } catch (error) {
    res.status(500).json({
      error: error.message
    })
  }
}