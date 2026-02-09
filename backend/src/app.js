import express from 'express';
import characterRoutes from './routes/character.routes.js';

const app = express();

app.use(express.json());
app.use('/api/characters', characterRoutes);

export default app;

