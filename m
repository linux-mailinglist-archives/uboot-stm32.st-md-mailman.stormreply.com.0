Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163B561F14
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 17:19:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D574FC5662F;
	Thu, 30 Jun 2022 15:19:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2809C04005
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 15:19:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 932FD842A2;
 Thu, 30 Jun 2022 17:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656602394;
 bh=9tJXN37LcdERBpVa+pqkxEl0l6GuE6YL184SuinupDA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=v0L1m1TAe8W5G9b3shVH3ly63C9CRkhdRjBe2u93nGQVzkX1gRoripRQtzQI3hBIu
 uLsId+7QmZSlhXG3YNX4FosTyxoT/6WRR+rpFWdaB9T8vAS/vUyFxyyASUTxEufk9G
 UCqHQ49iR7STuFGutE9uLJgNcQF1t72Ft8zck4QXL+Mty/f8F05eJIxdu+KJrzT9I5
 HQKlIz4Ow2t6GMy9V77nNe7shPBcW4WwnFiie+xLDCPtCcGt6ephlMG0MBQBVJhmZu
 Z9FLDqkIPvLYg2jz8cecH8WjsiVWw/2qn8zBHjAaKYJiw4zECsbq+Ng8nxwMGasrJa
 IFZ4p2zZ+1raA==
Message-ID: <a4962258-852b-fc7c-0c19-166fa1cdde00@denx.de>
Date: Thu, 30 Jun 2022 17:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Johann Neuhauser <jneuhauser@dh-electronics.com>, u-boot@lists.denx.de
References: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220630141949.10585-1-jneuhauser@dh-electronics.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: Drop fastboot and
 stm32prog trigger gpios on DHCOM
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

On 6/30/22 16:19, Johann Neuhauser wrote:
> PA13 and PA14 are used for USB power control and can't be used
> to enforce fastboot or stm32prog mode by pressing a button.
> 
> Defining CONFIG_FASTBOOT/CONFIG_CMD_STM32PROG without this patch applied
> results in fastboot/stm32prog always starting, because PA13/PA14 are always
> low during boot. So drop the wrong trigger gpios definitions.
> 
> Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>

Those GPIOs also likely make no sense on DHCOM , right ?

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
