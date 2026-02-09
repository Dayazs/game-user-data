import { findAllCharacters } from '../models/character.model.js';

async function getAllCharacters() {
  return await findAllCharacters();
}

export { getAllCharacters };
