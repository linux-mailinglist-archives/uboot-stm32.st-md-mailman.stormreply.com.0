Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABLTBtEcwmlvZgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2026 06:10:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFED302295
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2026 06:10:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C353C87EC8;
	Tue, 24 Mar 2026 05:10:40 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2907AC1A97C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 05:10:39 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ffymG1G6Nz9tVP;
 Tue, 24 Mar 2026 06:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1774329038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UeBpXq998F+Il6SGSNqyhvQOWewItovfYlB6eObyoeU=;
 b=YbMAPmm+SgUaArncWHA+yBoBBMg366Rh1elh1yMRJx1WNZhZINfNeNixYhzNlD9WSpI8mn
 Ne0op2+wujUlVp7nb4APq+Mg2sNwlETrfsZjlyTYWakycNCcW10aXK2rC22c3tetoQQhFj
 UqZIxKRipVm+PilbOeGyLPvxm8rAb7PQbZWwyzKLYDMiu6REKTIASQHsCnsH1U6SlcMTSh
 Ox8sVK9VtPGM2Bl7rmipnIcpKWmselJXYcWk7gOcMVxZGBxSCkmZQ+dNC67zpvmXVWpbxQ
 Tt4POXVKopqtKGNXDcJNVnyFIQTJcLDFZNv8vchPnlCHqCMrtHkPcgfhs4AIMQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m2W7T3qO;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <ef7c8db3-0df8-4d32-983f-4b2dd81b298e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1774329036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UeBpXq998F+Il6SGSNqyhvQOWewItovfYlB6eObyoeU=;
 b=m2W7T3qOL6rMsc54QvYEVJYZpx0TASRHHkXJqFQ/l1z8TH0KuM97qdBkPFUmj0X8PnbJu2
 w2g0IBzmkrleHlaBydJelz/PKTH+uAPi9mlamARxrdUMiWugpZqaPHgN03UwrOl+tXf6pU
 hOFXCN6TRF2+fz0uOjHhABib2tP1DxgVky3NWLdyop5guOw5jeHOfLf59A7A/MH1PQkS78
 +gJZlt107lHyyk/LNyyYt8GugmFDHMDPUKZfGXbum8J7smMnjuXmk+/2TORApIcIt5jRm8
 J2CAVQa8CX5g7YUP5aj15Dusxo+A11lzvdDgb1zwRlHcjyd+Z6fSzOIC+cP5KQ==
Date: Tue, 24 Mar 2026 00:28:13 +0100
MIME-Version: 1.0
To: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de
References: <20260323225537.896180-1-trini@konsulko.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260323225537.896180-1-trini@konsulko.com>
X-MBO-RS-ID: 7e33b08a627f9a9c824
X-MBO-RS-META: xznd7cphsqw5tc6zx1y3htxqroquz93o
Cc: Peng Fan <peng.fan@nxp.com>, Casey Connolly <casey.connolly@linaro.org>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot-qcom@groups.io,
 Jerome Forissier <jerome.forissier@arm.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux@analog.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] global: Correct duplicate U_BOOT_DRIVER
	entry names
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:u-boot@lists.denx.de,m:peng.fan@nxp.com,m:casey.connolly@linaro.org,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:kojima.masahisa@socionext.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot-qcom@groups.io,m:jerome.forissier@arm.com,m:simon.k.r.goldschmidt@gmail.com,m:u-boot-amlogic@groups.io,m:jh80.chung@samsung.com,m:pbrobinson@gmail.com,m:treding@nvidia.com,m:marek.vasut+renesas@mailbox.org,m:tien.fong.chee@altera.com,m:lukma@nabladev.com,m:philipp.tomsich@vrull.eu,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:mbrugger@suse.com,m:sjg@chromium.org,m:clamor95@gmail.com,m:linux@analog.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:ag.dev.uboot@gmail.com,m:simonkrgoldschmidt@gmail.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,linaro.org,mailbox.org,rock-chips.com,socionext.com,st-md-mailman.stormreply.com,groups.io,arm.com,gmail.com,samsung.com,nvidia.com,altera.com,nabladev.com,vrull.eu,suse.com,chromium.org,analog.com,foss.st.com];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9FFED302295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


[...]

> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 41d15996e5b2..49e9c3fa0e99 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -533,7 +533,7 @@ static const struct udevice_id dwc3_meson_g12a_ids[] = {
>   	{ }
>   };
>   
> -U_BOOT_DRIVER(dwc3_generic_wrapper) = {
> +U_BOOT_DRIVER(dwc3_meson_g12a) = {

Could you please add usb_ as a prefix in front those usb drivers ?

Either way, for the USB part:

Reviewed-by: Marek Vasut <marek.vasut+usb@mailbox.org>

Thanks !
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
