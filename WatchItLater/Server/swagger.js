//http://localhost:4000/api-docs
const swaggerJSDoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Watch It Later API',
      version: '1.0.0',
      description: 'API to manage watchlist items'
    },
    servers: [
      {
        url: 'http://localhost:4000'
      }
    ]
  },
  apis: ['./swagger.js'] // This file contains the comments
};

const swaggerSpec = swaggerJSDoc(options);
module.exports = swaggerSpec;

/**
 * @swagger
 * /watchitlater/all:
 *   get:
 *     summary: Get all watchlist items
 *     tags: [WatchItLater]
 *     responses:
 *       200:
 *         description: A list of watchlist items
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 */

/**
 * @swagger
 * /watchitlater/{id}:
 *   get:
 *     summary: Get a single watchlist item by ID
 *     tags: [WatchItLater]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: integer
 *         required: true
 *         description: Numeric ID of the watchlist item to get
 *     responses:
 *       200:
 *         description: Watchlist item data
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: integer
 *                 type:
 *                   type: string
 *                 name:
 *                   type: string
 *                 season:
 *                   type: integer
 *                 date:
 *                   type: string
 *                   format: date
 *                 description:
 *                   type: string
 *                 image:
 *                   type: string
 *                   description: URL of the image
 *       404:
 *         description: Item not found
 *       500:
 *         description: Server error
 */

/**
 * @swagger
 * /watchitlater/add:
 *   post:
 *     summary: Add a new item to the watchlist
 *     tags: [WatchItLater]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - type
 *               - name
 *             properties:
 *               type:
 *                 type: string
 *               name:
 *                 type: string
 *               season:
 *                 type: int
 *               date:
 *                 type: string
 *               description:
 *                 type: string
 *               image:
 *                 type: string
 *     responses:
 *       200:
 *         description: Item added successfully
 *       500:
 *         description: Error inserting item
 */

/**
 * @swagger
 * /watchitlater/edit/{id}:
 *   put:
 *     summary: Update an existing item in the watchlist
 *     tags: [WatchItLater]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the item to update
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - type
 *               - name
 *             properties:
 *               type:
 *                 type: string
 *               name:
 *                 type: string
 *               season:
 *                 type: integer
 *               date:
 *                 type: string
 *               description:
 *                 type: string
 *               image:
 *                 type: string
 *     responses:
 *       200:
 *         description: Item updated successfully
 *       404:
 *         description: Item not found
 *       600:
 *         description: Error updating item
 */

/**
 * @swagger
 * /watchitlater/delete/{id}:
 *   delete:
 *     summary: Delete an item by ID
 *     tags: [WatchItLater]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the item to delete
 *     responses:
 *       200:
 *         description: Item removed
 */