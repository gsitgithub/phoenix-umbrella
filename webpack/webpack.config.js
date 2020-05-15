const path = require('path');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const pathHelpers = require('./path.js');

module.exports = {
    mode: "development",
    entry: {
        'photog': pathHelpers.defaultEntrypointForApp('photog'),
        'seren': pathHelpers.defaultEntrypointForApp('seren'),
        'booklist': pathHelpers.defaultEntrypointForApp('booklist'),
        'bookmarker': pathHelpers.defaultEntrypointForApp('bookmarker'),
        'movielist': pathHelpers.defaultEntrypointForApp('movielist'),
        'grenadier': pathHelpers.defaultEntrypointForApp('grenadier'),
        'blockquote': `${__dirname}/../apps/blockquote/assets/sass/admin.scss`,
        'artour_admin': `${__dirname}/../apps/artour/assets/js/admin/index.js`,
        'artour_public': `${__dirname}/../apps/artour/assets/js/public/index.js`,
        'startpage_admin': `${__dirname}/../apps/startpage/assets/js/admin/index.js`,
        'startpage_public': `${__dirname}/../apps/startpage/assets/js/public/index.js`,
    },
    output: {
        path: path.join(__dirname, '..', 'apps'),
        filename: (info) => {
            return pathHelpers.outputPathForApp(info.chunk.name, 'js');
        },
    },
    resolve: {
        alias: {
            'umbrella-common-js': path.resolve(__dirname, '../apps/common/assets/js/'),
            bootstrap: path.resolve(__dirname, '../node_modules/bootstrap/scss'),
        },
    },
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader'
            },
            {
                test: /\.scss$/,
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader,
                    },
                    {
                        loader: 'css-loader',
                    },
                    {
                        loader: 'sass-loader',
                    },
                ]
            },
        ]
    },
    plugins: [
        new VueLoaderPlugin(),
        new MiniCssExtractPlugin({
            moduleFilename: (chunk) => {
                return pathHelpers.outputPathForApp(chunk.name, 'css');
            },
        }),
    ],
};