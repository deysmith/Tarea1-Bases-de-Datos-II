<div align="center">  

![Curso](https://img.shields.io/badge/Curso-IC4302_Bases_de_Datos_II-pink)
![Tarea](https://img.shields.io/badge/II_Semestre_2026-pink)

</div>

# Tarea#1 - API

### Nombre y carné de los integrantes: Deywenie Smith Gregory | 2024096722

### Estado del proyecto: Muy bueno

### Enlace del video:

## Descripción del trabajo
Esta tarea consiste en la creación de una arquitectura en la cual la comunicación entre la aplicación y la base de datos se encuentra descentralizada. Esto se realizará mediante el desarrollo de una API que permita la comunicación con una base de datos en SQL Server.

## Características del producto
- La solución está implementada en una distribución de Linux (`Ubuntu 22.04.5`), mediante una máquina virtual.
- El motor de bases de datos utilizado es SQL Server .
- La base de datos utilizada es `AdventureWorks2025`.
- La API fue desarrollada utilizando `Node.js` y `Express`.

## Configuración del entorno

### Instalación de SQL Server
Para la instalación del motor de bases de datos se siguieron los pasos descritos en el sitio web oficial de Microsoft: [Inicio rápido: Instalación de SQL Server y creación de una base de datos en Ubuntu](https://learn.microsoft.com/es-es/sql/linux/install-upgrade/quickstart-install-ubuntu?view=sql-server-ver17&tabs=ubuntu2004%2C2025ubuntu2204%2Codbc-ubuntu-1804).

Además, se utilzó el siguiente video como guía: [Cómo Instalar SQL Server en Ubuntu Linux y Conectarlo con SSMS 2026](https://youtu.be/aMss5U2xnNc?si=use-sT03DfwAtj_p)

El proceso seguido fue el siguiente:

1. Acceder a la terminal como superusuario:
``` bash
sudo su
```
2. Descargar la clave pública, convertirla de ASCII a formato GPG y escribirla en la ubicación correspondiente:
``` bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
```
3. Descargar y registrar el repositorio de SQL Server para Ubuntu 22.04:
```bash
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2025.list | sudo tee /etc/apt/sources.list.d/mssql-server-2025.list
```
4. Instalar SQL Server
```bash
sudo apt-get update
sudo apt-get install -y mssql-server
```
5. Ejecutar el asistente de configuración de SQL Server, establecer la contraseña del usuario `sa` y seleccionar la edición correspondiente. En este caso, se seleccionó la opción 3: Developer Edition.
```bash
sudo /opt/mssql/bin/mssql-conf setup
```
6. Comprobar que el servicio de SQL Server se encuentra en ejecución:
```bash
systemctl status mssql-server --no-pager
```
### Instalación de `sqlsmd`

Además, se instaló `sqlcmd`, herramienta que permite ejecutar instrucciones de Transact-SQL, procedimientos almacenados y archivos de script desde la terminal.

Los pasos seguidos para instalar sqlcmd fueron los siguientes:
1. Importar la clave GPG del repositorio público de Microsoft:
```bash
curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
```

2. Agregar el repositorio de Microsoft correspondiente a la versión de Ubuntu utilizada:
```bash
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"
```

3. Instalar `sqlcmd`
```bash
apt-get update
apt-get install sqlcmd
```
### Conexión a la instancia desde Windows
Una vez instalado y configurado SQL Server en la máquina virtual con Ubuntu, se realizó la conexión a la instancia desde Windows utilizando SQL Server Management Studio.

Para establecer la conexión se abrió SQL Server Management Studio y en la ventana de conexión se ingresaron los siguientes datos:

-  Nombre del servidor: Dirección IP de la máquina virtual.
- Authentication: Autenticación de SQL Server
- Nombre de usuario: sa
- Contraseña: Contraseña establecida durante la configuración de SQL Server en Ubuntu.

Una vez ingresados los datos, se seleccionó Connect para establecer la conexión con la instancia.

Si la conexión se realiza correctamente, SSMS permite visualizar y administrar la instancia de SQL Server desde Windows. Permitiendo  ejecutar instrucciones de Transact-SQL y administrar las bases de datos alojadas en el servidor.

Esta conexión permite trabajar desde Windows con el motor de SQL Server instalado en Ubuntu, por lo que las instrucciones ejecutadas desde SSMS son procesadas por la instancia que se encuentra dentro de la máquina virtual.


### Instalación y restauración de la BD
La base de datos AdventureWorks2025 fue obtenida en el sitio web oficial de Microsoft: [AdventureWorks sample databases](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms). 

El archivo descargado fue `AdventureWorks2025.bak`. Este archivo se descargó directamente en la máquina virtual con Ubuntu, donde se encuentra instalado el motor de SQL Server.

Una vez descargado el archivo de respaldo, se realizó la restauración de la base de datos desde Windows mediante la conexión a la instancia de SQL Server que se encuentra ejecutándose en la máquina virtual.

Los scripts utilizados para realizar la restauración de la base de datos se encuentran en la carpeta [Scripts sql](https://github.com/deysmith/Tarea1-Bases-de-Datos-II/tree/09bfea6ac7d700d57fb345c7a735bc67856bff30/Script%20sql).

## Creación de la API

### Instalación de `Node.js` y dependencias
Para el desarrollo de la API se utilizó `Node.js`, el cual permite ejecutar código de JavaScript fuera del navegador. Además, se utilizó `npm` para la instalación y administración de las dependencias necesarias para el proyecto. Node.js y npm pueden ser descargados en el siguiente enlace: [Node.js](https://nodejs.org/es).

Para comprobar que `Node.js` y `npm` se encuentran instalados correctamente, se ejecutaron los siguientes comandos:

```bash
node --version
npm --version
```

Una vez creado el proyecto de `Node.js`, se instalaron las siguientes dependencias:
```bash
npm install express
npm install mssql
npm install msnodesqlv8
npm install dotenv
```

Estas dependencias se utilizan para las siguientes funciones:

- `express`: Permite crear y configurar los servicios web y los endpoints de la API.
- `mssql`: Permite establecer la comunicación entre Node.js y SQL Server.
- `msnodesqlv8`: Permite utilizar el controlador de ODBC para realizar la conexión con SQL Server.
- dotenv: Permite cargar las variables de entorno definidas en el archivo `.env`.

### Configuración de variables de entorno
Para configurar los datos necesarios para realizar la conexión entre la API y SQL Server, se utilizó un archivo `.env`. En este archivo se almacenan las variables de configuración de la base de datos y del puerto utilizado por la API.

El archivo `.env` se encuentra dentro de la carpeta [proyectos]() y contiene la siguiente estructura:

```javascript
DB_USER=usuario
DB_PASSWORD=contraseña
DB_SERVER=192.XXX.X.XX
DB_DATABASE=AdventureWorks2025
DB_PORT=1433
API_PORTT=8080
```

Las variables utilizadas son:
- `DB_USER`: Usuario utilizado para realizar la conexión con SQL Server.
- `DB_PASSWORD`: Contraseña del usuario de SQL Server.
- `DB_SERVER`: Dirección IP de la máquina virtual donde se encuentra ejecutándose SQL Server.
- `DB_DATABASE`: Nombre de la base de datos utilizada por la API.
- `DB_PORT`: Puerto utilizado por SQL Server en la Máquina virtual Ubuntu para recibir las conexiones.
- `API_PORT`: Puerto en el que se ejecutará la API.

### Estructura del proyecto
La API se encuentra organizada en diferentes archivos, donde cada uno se encarga de una parte específica de la aplicación. La estructura utilizada es la siguiente:

<pre>
proyectos/ 
├── src/ 
│ ├── config.js 
│ ├── connection.js 
│ ├── routes.js 
│ ├── controllers.js 
│ └── services.js 
├── .env
├── .gitignore
├── package.json
├── package-lock.json
└── app.js 
</pre>

Los archivos principales de la API cumplen con las siguientes funciones:
- `app.js`: Configura y ejecuta el servidor de Express.
- `config.js`: Contiene la configuración utilizada para realizar la conexión con SQL Server.
- `connection.js`: Establece la conexión con la base de datos.
- `routes.js`: Define las rutas de los diferentes endpoints de la API y las relaciona con los controllers.
- `controllers.js`: Recibe las solicitudes realizadas a los endpoints, envía los datos necesarios a los services y devuelve las respuestas al cliente.
- `services.js`: Se encarga de ejecutar los Stored Procedures y retornar los resultados.
- `.env`: Contiene las variables de entorno utilizadas para configurar la conexión con SQL Server y el puerto de la API.

### Stored Procedures
Las operaciones sobre la base de datos se realizaron por medio de Stored Procedures. De esta forma, la API no ejecuta directamente las consultas SQL, sino que solicita a SQL la ejecución del procedimiento correspondiente.

Los Stored Procedures utilizados en la API son los siguientes:

| Stored Procedure  | Operación  | Parámetros  | Descripción  |
|---                |---         |---          |---           |
| `ObtenerPaisesPorCoincidenciaCodigo`  |  `SELECT` | `@Criterio`  | Obtiene los países cuyo código de región comienza con el criterio indicado. |
| `GetPersonasPorTipoTelefono`  | `SELECT` con `JOIN`  | `@Tipo`  | Obtiene las personas que tienen un número telefónico del tipo indicado. |
|  `AgregarNumeroTelefonico` | `INSERT` | `@BusinessEntity`, `@Telefono` y `@Tipo`  | Agrega un nuevo número telefónico a una persona.  |
| `EditarPromocionEmail`  | `UPDATE`  | `@BusinessEntity` y `@PromocionEmail`  | Actualiza la preferencia de promociones por correo electrónico de una persona.  |
| `EliminarNumeroTelefonico` | `DELETE`  | `@Telefono` | Elimina un número telefónico registrado.  |

Los parámetros utilizados en los procedimientos son:

- `@BusinessEntity`: Identificador de la persona.
- `@Telefono`: Número telefónico que se desea agregar o eliminar.
- `@Tipo`: Tipo de número telefónico. Puede ser: Home, Cell o Work.
- `@PromocionEmail`: Preferencia de promociones por correo electrónico. Puede ser: 0, 1 o 2.
- `@Criterio`: Letra utilizada para realizar la búsqueda de países.

Los Stored Procedures se encuentran dentro de la carpeta [Scripts sql](https://github.com/deysmith/Tarea1-Bases-de-Datos-II/tree/09bfea6ac7d700d57fb345c7a735bc67856bff30/Script%20sql) / [procedures](https://github.com/deysmith/Tarea1-Bases-de-Datos-II/tree/09bfea6ac7d700d57fb345c7a735bc67856bff30/Script%20sql/procedures).

### Endpoints

La API cuenta con cinco endpoints para realizar las operaciones definidas mediante los Stored Procedures. Los endpoints desarrollados son los siguientes:

**GET `/paises:criterio`** 

Permite obtener los países cuyo código de región comienza con la letra indicada.
- Parámetro: `criterio` - Letra utilizada como criterio de búsqueda.
- Ejemplo de solicitud: `GET http://localhost:8080/paises/C`

Este endpoint ejecuta el Stored Procedure `ObtenerPaisesPorCoincidenciaCodigo`.

**GET `/personas/telefono/:tipo`**

Permite obtener las personas que tienen registrado un número telefónico del tipo indicado.

- Parámetro: `tipo` - Tipo de número telefónico. Puede ser Home, Cell o Work.
- Ejemplo de solicitud: `GET http:/localhost:8080/personas/telefono/Home`

Este endpoint ejecuta el Stored Procedure `GetPersonasPorTipoTelefono`.

**POST `/telefonos`**
Agrega un nuevo número telefónico a una persona.

- Body:
 ```json  
    {
        "businessE": 291,
        "telefono": "123-456-789",
        "tipo": "Home"
    }
```  
- Ejemplo de solicitud: `POST http://localhost:8080/telefonos`

Este endpoint ejecuta el Stored Procedure `AgregarNumeroTelefonico`.

**PUT `/personas/:businessE/promocion-email`**
Permite actualizar la preferencia de promociones por correo electrónico de una persona.

- Parámetro: `businessE` - Identificador de la persona.
- Body: 
    ``` json 
    {
        "promocionE": 2
    }
    ```  
- Ejemplo de solicitud: `PUT http://localhost:8080/personas/291/promocion-email`

Este endpoint ejecuta el Stored Procedure `EditarPromocionEmail`.

**DELETE `/telefonos/:telefono`**
Elimina un número telefónico registrado.
- Parámetro: `telefono`: Número telefónico que se desea eliminar.
- Ejemplo de solicitud: `DELETE http://localhost:8080/telefonos/123-456-789`

Este endpoint ejecuta el Stored Procedure `EliminarNumeroTelefonico`
