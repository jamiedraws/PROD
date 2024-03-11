const path = require("path");
const glob = require("glob");
const autoprefixer = require("autoprefixer");

const mode = process.env.NODE_ENV || "development";
const target = process.env.NODE_ENV === "production" ? "browserslist" : "es5";

console.log(__dirname);

const createEntryContext = function (entryName, regexExtension) {
    const search = `${entryName}.+${regexExtension.source}`;
    const searchRegex = new RegExp(search);

    const files = glob.sync(`./{shared/ui/,/**/}${search}`);
    const entries = {};

    files.forEach((path) => {
        const directory = path.replace(searchRegex, "");
        if (!entries[directory]) {
            entries[directory] = { import: [] };
        }

        entries[directory].import.push(path);
    });

    return entries;
};

module.exports = {
    target: target,
    mode: mode,
    entry: createEntryContext("app", /(ts|scss)/i),
    output: {
        filename: "./[name]/app.js",
        path: path.resolve(__dirname)
    },
    watch: true,
    watchOptions: {
        ignored: /node_modules/
    },
    devtool: "source-map",
    module: {
        rules: [
            {
                test: /\.s[ac]ss$/i,
                type: "asset/resource",
                generator: {
                    filename: "[path][name].css"
                },
                use: [
                    { loader: "extract-loader" },
                    { loader: "css-loader" },
                    {
                        loader: "postcss-loader",
                        options: {
                            postcssOptions: {
                                plugins: [autoprefixer()]
                            }
                        }
                    },
                    {
                        loader: "sass-loader",
                        options: {
                            implementation: require("sass"),
                            webpackImporter: false,
                            sassOptions: {
                                includePaths: ["./node_modules"]
                            }
                        }
                    }
                ]
            },
            {
                test: /\.ts$/,
                loader: "ts-loader",
                include: path.resolve(__dirname),
                exclude: /node_modules/,
                options: {
                    onlyCompileBundledFiles: true
                }
            },
            {
                test: /\.ts|.js$/,
                loader: "babel-loader",
                exclude: /node_modules/,
                options: {
                    presets: [
                        [
                            "@babel/preset-env",
                            {
                                modules: false,
                                useBuiltIns: "usage",
                                corejs: 3,
                                loose: true
                            }
                        ],
                        "@babel/typescript"
                    ],
                    plugins: [
                        [
                            "@babel/plugin-proposal-class-properties",
                            {
                                loose: true
                            }
                        ]
                    ]
                }
            }
        ]
    },
    resolve: {
        extensions: [".scss", ".sass", ".ts", ".js"],
        alias: {
            shared: path.resolve(__dirname, "shared"),
            ts: path.resolve(__dirname, "ts")
        }
    },
    optimization: {
        usedExports: true
    }
};
