Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863EFF94AA
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 16:48:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16C62C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 15:48:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61EA8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 15:48:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xACFlebf022725; Tue, 12 Nov 2019 16:47:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tk6mvVlAYgoUBYvJF60Kj/15ltX5istHwJF3at+Mx+w=;
 b=MKYL70mMsCO1XweJDeLw/aBU1CCkD/cZ9K85AikGCNqgN98qy2Kwx1NmdNx3wFqany3X
 HMnu3r5cxTB0ZOl6t3OciZG7+wtk5yI9yjgNKspq+WbSuTacuEbzNb9T1cdM810+jcz9
 sL4HamErInWDDT//XPyd2KnVJPvgHsgXq+tQBH+myWf7TZQy4jhYQigcMelHPbverqt4
 C8t9Y6DaJc6BefpizSKvNfm/9hUdFfjn6fCNnwyL4fgFcEvbWEzE2R4u/S/nepCE4x4p
 HH5DsI9X1DkZSeaqHPCB1IhN26mh42wvbn1/Pm8on47Z4REBzQQi9fckKuLbHpNoJaB0 +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psb31em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 16:47:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56CA810002A;
 Tue, 12 Nov 2019 16:47:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F2B22AC100;
 Tue, 12 Nov 2019 16:47:56 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 16:47:56 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 12 Nov 2019 16:47:56 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 1/5] dm: clk: add stub for clk_disable_bulk when
 CONFIG_CLK is desactivated
Thread-Index: AQHVmT14rnLTQ8q+B0mTNWKgT9V1FqeHQWGAgABn7oA=
Date: Tue, 12 Nov 2019 15:47:56 +0000
Message-ID: <2e3b948dad6b470ba1356dbf04080d6e@SFHDAG6NODE3.st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
 <20191112094214.12686-2-patrick.delaunay@st.com>
 <19c5071a-ab8a-7c68-a7fe-bda25391b531@ti.com>
In-Reply-To: <19c5071a-ab8a-7c68-a7fe-bda25391b531@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_05:2019-11-11,2019-11-12 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/5] dm: clk: add stub for
 clk_disable_bulk when CONFIG_CLK is desactivated
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Jean-Jacques,


> From: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Sent: mardi 12 novembre 2019 11:17
> 
> Hi Patrick,
> 
> On 12/11/2019 10:42, Patrick Delaunay wrote:
> > Add stub for clk_disable_bulk() when CONFIG_CLK is desactivated.
> >
> > That avoid compilation issue (undefined reference to
> > `clk_disable_bulk') for code:
> >
> > clk_disable_bulk(&priv->clks);
> > clk_release_bulk(&priv->clks);
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v3:
> > - Add stub for clk_disable_bulk
> >
> > Changes in v2: None
> >
> >   include/clk.h | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/include/clk.h b/include/clk.h index
> > a5ee53d94a..6f0b0fe4bc 100644
> > --- a/include/clk.h
> > +++ b/include/clk.h
> > @@ -379,7 +379,11 @@ int clk_disable(struct clk *clk);
> >    *		by clk_get_bulk().
> >    * @return zero on success, or -ve error code.
> >    */
> > + #if CONFIG_IS_ENABLED(CLK)
> >   int clk_disable_bulk(struct clk_bulk *bulk);
> > +#else
> > +inline int clk_disable_bulk(struct clk_bulk *bulk) { return 0; }
> > +#endif
> 
> Maybe this could be done for all clk operations ?

I think about, but after reflection

1/ stub already exist for :
clk_get_by_index
clk_get_bulk
clk_get_by_name
clk_release_all

=> just inline , return -ENOSYS

2/ clk_release_bulk inline call for clk_release_all

3/ other function (clk_request, clk_free, clk_get_rate, clk_enable, clk_disable) 
    should be not used as "clk" parameter is never valid / available if CONFIG_CLK is not activited

4/ the only remaining case is 

	int clk_disable_bulk(struct clk_bulk *bulk);

	=> clk_get_bulk return -ENOSYS but normally this information is not keept by caller....

	On error bulk.count = 0, and for me clk_disable_bulk(bulk wthou count = 0) is valid even if CONFIG_CLK is disable....

So I decide to limit the patch to this function to minimize the impacts
also because the 2020.01 windows is closed.

Moreover  I have not board to test CONFIG_CLK disabled.

But I agree : it is more clear a have a stub for other function which can be used 
	including clk_valid

=> I can propose a 2nd separate patch with this proposal if it is required.

> JJ

Regards 
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
