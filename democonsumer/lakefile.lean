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
