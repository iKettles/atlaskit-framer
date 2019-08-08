import * as React from "react";
import * as System from "@atlaskit/modal-dialog";
import { ControlType, PropertyControls, addPropertyControls } from "framer";
import { controls, merge } from "./inferredProps/ModalBody";

const style: React.CSSProperties = {
  width: "100%",
  height: "100%"
};

export function ModalBody(props) {
  return <System.ModalBody {...props} style={style} />;
}

ModalBody.defaultProps = {
  width: 150,
  height: 50
};

addPropertyControls(ModalBody, {
  placeholder: merge(controls.placeholder, {}),
  css: merge(controls.css, {})
});
