import React from 'react';
import WithAuth from '../../lib/withAuth';
import Layout from '../../modules/layout/containers';
import Deal from '../../modules/deal/container';
import {commonItemLoad} from '../../modules/common/actions';

const DealIndex = (props)=>{
  return (
    <Layout {...props}>
      <Deal {...props} />
    </Layout>
  )
}
DealIndex.getInitialProps = async ({store,isServer})=>{
  const {common}=store.getState();
  if(common.payTypeList&&common.payTypeList.length==0){
    await  store.dispatch(commonItemLoad())
  }
  return {isServer}
}

export default WithAuth(DealIndex);


