Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A074150CC
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:56:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1598AC5A4D0;
	Wed, 22 Sep 2021 19:56:30 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D826C5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:56:28 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A5D44832F4;
 Wed, 22 Sep 2021 21:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632340587;
 bh=rtPslkMIK4QJ7C4weTfJIdVGagaa+BKZy4m7F5P/LK4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TFOuS1+9RNoNJZifSfCzkZRIc3MEI5uoHxDO3NPzGWE9jexDE+mu1SA0i/3M5yQJ+
 N8Fz7csPbTmjlt96YnRYIa6tJcm+rqK7ygKDy4c8lRr/2h62rQBNf4rXUw0TsnwenR
 0EcdntzXgm5x+TXdRjL9Ki/IpITtCvbML3PGnloc4OFMFmvWIwRHm6npWt9qLYrYvq
 gBXaSbBYLTLJlQ9Z+qbDb2OJesDtJ94xxJXYpljfeZarO93r2YjDy/zBpsMHY3jLou
 fhK4LexobZoqZZHyJUIXTzoRFr4k4MpLN9u+hAKdNhEYvixI7rxs2RpjbHOn4ZGrKU
 q4t2OKDy+KWfg==
To: Tom Rini <trini@konsulko.com>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
 <20210922194615.GD31748@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
Date: Wed, 22 Sep 2021 21:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922194615.GD31748@bill-the-cat>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
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

On 9/22/21 9:46 PM, Tom Rini wrote:
> On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:
> 
>> I am talking about using nor%d in MTDIDS in U-Boot UBI code to look up from
>> which device to attach UBI in U-Boot.
> 
> OK, so are we not able to pass in the correct name now?  Or just worried
> about old environment and new U-Boot?

Say you have the following in board config:

CONFIG_MTDIDS_DEFAULT="nor0=ff705000.spi.0"
CONFIG_MTDPARTS_DEFAULT="mtdparts=ff705000.spi.0:-(fs);"

Then run "=> ubi part fs", which will fail to find nor0, because now 
that nor0 is called something else. That is what this series tries to fix.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
