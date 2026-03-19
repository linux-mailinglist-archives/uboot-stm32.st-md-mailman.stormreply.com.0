Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F2zDuMZwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:45:55 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC492F06B5
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:45:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E529CC90083;
	Mon, 23 Mar 2026 10:36:54 +0000 (UTC)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 823C8C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 21:30:26 +0000 (UTC)
Date: Thu, 19 Mar 2026 21:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1773955825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gsU8+14tCdDaf1sLrt3CPQIm6pFdSHpcqyO8iv77JI=;
 b=ZIzfDroT7vwNskZzudrKJWgnD34kUGUDK44RZFkmSeVhVU5hPfjfF8tNBixOVcOgwMnzHU
 ogX1fGKuObRmZHjchIRGM50Tc9xfgGd0fI+T71QrbrWfJd3u6MzI0P5B34DmvEWi4aejLH
 DMk8hh3JOb+Jzs0IoCn9lYHq7ox//fOJPX6lQMuxOK9zjef00yCNz48M8nyBsQcNWCmiMP
 5yFN7ZynxzqK7sNDdclrqjizQWrBHrPwBonKYn7kzKeUkdjIENa6BKS/C5c9CBiRVMfgNc
 m0n1o1fv+nY4UyrUQ7gti7aDdo605jIi7ZjBtqV1W+9NbeLDh5mac2bgY+gCDg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: u-boot-qcom@groups.io, u-boot@lists.denx.de,
 Lukasz Majewski <lukma@denx.de>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Paul Barker <paul@pbarker.dev>, Dai Okamura <okamura.dai@socionext.com>,
 linux@analog.com, uboot-snps-arc@synopsys.com, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>
References: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
 <20260319-casey-ccf-upstream-v1-15-4df2ee2226da@linaro.org>
In-Reply-To: <20260319-casey-ccf-upstream-v1-15-4df2ee2226da@linaro.org>
Message-ID: <tc612f.1958x6s93grqj@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:36:50 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Paul Sajna <sajattack@postmarketos.org>, Stephen Boyd <swboyd@chromium.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH RFC 15/40] clk: restrict clk/imx to
	MACH_IMX
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
X-Spamd-Result: default: False [4.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[postmarketos.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[85];
	R_DKIM_REJECT(1.00)[postmarketos.org:s=key1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[postmarketos.org:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:u-boot-qcom@groups.io,m:u-boot@lists.denx.de,m:lukma@denx.de,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:GSS_MTK_Uboot_upstream@mediatek.com,m:paul@pbarker.dev,m:okamura.dai@socionext.com,m:linux@analog.com,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:sumit.garg@kernel.org,m:marex@denx.de,m:trini@konsulko.com,m:neil.armstrong@linaro.org,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:sajattack@postmarketos.org,m:swboyd@chromium.org,m:casey.connolly@linaro.org,m:andrew.goodbody@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[funderscore@postmarketos.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[funderscore@postmarketos.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,groups.io:email,groups.io:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9DC492F06B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 20:56, "Casey Connolly via groups.io" <casey.connolly=linaro.org@groups.io> wrote:
>Only build IMX clocks when MACH_IMX is enabled, otherwise IMX clock
>drivers get compiled for all platforms with CLK_CCF enabled.
>
>Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>---
> drivers/clk/Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>index 5f0c0d8a5c28..f96d57a3223a 100644
>--- a/drivers/clk/Makefile
>+++ b/drivers/clk/Makefile
>@@ -15,9 +15,9 @@ obj-$(CONFIG_$(PHASE_)CLK_STUB) += clk-stub.o
> 
> obj-y += adi/
> obj-y += airoha/
> obj-y += analogbits/
>-obj-y += imx/
>+obj-$(CONFIG_$(PHASE_)MACH_IMX) += imx/

I think this is not necessary. drivers/clk/imx/Makefile already requires
that imx config options be enabled for the driver to be compiled in.

Best regards,
Ferass

[PS: had to remove a few people from CC, because my email provider does
     not let me CC that many people, sorry!]

> obj-$(CONFIG_CLK_JH7110) += starfive/
> obj-y += tegra/
> obj-y += ti/
> obj-$(CONFIG_CLK_THEAD) += thead/
>
>-- 
>2.51.0
>
>
>
>-=-=-=-=-=-=-=-=-=-=-=-
>Groups.io Links: You receive all messages sent to this group.
>View/Reply Online (#2906): https://groups.io/g/u-boot-qcom/message/2906
>Mute This Topic: https://groups.io/mt/118408050/8399868
>Group Owner: u-boot-qcom+owner@groups.io
>Unsubscribe: https://groups.io/g/u-boot-qcom/leave/13198341/8399868/797498721/xyzzy [funderscore@postmarketos.org]
>-=-=-=-=-=-=-=-=-=-=-=-
>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
