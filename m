Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEhlJ8UXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF1D2F03F6
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 163DEC8F286;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5442C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:57:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43b40003d13so893010f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953878; x=1774558678;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OCnS3ZlhvvW3XbeEgO9yZIoCnqN7iRGngRVh2eKOPzw=;
 b=kis+rOCHm2hU3UZXvhUmWdlDRHyJzvMgM4ZJcwJa+y4KKjdcXqNfPTCx27A/uOGyGr
 PNAB9poYpAc2wcLZyafi188GKtqw45R5Wm8F1n+eN3+gzwyMI6SW6uBr1F8TxkfExLXO
 HOvpfe8RmNTZ28HYVy6FbXV05dHBJZpkl3O8ZeJTCkiP4nqK/L/OT+b6kikfS1M0kWra
 JRXIMZwQe7PCszUiVKkLBZNkhjfVJmnP4umVopsqQclYODRm2wFJAkW6maTvopisvgN7
 qoaHqI6xYUtdFfb+ANQUKyez7hWMp71w/hOAbzmo/MpE9rArU5i8u5Gn26+S6i7xlNx/
 KXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953878; x=1774558678;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OCnS3ZlhvvW3XbeEgO9yZIoCnqN7iRGngRVh2eKOPzw=;
 b=JkPfPQ199H0G+Cbcdgys8WjjM9+lp5kUF4VhFeJzoujKzUaGsSoEfoGar2fT31/phe
 3obRdT++6iqQt8w45yd7pfS7dBTM6vugn6yaKEUnRdheAFAbr4be1IaFfaA2hMTdr1aU
 HZo+0WjgcWedlDi97Lx9f69cvapKsjHvqurV7U7nUDwFWNThEQ1B1Jt+OtJ1dcZRkUq2
 AFZvUsRWkPGVGEt0/D7VbP7DqHYDlErhd+ZnhwXF4fEVNgCVUhuu2lFPuiXt4EL4HV5I
 oupBEjynVadVyc7tonfBHkq/wH6NGSRGjiALMITQyMwlKOvqHL/KR/OzKZTBBC937nnM
 Hm5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSPU/rbBJn6DdW7fy5FB/ElsrnGQIoptdj2w2lqS1xwAOmaxOqE69ZiZ3XKbUoh+WydG0XN4cvFT83VQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGDwlVeUNCf+AQ+wrsUw/cOJD2I2QQtyw052EHpLwLQGtNboJ9
 C+aQSvDTK1CpG0/OWtI5bTzczq0ld7srm+P2CnCMg1ZeHyfNrPs+Ft2eG2YRdz6gLeo=
X-Gm-Gg: ATEYQzypkpZQvSz20ou+UP49LkZzGiNYndRKmt4m8X8OSURvcoB8wdv8hQL7o7PIzd7
 qhu0oyXfdP+X5XE9R/hTqiGY6dHBaV4xUdN1jKUW1gqPyTaU1u+577LpfsbW6TkbgcqzJ1YRtTg
 ZQLxhOn6ox/VGemzxdk4y/89ffUfh8AR7K1VwoKPnjRK2cQ2WQxO3812XdTFB0IwWl61HkYEWxS
 9pxZKwPhUN1WQpIS86xvdinM+SSdhn/9KRar5oFT3hfhq+j04jk0K2/Ir2B66EhY+O1LWs77jCk
 ndA61He2r7oOyypbBTl6nDp5XBJ36fso2/I34bFGIYS3tCt3Beuq2XMkZfjbPt2OchEPblWUWrQ
 +/OdLR9XZnjS7Af71ZUAt3i2ob+uLObziIG/OYfW+OxV6k7pwv4neAavPSLBDcmYssQS6mj2MLZ
 CXLodhDovXGQSs+m6GGjucuF7vsB78i8PLotKd0Fo4Qgsa5pxm85pg2Ny6MMeBelK8jRo=
