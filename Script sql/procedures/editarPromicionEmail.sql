/*
Edita la preferencia de promociones por correo electrónico de una persona.

Entradas:
    - @BusinessEntity - int: Identificador de la persona cuyo registro 
      se desea modificar.
    - @PromocionEmail - int: Nueva preferencia de la persona para recibir
      promociones por correo electrónico.
Salidas:
    - No retorna datos. Actualiza el campo EmailPromotion en Person.Person.
    - La fecha de modificación se actualiza mediante GETDATE().
Restricciones:
    - @BusinessEntity debe existir en Person.Person.
    - @PromocionEmail debe ser 0, 1 o 2.
*/
CREATE PROCEDURE EditarPromicionEmail
    @BusinessEntity int,
    @PromocionEmail int
AS
BEGIN

    IF NOT EXISTS (
        SELECT 1
        FROM Person.Person
        WHERE BusinessEntityID = @BusinessEntity
    )
    BEGIN
        THROW 50002, 'El parámatro @BusinessEntity no se encuentra registrado.', 1
    END

    IF @PromocionEmail NOT IN (0, 1, 2)
    BEGIN
        THROW 50003, 'El parámatro PromocionEmail debe ser: 0, 1 o 2.', 1
    END

    UPDATE Person.Person
    SET EmailPromotion = @PromocionEmail,
        ModifiedDate = GETDATE()
    WHERE BusinessEntityID = @BusinessEntity
END;