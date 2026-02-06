const characterService = require('../services/character.service');

async function getCharacters(req, res) {
  try {
    const data = await characterService.getAllCharacters();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '查询失败' });
  }
}

module.exports = {
  getCharacters
};