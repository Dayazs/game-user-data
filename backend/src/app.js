import express from 'express';
import characterRoutes from './routes/character.routes.js';

const app = express();

app.use(express.json());
app.use('/api/characters', characterRoutes);

// 获取静态资源
app.use('/images',express.static('public/images'));

export default app;

