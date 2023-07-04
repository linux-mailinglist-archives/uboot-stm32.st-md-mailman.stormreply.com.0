Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0329C7479B9
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jul 2023 23:55:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9831FC6B45A;
	Tue,  4 Jul 2023 21:55:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1BD0C6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 21:55:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B2A4584782;
 Tue,  4 Jul 2023 23:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688507742;
 bh=YyQcBwCnZvUpbw7Vu6ztlgZWJ+F0p339zmVbewh0R7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fjlqnPEVT6uaOapphhRoNmjqIjZMEtzjzmTXS1jTWiLowCaZZDV+tNuZWTafg/DPU
 NwV6B19hRVrB6Hi3EAv4v0EkGAvClG0ajZ0G0f5Dck+74GsSgiX8Bm0s7gnVrSwtMI
 zLXR76gZnTWkZMi0E0z9CUCkawPETDZEDUwXIIEXNGJwjUK/5q8OGuJhUIdpDbl2yL
 pkRKzvGlMfBo71AqwtdRz4HyiblBGVkBk9U2iy+iZS6Wqst67/Pcca2xLDpsPwyFJ6
 6HHOR2fRQCJPHIwGC3sVyxwF5HJBFgDQ3Fy7ngeuIijK76cVI/YaONHM+iS4KuMtLR
 PVTfbCjl2DHqw==
Message-ID: <586cdbf2-e994-70f5-43a9-1af8214c9118@denx.de>
Date: Tue, 4 Jul 2023 23:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: u-boot@lists.denx.de
References: <20230517220239.329807-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230517220239.329807-1-marex@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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

On 5/18/23 00:02, Marek Vasut wrote:
> In case the DHSOM is in suspend state and either reset button is pushed
> or IWDG2 triggers a watchdog reset, then DRAM initialization could fail
> as follows:
> 
>    "
>    RAM: DDR3L 32bits 2x4Gb 533MHz
>    DDR invalid size : 0x4, expected 0x40000000
>    DRAM init failed: -22
>    ### ERROR ### Please RESET the board ###
>    "
> 
> Avoid this failure by not keeping any Buck regulators enabled during reset,
> let the SoC and DRAMs power cycle fully. Since the change which keeps Buck3
> VDD enabled during reset is ST specific, move this addition to ST specific
> SPL board initialization so that it wouldn't affect the DHSOM .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> NOTE: This is 2023.07 material

I don't see this one in 2023.07 yet, can you please pick it and send PR?

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
