/*
Devuelve el nombre y el número de télefono de la primeras 100 personas,
donde el tipo de número del télefono es igual al del parámetro ingresado.
Entradas:
    - @Tipo - nvarchar(50): Tipo de los número de télefono a buscar
Salidas:
    -  Primeras 100 personas donde el número de télefono coincide
Restricciones:
    - El tipo puede ser: Home, Cell o Work
*/
CREATE PROCEDURE GetPersonasPorTipoTelefono
    @Tipo nvarchar(50)
AS
BEGIN
    IF @Tipo NOT IN ('Home', 'Cell', 'Work')
    BEGIN
        THROW 50001, 'El tipo debe ser: Home, Cell o Work', 1
    END
    SELECT TOP 100
        concat(p.FirstName, ' ', ISNULL(p.MiddleName+ ' ', ''), p.LastName) as Nombre,
        pp.PhoneNumber as Numero
    FROM Person.Person p
    INNER JOIN Person.PersonPhone pp on pp.BusinessEntityID = p.BusinessEntityID
    INNER JOIN Person.PhoneNumberType pt on pt.PhoneNumberTypeID = pp.PhoneNumberTypeID
    WHERE pt.Name = @Tipo
END;
