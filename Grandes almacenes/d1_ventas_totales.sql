SELECT 
    m.Piso,
    SUM(p.Precio) AS VentasTotales
FROM 
    VENTA v
JOIN 
    MAQUINAS_REGISTRADORAS m ON v.Maquina = m.Codigo
JOIN 
    PRODUCTOS p ON v.Producto = p.Codigo
GROUP BY 
    m.Piso;
