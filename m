Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDvQHcYXwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 592212F0429
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09689C8F29A;
	Mon, 23 Mar 2026 10:36:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 184D1C87ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43b45bb7548so914161f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953918; x=1774558718;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hQumiPbp80hZWkFmcR45v5xw5x/cMV2c5oqDMRtP4WA=;
 b=UZTkv/as7G4arA4GZbxKUx2ThS21ZrcOZPak3uBQx6BIJ61QKmFrRl+xVgLw74WAeh
 PFJ751AR/RpCZhJR6J5EgcCSgsXaimUPvFtZbgPh6stcpJTLOQZS8VhgU1KGkHKtdZ13
 nq4wZm2rPwc87HRIU+wHZH6wrrN5gxlg/7MF5CPrWti3W3+9EXVOe15UM/ZhY0UBoPpN
 W056URQza282g6ebI9qng/HwVtkdo+Gby3sQYru7mBI/u253TiqDOlqCz8G34GDiRS1I
 UNCTwl1AAdNCbg+WebByi4eSTUyZxclJcV6Frs7CmYohXKr2cKYijzuooEmJprksSxwK
 BzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953918; x=1774558718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hQumiPbp80hZWkFmcR45v5xw5x/cMV2c5oqDMRtP4WA=;
 b=e4CqNjPxXoaXs4GhkwwilwBdux+8L/7PTOQ43TnvYU+lTk+Yh5gt/SwMqDlle37Ama
 FCRsU8e/j5CWrccxYddNH0KVHWxJiFMCKr1UAniLFxAZCceblxvxuBjYDjayk46lpYIb
 Jpo+17CoOlkGZLCnRI3hyK/TbnKuf5FMl8fS9IvQMN4o64emXd5EmekAcS0P76N/OqS/
 O2P4Ce+kFqwz+nSXixpqS4ccgEF6dwnXyFQPDixnQ/By18DhvBjAgc/P1PN8Wh3qmduX
 Z8y5b9Q0DQL2I6viTVQHme+H4vEO92UWTWyuo8pKyVQ2nVJomj3rWuPMnbHHd4J6DPDN
 DmvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfmtpyJ1vCt21hbBfkUUZjes5D77khHF36sNwfoUnn+vUL8es5/mpT2Mz4RBCSOiIJPlC87PAq6Z5KPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyFlp+/ZWsVuseJ4MHwXLumZh+fvGLfooJF5J5/wIZOBU11Dnmb
 NmZ9M+3LZZBewyDSxi8SBLhG5CcAF6KaQlMUQLEd+jopVU3/zEQ6DpcZuWcbj/jCL7o=
X-Gm-Gg: ATEYQzyXeKGqIR99Ry+IcDej65dhAn68lzPfLrvO7pTTIRIcbV4VI+cxo1IMLU5PEbp
 PIrVo/xrF8Nzhse4KKfx67JssJSLN4rpy0sckAfXotKEMv4cmMOaTg4MeF3Oby49qiiLCp43nre
 mHsPzYRuUQafOpM30lWBAwA0413RP7XZ5iAFiRHOz0VI2mFyzOqY5Xavu5vjphplequIhpI5K6g
 g6QJFQeVI++U6O69IlljvFCrOOU6tIHJF9RbhUTzJxUAm1QEmVX0PZyQO4jFKp4H/MwL48N8I75
 sMPEyVIHJyerxNBXWQeILNoG1pmnKaMDvOqNoeD8HTlYc0ilodVb44THP+J8G9LKeGJI1cls1yZ
 pXjimK4KOlqskeNK7eZJC/o6xpk/YjzXvRuFaMnMb3B2WwsZ+Yf0JrpKs9+gQIiJQVbhnz4XfPV
 GO063sd+da78pjnm4fDKMGFjiVrQMDm5OkVGH4kuRt7Caa8kEvX5UbC90TCewC65Fq6HU=
X-Received: by 2002:a05:6000:2203:b0:43b:45a0:9df8 with SMTP id
 ffacd0b85a97d-43b642781a8mr1368024f8f.35.1773953918329; 
 Thu, 19 Mar 2026 13:58:38 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:37 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:48 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-26-4df2ee2226da@linaro.org>
