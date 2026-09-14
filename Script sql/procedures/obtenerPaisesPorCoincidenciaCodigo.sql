/*
Obtiene los países cuyo código de región comienza con el criterio indicado.

Entradas:
    - @Criterio - nvarchar(1): Letra utilizada como criterio de búsqueda.

Salidas:
    - Retorna el nombre de los países cuyo código de región comienza con
      la letra indicada.

Restricciones:
    - @Criterio debe ser una sola letra, mayúscula o minúscula.
*/
CREATE PROCEDURE ObtenerPaisesPorCoincidenciaCodigo
	@Criterio nvarchar(1)
AS
BEGIN
	IF @Criterio NOT LIKE '[A-Z]' AND @Criterio	NOT LIKE '[a-z]'
	BEGIN
		THROW 50005, 'El criterio debe ser una letra mayúscula o una letra minúscula', 1
	END

	SELECT CountryRegionCode as Código,
		   Name as Pais
	FROM Person.CountryRegion
	WHERE CountryRegionCode LIKE @Criterio + '%'
END;