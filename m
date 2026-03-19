Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOhjAuMZwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:45:55 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2202F06B6
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:45:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1D95C90088;
	Mon, 23 Mar 2026 10:36:54 +0000 (UTC)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B934C87ED2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 21:33:56 +0000 (UTC)
Date: Thu, 19 Mar 2026 21:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1773956034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8NIwjUKQtcXq7NUx5Qtp+sx2LMNQUWDJhkj54mLwEs=;
 b=gQxKCp570z5fbGqqoURMKniXq072iFXWEko+AaI39lGN6nWFL8Us27mIhcxEYiX9H/te1r
 Q0VHtliF3re0R95h/gFPO3y08x5dnEHZLA//tgh80jzUrfBjGDJ8rf6QQX/UCa4xfvYX5W
 ykzRyWXEaKBdCYuixNcVFiqDyZovLRtLFp350+GRvGxIQX8feFDXEqOa3rRL13PyG3upoZ
 lkbA2PpOkuW7RoPM7QYcv4UW40YVbVLd1BhF6u++Uo60V0hbgQ2qGCMw/blQUlPL0p8xgw
 2SGc/Ls8mDjWs82I54j2nVFMbpEzPtYl5tuPaIl6WNKhDTFgalri5RkfQUQ89g==
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
In-Reply-To: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
Message-ID: <tc6181.3ppuo0c75vwxp@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:36:50 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Conor Dooley <conor.dooley@microchip.com>,
 Naman Trivedi <naman.trivedimanojbhai@amd.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Tom Rini <trini@konsulko.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Marek Vasut <marex@denx.de>,
 Paul Sajna <sajattack@postmarketos.org>, Stephen Boyd <swboyd@chromium.org>,
 Jens Reidel <adrian@mainlining.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 David Wronek <david.wronek@mainlining.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 00/40] clk: port full Linux Common
	Clock Framework to U-Boot
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
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:u-boot-qcom@groups.io,m:u-boot@lists.denx.de,m:lukma@denx.de,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:GSS_MTK_Uboot_upstream@mediatek.com,m:paul@pbarker.dev,m:okamura.dai@socionext.com,m:linux@analog.com,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:sumit.garg@kernel.org,m:peng.fan@nxp.com,m:venkatesh.abbarapu@amd.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:conor.dooley@microchip.com,m:naman.trivedimanojbhai@amd.com,m:manikandan.m@microchip.com,m:trini@konsulko.com,m:jorge.ramirez@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:marex@denx.de,m:sajattack@postmarketos.org,m:swboyd@chromium.org,m:adrian@mainlining.org,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:neil.armstrong@linaro.org,m:ycliang@andestech.com,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:stephan.gerhold@linaro.org,m:david.wronek@mainlining.org,m:patrick.delaunay@foss.st.com,m:quic_varada@quicinc.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,groups.io:email]
X-Rspamd-Queue-Id: 9F2202F06B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, 19 Mar 2026 20:56, "Casey Connolly via groups.io" <casey.connolly=linaro.org@groups.io> wrote:

>    This RFC provides a proof of concept for using the full Linux CCF in
>    U-Boot and consequently porting full Linux clock drivers with extremely
>    minimal changes.
>
>    [...]
>
>    === Memory/perf overhead ===
>
>    The memory and size overhead of CCF is undoubtably bigger than uCCF,
>    although I suspect the difference is less than it might seem at
>    first glance. In particular: clk_core is only ~50 bytes larger than
>    struct udevice on ARM64, and an additional 120 bytes is saved for each
>    U_BOOT_DRIVER used by uCCF.
>
>    On the other hand, the CPU overhead is probably more significant,
>    but not an unreasonable cost to ensure correctness and propagate rate
>    changes across the clock tree.
>
>    Just comparing the binary size of sandbox64_defconfig with uCCF vs
>    CCF_FULL, CCF_FULL results in a 135k size increase in the binary. I
>    haven't done any more detailed analysis here (still haven't got buildman
>    to play nice...).
>
>    === SPL ===
>
>    This RFC doesn't have any SPL specific support, I think this role is
>    better fulfilled by UCLASS_CLK.

It is worth noting that not a lot of boards actually use the existing
CCF port under SPL.

	configs$ git grep "CONFIG_SPL=y" | wc -l
	550
	configs$ git grep "CONFIG_SPL_CLK=y" | wc -l
	179
	configs$ git grep "CONFIG_SPL_CLK_CCF=y" | wc -l
	25

As far as I know, this is most likely because that existing CCF is
already quite huge for such a small environment like SPL (SPL_CLK is
already quite big, especially with its dependency on driver model, which
is fine but some devices are so restricted when SPL runs that even
DM is too big to fit). So I wouldn't bother trying to support SPL with
this.

Just wanted to share this, FYI.

Best regards,
Ferass

[PS: had to remove some people from CC, because my email provider does
     not let me CC that many people. Also sorry for those who got this
     email twice]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
