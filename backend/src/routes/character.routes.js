import express from 'express';
import { getCharacters, getCharacterSkills } from '../controllers/character.controller.js';

const router = express.Router();

router.get('/', getCharacters);
router.get('/skill', getCharacterSkills)

export default router;
