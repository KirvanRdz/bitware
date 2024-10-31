SELECT 
    p.Nombre AS Producto,
    COUNT(*) AS TotalVentas
FROM 
    VENTA v
JOIN 
    PRODUCTOS p ON v.Producto = p.Codigo
GROUP BY 
    p.Nombre
ORDER BY 
    TotalVentas DESC;
