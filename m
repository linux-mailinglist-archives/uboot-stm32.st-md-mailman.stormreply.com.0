Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D0F136922
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Jan 2020 09:47:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C89C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Jan 2020 08:47:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECE54C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 08:47:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00A8O144031885; Fri, 10 Jan 2020 09:47:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=mMgN/3bXbAdP0ctJ+/udazdL+e8xJIoXBUrHslZU+gs=;
 b=woymxJc7aZWwdYy1YwLp3rC9CAtpk/FSP9xLtPTbM/VXEOV8S63zVzB2C4m8E/ix8y+9
 W4OskGmAMb75+wEM8/ar2MXhdo4zNGK4aEwUlNT8fbLZqeH8zk+5NaHWm76CAyNv+7pZ
 eHJGhsuj2NebTjxTbK8+lc/2CIFWji9hp+0cPJDK7BGF/TvR+g0T8Y8bdSDa5CtZOQkU
 1DcQgw/DykD5cT8KYKHTSbX99aLlXz6kTMxbZADZuA77O5rzubdt7DWJ/xniDN7dKfMp
 zPsdFdxAbr3T2imRpK/CuIRzaE19hGxVXRoUuYTGitR9lwJhy2VK/yA5qAF2biENE2I3 wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakm5x7xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 09:47:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5104C100039;
 Fri, 10 Jan 2020 09:47:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4224321FE81;
 Fri, 10 Jan 2020 09:47:19 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 Jan
 2020 09:47:18 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Jan 2020 09:47:18 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] board_f.c: Insure 16 alignment of start_addr_sp and
 reserved memory
Thread-Index: AQHVxw/YYSRf/hEqXUuoHzRPxNQGh6fijSsAgAEJvUA=
Date: Fri, 10 Jan 2020 08:47:18 +0000
Message-ID: <01d8b005a21b4bfd952dbc54a47cc05a@SFHDAG6NODE3.st.com>
References: <20200109171123.16348-1-patrick.delaunay@st.com>
 <20200109171123.16348-4-patrick.delaunay@st.com>
 <18a0b1ee-fb54-499f-ffce-c96c63fbdc15@gmx.de>
In-Reply-To: <18a0b1ee-fb54-499f-ffce-c96c63fbdc15@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>, Joe
 Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] board_f.c: Insure 16 alignment of
 start_addr_sp and reserved memory
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

Hi,

> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: jeudi 9 janvier 2020 18:56
> 
> On 1/9/20 6:11 PM, Patrick Delaunay wrote:
> > Add a function reserve_sp() to reserved memory with 16 bits alignment
> 
> I guess this is a typo:
> 
> %s/bits/bytes/

Yes error in commit message "16 bytes alignment"... 
I will correct it in V2, thanks.

Regards

Patrick
 
