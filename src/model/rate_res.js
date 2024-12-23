const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('rate_res', {
    users_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'users',
        key: 'users_id'
      }
    },
    res_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'restaurant',
        key: 'res_id'
      }
    },
    amount: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    date_rate: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'rate_res',
    timestamps: false,
    indexes: [
      {
        name: "users_id",
        using: "BTREE",
        fields: [
          { name: "users_id" },
        ]
      },
      {
        name: "res_id",
        using: "BTREE",
        fields: [
          { name: "res_id" },
        ]
      },
    ]
  });
};
