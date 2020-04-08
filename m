Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCD1A2822
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 19:54:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0C04C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 17:54:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8514C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2020 17:54:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038Hi1Xf002666; Wed, 8 Apr 2020 19:54:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MPFj5O63w9uFuP6DvZ7z8KRGw5aPkq9xO3pueCHpyWU=;
 b=sAByb6TxDSZSASIAb9BFYYP87KFF7PsR0B4WcUdpnRpuPDbsTpZAsoqsfeUdyI6EhRqz
 a1fVC7AEgj3GLyPWO9CIcTlMc2TBoW/8wO51aFablXmGtmK5snjNWR3leJU9QdtX4adO
 PbK2AdCJXY6DwqvPEHpYhC/6cDkOYW/4XyO0q1Z0EUI5Nbn7GNXf7mcijwEaoFgA6AyF
 he5LNA5yJsyoqUrrDtdv6LL8Ijul6rVRw+V9+6tHQ+iqN1Z+5J5ujAWcwkKNpcuLlCf6
 Y1YDKQj3FSuXUXIypBlBlltB7mqS1A1kUrdXp/ol7UkNUnVV5ZdRyBHjTFu/KIdtB6jg 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091k6wd8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 19:54:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B750D100038;
 Wed,  8 Apr 2020 19:54:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A83FE2C38C0;
 Wed,  8 Apr 2020 19:54:39 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr
 2020 19:54:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 8 Apr 2020 19:54:39 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/3] arm: caches: protect dram_bank_mmu_setup access to
 bi_dram
Thread-Index: AQHWCZHmZGt2TlfRZ0yXgHbRYqS8sKhnyJOAgAe+mSA=
Date: Wed, 8 Apr 2020 17:54:38 +0000
Message-ID: <a6908629697c460483b35ded72b69e96@SFHDAG6NODE3.st.com>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <714177fe-ba0e-cc2a-dcb4-0a5e4c036aa0@denx.de>
In-Reply-To: <714177fe-ba0e-cc2a-dcb4-0a5e4c036aa0@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>, Trevor
 Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] arm: caches: protect
 dram_bank_mmu_setup access to bi_dram
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

Dear Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 3 avril 2020 23:27
> 
> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
> > Add protection in dram_bank_mmu_setup() to avoid access to bd->bi_dram
> > before relocation.
> >
> > This patch allow to use the generic weak function dram_bank_mmu_setup
> > to activate the MMU and the data cache in SPL or in U-Boot before
> > relocation, when bd->bi_dram is not yet initialized.
> >
> > In this cases, the MMU must be initialized explicitly with
> > mmu_set_region_dcache_behaviour function.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  arch/arm/lib/cache-cp15.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
> > index f8d20960da..54509f11c3 100644
> > --- a/arch/arm/lib/cache-cp15.c
> > +++ b/arch/arm/lib/cache-cp15.c
> > @@ -91,6 +91,10 @@ __weak void dram_bank_mmu_setup(int bank)
> >  	bd_t *bd = gd->bd;
> >  	int	i;
> >
> > +	/* bd->bi_dram is available only after relocation */
> > +	if ((gd->flags & GD_FLG_RELOC) == 0)
> > +		return;
> 
> Why not just set the bd->bi_dram correctly before this is called ?

Just set "bd->bi_dram" seens as a hack.

For me the bd struct can be updated only in  common/board_f.c
after reserve_board() for U-Boot 
Or other spl_set_bd() called in board_init_r() for SPL. 

And that can cause issue if CONFIG_NR_DRAM_BANKS > 1
(even it is not the case today for STM32MP1).

But if this kind of protection is not correct here I prefer come back
to overidde of the weak fucntio dram_bank_mmu_setup in stm32mp arch
(it is the reason this weak definition)

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
