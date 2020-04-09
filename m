Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F461A35BA
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 16:18:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFEE8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 14:18:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B37C3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 14:18:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039ECB08012859; Thu, 9 Apr 2020 16:18:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Fzn1xFeUEH9udf5zJZcjVI/v58pc2MUsK4u+OP6uyJU=;
 b=QtX8OqEBaxU9UT0B52U5aBAHVHyFit3Jkr7MeS/8iSj7Ge7b7huuHB/uz+yoglJYOc1t
 RVql/Yz7771P38Vix0ycF0HQN1v9/Ewx++wJBcf+f+80IpzOpjke4BVNvKLMQmgjLCV+
 14CxzsSRnxT2a3Qwf9j6MyIsCsFd/Pk9Ylhbtq0c2FkCYjDIz8aem2c1xsZwKu7+RDY+
 Dl9I89Hy17/HkMkpA61y1h1z7trQyIOxGBP5luusDFBbM7IyBzT9nIcgRT2feahbp+Fb
 DHlck0Rgvd4hCTxYiOOEpyeFEOuNAoskt9KdpxZcurZqKv1dsSlgM4c47KkDKPl8ncQa hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091k72wch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 16:18:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47834100034;
 Thu,  9 Apr 2020 16:18:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37D0D2AF592;
 Thu,  9 Apr 2020 16:18:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 16:18:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Apr 2020 16:18:06 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] arm: caches: manage phys_addr_t overflow in
 mmu_set_region_dcache_behaviour
Thread-Index: AQHWCZHnx4T+nlKgAUCrBmzXu/7Bh6hnyYiAgAjPTOA=
Date: Thu, 9 Apr 2020 14:18:06 +0000
Message-ID: <cfae3f9ab7de4515b302533c379a3457@SFHDAG6NODE3.st.com>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
 <9e48b552-38a0-53f9-349c-68f5542b18bd@denx.de>
In-Reply-To: <9e48b552-38a0-53f9-349c-68f5542b18bd@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_04:2020-04-07,
 2020-04-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>, Trevor
 Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] arm: caches: manage phys_addr_t
 overflow in mmu_set_region_dcache_behaviour
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



> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 3 avril 2020 23:31
> To: Patrick DELAUNAY <patrick.delaunay@st.com>; u-boot@lists.denx.de
> Cc: Simon Glass <sjg@chromium.org>; Alexey Brodkin
> <abrodkin@synopsys.com>; Lokesh Vutla <lokeshvutla@ti.com>; Tom Rini
> <trini@konsulko.com>; Trevor Woerner <trevor@toganlabs.com>; U-Boot STM32
> <uboot-stm32@st-md-mailman.stormreply.com>
> Subject: Re: [PATCH 3/3] arm: caches: manage phys_addr_t overflow in
> mmu_set_region_dcache_behaviour
> Importance: High
> 
> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
> > Detect and solve the overflow on phys_addr_t type for start + size in
> > mmu_set_region_dcache_behaviour() function.
> >
> > This issue occurs for example with ARM32, start = 0xC0000000 and size
> > = 0x40000000: start + size = 0x100000000 and end = 0x0.
> >
> > Overflow is detected when end < start.
> > In normal case the previous behavior is still used: when start is not
> > aligned on MMU section, the end address is only aligned after the sum
> > start + size.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  arch/arm/lib/cache-cp15.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
> > index d15144188b..e5a7fd0ef4 100644
> > --- a/arch/arm/lib/cache-cp15.c
> > +++ b/arch/arm/lib/cache-cp15.c
> > @@ -63,6 +63,11 @@ void mmu_set_region_dcache_behaviour(phys_addr_t
> > start, size_t size,
> >
> >  	end = ALIGN(start + size, MMU_SECTION_SIZE) >>
> MMU_SECTION_SHIFT;
> >  	start = start >> MMU_SECTION_SHIFT;
> > +
> > +	/* phys_addr_t overflow detected */
> > +	if (end < start)
> > +		end = (~(phys_addr_t)0x0 >> MMU_SECTION_SHIFT) + 1;
> > +
> 
> Or, you can divide $start and $size separately by MMU_SECTION_SIZE and then
> add them up .

It was my first idea but that change the function behavior,
because today start and size can be not aligned on MMU_SECTION aligned.

I think it is strange, but I preferred to don't change this part.

Example with shift = 21 and 2MB section size: 0x200000

Start = 0x1000000
Size = 0x1000000

End = 0x2000000 

=> after alignment start = 0x0, end = 0x1

But if we align the start and size before addition as proposed, the final result change 

Start = 0x1000000 => 0
Size = 0x1000000 => 0

End = 0x0

I prefer don't modify this current (strange) behavior to avoid regression.

But if it is acceptable (because the caller MUST always use start and size MMU_SECTION aligned),
I will change the proposal

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
