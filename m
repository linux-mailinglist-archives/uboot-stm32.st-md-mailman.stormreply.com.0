Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E348B145A47
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 17:53:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3C6C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 16:53:19 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD14C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 16:53:17 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id A216C1C07A0;
 Wed, 22 Jan 2020 09:53:15 -0700 (MST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200122135243.17683-1-patrick.delaunay@st.com>
 <20200122135243.17683-2-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <5e3e5602-b180-9a27-3bdb-80fda33b740b@wwwdotorg.org>
Date: Wed, 22 Jan 2020 09:53:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122135243.17683-2-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/4] board_f.c: Insure
	gd->new_bootstage alignment
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

On 1/22/20 6:52 AM, Patrick Delaunay wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> In reserve_bootstage(), in case size is odd, gd->new_bootstage
> is not aligned. In bootstage_relocate(), the platform hangs when
> getting access to data->record[i].name.
> To avoid this issue, make gd->new_bootstage 16 byte aligned.
> 
> To insure that new_bootstage is 16 byte aligned (at least needed for
> x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> ALIGN_DOWN macro is used.

> diff --git a/common/board_f.c b/common/board_f.c
> index d66afb37ca..e21f533634 100644
> --- a/common/board_f.c
> +++ b/common/board_f.c
> @@ -562,6 +562,11 @@ static int reserve_bootstage(void)
>   	int size = bootstage_get_size();
>   
>   	gd->start_addr_sp -= size;
> +	/*
> +	 * Insure that start_addr_sp is aligned down to reserve enough

Nit: Ensure not insure (a pet peeve of mine!)

> +	 * space for new_bootstage
> +	 */
> +	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);
>   	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
>   	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
>   	      gd->start_addr_sp);
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
