<div align="center">  

![Curso](https://img.shields.io/badge/Curso-IC4302_Bases_de_Datos_II-pink)
![Tarea](https://img.shields.io/badge/II_Semestre_2026-pink)

</div>

# Tarea#1 - API

### Nombre y carné de los integrantes: Deywenie Smith Gregory | 2024096722

### Estado del proyecto: en veremos

### Enlace del video:

## Descripción del trabajo
Esta tarea consiste en la creación de una arquitectura en la cual la comunicación entre la aplicación y la base de datos se encuentra descentralizada. Esto se realizará mediante el desarrollo de una API que permita la comunicación con una base de datos en SQL Server.

## Características del producto
- La solución está implementada en una distribución de Linux (`Ubuntu 22.04.5`), mediante una máquina virtual.
- El motor de bases de datos utilizado es SQL Server 
- La base de datos utilizada es `AdventureWorks2025`.

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
5. Ejecutar el asistente de configuración de SQL Server, establecer la contraseña del usuario `sa` y seleccionar la edición correspondiente. En este caso, se seleccionó la opción 3: Standard Developer Edition.
```
sudo /opt/mssql/bin/mssql-conf setup
```
6. Comprobar que el servicio de SQL Server se encuentra en ejecución:
```
systemctl status mssql-server --no-pager
```
### Instalación de `sqlsmd`

Además, se instaló `sqlcmd`, herramienta que permite ejecutar instrucciones de Transact-SQL, procedimientos almacenados y archivos de script desde la terminal.

Los pasos seguidos para instalar sqlcmd fueron los siguientes:
1. Importar la clave GPG del repositorio público de Microsoft:
```
curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
```
2. Agregar el repositorio de Microsoft correspondiente a la versión de Ubuntu utilizada:
```
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/prod.list)"
```
3. Instalar `sqlcmd`
```
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


### Instalación y restuaración de la BD
La base de datos AdventureWorks2025 fue obtenida en el sitio web oficial de Microsoft: [AdventureWorks sample databases](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms). 

El archivo descargado fue `AdventureWorks2025.bak`. Este archivo se descargó directamente en la máquina virtual con Ubuntu, donde se encuentra instalado el motor de SQL Server.

Una vez descargado el archivo de respaldo, se realizó la restauración de la base de datos desde Windows mediante la conexión a la instancia de SQL Server que se encuentra ejecutandose en la máquina virtual.

Los scripts utilizados para realizar la restuaración de la base de datos se encuentra en la carpeta [Scripts sql](https://github.com/deysmith/Tarea1-Bases-de-Datos-II/tree/main/Scripts%20sql).

## Creación de la API
### Instalación de `node.js` y dependencias
### Configuración de variables de entorno
### Estructura del proyecto
### Stored Procedures
### Endpoints
