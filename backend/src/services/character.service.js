const characterModel = require('../models/character.model');

async function getAllCharacters() {
  return await characterModel.findAllCharacters();
}

module.exports = {
  getAllCharacters
};

