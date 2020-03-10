Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD417F434
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 10:54:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A872C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 09:54:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E0B0C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 09:54:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02A9mp3o000994; Tue, 10 Mar 2020 10:53:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ScLDKg5aYoAb1oxK8MXPyw9HFNMpPf5m8QoCtPaNUVM=;
 b=ghhSTwMJL0RECwryWfbYF7aMNmey5Jms3PQ4euI/baam9eKdYZWGMkleSupwk1frcK1X
 giUtRQxkS3p8z5ZGKuNtswruMZVFDxysF89vAx85avxmPPMNH8yUTiv5seCK+1n/xKP0
 cB3kPjb1F3CQKG4iwQlwo3xOmYZ8ET6+P0+b7AnYRlrCTy6ungLr7UAnuqecx1DfUErG
 MU2hL7plqEMH529+2mYDXmrpRqQ2G4UNcaF5BuOGS7gQXPahIXlmI2pXffm+XfrxUm3B
 12KwiX1QauZeaEfAAOXnY4iQ99aCyg9UyrmRuwp4pWyyg43KyhmwdsZix1+Jo6ySdtpn mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1y6jg04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 10:53:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CF8C100039;
 Tue, 10 Mar 2020 10:52:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA6E62A4D64;
 Tue, 10 Mar 2020 10:52:57 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Mar
 2020 10:52:57 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 10 Mar 2020 10:52:57 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Thread-Topic: [PATCH v5 1/5] dm: clk: add stub when CONFIG_CLK is deactivated
Thread-Index: AQHV855Aldt9ANv5GUOG/acvsfahH6g7XLCAgAY0/nA=
Date: Tue, 10 Mar 2020 09:52:57 +0000
Message-ID: <227fa911c82c42969e2729472fe39600@SFHDAG6NODE3.st.com>
References: <20200306100140.27582-1-patrick.delaunay@st.com>
 <20200306100140.27582-2-patrick.delaunay@st.com>
 <CAAh8qsxjEBGyDicSsEJJ0fsn=X6JDz9=N4GYkm5EgrMcrK=rOQ@mail.gmail.com>
In-Reply-To: <CAAh8qsxjEBGyDicSsEJJ0fsn=X6JDz9=N4GYkm5EgrMcrK=rOQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_04:2020-03-09,
 2020-03-10 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v5 1/5] dm: clk: add stub when CONFIG_CLK
	is deactivated
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

Hi Simon,

> From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> Sent: vendredi 6 mars 2020 12:28
> 
> On Fri, Mar 6, 2020 at 11:01 AM Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > Add stub for functions clk_...() when CONFIG_CLK is deactivated.
> >
> > This patch avoids compilation issues for driver using these API
> > without protection (#if CONFIG_IS_ENABLED(CLK))
> >
> > For example, before this patch we have undefined reference to
> > `clk_disable_bulk') for code:
> >   clk_disable_bulk(&priv->clks);
> >   clk_release_bulk(&priv->clks);
> >
> > The bulk stub set and test bulk->count to avoid error for the sequence:
> >
> >   clk_get_bulk(dev, &priv->bulk);
> >         ....
> >   if (clk_enable(&priv>bulk))
> >         return -EIO;
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v5:
> > - use ERR_PTR in clk_get_parent()
> > - force bulk->count = 0 in clk_get_bulk to avoid issue
> >   for next call of clk_enable_bulk / clk_enable_bulk
> 
> I wonder if this is correct. I think it only produces additional code. If you always set
> bulk->count to 0, the enable code will never fail.
> 
> However, the enable function should never be executed as enable returns an error.
> I can imagine the *disable* function could be called, but the return value of this
> function is currently only handled in clk_sandbox_test.c...
>
> Wouldn't it work to just remove all checks for bulk->count and let *all* redefined
> functions return a constant (success or failure)? That would help to keep the code
> small.

I wasn't sure if each stub should raise error or success.

When I code the stub the first time I found one example for API usage without protection
which can cause issue in drivers/net/ftgmac100.c

ftgmac100_ofdata_to_platdata
=> clk_get_bulk(dev, &priv->clks);

ftgmac100_probe(struct udevice *dev)
=> clk_enable_bulk(&priv->clks);

An other example : drivers/power/domain/meson-ee-pwrc.c
   meson_ee_pwrc_probe => clk_get_bulk(dev, &priv->clks);
   meson_ee_pwrc_on => clk_enable_bulk(&priv->clks);

And same in drivers/power/domain/meson-gx-pwrc-vpu.c

But finally after deeper check today, these driver can't handle the proposed clk stubs
(error during probe for clk_get_bulk).

So I agree that I complexify the clk stub only for over protection.

> Looking at linux, clock disable functions have *no* return value that needs to be
> checked, clock enable functions return success when compiled without clock
> support.

I also check the stub for reset function in "./include/reset.h"
- reset_free
- reset_assert
- reset_deassert
- reset_deassert_bulk
- reset_assert_bulk

All these reset stub functions return 0

So to be coherent I will update the patch to return success for 
clk_free, clk_enable, clk_disable, clk_disable_bulk and clk_enable_bulk.

And other functions return error -ENOSYS: request / get_rate / set_rate

> Regards,
> Simon
> 

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
