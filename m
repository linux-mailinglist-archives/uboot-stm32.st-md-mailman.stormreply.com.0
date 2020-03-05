Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB5B17ADB1
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Mar 2020 18:58:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70EE6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Mar 2020 17:58:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07E5FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2020 17:58:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025HiAgI023943; Thu, 5 Mar 2020 18:57:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Kwfy22Hyba1wNhgaJayj9pb8cR/JBxzFAKoQ3y0BvVE=;
 b=iEYtot5UbrjjCOD5JPXBXzrPDmRYsksZKNlQQSLNDfs27wIGW7Q/1zvHM79hdjZkGe2y
 Hk59QADBUPLuGEAr8J9icq9pLSXQD2I+4nyrbSHvCyUmUxZfSSqt83XsXOL7uLvELPOK
 xX13CiCPXgmkuowa5usIL1UtDWVNqAfpj3w4ywBs1mVF36wAOIp/6O32WQBAEoTbavg6
 jSxj0PZ/fVVV0W2Dl2xN0Tq+foinVpizZPSeQJK8k1Qeuf8T86tSBMi47MVk37eP5nVA
 pJsLxSMhQ85bNz8oJDELUCWZ2VLMZUgZHx/YiTIHCcp9oIh/Ab4V51EN4Ymlh+oiiKYu 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem19mas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 18:57:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CAD5100034;
 Thu,  5 Mar 2020 18:57:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE2CB2BEC5F;
 Thu,  5 Mar 2020 18:57:40 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 5 Mar
 2020 18:57:40 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 5 Mar 2020 18:57:40 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v4 1/5] dm: clk: add stub when CONFIG_CLK is desactivated
Thread-Index: AQHV5jZUpYcfs9bFWUSVG2S8k0nlsag43qwAgAF16sA=
Date: Thu, 5 Mar 2020 17:57:40 +0000
Message-ID: <8807f2e484b74f2eb101cc29781ee1fe@SFHDAG6NODE3.st.com>
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <20200218083503.5468-2-patrick.delaunay@st.com>
 <6981022d-792b-7776-ac9f-00af6acb1d0e@gmail.com>
In-Reply-To: <6981022d-792b-7776-ac9f-00af6acb1d0e@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_06:2020-03-05,
 2020-03-05 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Sekhar Nori <nsekhar@ti.com>, Lukasz
 Majewski <lukma@denx.de>, "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/5] dm: clk: add stub when CONFIG_CLK
	is desactivated
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
> Sent: mercredi 4 mars 2020 20:49
> 
> Am 18.02.2020 um 09:34 schrieb Patrick Delaunay:
> > Add stub for functions clk_...() when CONFIG_CLK is desactivated.
> >
> > This patch avoids compilation issues for driver using these API
> > without protection (#if CONFIG_IS_ENABLED(CLK))
> >
> > For example, before this patch we have undefined reference to
> > `clk_disable_bulk') for code:
> >   clk_disable_bulk(&priv->clks);
> >   clk_release_bulk(&priv->clks);
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v4:
> > - Add stub for all functions using 'struct clk' or 'struct clk_bulk'
> >   after remarks on v3
> >
> > Changes in v3:
> > - Add stub for clk_disable_bulk
> >
> > Changes in v2: None
> >
> >  include/clk.h | 101
> > +++++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 88 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/clk.h b/include/clk.h index
> > 3336301815..1fb415ddc8 100644
> > --- a/include/clk.h
> > +++ b/include/clk.h
> > @@ -312,6 +312,7 @@ static inline int clk_release_bulk(struct clk_bulk *bulk)
> >  	return clk_release_all(bulk->clks, bulk->count);  }
> >
> > +#if CONFIG_IS_ENABLED(CLK)
> >  /**
> >   * clk_request - Request a clock by provider-specific ID.
> >   *
> > @@ -433,19 +434,6 @@ int clk_disable_bulk(struct clk_bulk *bulk);
> >   */
> >  bool clk_is_match(const struct clk *p, const struct clk *q);
> >
> > -int soc_clk_dump(void);
> > -
> > -/**
> > - * clk_valid() - check if clk is valid
> > - *
> > - * @clk:	the clock to check
> > - * @return true if valid, or false
> > - */
> > -static inline bool clk_valid(struct clk *clk) -{
> > -	return clk && !!clk->dev;
> > -}
> > -
> >  /**
> >   * clk_get_by_id() - Get the clock by its ID
> >   *
> > @@ -465,6 +453,93 @@ int clk_get_by_id(ulong id, struct clk **clkp);
> >   * @return true on binded, or false on no
> >   */
> >  bool clk_dev_binded(struct clk *clk);
> > +
> > +#else /* CONFIG_IS_ENABLED(CLK) */
> > +
> > +static inline int clk_request(struct udevice *dev, struct clk *clk) {
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline int clk_free(struct clk *clk) {
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline ulong clk_get_rate(struct clk *clk) {
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline struct clk *clk_get_parent(struct clk *clk) {
> > +	return (struct clk *)-ENOSYS;
> 
> This should use ERR_PTR() to care for platforms defining
> CONFIG_ERR_PTR_OFFSET.

Yes I take the point for V5.

> > +}
> > +
> > +static inline long long clk_get_parent_rate(struct clk *clk) {
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline ulong clk_set_rate(struct clk *clk, ulong rate) {
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline int clk_set_parent(struct clk *clk, struct clk *parent)
> > +{
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline int clk_enable(struct clk *clk) {
> > +	return -ENOSYS;
> > +}
> > +
> > +static inline int clk_enable_bulk(struct clk_bulk *bulk) {
> > +	return bulk && bulk->count == 0 ? 0 : -ENOSYS;
> 
> For this test to work, someone would need to set bulk->count to 0. This is normally
> done by clk_get_bulk(), but you defined it to only return an error.
> 
> I guess it works for you because all clk_bulk objects you use are from the heap
> (which is currently zeroed out in U-Boot) or if they are on the stack, you have
> if/else code that doesn't bring you here. Still it seems wrong.

Yes exactly, it is working for me as the bulk was in private date, so zero allocated.

I will update on V5

> Regards,
> Simon

Thanks for the review
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
