WITH VentasPorPiso AS (
    SELECT 
        m.Piso,
        SUM(p.Precio) AS TotalVentasPiso
    FROM 
        VENTA v
    JOIN 
        MAQUINAS_REGISTRADORAS m ON v.Maquina = m.Codigo
    JOIN 
        PRODUCTOS p ON v.Producto = p.Codigo
    GROUP BY 
        m.Piso
)
SELECT DISTINCT 
    c.Codigo,
    c.NomApels AS Cajero
FROM 
    VENTA v
JOIN 
    CAJEROS c ON v.Cajero = c.Codigo
JOIN 
    MAQUINAS_REGISTRADORAS m ON v.Maquina = m.Codigo
JOIN 
    VentasPorPiso vp ON m.Piso = vp.Piso
WHERE 
    vp.TotalVentasPiso < 5000;