X-Received: by 2002:a5d:5d13:0:b0:43b:3bed:f3b with SMTP id
 ffacd0b85a97d-43b64277fafmr1203947f8f.34.1773953877871; 
 Thu, 19 Mar 2026 13:57:57 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:57:56 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:38 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-16-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9240;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=/RAbNGoLPbHbhn8quS6iAUljDwLpWmzJA+HtFCQI1Qk=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yfyZVdPqjzFeKtZ8mTDnwHx7Z6XTvTMnHtj3IueMe
 +we5ckHOkpZGAQ5GGTFFFnETyyzbFp72V5j+4ILMHNYmUCGMHBxCsBETrEz/HdbJnz0g/15OyUN
 od6cNzMZXlwrM7SV3vos7GfQr97sCzKMDJNcO6I3lwU9tX/o22d0c8WeuDOuvH4/oys1fVls6hz
 4JgIA
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
Subject: [Uboot-stm32] [PATCH RFC 16/40] clk: move U-Boot CCF to clk/uccf
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,linaro.org:email,linaro.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5CF1D2F03F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prepare for the introduction of full CCF support by moving the existing
U-Boot CCF support to a uccf subdirectory.

Due to a number of incompatibilities it won't be possible to support
existing U-Boot CCF clocks with the full CCF, this allows us to support
both. While it may make sense to remove U-Boot CCF in the future, it may
be necessary to continue supporting it to meet space/memory requirements
in SPL for some platforms.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/Kconfig                                | 51 +++++++---------------
 drivers/clk/Makefile                               |  7 ++-
 drivers/clk/uccf/Kconfig                           | 22 ++++++++++
 drivers/clk/uccf/Makefile                          | 11 +++++
 drivers/clk/{ => uccf}/clk-composite.c             |  0
 drivers/clk/{ => uccf}/clk-divider.c               |  0
 drivers/clk/{ => uccf}/clk-fixed-factor.c          |  0
 drivers/clk/{ => uccf}/clk-gate.c                  |  0
 drivers/clk/{ => uccf}/clk-mux.c                   |  0
 drivers/clk/{ => uccf}/clk.c                       |  0
 .../{clk_sandbox_ccf.c => uccf/clk_sandbox_uccf.c} |  2 +-
 include/sandbox-clk.h                              |  2 +-
 12 files changed, 54 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c88931c8ec4d..5cc76cd55cc8 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -10,8 +10,24 @@ config CLK
 	  a particular clock rate and check on available clocks. Clocks can
 	  feed into other clocks in a tree structure, with multiplexers to
 	  choose the source for each clock.
 
+source "drivers/clk/uccf/Kconfig"
+
+config SANDBOX_CLK_CCF
+	bool "Sandbox U-Boot Common Clock Framework [uCCF] support"
+	depends on SANDBOX && (CLK_CCF || CLK_CCF_FULL)
+	help
+	  Enable this option if you want to test the Linux kernel's Common
+	  Clock Framework [CCF] code in U-Boot's Sandbox clock driver.
+
+config CLK_COMPOSITE_CCF
+	bool "Common Clock Framework [CCF] composite clk support"
+	depends on CLK_CCF || CLK_CCF_FULL
+	help
+	  Enable this option if you want to (re-)use the Linux kernel's Common
+	  Clock Framework [CCF] composite code in U-Boot's clock driver.
+
 config CLK_AUTO_ID
 	bool "Enable support of an unique clock id with several provider"
 	depends on CLK
 	help
@@ -66,35 +82,8 @@ config CLK_BOSTON
 	select SYSCON
 	help
 	  Enable this to support the clocks
 