> Best regards
> 
> Heinrich
> 
> > after the stack pointer (gd->start_addr_sp) and use this new function
> > in board_f.c to reserve all the memory area (malloc, board, gd, fdt,
> > bootstage, stacks).
> >
> > This 16 byte alignment is needed for cast on struct pointer for the
> > reserved memory, for example:
> > + x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> > + ARMv8 Instruction Set Overview: quad word, 16 bytes
> >
> > An other alignment value could be needed for other architecture.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >   common/board_f.c | 32 ++++++++++++++++++--------------
> >   1 file changed, 18 insertions(+), 14 deletions(-)
> >
> > diff --git a/common/board_f.c b/common/board_f.c index
> > e21f533634..0302ee4a6e 100644
> > --- a/common/board_f.c
> > +++ b/common/board_f.c
> > @@ -470,6 +470,17 @@ static int reserve_uboot(void)
> >   	return 0;
> >   }
> >
> > +/*
> > + * reserve after start_addr_sp the requested size and make the stack
> > +pointer
> > + * 16-byte aligned, this alignment is needed for cast on the reserved
> > +memory
> > + * ref = x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> > + *     = ARMv8 Instruction Set Overview: quad word, 16 bytes
> > + */
> > +static unsigned long reserve_sp(size_t size) {
> > +	return ALIGN_DOWN(gd->start_addr_sp - size, 16); }
> > +
> >   #ifdef CONFIG_SYS_NONCACHED_MEMORY
> >   static int reserve_noncached(void)
> >   {
> > @@ -495,7 +506,7 @@ static int reserve_noncached(void)
> >   /* reserve memory for malloc() area */
> >   static int reserve_malloc(void)
> >   {
> > -	gd->start_addr_sp = gd->start_addr_sp - TOTAL_MALLOC_LEN;
> > +	gd->start_addr_sp = reserve_sp(TOTAL_MALLOC_LEN);
> >   	debug("Reserving %dk for malloc() at: %08lx\n",
> >   	      TOTAL_MALLOC_LEN >> 10, gd->start_addr_sp);
> >   #ifdef CONFIG_SYS_NONCACHED_MEMORY
> > @@ -509,7 +520,7 @@ static int reserve_malloc(void)
> >   static int reserve_board(void)
> >   {
> >   	if (!gd->bd) {
> > -		gd->start_addr_sp -= sizeof(bd_t);
> > +		gd->start_addr_sp = reserve_sp(sizeof(bd_t));
> >   		gd->bd = (bd_t *)map_sysmem(gd->start_addr_sp, sizeof(bd_t));
> >   		memset(gd->bd, '\0', sizeof(bd_t));
> >   		debug("Reserving %zu Bytes for Board Info at: %08lx\n", @@ -
> 528,7
> > +539,7 @@ static int setup_machine(void)
> >
> >   static int reserve_global_data(void)
> >   {
> > -	gd->start_addr_sp -= sizeof(gd_t);
> > +	gd->start_addr_sp = reserve_sp(sizeof(gd_t));
> >   	gd->new_gd = (gd_t *)map_sysmem(gd->start_addr_sp, sizeof(gd_t));
> >   	debug("Reserving %zu Bytes for Global Data at: %08lx\n",
> >   	      sizeof(gd_t), gd->start_addr_sp); @@ -546,7 +557,7 @@ static
> > int reserve_fdt(void)
> >   	if (gd->fdt_blob) {
> >   		gd->fdt_size = ALIGN(fdt_totalsize(gd->fdt_blob) + 0x1000, 32);
> >
> > -		gd->start_addr_sp -= gd->fdt_size;
> > +		gd->start_addr_sp = reserve_sp(gd->fdt_size);
> >   		gd->new_fdt = map_sysmem(gd->start_addr_sp, gd->fdt_size);
> >   		debug("Reserving %lu Bytes for FDT at: %08lx\n",
> >   		      gd->fdt_size, gd->start_addr_sp); @@ -561,12 +572,7 @@
> > static int reserve_bootstage(void)
> >   #ifdef CONFIG_BOOTSTAGE
> >   	int size = bootstage_get_size();
> >
> > -	gd->start_addr_sp -= size;
> > -	/*
> > -	 * Insure that start_addr_sp is aligned down to reserve enough
> > -	 * space for new_bootstage
> > -	 */
> > -	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
> > +	gd->start_addr_sp = reserve_sp(size);
> >   	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
> >   	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
> >   	      gd->start_addr_sp);
> > @@ -583,8 +589,7 @@ __weak int arch_reserve_stacks(void)
> >   static int reserve_stacks(void)
> >   {
> >   	/* make stack pointer 16-byte aligned */
> > -	gd->start_addr_sp -= 16;
> > -	gd->start_addr_sp &= ~0xf;
> > +	gd->start_addr_sp = reserve_sp(16);
> >
> >   	/*
> >   	 * let the architecture-specific code tailor gd->start_addr_sp and
> > @@ -596,8 +601,7 @@ static int reserve_stacks(void)
> >   static int reserve_bloblist(void)
> >   {
> >   #ifdef CONFIG_BLOBLIST
> > -	gd->start_addr_sp &= ~0xf;
> > -	gd->start_addr_sp -= CONFIG_BLOBLIST_SIZE;
> > +	gd->start_addr_sp = reserve_sp(CONFIG_BLOBLIST_SIZE);
> >   	gd->new_bloblist = map_sysmem(gd->start_addr_sp,
> CONFIG_BLOBLIST_SIZE);
> >   #endif
> >
> >

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
