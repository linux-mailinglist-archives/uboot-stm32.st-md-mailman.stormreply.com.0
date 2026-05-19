Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLAhBaApDWo8twUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 05:25:20 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0658735B
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 05:25:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D03FC055F4;
	Wed, 20 May 2026 03:25:19 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4686EC8F295
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 03:25:18 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gKxkP6Jcqz9w0k;
 Wed, 20 May 2026 05:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779247517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xlu4i1V3xrvzKE9u9OSuGrGWImoGU+ptAouypl50RNo=;
 b=EawW9ZcEUSASi2NnMqSUtcMXzg9ScDm869TQPo2XoNzqvDj1wGgbR7IenjDNZB2ni8uNgB
 HaqVVT3zOYKtL6YhefEQJhOSVUzsIZDUcaK0b6v7d1FS+1Y4ty2oLq0blqHJ0HwAQ7GR1L
 a0ZQzL3WrxQu3QB3A8gXCiNfITh4Qhz39oUgns2/k2gSbUzGwXv61oZ0jomM9MrYSUc+fV
 D2u4SqiDUFtJn+JG6SxlRK/cxIv7Rf9xl8OirS7UFp2Gm5mstTqf7pyfdEw7jfXNNJMQ+7
 14PWBeRncASMNfv/e2m5wxez54p3D227ASNFAj8hoeiRgPoJoTEhDT5hJfexQQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mTRDznHU;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <f420eff8-6524-4797-93b7-0f9a1149e860@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779247516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xlu4i1V3xrvzKE9u9OSuGrGWImoGU+ptAouypl50RNo=;
 b=mTRDznHUKMhe0Ub+HlMXXZckdTlkqsGrCtgf0ZH2tUNueR0RK3eAFJvogKgLaEtPQ2vGT5
 ydKUCcnX2hgEtOJl5nXF4D6VIfEYGCEkgorU203xsCzjX0iY2WUoux3kp+hkefb1w6WQT8
 V9gHW3WZUHM0+MQ/TStqlyBnvljW+t7WmTn81NEZbljxnjesV3low6sygt5A97Uy5y6B0T
 pBAE5QNR8zm9BKwc8LHBWR2Pv9m4YwcVftHuZVzkPdU93MQrz24lY8rFr3irkFlRWXbnXB
 +Gl1DHNKS5mTpmipU3uVOHXIc7UXVvjHZPrgQY004/pf+SROesUt6tZ8pCAzwA==
Date: Tue, 19 May 2026 18:58:07 +0200
MIME-Version: 1.0
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-3-yann.gautier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260519163145.221668-3-yann.gautier@foss.st.com>
X-MBO-RS-META: ho4s4k41he7f541um9o4khohi3qhn194
X-MBO-RS-ID: d5a99560888be9571eb
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] configs: stm32mp13: activate
	watchdog
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[mailbox.org : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mailbox.org:s=mail20150812];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D5E0658735B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 6:31 PM, Yann Gautier wrote:
> No watchdog was enabled for STM32MP13 platform. Add the required flags to
> support it. As done for STM32MP15 (in SCMI config) and STM32MP2x, we use
> the Arm SMC watchdog. The required nodes were already present in Linux
> imported DT files (stm32mp13.dtsi & stm32mp135f-dk.dts).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> 
> ---
> 
> Changes in v2:
> - update commit message
> 
>   configs/stm32mp13_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 620a6da2efe3..cc41585097c7 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -113,4 +113,7 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
>   CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>   CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>   CONFIG_USB_GADGET_DWC2_OTG=y
> +CONFIG_WDT=y
> +CONFIG_WDT_STM32MP=y
Why is CONFIG_WDT_STM32MP enabled here , is this the ARM SMC watchdog 
driver ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