-config SPL_CLK_CCF
-	bool "SPL Common Clock Framework [CCF] support"
-	depends on SPL
-	help
-	  Enable this option if you want to (re-)use the Linux kernel's Common
-	  Clock Framework [CCF] code in U-Boot's SPL.
-
-config SPL_CLK_COMPOSITE_CCF
-	bool "SPL Common Clock Framework [CCF] composite clk support"
-	depends on SPL_CLK_CCF
-	help
-	  Enable this option if you want to (re-)use the Linux kernel's Common
-	  Clock Framework [CCF] composite code in U-Boot's SPL.
-
-config CLK_CCF
-	bool "Common Clock Framework [CCF] support"
-	help
-	  Enable this option if you want to (re-)use the Linux kernel's Common
-	  Clock Framework [CCF] code in U-Boot's clock driver.
-
-config CLK_COMPOSITE_CCF
-	bool "Common Clock Framework [CCF] composite clk support"
-	depends on CLK_CCF
-	help
-	  Enable this option if you want to (re-)use the Linux kernel's Common
-	  Clock Framework [CCF] composite code in U-Boot's clock driver.
-
 config CLK_GPIO
 	bool "GPIO-controlled clock gate driver"
 	depends on CLK
 	help
@@ -180,16 +169,8 @@ config CLK_OCTEON
 	default y
 	help
 	  Enable this to support the clocks on Octeon MIPS platforms.
 
-config SANDBOX_CLK_CCF
-	bool "Sandbox Common Clock Framework [CCF] support"
-	depends on SANDBOX
-	select CLK_CCF
-	help
-	  Enable this option if you want to test the Linux kernel's Common
-	  Clock Framework [CCF] code in U-Boot's Sandbox clock driver.
-
 config CLK_SCMI
 	bool "Enable SCMI clock driver"
 	depends on CLK
 	depends on SCMI_FIRMWARE
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f96d57a3223a..30991e9f55d7 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -6,14 +6,14 @@
 
 obj-$(CONFIG_$(PHASE_)CLK) += clk-uclass.o
 obj-$(CONFIG_$(PHASE_)CLK) += clk_fixed_rate.o
 obj-$(CONFIG_$(PHASE_)CLK) += clk_fixed_factor.o
-obj-$(CONFIG_$(PHASE_)CLK_CCF) += clk.o clk-divider.o clk-mux.o clk-gate.o
-obj-$(CONFIG_$(PHASE_)CLK_CCF) += clk-fixed-factor.o
-obj-$(CONFIG_$(PHASE_)CLK_COMPOSITE_CCF) += clk-composite.o
 obj-$(CONFIG_$(PHASE_)CLK_GPIO) += clk-gpio.o
 obj-$(CONFIG_$(PHASE_)CLK_STUB) += clk-stub.o
 
+# U-Boot/IMX "micro" CCF port
+obj-$(CONFIG_$(PHASE_)CLK_CCF) += uccf/
+
 obj-y += adi/
 obj-y += airoha/
 obj-y += analogbits/
 obj-$(CONFIG_$(PHASE_)MACH_IMX) += imx/
@@ -57,7 +57,6 @@ obj-$(CONFIG_CLK_XLNX_CLKWZRD) += clk-xlnx-clock-wizard.o
 obj-$(CONFIG_CLK_ZYNQ) += clk_zynq.o
 obj-$(CONFIG_CLK_ZYNQMP) += clk_zynqmp.o
 obj-$(CONFIG_CLK_ICS8N3QV01) += ics8n3qv01.o
 obj-$(CONFIG_MACH_PIC32) += clk_pic32.o
-obj-$(CONFIG_SANDBOX_CLK_CCF) += clk_sandbox_ccf.o
 obj-$(CONFIG_SANDBOX) += clk_sandbox.o
 obj-$(CONFIG_SANDBOX) += clk_sandbox_test.o
