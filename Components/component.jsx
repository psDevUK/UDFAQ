import React, { useEffect, useState } from "react";
import Faq from "react-faq-component";
import { withComponentFeatures } from 'universal-dashboard'

const UDFAQ = props => {
  const data = {
    title: props.title,
    rows: props.rows
  };

  const styles = {
    bgColor: props.bgColor,
    titleTextColor: props.titleTextColor,
    titleTextSize: props.titleTextSize,
    rowTitleColor: props.rowTitleColor,
    rowTitleTextSize: props.rowTitleTextSize,
    rowContentColor: props.rowContentColor,
    rowContentTextSize: props.rowContentTextSize,
    arrowColor: props.arrowColor,
    transitionDuration: props.transitionDuration
  };

  const config = {
    animate: true,
    expandIcon: "+",
    collapseIcon: "-",
    tabFocus: true
  };

  return (
    <div key={props.id}>
      <Faq
        data={data}
        styles={styles}
        config={config}
      />
    </div>
  );
}

export default withComponentFeatures(UDFAQ)