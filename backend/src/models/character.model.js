import db from '../config/db.js';

// 查询所有角色信息
async function findAllCharacters() {
  const [rows] = await db.query('SELECT * FROM characters');
  return rows;
}

// 查询指定角色信息
async function findCharacterDetailById(id) {
  const [rows] = await db.query(`
    SELECT * FROM characters WHERE characters.id = ?;
    `, [id]);
  return rows;
}

// 根据指定的id查询角色的技能信息
async function findCharacterSkillById(id) {
  const [rows] = await db.query(`
    SELECT
      s.skill_name,
      s.skill_type,
      s.description
    FROM characters c
    LEFT JOIN character_skills s
    ON c.id = s.character_id
    WHERE c.id = ?;
    `, [id]);
  return rows;
}

// 根据指定的id查询角色的能力
async function findCharacterAttributesById(id) {
  const [rows] = await db.query(`
    SELECT
      c.id,
      c.name,
      c.faction,
      c.race,
      c.star_level,
      s.strength,
      s.agility,
      s.intelligence,
      s.willpower,
      s.hp,
      s.attack,
      s.defense,
      s.main_ability,
      secondary_ability
    FROM characters c
    LEFT JOIN character_stats s
    ON c.id = s.character_id
    WHERE c.id = ?;
    `, [id]);
  return rows;
}

// 根据指定的id查询角色的阵营和属性
async function findCharacterRanksById(id) {
  const [rows] = await db.query(`
    SELECT
      s.character_id,
      s.role_type,
      s.damage_type
    FROM characters c
    LEFT JOIN character_role_damage s
    ON c.id = s.character_id
    WHERE c.id = ?;
    `, [id]);
  return rows;
}

// 查询指定角色id的台词和介绍
async function findCharacterDialoguesById(id) {
  const [rows] = await db.query(`
    SELECT 
      d.character_id,
      d.catchphrase,
      d.introduction
    FROM characters c
    LEFT JOIN character_dialogues d
    ON c.id = d.character_id
    WHERE c.id = ?;
    `, [id]);
    return rows;
}
export { findAllCharacters, findCharacterSkillById, findCharacterAttributesById, findCharacterRanksById, findCharacterDetailById,findCharacterDialoguesById };