diff --git a/drivers/clk/uccf/Kconfig b/drivers/clk/uccf/Kconfig
new file mode 100644
index 000000000000..bf4a634a403f
--- /dev/null
+++ b/drivers/clk/uccf/Kconfig
@@ -0,0 +1,22 @@
+
+
+config SPL_CLK_CCF
+	bool "SPL U-Boot Common Clock Framework [uCCF] support"
+	depends on SPL
+	help
+	  Enable this option if you want to (re-)use the Linux kernel's Common
+	  Clock Framework [CCF] code in U-Boot's SPL.
+
+config SPL_CLK_COMPOSITE_CCF
+	bool "SPL U-Boot Common Clock Framework [uCCF] composite clk support"
+	depends on SPL_CLK_CCF
+	help
+	  Enable this option if you want to (re-)use the Linux kernel's Common
+	  Clock Framework [CCF] composite code in U-Boot's SPL.
+
+config CLK_CCF
+	bool "U-Boot Common Clock Framework [uCCF] support"
+	help
+	  Enable this option if you want to (re-)use the Linux kernel's Common
+	  Clock Framework [CCF] code in U-Boot's clock driver.
+
diff --git a/drivers/clk/uccf/Makefile b/drivers/clk/uccf/Makefile
new file mode 100644
index 000000000000..02440b5e322c
--- /dev/null
+++ b/drivers/clk/uccf/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (c) 2015 Google, Inc
+# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
+#
+
+obj-$(CONFIG_$(PHASE_)CLK_CCF) += clk.o clk-divider.o clk-mux.o clk-gate.o
+obj-$(CONFIG_$(PHASE_)CLK_CCF) += clk-fixed-factor.o
+obj-$(CONFIG_$(PHASE_)CLK_COMPOSITE_CCF) += clk-composite.o
+
+obj-$(CONFIG_SANDBOX_CLK_CCF) += clk_sandbox_uccf.o
diff --git a/drivers/clk/clk-composite.c b/drivers/clk/uccf/clk-composite.c
similarity index 100%
rename from drivers/clk/clk-composite.c
rename to drivers/clk/uccf/clk-composite.c
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/uccf/clk-divider.c
similarity index 100%
rename from drivers/clk/clk-divider.c
rename to drivers/clk/uccf/clk-divider.c
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/uccf/clk-fixed-factor.c
similarity index 100%
rename from drivers/clk/clk-fixed-factor.c
rename to drivers/clk/uccf/clk-fixed-factor.c
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/uccf/clk-gate.c
similarity index 100%
rename from drivers/clk/clk-gate.c
rename to drivers/clk/uccf/clk-gate.c
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/uccf/clk-mux.c
similarity index 100%
rename from drivers/clk/clk-mux.c
rename to drivers/clk/uccf/clk-mux.c
diff --git a/drivers/clk/clk.c b/drivers/clk/uccf/clk.c
similarity index 100%
rename from drivers/clk/clk.c
rename to drivers/clk/uccf/clk.c
diff --git a/drivers/clk/clk_sandbox_ccf.c b/drivers/clk/uccf/clk_sandbox_uccf.c
similarity index 98%
rename from drivers/clk/clk_sandbox_ccf.c
rename to drivers/clk/uccf/clk_sandbox_uccf.c
index 9b8036d41aac..9c74ed940acd 100644
--- a/drivers/clk/clk_sandbox_ccf.c
+++ b/drivers/clk/uccf/clk_sandbox_uccf.c
@@ -112,9 +112,9 @@ static const struct clk_ops clk_gate2_ops = {
 	.disable = clk_gate2_disable,
 	.get_rate = clk_generic_get_rate,
 };
 
-struct clk *sandbox_clk_register_gate2(struct device *dev, const char *name,
+struct clk *sandbox_clk_register_gate2(struct udevice *dev, const char *name,
 				       const char *parent_name,
 				       unsigned long flags, void __iomem *reg,
 				       u8 bit_idx, u8 cgr_val,
 				       u8 clk_gate2_flags)
diff --git a/include/sandbox-clk.h b/include/sandbox-clk.h
index c2616c27a44a..eb02a474c741 100644
--- a/include/sandbox-clk.h
+++ b/include/sandbox-clk.h
@@ -57,9 +57,9 @@ static inline struct clk *sandbox_clk_gate(const char *name, const char *parent,
 	return clk_register_gate(NULL, name, parent, CLK_SET_RATE_PARENT,
 				 reg, bit_idx, clk_gate_flags, NULL);
 }
 
-struct clk *sandbox_clk_register_gate2(struct device *dev, const char *name,
+struct clk *sandbox_clk_register_gate2(struct udevice *dev, const char *name,
 				       const char *parent_name,
 				       unsigned long flags,
 				       void __iomem *reg, u8 bit_idx,
 				       u8 cgr_val, u8 clk_gate_flags);

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
