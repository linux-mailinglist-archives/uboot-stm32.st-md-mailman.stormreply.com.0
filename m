Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 263391A46AE
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 15:25:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B2F8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 13:25:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EA31C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 13:25:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ADNDw1024258; Fri, 10 Apr 2020 15:25:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=woXnglePaUG/Sua7ul70Ux4u9HfK3OzlOpBXkUMUx84=;
 b=zgi/pMHT8Izc0GPuHRT1Zz/go++TMb+wfmtMfr5HKiP4I2UV05ih3gTuwsWYk/kfFgCI
 cvb6+K3WmPh6H9N4BUFsNdCRlpr8V5PLVXjsGFV1cyVdU/OLCt1bAaCJssTrGkMZyTAW
 Qa5nZwFKC8p8OeqKF5Jrmosi2CNyyFRHFGwkrW6AZmeuyrWTburWOKHjYXYLbBBqKkIs
 EQQmjKSFsFe7L6RBEQcxVoe5/kbbqIDlMBG/0KOymI4o1ebaKe95GEeNdaHSfR3miiKP
 EWEzHgdFOTijNz4hWfSWnG5xxy6VXYfPPV8OQ/tO1GdKhfX564zbHmpgD8yMYwVh57eG qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qkgm3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 15:25:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF90910002A;
 Fri, 10 Apr 2020 15:25:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96CE82B5C5F;
 Fri, 10 Apr 2020 15:25:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 Apr
 2020 15:25:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Apr 2020 15:25:00 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] arm: caches: manage phys_addr_t overflow in
 mmu_set_region_dcache_behaviour
Thread-Index: AQHWCZHnx4T+nlKgAUCrBmzXu/7Bh6hnyYiAgAjPTOCAAVAjgIAAeeCQ
Date: Fri, 10 Apr 2020 13:24:59 +0000
Message-ID: <bb316e5469cd457f84625712f837fe5a@SFHDAG6NODE3.st.com>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
 <9e48b552-38a0-53f9-349c-68f5542b18bd@denx.de>
 <cfae3f9ab7de4515b302533c379a3457@SFHDAG6NODE3.st.com>
 <583926ae-0bcd-bbaa-33dd-78978ab49395@denx.de>
In-Reply-To: <583926ae-0bcd-bbaa-33dd-78978ab49395@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_04:2020-04-09,
 2020-04-10 signatures=0
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

Dear Marek

> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 10 avril 2020 10:06
> 
> On 4/9/20 4:18 PM, Patrick DELAUNAY wrote:
> >
> >
> >> -----Original Message-----
> >> From: Marek Vasut <marex@denx.de>
> >> Sent: vendredi 3 avril 2020 23:31
> >> To: Patrick DELAUNAY <patrick.delaunay@st.com>; u-boot@lists.denx.de
> >> Cc: Simon Glass <sjg@chromium.org>; Alexey Brodkin
> >> <abrodkin@synopsys.com>; Lokesh Vutla <lokeshvutla@ti.com>; Tom Rini
> >> <trini@konsulko.com>; Trevor Woerner <trevor@toganlabs.com>; U-Boot
> >> STM32 <uboot-stm32@st-md-mailman.stormreply.com>
> >> Subject: Re: [PATCH 3/3] arm: caches: manage phys_addr_t overflow in
> >> mmu_set_region_dcache_behaviour
> >> Importance: High
> >>
> >> On 4/3/20 10:28 AM, Patrick Delaunay wrote:
> >>> Detect and solve the overflow on phys_addr_t type for start + size
> >>> in
> >>> mmu_set_region_dcache_behaviour() function.
> >>>
> >>> This issue occurs for example with ARM32, start = 0xC0000000 and
> >>> size = 0x40000000: start + size = 0x100000000 and end = 0x0.
> >>>
> >>> Overflow is detected when end < start.
> >>> In normal case the previous behavior is still used: when start is
> >>> not aligned on MMU section, the end address is only aligned after
> >>> the sum start + size.
> >>>
> >>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >>> ---
> >>>
> >>>  arch/arm/lib/cache-cp15.c | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
> >>> index d15144188b..e5a7fd0ef4 100644
> >>> --- a/arch/arm/lib/cache-cp15.c
> >>> +++ b/arch/arm/lib/cache-cp15.c
> >>> @@ -63,6 +63,11 @@ void mmu_set_region_dcache_behaviour(phys_addr_t
> >>> start, size_t size,
> >>>
> >>>  	end = ALIGN(start + size, MMU_SECTION_SIZE) >>
> >> MMU_SECTION_SHIFT;
> >>>  	start = start >> MMU_SECTION_SHIFT;
> >>> +
> >>> +	/* phys_addr_t overflow detected */
> >>> +	if (end < start)
> >>> +		end = (~(phys_addr_t)0x0 >> MMU_SECTION_SHIFT) + 1;
> >>> +
> >>
> >> Or, you can divide $start and $size separately by MMU_SECTION_SIZE
> >> and then add them up .
> >
> > It was my first idea but that change the function behavior, because
> > today start and size can be not aligned on MMU_SECTION aligned.
> >
> > I think it is strange, but I preferred to don't change this part.
> >
> > Example with shift = 21 and 2MB section size: 0x200000
> >
> > Start = 0x1000000
> > Size = 0x1000000
> >
> > End = 0x2000000
> >
> > => after alignment start = 0x0, end = 0x1
> >
> > But if we align the start and size before addition as proposed, the
> > final result change
> >
> > Start = 0x1000000 => 0
> > Size = 0x1000000 => 0
> >
> > End = 0x0
> >
> > I prefer don't modify this current (strange) behavior to avoid regression.
> >
> > But if it is acceptable (because the caller MUST always use start and
> > size MMU_SECTION aligned), I will change the proposal
> 
> The minimum page size is 4k, right ? Then divide both by 4k and then by the rest
> of MMU_SECTION_SHIFT.

Yes, good idea...
I am waiting possible other feedbacks

but I think ii ts candidate to integrate V2.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
