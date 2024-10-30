import pg from 'pg'
const { Pool } = pg

const connectionConfig = {
  host: 'localhost',
  port: 5432,
  user: 'postgres',
  database: 'fallara',
  password: 'clave',
  max: 100
}

const pool = new Pool(connectionConfig)

const insertData = async () => {
  for (let i = 1; i <= 33000; i++) {
      const name = `Nombre${i}`;
      await pool.query('INSERT INTO usuarios (nombre) VALUES ($1)', [name]);
  }
  await pool.end();
}

insertData().catch(err => console.error('Error ejecutando script', err));
