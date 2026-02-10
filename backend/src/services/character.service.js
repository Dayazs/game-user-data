import { findAllCharacters, findCharacterSkillById, findCharacterAttributesById ,findCharacterRanksById} from '../models/character.model.js';

// 获取角色基本信息
async function getAllCharacters() {
  return await findAllCharacters();
}

// 获取指定id角色技能信息
async function getCharacterSkillById(id) {
  return await findCharacterSkillById(id);
}

// 获取指定id角色能力信息
async function getCharacterAttributesById(id) {
  return await findCharacterAttributesById(id);
}

// 获取指定id角色阵营和属性信息
async function getCharacterRanksById(id) {
  return await findCharacterRanksById(id);
}

export { getAllCharacters, getCharacterSkillById, getCharacterAttributesById,getCharacterRanksById };
