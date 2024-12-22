const express = require('express');
const openingTagsController = require('../controllers/openingTagsController');

const router = express.Router();


router.post('/post/opening-tags-entry', openingTagsController.createOpeningTag);
router.get('/get/opening-tags-entry', openingTagsController.getOpeningTags);
router.put('/update/opening-tags-entry/:id', openingTagsController.updateOpeningTag);
router.delete('/delete/opening-tags-entry/:id', openingTagsController.deleteOpeningTag);




module.exports = router;
