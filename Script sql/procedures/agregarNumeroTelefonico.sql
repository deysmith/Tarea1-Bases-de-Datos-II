/*
Agrega un nuevo número telefónico a una persona.

Entradas:
    - @BusinessEntity - int: Identificador de la persona a la que se desea
      agregar el número telefónico.
    - @Telefono - nvarchar(25): Número telefónico que se desea registrar.
    - @Tipo - nvarchar(50): Tipo de número telefónico que se desea registrar.

Salidas:
    - No retorna datos. Crea un nuevo registro en Person.PersonPhone.
    - La fecha de modificación se establece mediante GETDATE().

Restricciones:
    - @BusinessEntity debe existir en Person.BusinessEntity.
    - @Tipo debe ser: Home, Cell o Work.
    - @Telefono debe cumplir con uno de los siguientes formatos:
        - ###-###-###
        - 1 (##) ### ###-###
*/
CREATE PROCEDURE AgregarNumeroTelefonico
	@BusinessEntity int,
	@Telefono nvarchar(25),
	@Tipo nvarchar(50)
AS
BEGIN
	IF @Tipo NOT IN ('Home', 'Cell', 'Work')
	BEGIN
        THROW 50001, 'El tipo debe ser: Home, Cell o Work', 1
    END

	IF NOT EXISTS (
        SELECT 1
        FROM Person.Person
        WHERE BusinessEntityID = @BusinessEntity
    )
    BEGIN
        THROW 50002, 'El parámatro @BusinessEntity no se encuentra registrado.', 1
    END

    IF @Telefono NOT LIKE '[1-9][0-9][0-9]-[1-9][0-9][0-9]-[1-9][0-9][0-9]' AND 
       @Telefono NOT LIKE '[1] ([0-9][0-9]) [0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
    BEGIN
        THROW 50004, 'El teléfono no tiene un formato válido', 1
    END

    INSERT INTO Person.PersonPhone (
        BusinessEntityID,
        PhoneNumber,
        PhoneNumberTypeID,
        ModifiedDate
    )

    VALUES (
        @BusinessEntity,
        @Telefono,
        (SELECT PhoneNumberTypeID
        FROM Person.PhoneNumberType
        WHERE Name = @Tipo),
        GETDATE()
    )
END