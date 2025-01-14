Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2BA10DF7
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 18:41:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 299B2C78F64;
	Tue, 14 Jan 2025 17:41:54 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42C9CC7802D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 17:41:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A72B4101C6440; Tue, 14 Jan 2025 18:41:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1736876507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5bZvVzn6AW3vmwP/QyAD/DbzUeUXDAIQvOZWelbtMg=;
 b=CJaLID7Mf9ftz07AeAbqNkrPvRVjhWqU/idg7sn1XMoQBboxZ2u935oEBKMfO/GCKU+cg1
 eHJ0q9MImyRCqlOKlGdywyCSBmdGTX9RqKSahME+YT3Iz9Bz2rqjXh2WPtRfFoV9BtTu9B
 f9EuWRwBlExGvOzFpULDgNI12ZrTtKgnT3gQVzGdVuERI8MjXfuDySbwhxnBKZq/h2FFeX
 DTq3n66VPqovveWM0HbgZGUXMREfOn8+rN02LefL8oPg/G5dK5ylrh4zepWBrG8g/IIEVS
 Mt9gPW93nCGB4MlktWPSUdVzwj+otHnW5utpieTMhx3bk0ww8z2kx9JOhmqlYg==
Message-ID: <366cef60-e32f-4557-9830-b1b642f0683f@denx.de>
Date: Tue, 14 Jan 2025 15:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250114144528.1612168-5-patrice.chotard@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/10] usb: dwc3-generic: Add STih407
	support
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

On 1/14/25 3:45 PM, Patrice Chotard wrote:

> +	/* glue init */
> +	reg = readl(glue_base + CLKRST_CTRL);
> +
> +	reg |= AUX_CLK_EN | EXT_CFG_RESET_N | XHCI_REVISION;
> +	reg &= ~SW_PIPEW_RESET_N;
> +
> +	writel(reg, glue_base + CLKRST_CTRL);
> +
> +	/* configure mux for vbus, powerpresent and bvalid signals */
> +	reg = readl(glue_base + USB2_VBUS_MNGMNT_SEL1);
> +
> +	reg |= SEL_OVERRIDE_VBUSVALID(USB2_VBUS_UTMIOTG) |
> +	       SEL_OVERRIDE_POWERPRESENT(USB2_VBUS_UTMIOTG) |
> +	       SEL_OVERRIDE_BVALID(USB2_VBUS_UTMIOTG);
> +
> +	writel(reg, glue_base + USB2_VBUS_MNGMNT_SEL1);
setbits_le32() , please fix globally.

Also, I am wondering if we're not overstuffing the dwc3-generic.c with 
too many disparate glue code shreds, and whether it isn't just about 
time to split the glue code parts out of it, into separate .c files. 
Thoughts ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
