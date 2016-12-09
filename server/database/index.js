// const models = require('./models');
//
//
// export const db = models.sequelize;
//
//
// export const User = models.User;
// export const Dashboard = models.Dashboard;
//
// export const connect = () => {
//   return new Promise((resolve, reject) => {
//     try {
//       models.sequelize.sync().then(() => {
//         const schema = require('./graphql').getSchema()
//         resolve(schema);
//       });
//     } catch (error) {
//       reject(error);
//     }
//   });
// };