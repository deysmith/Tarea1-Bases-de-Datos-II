/*
Elimina un número telefónico 

Entradas:
    - @Telefono - nvarchar(25): Número telefónico que se desea eliminar.

Salidas:
    - No retorna datos. Elimina un registro de Person.PersonPhone  

Restricciones:
    - @Telefono debe cumplir con uno de los siguientes formatos:
        - ###-###-###
        - 1 (##) ### ###-###
*/
CREATE PROCEDURE EliminarNumeroTelefonico
	@Telefono nvarchar(25)

AS
BEGIN
	
    IF @Telefono NOT LIKE '[1-9][0-9][0-9]-[1-9][0-9][0-9]-[1-9][0-9][0-9]' AND 
       @Telefono NOT LIKE '[1] ([0-9][0-9]) [0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
    BEGIN
        THROW 50004, 'El teléfono no tiene un formato válido', 1
    END

    DELETE FROM Person.PersonPhone
    WHERE PhoneNumber = @Telefono
END;