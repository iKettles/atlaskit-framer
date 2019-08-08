import * as React from "react";
import * as System from "@atlaskit/breadcrumbs";
import { ControlType, PropertyControls, addPropertyControls } from "framer";
import { controls, merge } from "./inferredProps/BreadcrumbsItem";

const style: React.CSSProperties = {
  width: "100%",
  height: "100%"
};

export function BreadcrumbsItem(props) {
  return <System.BreadcrumbsItem {...props} style={style} />;
}

BreadcrumbsItem.defaultProps = {
  width: 150,
  height: 50
};

addPropertyControls(BreadcrumbsItem, {
  href: merge(controls.href, {}),
  target: merge(controls.target, {}),
  iconAfter: merge(controls.iconAfter, {}),
  iconBefore: merge(controls.iconBefore, {}),
  text: merge(controls.text, {}),
  truncationWidth: merge(controls.truncationWidth, {}),
  hasSeparator: merge(controls.hasSeparator, {})
});
