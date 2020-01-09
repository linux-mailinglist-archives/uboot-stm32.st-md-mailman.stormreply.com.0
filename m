Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1B135FE3
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 18:56:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A34AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 17:56:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52E58C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1578592555;
 bh=6W/wpkFHnxgk7xG2cfQI7BUZgOp3kNeGzEmBkNgkcHI=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=aISTX5jfMLJgoiTagHmOFcJTJHSWWOP0prbF8S6FvjOWg4E8KVW3PycSkH0enTUNv
 hafIQK+1xCG8OsXAlwyGdPFw2LshxIraoH8tFNYzOQfkbsfvHQf36HSuxciN/PwuFR
 IejhHlMrWn2YKOqMcUyqirg+gcFkjDZYX+0fGdVA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([84.119.33.160]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1jUySP1Sos-00pOH4; Thu, 09
 Jan 2020 18:55:55 +0100
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200109171123.16348-1-patrick.delaunay@st.com>
 <20200109171123.16348-4-patrick.delaunay@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <18a0b1ee-fb54-499f-ffce-c96c63fbdc15@gmx.de>
Date: Thu, 9 Jan 2020 18:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200109171123.16348-4-patrick.delaunay@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:I+CSUrQoR4GCudE1m1Wkmlt+ejGCOpgTRbxUfuLc0obzVkwt31R
 17gHZWJ74LaD2tJnkVao2JOpAHb345xsHqP3vSWuIIi0maKGBhW0ijGoqoyu9h6L5y+b1cA
 ie35gfQvokldLH/vbaSzkAcCzFBV3J4WSAbTvPYWSgrNw5IPEwAbw2RXZWE48iOgZNuRJU5
 4lGUks0Xubu9Mmd8nrzbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jRUdD+h29Zk=:yj9IwusjAYinwrYP1quzox
 S8hYwjXiozqWBN87271U2lTz2YOGvaG8PolBhQ/R6QJoMFI4rJp+QRK2cCB56mSKEGlQnB3tZ
 FGMG4o/VsWxPS5SyK0rWKikfD5xWVdwuFMcG92ItXgHKzMiJQT/CBM2tcmjPMChbRul8HpzxE
 q+fx/aHTZCFDp7Tjb0i3xskGVCAaMb4gLi4/aXKOfpuqP7/VuZxy6GnxXXTI580uKB5teYFeO
 t5hRc9KSB9Kj/ftm7+wQ5oIHNWePwSEnt3gn0hUR6VMsmiCOy/8h2FqGMvieUItTua2VlM0lG
 OpvL1N9xCdpxAn8xNbHvYHCA2q9ENORfFy8OpcSgsMAMp3PaY1OtwCQ9FY5jlaDIxhgmVcX34
 p+KWZiY8zVezdi6bvHO8tW9Hd83I1JO1yqEOw7ZgM8kSZzGhcwoL5lhT9cNUmKP0uX93YwvzR
 zepeABHmaVKmfKf5l38OsotfRsZPpBFshMe6rZQH+CuI6rdiMI71OET6di/PMtdI0pRtSItjl
 9hue0hbRjTbBHn0TvzP7aFQmClS9n+z7zlpqK7KMxZxU+AVyo2+X7x+H5SIwOjiQGXngyIns7
 DxCnTGzOXF1myXMELIWWMAcmrfa8ENnA2giyd1fnvBITOO0MyqegtEpW6JyQrA0vqEyiQakXo
 asI2irsTH0tKfThTNEx3tncwNzJpXyv7sxDtf2fFA4YqhagtMhD0Aup1GnrL4DkpNXB5Qtamg
 8Ar+zGjUFQ7X/fegi9nOR1P1TVOflJ6+rPYLvxp9lK6exT8eeIGAg9GUnt0SjqPfG1ZjTMzQ8
 UBwaz+9Zx8E4gMl2/8w3Yhdva2JOrdsosIhZafoekutlvUPu03Duc5ssn3640hRotSP77StAr
 MlWrbviz/hdKuaBYNRzAxN/GyS0rZWd0RrnVhIYiCMXY6QmbPkCdWuLV6EM+nfwRwTavinHuR
 LPrw2wPkMLOoI+6b7c1H/S9Doq6/SZnBL37lTRcP8UzcjSGhXRZpqk3iMOktUs8/RAizchunA
 x1RQZTEhYtmBwrvwsjYlk8Z8DC5O9eiVzOTqCRTBipLwk/pZT6oCsoUK3a20f+abVeqoODoXS
 44xahLyWubcatBgzg91hdJxUsBNle0pbXwvuw/+NbFPAK6uRsN7r1Cf1XHjhfFim8+1dVfJnA
 f7vxV/SvPw+l6uOmX8pi02ZibUHGiin/Yd6DD/st+IxCrg929g91qwn+tbzV+TW5XjqfH7lwW
 gD81nfiQw4V4lD2PXCtYCGgUwPgLIw/R7PwVeEaBw/j5FwYMXZkNqXv1YsTs=
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 1/9/20 6:11 PM, Patrick Delaunay wrote:
> Add a function reserve_sp() to reserved memory with 16 bits alignment

I guess this is a typo:

%s/bits/bytes/

Best regards

Heinrich

> after the stack pointer (gd->start_addr_sp) and use this new function
> in board_f.c to reserve all the memory area (malloc, board, gd, fdt,
> bootstage, stacks).
>
> This 16 byte alignment is needed for cast on struct pointer
> for the reserved memory, for example:
> + x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> + ARMv8 Instruction Set Overview: quad word, 16 bytes
>
> An other alignment value could be needed for other architecture.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>   common/board_f.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/common/board_f.c b/common/board_f.c
> index e21f533634..0302ee4a6e 100644
> --- a/common/board_f.c
> +++ b/common/board_f.c
> @@ -470,6 +470,17 @@ static int reserve_uboot(void)
>   	return 0;
>   }
>
> +/*
> + * reserve after start_addr_sp the requested size and make the stack pointer
> + * 16-byte aligned, this alignment is needed for cast on the reserved memory
> + * ref = x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> + *     = ARMv8 Instruction Set Overview: quad word, 16 bytes
> + */
> +static unsigned long reserve_sp(size_t size)
> +{
> +	return ALIGN_DOWN(gd->start_addr_sp - size, 16);
> +}
> +
>   #ifdef CONFIG_SYS_NONCACHED_MEMORY
>   static int reserve_noncached(void)
>   {
> @@ -495,7 +506,7 @@ static int reserve_noncached(void)
>   /* reserve memory for malloc() area */
>   static int reserve_malloc(void)
>   {
> -	gd->start_addr_sp = gd->start_addr_sp - TOTAL_MALLOC_LEN;
> +	gd->start_addr_sp = reserve_sp(TOTAL_MALLOC_LEN);
>   	debug("Reserving %dk for malloc() at: %08lx\n",
>   	      TOTAL_MALLOC_LEN >> 10, gd->start_addr_sp);
>   #ifdef CONFIG_SYS_NONCACHED_MEMORY
> @@ -509,7 +520,7 @@ static int reserve_malloc(void)
>   static int reserve_board(void)
>   {
>   	if (!gd->bd) {
> -		gd->start_addr_sp -= sizeof(bd_t);
> +		gd->start_addr_sp = reserve_sp(sizeof(bd_t));
>   		gd->bd = (bd_t *)map_sysmem(gd->start_addr_sp, sizeof(bd_t));
>   		memset(gd->bd, '\0', sizeof(bd_t));
>   		debug("Reserving %zu Bytes for Board Info at: %08lx\n",
> @@ -528,7 +539,7 @@ static int setup_machine(void)
>
>   static int reserve_global_data(void)
>   {
> -	gd->start_addr_sp -= sizeof(gd_t);
> +	gd->start_addr_sp = reserve_sp(sizeof(gd_t));
>   	gd->new_gd = (gd_t *)map_sysmem(gd->start_addr_sp, sizeof(gd_t));
>   	debug("Reserving %zu Bytes for Global Data at: %08lx\n",
>   	      sizeof(gd_t), gd->start_addr_sp);
> @@ -546,7 +557,7 @@ static int reserve_fdt(void)
>   	if (gd->fdt_blob) {
>   		gd->fdt_size = ALIGN(fdt_totalsize(gd->fdt_blob) + 0x1000, 32);
>
> -		gd->start_addr_sp -= gd->fdt_size;
> +		gd->start_addr_sp = reserve_sp(gd->fdt_size);
>   		gd->new_fdt = map_sysmem(gd->start_addr_sp, gd->fdt_size);
>   		debug("Reserving %lu Bytes for FDT at: %08lx\n",
>   		      gd->fdt_size, gd->start_addr_sp);
> @@ -561,12 +572,7 @@ static int reserve_bootstage(void)
>   #ifdef CONFIG_BOOTSTAGE
>   	int size = bootstage_get_size();
>
> -	gd->start_addr_sp -= size;
> -	/*
> -	 * Insure that start_addr_sp is aligned down to reserve enough
> -	 * space for new_bootstage
> -	 */
> -	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
> +	gd->start_addr_sp = reserve_sp(size);
>   	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
>   	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
>   	      gd->start_addr_sp);
> @@ -583,8 +589,7 @@ __weak int arch_reserve_stacks(void)
>   static int reserve_stacks(void)
>   {
>   	/* make stack pointer 16-byte aligned */
> -	gd->start_addr_sp -= 16;
> -	gd->start_addr_sp &= ~0xf;
> +	gd->start_addr_sp = reserve_sp(16);
>
>   	/*
>   	 * let the architecture-specific code tailor gd->start_addr_sp and
> @@ -596,8 +601,7 @@ static int reserve_stacks(void)
>   static int reserve_bloblist(void)
>   {
>   #ifdef CONFIG_BLOBLIST
> -	gd->start_addr_sp &= ~0xf;
> -	gd->start_addr_sp -= CONFIG_BLOBLIST_SIZE;
> +	gd->start_addr_sp = reserve_sp(CONFIG_BLOBLIST_SIZE);
>   	gd->new_bloblist = map_sysmem(gd->start_addr_sp, CONFIG_BLOBLIST_SIZE);
>   #endif
>
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
