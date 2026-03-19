Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI75CsYXwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CD2F041D
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92DF1C8F294;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39A61C87ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486b96760easo15182705e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953903; x=1774558703;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y7YG64DnCuy2McZZ3OS1s5OitYK10LkBi72/Tt+MRRY=;
 b=PQACWixve0ZpxUBdeiG430NTWeDre4O1c6EsEpksS49dbujmlV6ua481NlY81GzxDF
 ZZzY2GUT3IIfTKlCNXMShTTL9HHNfRxQbG6U1zqggji4I5QpEEITD0k7zeGSJVKgly99
 M17dk89XkpRah2yNDImlKKbDGJI9diw+ksCuEnnywTKAFamqRfX10sqL0wlCpzYR08LD
 MTgENJrBsUQewGOqYvVR+H4T3u6DWcE7RNbGNyB3OKLD+USytr6KOTh7xS2eYcPdUQ4o
 7+a/QEtyx7KApkI1/1KZH+L1qWkzbym3jmLW73vnDOiTa6GFieL5puTn9ntX/kmKUpSL
 E8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953903; x=1774558703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y7YG64DnCuy2McZZ3OS1s5OitYK10LkBi72/Tt+MRRY=;
 b=mXPe+IOR7aqpvsu64EErsUsp4JGSRYmQTq/VGxMJg5rkzH4jiw+sxynD75AdhKoV2V
 1DFXtu19famls1iFgVuQbvte/emrJ3U2Ms/AfOdXATRdFLMuhkf+wcgTlmkE3cT122AP
 W5PQPQ21yxzJQJJ1qltHepkbnxMVyxCeVDxJ2+sYOCiTGhWArA/UtfkzMTJjyVl450i0
 YF0I3xV5qLphaKokLUG7KSmy+FkesNy3kPJtYG51eCMP7jUO7T7ESiCNMdxtu6eIbBdu
 twX/p88J/AMI7xoYzBoWW5Qm9i7Ex5MxfC2VDeROCkneqYOvvpJIMoVsHtBzwa3Ky+ZZ
 rUGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYzB+yiImkGxv2++Qem77ntJ/dwZwxSzHXf6cK1Bjz5oqUO2/EpaQ/keg9fQjQ16r1F2enE2s1qsLtIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNqMOR+DRU+mQM7JSrqgyIWweTACV8UOUqiCOqsTzRXts8Kqve
 OcKlTvmhLufwF1JVWExlk6XHUY8XDlu7y20komX2BhSH7e17apybIboksoRLZHF1vcg=
X-Gm-Gg: ATEYQzzm8eu/l2DftACTbA8cQAivcycflTAYZzbe8Cyyi60dzntufG7TBG/dcSLJsNm
 +r5gIRlL3nA2/Kwfal9YDLG541WwTs7GDnPM+4v+Y0AikaujBX58PoLuV3hXwQxcamoj2uuKWOY
 FQGnLMOViZTpw9nAq7Zi/VP2vLE8bU3V07jRWflwDDdfqmRRS38/vr9tWwmAyWOnPN+AXN/Bbs+
 Szqu97QG11oPamr5g9OZ5HrIBYJQLQSOBqIhWbdLH21bAX935sGJWpP8cjisMS6gGwNrQ8VXdyX
 FDyzP0hOo+gVjOhbJYqRnkv6xlBRSSxjfi1Nz7JPDFcLKkBBi9iXJKOFQYn8QzcgAQf6eYRtjTH
 8l6+MxPs0JFEM6KG7P176hfslVGN2WHnbXt6nMbSewAYfgq1hJ2gJrtYc7mb0S8mO51M9I8PdtS
 Si3Ln6JYkrOdve+LwapbnJRvXN+6++Z0Ik5Gwe0o+MApRHgLRYIYPmxRQ4cW7tVj9v9gs=
