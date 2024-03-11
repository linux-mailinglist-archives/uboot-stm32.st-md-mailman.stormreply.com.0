Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C96878FB3
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 09:29:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F180C71280;
	Tue, 12 Mar 2024 08:29:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65F8FC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 15:36:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42BFaK5C047454;
 Mon, 11 Mar 2024 10:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1710171380;
 bh=q8HHtyyWpEBvFwivGbtGBCsaH1Go/i1sedNYgym41S4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=G70YHgHGS6mkK651fo0+9ESEQ6mWx+GzZWGBjQbJgVG2UAhNb092Io+T4pkcC/1sW
 PHmBupRZGSMmQBPadBz83YlfzbW4MzQ++nRIsAG8O0XiryteikTk8FLpVOjWSwTua4
 shnRsQ4aluo1Z3CHAz2yS/++lLBxnk7XQOKISvsc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42BFaKF8015896
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Mar 2024 10:36:20 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Mar 2024 10:36:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Mar 2024 10:36:20 -0500
Received: from [10.249.141.75] ([10.249.141.75])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42BFaGIr126622;
 Mon, 11 Mar 2024 10:36:17 -0500
Message-ID: <32e8bffc-dbe7-48d9-985f-d794aa6a4848@ti.com>
Date: Mon, 11 Mar 2024 21:06:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240311143918.2927406-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20240311143918.2927406-1-patrice.chotard@foss.st.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 12 Mar 2024 08:29:26 +0000
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Michal Simek <michal.simek@amd.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lmb: Avoid to add identical region in
 lmb_add_region_flags()
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


On 3/11/2024 8:09 PM, Patrice Chotard wrote:
> In case lmb_add_region_flags() is called with the same parameter than
> an already existing lmb and this lmb is adjacent to its previous lmb with
> different flag, this lmb is added again.


Same parameter means , addr and size and different flags correct ?


> Instead breaking the loop, continue, at the next iteration, we are able
> to detect that this region already exist.

Once region already exist detected, then you can think of returning 
error , no ?


> Issue reproduced on STM32MP157-DK2 with SCMI DT, bdinfo command's output
> shows:
>
> Before this patch, the last LMB [0xde000000-0xdfffffff] is duplicated:
> ...
> lmb_dump_all:nnn
>   memory.cnt = 0x1 / max = 0x2
>   memory[0]      [0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>   reserved.cnt = 0x6 / max = 0x10
>   reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>   reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>   reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>   reserved[3]    [0xdaadf000-0xdfffffff], 0x05521000 bytes flags: 0
>   reserved[4]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
>   reserved[5]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
> ...
>
> After this patch:
> ...
> lmb_dump_all:
>   memory.cnt = 0x1 / max = 0x2
>   memory[0]      [0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
>   reserved.cnt = 0x5 / max = 0x10
>   reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>   reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>   reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>   reserved[3]    [0xdaadf000-0xdfffffff], 0x05521000 bytes flags: 0
>   reserved[4]    [0xde000000-0xdfffffff], 0x02000000 bytes flags: 4
> ...
>
> Fixes: 59c0ea5df33f ("lmb: Add support of flags for no-map properties")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   lib/lmb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/lmb.c b/lib/lmb.c
> index 44f98205310..b6afb731440 100644
> --- a/lib/lmb.c
> +++ b/lib/lmb.c
> @@ -285,14 +285,14 @@ static long lmb_add_region_flags(struct lmb_region *rgn, phys_addr_t base,
>   		adjacent = lmb_addrs_adjacent(base, size, rgnbase, rgnsize);
>   		if (adjacent > 0) {
>   			if (flags != rgnflags)
> -				break;
> +				continue;
>   			rgn->region[i].base -= size;
>   			rgn->region[i].size += size;
>   			coalesced++;
>   			break;
>   		} else if (adjacent < 0) {
>   			if (flags != rgnflags)
> -				break;
> +				continue;
>   			rgn->region[i].size += size;
>   			coalesced++;
>   			break;
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
