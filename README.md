# How its made

WARN: Open either democonsumer or demolib as folder in vscode.    
Opening the demolibLeanLocal repo dir will cause lean to underline false errors.    

The other repo with only the demolib is [https://github.com/userJY/demolibLean](https://github.com/userJY/demolibLean)

## Building library

```bash
mkdir demolib
cd demolib
lake init demolib lib
mkdir Demolib
touch Demolib/X.lean
```

modify content of Demolib.lean so that it imports all your lean files inside the Demolib folder like X.lean   

Demolib.lean
```
import Demolib.X
```

```bash
lake update #this will make a lean-manifest.json
lake build
```

## Using library

In make another directory for lean executable

```bash
cd democonsumer
lake init democonsumer exe
```

Main.lean

```
import Demolib

def main : IO Unit :=
  IO.println s!"Hello, {demo}"

#eval demo
```


locally with `require demolib from "../demolib"` where `../demolib` is path of the library directory 

```
import Lake
open Lake DSL

require demolib from "../demolib"

package «democonsumer» {
  -- add package configuration options here
}

@[default_target]
lean_exe «democonsumer» {
  -- add executable configuration options here
}
```

Alternatively pulling from github 

Add the line `require demolib from git "https://github.com/userJY/demolibLean.git"`

lakefile.lean


```
import Lake
open Lake DSL

require demolib from git "https://github.com/userJY/demolibLean.git"

package «democonsumer» {
  -- add package configuration options here
}

@[default_target]
lean_exe «democonsumer» {
  -- add executable configuration options here
}```


# Cleaning up the .gitignore for commiting

* remove the `.git` in both the democonsumer and demolib dir
* add a `.gitignore` in the workspace demolibLeanLocal repo dir

```
**/build
**/lake-packages/*
```
