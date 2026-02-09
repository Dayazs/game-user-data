import { getAllCharacters } from '../services/character.service.js';

async function getCharacters(req, res) {
  try {
    const data = await getAllCharacters();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '查询失败' });
  }
}

export { getCharacters };