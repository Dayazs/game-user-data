import { findAllCharacters, findCharacterSkillById, findCharacterAttributesById, findCharacterRanksById, findCharacterDetailById, findCharacterDialoguesById } from '../models/character.model.js';

// 获取角色基本信息
async function getAllCharacters() {
  return await findAllCharacters();
}

// 获取指定角色信息
async function getCharacterDetailById(id) {
  return await findCharacterDetailById(id);
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

// 获取指定id角色的台词和介绍
async function getCharacterDialoguesById(id) {
  return await findCharacterDialoguesById(id);
}

export { getAllCharacters, getCharacterSkillById, getCharacterAttributesById, getCharacterRanksById, getCharacterDetailById, getCharacterDialoguesById };
