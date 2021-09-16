Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3440E7B2
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 19:44:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F9A1C5A4F6;
	Thu, 16 Sep 2021 17:44:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 693E9C5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 17:44:30 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6275583143;
 Thu, 16 Sep 2021 19:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631814269;
 bh=CRATGtqvCISBnxLLIhB/3amjrsXrGIVtgBWlFMYFtig=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=opjaOQ3OvSTFAuM/5yNHdAIG7Ir31IoegR3upiKhQRVLORVEl79Sjhyh91Gjv11Yh
 /DhT6h+h9O9FTFn3APrPlBkKy0ti8AkxRznyirvercqATy0wLjXeEHr1rN1Grp0gM7
 YNHnxJA0+jfnsiIn3IpCuqH4OWsiVgdiM7DvNpfDO0P/OEs2TBZtH7ANx7f930unYr
 bFR84ddmW8nUi7eAQmoTPgS1i4bQo64S/aTGFzTCDQZw9zdCKs1dnKj698xkK+M/h+
 hzhUoQ3EQM/AnnQM4/aS555M7fANE+Eq1qszWWs1VhhpMDTrOsEHzStNu832MPkA06
 7qJ5YOtSeCruQ==
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1b219a1c-389f-d979-dcf2-bbcf3b840dc1@denx.de>
Date: Thu, 16 Sep 2021 19:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
> 
> This serie is a V3 for
> http://patchwork.ozlabs.org/project/uboot/list/?series=262017&state=*
> http://patchwork.ozlabs.org/project/uboot/list/?series=262013&state=*
> 
> Now the SPI nor are named "norN" with N after the CFI nor device:
> "nor0" to "norM" => N= M+1.
> 
> See also an other proposal from Marek (not working after test)
> "mtd: spi-nor: Fix SF MTDIDS when registering multiple MTDs with DM enabled"
> 
> http://patchwork.ozlabs.org/project/uboot/list/?series=262362
> 
> The first patch of the serie fixed the compilation issues around
> 'cfi_flash_num_flash_banks' found in CI:
> 
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/9138
> 
> Patrick

This looks good to me, except for a few nits.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
