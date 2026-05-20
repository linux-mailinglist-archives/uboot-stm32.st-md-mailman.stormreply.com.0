Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHb5NCM5DmpC8gUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 May 2026 00:43:47 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675559C371
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 May 2026 00:43:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F263C87ED1;
	Wed, 20 May 2026 22:43:46 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85FDC36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 22:43:45 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gLRR46kf7z9v0h;
 Thu, 21 May 2026 00:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779317025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9awvQSXyo/J6uq/fKxyXWpPj8qolhhA0l58VNJgOn4=;
 b=rikRJDEFOVOQzRXY8zG2kvdYh8VXWkow7TWOLvi7cLCpshqkVVzydjPKSdOONVzbqU9x51
 8LcnNyZOc2+on7MfS7dxX1rLGeBFHicO4EXSZwevWHReBFTVdrNclvWzvBDdAQfGcfoqGW
 yMGQyf18MkWhi4wmbKTWst390CXLLO3bs4FEam5vegUrHSLYYNdURa29O12GhUOBLMoeCr
 0bI+iPMwL09ATgcJVn1y2vJ5oxAKoyBINdUVuCIFANOUu49210HisgwkC6o1dqUH6Hd2GQ
 mLgMYaq8+m4iwHRcHGV+aMT+sMYMjqoIXsWJVKO2OrLgv3odvBkiJL3v6Vg0LQ==
Message-ID: <f48f9d8d-4b14-4745-8c96-2c315889f770@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779317022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9awvQSXyo/J6uq/fKxyXWpPj8qolhhA0l58VNJgOn4=;
 b=DspOutc8MOU3Onr3kz5rZrXKllZJgFGwigJ1INzXcGpsI5PGLjh3VNfqeC1Stx0Xbbn/d3
 lGP+0c0yTBVF6fHaiFB5QH/ZNdwoRkRfbe85eOqQBsvtnkCuVjJC5i0d3zRz5Tq0wtd4mt
 acbXDRT/H3Ax/XqSYCaOTucgVFzKpOmZV6zvguLW4B8SkhXGMYs+ap6gl7hPtIazigUdHN
 TXQY3treH/xSDdNRpmUHngSu+oIsln2kCLhJLSXMRHLV+Xpr1U9pqfj5pnUxKX+FM+zjPi
 +7MioRvfx79cMY5hiyzG2L1xFy/PqarCYJ5mcaSEcDPHlgOyouDUODMf2uzmXw==
Date: Wed, 20 May 2026 18:38:22 +0200
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
Content-Language: en-US
In-Reply-To: <20260520160715.175032-1-yann.gautier@foss.st.com>
X-MBO-RS-ID: 2a396fceac1cc5a5f4e
X-MBO-RS-META: tt54i1ydmigkaqwkit784f5gepybk4kn
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Enable Arm SMC watchdog for
	STM32MP1
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6675559C371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:07 PM, Yann Gautier wrote:
> This series adds the supports for Arm SMC watchdog for STM32MP1x
> platforms. This enables the required config flags for both STM32MP13
> and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
> in SCMI configuration.
> 
> This series also requires a patch from Patrice[1] increasing the
> CONFIG_SYS_MALLOC_F_LEN for STM32MP15.
> 
> [1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518-master-v1-1-37fd4df56609@foss.st.com/

I hate to nitpick at this point, but, it seems the two patches in this 
series do effectively the same thing. I'd say, align the commit subjects 
to something like:

configs: stm32mp15: Enable Arm SMC watchdog

And:

configs: stm32mp13: Enable Arm SMC watchdog

Even the commit messages can likely be aligned ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
