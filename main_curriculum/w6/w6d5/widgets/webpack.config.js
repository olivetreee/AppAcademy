// webpack.config.js

module.exports = {
  //Entry and output points
  entry: './frontend/widgets.jsx',
  output: {
    path: './', //Use this path on rails apps
    filename: 'bundle.js',
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/], //for files ending in this...
        exclude: /(node_modules)/, //exclude node_modules
        loader: 'babel',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map', //Get line references when errors are raised
  resolve: {
    extensions: ['', '.js', '.jsx' ] //so you can type require "/lib/MyClass" and ommit the .js
  }
};
