SELECT 
    c.Codigo,
    c.NomApels AS Cajero,
    SUM(p.Precio) AS ImporteTotalVentas
FROM 
    VENTA v
JOIN 
    CAJEROS c ON v.Cajero = c.Codigo
JOIN 
    PRODUCTOS p ON v.Producto = p.Codigo
GROUP BY 
    c.Codigo, c.NomApels;
