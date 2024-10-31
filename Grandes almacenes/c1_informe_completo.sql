SELECT 
    c.NomApels AS Cajero,
    p.Nombre AS Producto,
    p.Precio AS Precio,
    m.Piso AS Piso
FROM 
    VENTA v
JOIN 
    CAJEROS c ON v.Cajero = c.Codigo
JOIN 
    PRODUCTOS p ON v.Producto = p.Codigo
JOIN 
    MAQUINAS_REGISTRADORAS m ON v.Maquina = m.Codigo;
