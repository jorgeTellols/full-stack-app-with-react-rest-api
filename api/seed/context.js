'use strict';

require('dotenv').config(); 
const mysql = require('mysql2/promise');

class Context {
  constructor(enableLogging = false) {
    this.enableLogging = enableLogging;

    this.pool = mysql.createPool({
      host: process.env.DB_HOST,
      user: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0
    });
  }

  static prepareQuery(text) {
    return text
      .replace(/\s+/g, ' ')
      .trim();
  }

  static log(text, params) {
    console.info(`Running query: "${text}", with params: ${JSON.stringify(params)}`);
  }

  async execute(text, ...params) {
    const sql = Context.prepareQuery(text);
    if (this.enableLogging) {
      Context.log(sql, params);
    }

    const conn = await this.pool.getConnection();
    try {
      await conn.execute(sql, params);
    } finally {
      conn.release();
    }
  }

  async query(text, ...params) {
    const sql = Context.prepareQuery(text);
    if (this.enableLogging) {
      Context.log(sql, params);
    }

    const conn = await this.pool.getConnection();
    try {
      const [rows] = await conn.execute(sql, params);
      return rows;
    } finally {
      conn.release();
    }
  }

  async retrieve(text, ...params) {
    return this.query(text, ...params);
  }

  async retrieveSingle(text, ...params) {
    const data = await this.query(text, ...params);
    if (data && data.length === 1) {
      return data[0];
    } else if (data.length > 1) {
      throw new Error('Unexpected number of rows encountered.');
    }
    return null;
  }

  async retrieveValue(text, ...params) {
    const data = await this.query(text, ...params);
    if (data.length !== 1) {
      throw new Error('Unexpected number of rows encountered.');
    }

    const record = data[0];
    const keys = Object.keys(record);
    if (keys.length !== 1) {
      throw new Error('Unexpected number of values encountered.');
    }

    return record[keys[0]];
  }
}

module.exports = Context;
