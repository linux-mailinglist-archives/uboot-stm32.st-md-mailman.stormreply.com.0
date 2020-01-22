Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7B145A4C
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 17:54:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A8AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 16:54:21 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF92FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 16:54:19 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id 099AF1C07A0;
 Wed, 22 Jan 2020 09:54:17 -0700 (MST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200122135243.17683-1-patrick.delaunay@st.com>
 <20200122135243.17683-5-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <1508ecf0-66b1-928f-c766-6dc67252c6bc@wwwdotorg.org>
Date: Wed, 22 Jan 2020 09:54:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122135243.17683-5-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/4] board_f.c: Insure 16 alignment of
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

On 1/22/20 6:52 AM, Patrick Delaunay wrote:
> Add a function reserve_sp() to reserved memory with 16 bits alignment
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

> diff --git a/common/board_f.c b/common/board_f.c

>   
> +/*
> + * reserve after start_addr_sp the requested size and make the stack pointer
> + * 16-byte aligned, this alignment is needed for cast on the reserved memory
> + * ref = x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> + *     = ARMv8 Instruction Set Overview: quad word, 16 bytes
> + */
> +static unsigned long reserve_sp(size_t size)

Bikeshed: Not sure this name is very description. Perhaps 
reserve_stack_aligned() would be better. Not a big deal though. Patches 
1,4 look fine otherwise.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
