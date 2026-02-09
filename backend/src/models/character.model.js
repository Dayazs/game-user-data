import db from '../config/db.js';

// 查询所有角色信息
async function findAllCharacters() {
  const [rows] = await db.query('SELECT * FROM characters');
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

export { findAllCharacters, findCharacterSkillById };