References: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
In-Reply-To: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>, 
 u-boot-qcom@groups.io, Aspeed BMC SW team <BMC-SW@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 Paul Barker <paul@pbarker.dev>, Dai Okamura <okamura.dai@socionext.com>, 
 linux@analog.com, uboot-snps-arc@synopsys.com, u-boot-amlogic@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com, 
 Sumit Garg <sumit.garg@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=10143;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=VQ+UwRkFHsmDi4X2J1U5vDc1dvKFNcSZwLk2BRRq0g4=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yQKsz67p7ikwPL0wb62c2JLLgau+fbWKdv6W91TlO
 P/rpmTDjlIWBkEOBlkxRRbxE8ssm9ZettfYvuACzBxWJpAhDFycAjCRLwsY/kd3RyZPDuZ4N3WN
 uOJRwf0RfgIqHA/1vzVM25gsVlyUNo/hf12zKrelG0vhhn+nJvRs5v2y3d72wnGObcvv/7P8EbP
 0wHUA
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:36:50 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, David Lechner <dlechner@baylibre.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Stephen Boyd <swboyd@chromium.org>, Jens Reidel <adrian@mainlining.org>,
 Heiko Schocher <hs@nabladev.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 David Wronek <david.wronek@mainlining.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Shih <sam.shih@mediatek.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Joseph Chen <chenjh@rock-chips.com>,
 Ryan Wanner <Ryan.Wanner@microchip.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 "Markus Schneider-Pargmann \(TI.com\)" <msp@baylibre.com>,
 Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Greg Malysa <malysagreg@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Tom Rini <trini@konsulko.com>, Peter Korsgaard <peter@korsgaard.com>,
 Philip Molloy <philip.molloy@analog.com>, Udit Kumar <u-kumar1@ti.com>,
 Romain Gantois <romain.gantois@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>,
 Paul Sajna <sajattack@postmarketos.org>, Raymond Mao <raymondmaoca@gmail.com>,
 Jonathan Currier <dullfire@yahoo.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Robert Marko <robert.marko@sartura.hr>, Thierry Reding <treding@nvidia.com>,
 Shmuel Leib Melamud <smelamud@redhat.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Nishanth Menon <nm@ti.com>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Sam Day <me@samcday.com>, Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 Naman Trivedi <naman.trivedimanojbhai@amd.com>, Marek Vasut <marex@denx.de>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, Andrew Davis <afd@ti.com>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [Uboot-stm32] [PATCH RFC 26/40] clk/clk-uclass: adapt for CCF_FULL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.89 / 15.00];
	DATE_IN_PAST(1.00)[85];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:lukma@denx.de,m:u-boot-qcom@groups.io,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:GSS_MTK_Uboot_upstream@mediatek.com,m:paul@pbarker.dev,m:okamura.dai@socionext.com,m:linux@analog.com,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:sumit.garg@kernel.org,m:peng.fan@nxp.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:conor.dooley@microchip.com,m:finley.xiao@rock-chips.com,m:miquel.raynal@bootlin.com,m:chiawei_wang@aspeedtech.com,m:neil.armstrong@linaro.org,m:luca.weiss@fairphone.com,m:dlechner@baylibre.com,m:Eugeniy.Paltsev@synopsys.com,m:swboyd@chromium.org,m:adrian@mainlining.org,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gabriel.fernandez@foss.st.com,m:padmarao.begari@amd.com,m:david.wronek@mainlining.org,m:hayashi.kunihiko@socionext.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:seanga2@gmail.com,m:manivannan.sadhasivam@linaro.org,m:sam.s
 hih@mediatek.com,m:michael@amarulasolutions.com,m:ansuelsmth@gmail.com,m:chenjh@rock-chips.com,m:Ryan.Wanner@microchip.com,m:iwamatsu@nigauri.org,m:senthilnathan.thangaraj@amd.com,m:zhangqing@rock-chips.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:msp@baylibre.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:ryan_chen@aspeedtech.com,m:malysagreg@gmail.com,m:sjg@chromium.org,m:quic_varada@quicinc.com,m:liviu.dudau@foss.arm.com,m:quentin.schulz@cherry.de,m:varshini.rajendran@microchip.com,m:hal.feng@starfivetech.com,m:manikandan.m@microchip.com,m:trini@konsulko.com,m:peter@korsgaard.com,m:philip.molloy@analog.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:jonas@kwiboo.se,m:sajattack@postmarketos.org,m:raymondmaoca@gmail.com,m:dullfire@yahoo.com,m:ycliang@andestech.com,m:robert.marko@sartura.hr,m:treding@nvidia.com,m:smelamud@redhat.com,m:clamor95@gmail.com,m:nm@ti.com,m:valentin.caron@foss.st.
 com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:me@samcday.com,m:aswin.murugan@oss.qualcomm.com,m:naman.trivedimanojbhai@amd.com,m:marex@denx.de,m:jorge.ramirez@oss.qualcomm.com,m:ryder.lee@mediatek.com,m:loic.poulain@oss.qualcomm.com,m:weijie.gao@mediatek.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:balaji.selvanathan@oss.qualcomm.com,m:chunfeng.yun@mediatek.com,m:arturs.artamonovs@analog.com,m:venkatesh.abbarapu@amd.com,m:vasileios.bimpikas@analog.com,m:yannick.fertre@foss.st.com,m:stephan.gerhold@linaro.org,m:afd@ti.com,m:rui.silva@linaro.org,m:patrick.delaunay@foss.st.com,m:m-chawdhry@ti.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[casey.connolly@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,sntech.de,kernel.org,microchip.com,rock-chips.com,bootlin.com,aspeedtech.com,linaro.org,fairphone.com,baylibre.com,synopsys.com,chromium.org,mainlining.org,nabladev.com,foss.st.com,amd.com,socionext.com,mailbox.org,gmail.com,mediatek.com,amarulasolutions.com,nigauri.org,starfivetech.com,vrull.eu,altera.com,iopsys.eu,quicinc.com,foss.arm.com,cherry.de,konsulko.com,korsgaard.com,analog.com,ti.com,kwiboo.se,postmarketos.org,yahoo.com,andestech.com,sartura.hr,nvidia.com,redhat.com,ziyao.cc,samcday.com,oss.qualcomm.com,denx.de,samsung.com,mentallysanemainliners.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[100];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[casey.connolly@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email,linaro.org:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 592212F0429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When building U-Boot with CCF_FULL support, most clk operations
are implemented in clk/ccf/clk.c, so we can remove the conflicting
definitions in clk-uclass.c.

Additionally, registering clock consumers works quite differently, so we
adapt clk_get_by_name() and similar functions to call into CCF. Notably
while in Linux the struct clk handle is allocated inside CCF (since
it's an opaque cookie), in U-Boot struct clk is public and typically
allocated by the consumer driver, so we need a small adjustment to allow
CCF to populate an already-allocated struct clk.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/clk-uclass.c | 297 +++++++++++++++++++++++++++--------------------
 1 file changed, 172 insertions(+), 125 deletions(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 095329e25f15..d54d76745560 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -23,8 +23,11 @@
 #include <linux/bug.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 
+#include <linux/clk/clk-conf.h>
+#include "ccf/clk.h"
+
 static inline const struct clk_ops_uboot *clk_dev_ops(struct udevice *dev)
 {
 	return (const struct clk_ops_uboot *)dev->driver->ops;
 }
@@ -74,9 +77,9 @@ static int clk_of_xlate_default(struct clk *clk,
 
 	return 0;
 }
 
-static int clk_get_by_index_tail(int ret, ofnode node,
+static int __maybe_unused clk_get_by_index_tail(int ret, ofnode node,
 				 struct ofnode_phandle_args *args,
 				 const char *list_name, int index,
 				 struct clk *clk)
 {
@@ -115,47 +118,30 @@ err:
 
 	return log_msg_ret("prop", ret);
 }
 
-static int clk_get_by_indexed_prop(struct udevice *dev, const char *prop_name,
-				   int index, struct clk *clk)
-{
-	int ret;
-	struct ofnode_phandle_args args;
-
-	debug("%s(dev=%s, index=%d, clk=%p)\n", __func__, dev_read_name(dev),
-	      index, clk);
-
-	assert(clk);
-	clk->dev = NULL;
-
-	ret = dev_read_phandle_with_args(dev, prop_name, "#clock-cells", 0,
-					 index, &args);
-	if (ret) {
-		debug("%s: fdtdec_parse_phandle_with_args failed: err=%d\n",
-		      __func__, ret);
-		return log_ret(ret);
-	}
-
-	return clk_get_by_index_tail(ret, dev_ofnode(dev), &args, "clocks",
-				     index, clk);
-}
-
 int clk_get_by_index(struct udevice *dev, int index, struct clk *clk)
 {
 	return clk_get_by_index_nodev(dev_ofnode(dev), index, clk);
 }
 
 int clk_get_by_index_nodev(ofnode node, int index, struct clk *clk)
 {
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+	struct clk_hw *hw;
+
+	hw = of_clk_get_hw(node, index, NULL);
+	return clk_hw_create_clk_uboot(clk, hw);
+#else
 	struct ofnode_phandle_args args;
 	int ret;
 
 	ret = ofnode_parse_phandle_with_args(node, "clocks", "#clock-cells", 0,
 					     index, &args);
 
 	return clk_get_by_index_tail(ret, node, &args, "clocks",
 				     index, clk);
+#endif
 }
 
 int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
 {
@@ -189,8 +175,86 @@ bulk_get_err:
 
 	return ret;
 }
 
+int clk_get_by_name(struct udevice *dev, const char *name, struct clk *clk)
+{
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+	struct clk_hw *hw;
+
+	hw = of_clk_get_hw(dev_ofnode(dev), 0, name);
+	return clk_hw_create_clk_uboot(clk, hw);
+#else
+	return clk_get_by_name_nodev(dev_ofnode(dev), name, clk);
+#endif
+}
+#endif /* OF_REAL */
+
+int clk_get_by_name_nodev(ofnode node, const char *name, struct clk *clk)
+{
+	int index = 0;
+
+	debug("%s(node=%s, name=%s, clk=%p)\n", __func__,
+		ofnode_get_name(node), name, clk);
+	clk->dev = NULL;
+
+	if (name) {
+		index = ofnode_stringlist_search(node, "clock-names", name);
+		if (index < 0) {
+			debug("fdt_stringlist_search() failed: %d\n", index);
+			return index;
+		}
+	}
+
+	return clk_get_by_index_nodev(node, index, clk);
+}
+
+int clk_release_all(struct clk *clk, unsigned int count)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < count; i++) {
+		debug("%s(clk[%u]=%p)\n", __func__, i, &clk[i]);
+
+		/* check if clock has been previously requested */
+		if (!clk[i].dev)
+			continue;
+
+		ret = clk_disable(&clk[i]);
+		if (ret && ret != -ENOSYS)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* Full CCF has its own versions of these functions */
+#if !CONFIG_IS_ENABLED(CLK_CCF_FULL)
+static int clk_get_by_indexed_prop(struct udevice *dev, const char *prop_name,
+				   int index, struct clk *clk)
+{
+	int ret;
+	struct ofnode_phandle_args args;
+
+	debug("%s(dev=%s, index=%d, clk=%p)\n", __func__, dev_read_name(dev),
+	      index, clk);
+
+	assert(clk);
+	clk->dev = NULL;
+
+	ret = dev_read_phandle_with_args(dev, prop_name, "#clock-cells", 0,
+					 index, &args);
+	if (ret) {
+		debug("%s: fdtdec_parse_phandle_with_args failed: err=%d\n",
+		      __func__, ret);
+		return log_ret(ret);
+	}
+
+	return clk_get_by_index_tail(ret, dev_ofnode(dev), &args, "clocks",
+				     index, clk);
+}
+
 static struct clk *clk_set_default_get_by_id(struct clk *clk)
 {
 	struct clk *c = clk;
 
@@ -371,62 +435,8 @@ fail:
 	free(rates);
 	return ret;
 }
 
-int clk_set_defaults(struct udevice *dev, enum clk_defaults_stage stage)
-{
-	int ret;
-
-	if (!dev_has_ofnode(dev))
-		return 0;
-
-	/*
-	 * To avoid setting defaults twice, don't set them before relocation.
-	 * However, still set them for SPL. And still set them if explicitly
-	 * asked.
-	 */
-	if (!(IS_ENABLED(CONFIG_XPL_BUILD) || (gd->flags & GD_FLG_RELOC)))
-		if (stage != CLK_DEFAULTS_POST_FORCE)
-			return 0;
-
-	debug("%s(%s)\n", __func__, dev_read_name(dev));
-
-	ret = clk_set_default_parents(dev, stage);
-	if (ret)
-		return ret;
-
-	ret = clk_set_default_rates(dev, stage);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-int clk_get_by_name(struct udevice *dev, const char *name, struct clk *clk)
-{
-	return clk_get_by_name_nodev(dev_ofnode(dev), name, clk);
-}
-#endif /* OF_REAL */
-
-int clk_get_by_name_nodev(ofnode node, const char *name, struct clk *clk)
-{
-	int index = 0;
-
-	debug("%s(node=%s, name=%s, clk=%p)\n", __func__,
-		ofnode_get_name(node), name, clk);
-	clk->dev = NULL;
-
-	if (name) {
-		index = ofnode_stringlist_search(node, "clock-names", name);
-		if (index < 0) {
-			debug("fdt_stringlist_search() failed: %d\n", index);
-			return index;
-		}
-	}
-
-	return clk_get_by_index_nodev(node, index, clk);
-}
-
 const char *
 clk_resolve_parent_clk(struct udevice *dev, const char *name)
 {
 	struct udevice *parent;
@@ -443,28 +453,8 @@ clk_resolve_parent_clk(struct udevice *dev, const char *name)
 
 	return clk.dev->name;
 }
 
-int clk_release_all(struct clk *clk, unsigned int count)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < count; i++) {
-		debug("%s(clk[%u]=%p)\n", __func__, i, &clk[i]);
-
-		/* check if clock has been previously requested */
-		if (!clk[i].dev)
-			continue;
-
-		ret = clk_disable(&clk[i]);
-		if (ret && ret != -ENOSYS)
-			return ret;
-	}
-
-	return 0;
-}
-
 int clk_request(struct udevice *dev, struct clk *clk)
 {
 	const struct clk_ops_uboot *ops;
 
@@ -704,21 +694,8 @@ int clk_enable(struct clk *clk)
 
 	return 0;
 }
 
-int clk_enable_bulk(struct clk_bulk *bulk)
-{
-	int i, ret;
-
-	for (i = 0; i < bulk->count; i++) {
-		ret = clk_enable(&bulk->clks[i]);
-		if (ret < 0 && ret != -ENOSYS)
-			return ret;
-	}
-
-	return 0;
-}
-
 int clk_disable(struct clk *clk)
 {
 	const struct clk_ops_uboot *ops;
 	struct clk *clkp = NULL;
@@ -769,21 +746,8 @@ int clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-int clk_disable_bulk(struct clk_bulk *bulk)
-{
-	int i, ret;
-
-	for (i = 0; i < bulk->count; i++) {
-		ret = clk_disable(&bulk->clks[i]);
-		if (ret < 0 && ret != -ENOSYS)
-			return ret;
-	}
-
-	return 0;
-}
-
 int clk_get_by_id(ulong id, struct clk **clkp)
 {
 	struct udevice *dev;
 	struct uclass *uc;
@@ -820,8 +784,65 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 		return true;
 
 	return false;
 }
+#else
+long clk_get_parent_rate(struct clk *clk)
+{
+	struct clk *pclk;
+
+	if (!clk)
+		return -EINVAL;
+
+	pclk = clk_get_parent(clk);
+	return clk_get_rate(pclk);
+}
+
+static int clk_set_default_parents(struct udevice *dev,
+				   enum clk_defaults_stage stage)
+{
+	return -ENOSYS;
+}
+
+static int clk_set_default_rates(struct udevice *dev,
+				 enum clk_defaults_stage stage)
+{
+	return -ENOSYS;
+}
+#endif
+
+int clk_set_defaults(struct udevice *dev, enum clk_defaults_stage stage)
+{
+	int ret;
+
+	if (!dev_has_ofnode(dev))
+		return 0;
+
+	/*
+	 * To avoid setting defaults twice, don't set them before relocation.
+	 * However, still set them for SPL. And still set them if explicitly
+	 * asked.
+	 */
+	if (!(IS_ENABLED(CONFIG_XPL_BUILD) || (gd->flags & GD_FLG_RELOC)))
+		if (stage != CLK_DEFAULTS_POST_FORCE)
+			return 0;
+
+	debug("%s(%s)\n", __func__, dev_read_name(dev));
+
+	if (CONFIG_IS_ENABLED(CLK_CCF_FULL)) {
+		return of_clk_set_defaults(dev_ofnode(dev), false);
+	} else {
+		ret = clk_set_default_parents(dev, stage);
+		if (ret)
+			return ret;
+
+		ret = clk_set_default_rates(dev, stage);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
 
 struct clk *devm_clk_get(struct udevice *dev, const char *id)
 {
 	int rc;
@@ -837,8 +858,34 @@ struct clk *devm_clk_get(struct udevice *dev, const char *id)
 
 	return clk;
 }
 
+int clk_enable_bulk(struct clk_bulk *bulk)
+{
+	int i, ret;
+
+	for (i = 0; i < bulk->count; i++) {
+		ret = clk_enable(&bulk->clks[i]);
+		if (ret < 0 && ret != -ENOSYS)
+			return ret;
+	}
+
+	return 0;
+}
+
+int clk_disable_bulk(struct clk_bulk *bulk)
+{
+	int i, ret;
+
+	for (i = 0; i < bulk->count; i++) {
+		ret = clk_disable(&bulk->clks[i]);
+		if (ret < 0 && ret != -ENOSYS)
+			return ret;
+	}
+
+	return 0;
+}
+
 int clk_uclass_post_probe(struct udevice *dev)
 {
 	/*
 	 * when a clock provider is probed. Call clk_set_defaults()

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