X-Received: by 2002:a05:600c:8b31:b0:485:9a50:3369 with SMTP id
 5b1f17b1804b1-486fee304c4mr7491445e9.29.1773953902485; 
 Thu, 19 Mar 2026 13:58:22 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:21 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:44 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-22-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5656;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=pyXAUexLV67NxbGLlNdz7O544IZi4ffGh3W9T1xKaV0=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yfzx1pPc5kyeEqS2Ry9LVzppW71iUWWD4oLmxp0ln
 +2KysQ6SlkYBDkYZMUUWcRPLLNsWnvZXmP7ggswc1iZQIYwcHEKwESMKxh+MTksTxGIUHi72dUm
 3aPboKi5sKs96wML69Jz3cl/J1qkMzLsevraySBDSj1gmsaX6iqr1oiimabzFXznXEq3avsw6Xo
 RAA==
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
Subject: [Uboot-stm32] [PATCH RFC 22/40] clk: move clock flags to common
	clk-provider.h
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
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,sntech.de,kernel.org,microchip.com,rock-chips.com,bootlin.com,aspeedtech.com,linaro.org,fairphone.com,baylibre.com,synopsys.com,chromium.org,mainlining.org,nabladev.com,foss.st.com,amd.com,socionext.com,mailbox.org,gmail.com,mediatek.com,amarulasolutions.com,nigauri.org,starfivetech.com,vrull.eu,altera.com,iopsys.eu,quicinc.com,foss.arm.com,cherry.de,konsulko.com,korsgaard.com,analog.com,ti.com,kwiboo.se,postmarketos.org,yahoo.com,andestech.com,sartura.hr,nvidia.com,redhat.com,ziyao.cc,samcday.com,oss.qualcomm.com,denx.de,samsung.com,mentallysanemainliners.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[casey.connolly@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
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
X-Rspamd-Queue-Id: EA1CD2F041D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These are the same between uccf and ccf_full, move them out to
clk-provider.h so we can ensure they stay in sync.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 include/linux/clk-provider-ccf_full.h | 24 ------------------------
 include/linux/clk-provider-uccf.h     | 24 ------------------------
 include/linux/clk-provider.h          | 24 ++++++++++++++++++++++++
 3 files changed, 24 insertions(+), 48 deletions(-)

diff --git a/include/linux/clk-provider-ccf_full.h b/include/linux/clk-provider-ccf_full.h
index dfc2049feee5..0e160b13b3b2 100644
--- a/include/linux/clk-provider-ccf_full.h
+++ b/include/linux/clk-provider-ccf_full.h
@@ -9,32 +9,8 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <clk-uclass.h>
 
-/*
- * flags used across common struct clk.  these flags should only affect the
- * top-level framework.  custom flags for dealing with hardware specifics
- * belong in struct clk_foo
- *
- * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
- */
-#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
-#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
-#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
-#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
-				/* unused */
-				/* unused */
-#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
-#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
-#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
-#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
-#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
-#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
-/* parents need enable during gate/ungate, set rate and re-parent */
-#define CLK_OPS_PARENT_ENABLE	BIT(12)
-/* duty cycle call may be forwarded to the parent clock */
-#define CLK_DUTY_CYCLE_PARENT	BIT(13)
-
 struct clk;
 struct clk_hw;
 struct clk_core;
 struct dentry;
diff --git a/include/linux/clk-provider-uccf.h b/include/linux/clk-provider-uccf.h
index bfd16fbdfc67..63b8df663a7a 100644
--- a/include/linux/clk-provider-uccf.h
+++ b/include/linux/clk-provider-uccf.h
@@ -27,32 +27,8 @@ static inline void clk_dm(ulong id, struct clk *clk)
 	if (!IS_ERR(clk))
 		clk->id = CLK_ID(clk->dev, id);
 }
 
-/*
- * flags used across common struct clk.  these flags should only affect the
- * top-level framework.  custom flags for dealing with hardware specifics
- * belong in struct clk_foo
- *
- * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
- */
-#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
-#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
-#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
-#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
-				/* unused */
-#define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() */
-#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
-#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
-#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
-#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
-#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
-#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
-/* parents need enable during gate/ungate, set rate and re-parent */
-#define CLK_OPS_PARENT_ENABLE	BIT(12)
-/* duty cycle call may be forwarded to the parent clock */
-#define CLK_DUTY_CYCLE_PARENT	BIT(13)
-
 #define CLK_MUX_INDEX_ONE		BIT(0)
 #define CLK_MUX_INDEX_BIT		BIT(1)
 #define CLK_MUX_HIWORD_MASK		BIT(2)
 #define CLK_MUX_READ_ONLY		BIT(3) /* mux can't be changed */
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1140c2b10ac2..4fcdb5a86799 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -8,8 +8,32 @@
  */
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+/*
+ * flags used across common struct clk.  these flags should only affect the
+ * top-level framework.  custom flags for dealing with hardware specifics
+ * belong in struct clk_foo
+ *
+ * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
+ */
+#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
+#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
+#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
+#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
+				/* unused */
+				/* unused */
+#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
+#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
+#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
+#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
+#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
+#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
+/* parents need enable during gate/ungate, set rate and re-parent */
+#define CLK_OPS_PARENT_ENABLE	BIT(12)
+/* duty cycle call may be forwarded to the parent clock */
+#define CLK_DUTY_CYCLE_PARENT	BIT(13)
+
 /*
  * U-Boot: for compatibility include the correct clk-provider.h
  * for either uccf (U-Boot CCF) or ccf_full (Linux CCF)
  */

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
