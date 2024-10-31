const fs = require('fs');
const mongoose = require('mongoose');
const csv = require('csv-parser');

// Conectar a MongoDB
mongoose.connect('mongodb://localhost:27017/test');

// Definir un esquema y modelo para MongoDB
const dataSchema = new mongoose.Schema({
  nombre: String,
  apellido: String,
  correo: String,
},{ versionKey: false });

const Data = mongoose.model('Data', dataSchema);

// Función async para leer el archivo CSV y guardar los datos en MongoDB
const importarCSV = async (rutaArchivo) => {
  const resultados = [];

  // Leer el archivo CSV y agregar los datos a resultados
  await new Promise((resolve, reject) => {
    fs.createReadStream(rutaArchivo)
      .pipe(csv())
      .on('data', (data) => resultados.push(data))
      .on('end', resolve)
      .on('error', reject);
  });

  // Guardar los resultados en MongoDB
  try {
    await Data.insertMany(resultados);
    console.log('Datos importados exitosamente.');
  } catch (error) {
    console.error('Error al guardar los datos:', error.message);
  } finally {
    mongoose.connection.close();
  }
};

// Usar la función
importarCSV('contactos.csv');
