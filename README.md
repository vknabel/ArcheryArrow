# 🏹 Archery Arrow


Runs multiple scripts.
For more information about Archery itself head to [vknabel/Archery](https://github.com/vknabel/Archery).


```json
{
    "scripts": {
        "format": {
            "arrow": "vknabel/BashArrow",
            "command": "swiftformat ."
        },
        "generate": {
            "arrow": "vknabel/ArcheryArrow",
            "run": [
                "readme",
                "format",
                "docs"
            ],
            "scripts": {
                "readme": {
                    "arrow": "vknabel/StencilArrow",
                    "template": "README.md.stencil",
                    "destination": "README.md",
                    "searchPaths": ["Scripts"]
                },
                "docs": {
                    "arrow": "vknabel/BashArrow",
                    "command": "if which jazzy >/dev/null; then jazzy; else echo Skip: Jazzy not available; fi"
                }
            }
        }
    }
}
```

Generate will execute all scripts in the given order.
```bash
$ archery generate
# Will run readme, format and docs
```


## Available Options

| Name | Type | Default |
|------|------|---------|
| run | `[String]` | Required |
| scripts | `[String: AnyArrow]?` | `[:]` |

## Contributors
* Valentin Knabel, [@vknabel](https://github.com/vknabel), dev@vknabel.com, [@vknabel](https://twitter.com/vknabel) on Twitter


## License
Archery is available under the [](https://github.com/vknabel/archery/master/LICENSE) license.
