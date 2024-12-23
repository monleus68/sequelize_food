var DataTypes = require("sequelize").DataTypes;
var _food = require("./food");
var _food_type = require("./food_type");
var _like_res = require("./like_res");
var _orders = require("./orders");
var _rate_res = require("./rate_res");
var _restaurant = require("./restaurant");
var _sub_food = require("./sub_food");
var _users = require("./users");

function initModels(sequelize) {
  var food = _food(sequelize, DataTypes);
  var food_type = _food_type(sequelize, DataTypes);
  var like_res = _like_res(sequelize, DataTypes);
  var orders = _orders(sequelize, DataTypes);
  var rate_res = _rate_res(sequelize, DataTypes);
  var restaurant = _restaurant(sequelize, DataTypes);
  var sub_food = _sub_food(sequelize, DataTypes);
  var users = _users(sequelize, DataTypes);

  orders.belongsTo(food, { as: "food", foreignKey: "food_id"});
  food.hasMany(orders, { as: "orders", foreignKey: "food_id"});
  sub_food.belongsTo(food, { as: "food", foreignKey: "food_id"});
  food.hasMany(sub_food, { as: "sub_foods", foreignKey: "food_id"});
  food.belongsTo(food_type, { as: "type", foreignKey: "type_id"});
  food_type.hasMany(food, { as: "foods", foreignKey: "type_id"});
  like_res.belongsTo(restaurant, { as: "re", foreignKey: "res_id"});
  restaurant.hasMany(like_res, { as: "like_res", foreignKey: "res_id"});
  rate_res.belongsTo(restaurant, { as: "re", foreignKey: "res_id"});
  restaurant.hasMany(rate_res, { as: "rate_res", foreignKey: "res_id"});
  like_res.belongsTo(users, { as: "user", foreignKey: "users_id"});
  users.hasMany(like_res, { as: "like_res", foreignKey: "users_id"});
  orders.belongsTo(users, { as: "user", foreignKey: "users_id"});
  users.hasMany(orders, { as: "orders", foreignKey: "users_id"});
  rate_res.belongsTo(users, { as: "user", foreignKey: "users_id"});
  users.hasMany(rate_res, { as: "rate_res", foreignKey: "users_id"});

  return {
    food,
    food_type,
    like_res,
    orders,
    rate_res,
    restaurant,
    sub_food,
    users,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
