Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D55B40E7B0
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 19:44:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B678C597BE;
	Thu, 16 Sep 2021 17:44:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C700C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 17:44:25 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C819783129;
 Thu, 16 Sep 2021 19:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631814264;
 bh=K+8cxZrGbx6Tw80KNv9E6mpgH0lXkVeY9VTyfFN+VZk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cnqynw/DikywpuSNZrQzlt8g1kjwcf/qWeyHlOEX+LZphzT9/d9GjbfznKMfETMeR
 WGYCbF3NnScl4qwwVyKFsXZ8Nw8o0YIUXgJObZ0M3CCvnYO0Rg23QqMl6eYDJDl4fw
 +/JdHPuzFrqMsic79+lwOzDK2bHf8C582q5a8WmiqVL1oe2ITULhPQlgpvW2Cj9rH6
 B024sUfQ/SRNthZnm0s/OcC2oqk8pbmicpQifDPTAtWKkzJges7bhqs+out+H+2FqL
 yRmXb+kD8BBCTC3XuoSbx8b//0xRAnvsdvwTTQEwma1WO5Iy2LpSnTRHzsTPiT/ZWd
 UC19+UazAcy5g==
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <66302ec0-269a-83b9-1807-084cd8126381@denx.de>
Date: Thu, 16 Sep 2021 19:24:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/2] mtd: cfi_flash: use
 cfi_flash_num_flash_banks only when supported
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

On 9/16/21 4:01 PM, Patrick Delaunay wrote:
> When CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated,
> CONFIG_SYS_MAX_FLASH_BANKS is replaced by cfi_flash_num_flash_banks,
> but this variable is defined in drivers/mtd/cfi_flash.c, which is
> compiled only when CONFIG_FLASH_CFI_DRIVER is activated, in U-Boot
> or in SPL when CONFIG_SPL_MTD_SUPPORT is activated.
> 
> This patch deactivates this feature CONFIG_SYS_MAX_FLASH_BANKS_DETECT
> when flash cfi driver is not activated to avoid compilation issue in
> the next patch, when CONFIG_SYS_MAX_FLASH_BANKS is used in spi_nor_scan().

Maybe just migrate this config option to Kconfig and let Kconfig handle 
the macro magic ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
