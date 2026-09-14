import "dotenv/config"
import express from "express"
import router from "./src/routes.js"

const app = express()

app.use(express.json())
app.use(router)

app.listen(process.env.API_PORT, () => {
    console.log("Shes alive")
})

export default app