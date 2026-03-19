Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIBgH8YXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 590EB2F0428
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF67FC8F298;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70E43C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b45bb7548so914129f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953915; x=1774558715;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LO9AczzwpW2mlPWdTEWqRurhDvGffr5v8pKAyKeCkS8=;
 b=a9lLWltuLZd1rJr2DTK4CflgAW17qw6Ud1EGRWv0TIo+DDdL6KRMRMwtTgZBnDquv7
 VQsJkoKK7ITsrhPXS8MXnf49VcALZFrktvUiw1KI3qsEGPT90CL+4YpGYc0LfVt45G3l
 7vT5yqkNVwFWe/s5W89FAZS6jX/3FdF3rgnPxDLQxMeDOi1gF+YTTlLkNEetBXeJfj5Y
 CzaszxXen4R1Z1OuihshvMZ/HaG5FmvuHYfevaZnlXnj7N9lOkQS6aFIaXu00B+aXah2
 07M23ni8wckQfE5gFtuyQ7/4T9hxsiIvAzuydIM7XiUEilF++JyzDBJ0AbQGdtqqurPb
 dC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953915; x=1774558715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LO9AczzwpW2mlPWdTEWqRurhDvGffr5v8pKAyKeCkS8=;
 b=bt7wmlziQhJlfxobgYIsiLPsq/nCz9OtSRMO+qRg7vR0eF4s7L198RSF3Z3wddjaRq
 bg6iK4RszG4OrRiEze2ZhzDRtp89bueLatfSssmr/FjwoPiwgrq12oHM6JJ8gZsO0fbh
 kCdQEO3uclq6nYuCRu6n0kw3BzD+nw/tW67+/WhiDLai8HbiaGet5b2FHNIxZDRDJzj+
 wxWhqZnHbsR1DhCaQfy1haDwzYFfILu4jAkCYZERlvqhPIqxE/jwMfIbP7e04i2ZhWA/
 ETTpxP6xhrIaanJa5azfiHiFj+gJ9Zn3oQDpMpqs2qdm3fj6FbybyNcaQMte6nHYYtG4
 Hn3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF3HLxLGn/2LOS+L90/M0TLd85fbYS6OTuuBOYb53V4UGDhDuAggOE17UC2toE9lz57RvkuTSukQ6JuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJeCO0gunhVxmc9fQV37BEtKK3n4uilebxasF2V1l0k8YhSdg8
 pDJC1y89VUi3sHT4fOznSqSzKghz5Dm0GGUDhKU2NF/sXbG8UkPwjLchYfgD8VvSrj4=
X-Gm-Gg: ATEYQzz2kVa37z4vHGaJTLBuYgd8j6LejPDd/WqwC1uetSJhwLY1+OxRYed3M6kQywK
 nrHBiopLZ5ChuJmvbCRp36cKZurS0gUV6U+lna7NV/9B8ixmnbFJlYtDvzTnQX800zjvbqdIvlh
 /LJ0hcvIHy2aoAvGHcDY86hYTT+UxBzahICn3RPauEGsPcC3qtoCdNpWgREHcfFXW2/3wPgh/5N
 5poNXsxEGjXSBlPd+7R2Cvkxgyix3PLetTL9jiQSXkcR22UiG+7yJ7p0QpfiVgEiJW2pkHOtJGy
 PLxqix+k0AMXt5iKyCTtCv0RYupf4l8ifhOyEtHDwe9scGfu7ezlh81EthqRcN27JpGm0BEnAoC
 4lodtISyqppeIxnsjoNMWiwPatPjsmelSkLIfw60Yu89ftJ08QI1PZUPXzBeBriWztoiXwVDTOg
 NWZb1w9Shn/0PLpaHTfrIT9IbDu84M709kXnHcV9cBugsIFZ+hIqnmsvxJk1AZ1UQzJBA=
X-Received: by 2002:a05:6000:2007:b0:43b:4e13:2213 with SMTP id
 ffacd0b85a97d-43b6428baa5mr1395997f8f.51.1773953914418; 
 Thu, 19 Mar 2026 13:58:34 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:33 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:47 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-25-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=34475;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=N77OGl5Rha0k69ufHfd54/JUlWLygviMWvuLLa+fN9U=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yQITY+5K8Omvrl2S+fPj3bhw5Wquu4t/F2dXh+z5e
 kaxiPViRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjI1h0M/zQeK9WHvjl9b0l2
 msKWB+erXvFntR4/0bh306tT2n+5OmYw/K9X2eU0h6k269D9soibr/6X7WQ5Wcd+zdyyzftunNt
 LuXsA
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
Subject: [Uboot-stm32] [PATCH RFC 25/40] clk/ccf: adapt CCF generic clocks
	for U-Boot
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,pengutronix.de:email,linaro.org:email,linaro.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 590EB2F0428
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adjusted the generic clock drivers so that they build and work in
U-Boot. These changes are fairly minimal, big endian support is dropped
as it's unused anyway, and a small hack is added for sandbox tests which
can't use readl/writel.

The unused spinlock is removed from most function prototypes.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/ccf/clk-composite.c    |  21 +++---
 drivers/clk/ccf/clk-divider.c      |  45 +++++--------
 drivers/clk/ccf/clk-fixed-factor.c | 129 ++++++++++++++++---------------------
 drivers/clk/ccf/clk-fixed-rate.c   |  93 +++++++++++---------------
 drivers/clk/ccf/clk-gate.c         |  39 +++++------
 drivers/clk/ccf/clk-mux.c          |  31 ++++-----
 6 files changed, 156 insertions(+), 202 deletions(-)

diff --git a/drivers/clk/ccf/clk-composite.c b/drivers/clk/ccf/clk-composite.c
index 66759fe28fad..90d8a18f8ce0 100644
--- a/drivers/clk/ccf/clk-composite.c
+++ b/drivers/clk/ccf/clk-composite.c
@@ -2,12 +2,15 @@
 /*
  * Copyright (c) 2013 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <dm/device.h>
+#include <dm/devres.h>
+#include <linux/bug.h>
+#include <linux/compat.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/slab.h>
 
 static u8 clk_composite_get_parent(struct clk_hw *hw)
 {
 	struct clk_composite *composite = to_clk_composite(hw);
@@ -233,9 +236,9 @@ static void clk_composite_disable(struct clk_hw *hw)
 
 	gate_ops->disable(gate_hw);
 }
 
-static struct clk_hw *__clk_hw_register_composite(struct device *dev,
+static struct clk_hw *__clk_hw_register_composite(struct udevice *dev,
 			const char *name, const char * const *parent_names,
 			const struct clk_parent_data *pdata, int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
@@ -350,9 +353,9 @@ err:
 	kfree(composite);
 	return hw;
 }
 
-struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
+struct clk_hw *clk_hw_register_composite(struct udevice *dev, const char *name,
 			const char * const *parent_names, int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
@@ -364,9 +367,9 @@ struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
 					   gate_ops, flags);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_composite);
 
-struct clk_hw *clk_hw_register_composite_pdata(struct device *dev,
+struct clk_hw *clk_hw_register_composite_pdata(struct udevice *dev,
 			const char *name,
 			const struct clk_parent_data *parent_data,
 			int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
@@ -379,9 +382,9 @@ struct clk_hw *clk_hw_register_composite_pdata(struct device *dev,
 					   rate_hw, rate_ops, gate_hw,
 					   gate_ops, flags);
 }
 
-struct clk *clk_register_composite(struct device *dev, const char *name,
+struct clk *clk_register_composite(struct udevice *dev, const char *name,
 			const char * const *parent_names, int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
@@ -397,9 +400,9 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
 	return hw->clk;
 }
 EXPORT_SYMBOL_GPL(clk_register_composite);
 
-struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
+struct clk *clk_register_composite_pdata(struct udevice *dev, const char *name,
 			const struct clk_parent_data *parent_data,
 			int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
@@ -441,14 +444,14 @@ void clk_hw_unregister_composite(struct clk_hw *hw)
 	kfree(composite);
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_composite);
 
-static void devm_clk_hw_release_composite(struct device *dev, void *res)
+static void devm_clk_hw_release_composite(struct udevice *dev, void *res)
 {
 	clk_hw_unregister_composite(*(struct clk_hw **)res);
 }
 
-static struct clk_hw *__devm_clk_hw_register_composite(struct device *dev,
+static struct clk_hw *__devm_clk_hw_register_composite(struct udevice *dev,
 			const char *name, const char * const *parent_names,
 			const struct clk_parent_data *pdata, int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
@@ -475,9 +478,9 @@ static struct clk_hw *__devm_clk_hw_register_composite(struct device *dev,
 
 	return hw;
 }
 
-struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
+struct clk_hw *devm_clk_hw_register_composite_pdata(struct udevice *dev,
 			const char *name,
 			const struct clk_parent_data *parent_data,
 			int num_parents,
 			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
diff --git a/drivers/clk/ccf/clk-divider.c b/drivers/clk/ccf/clk-divider.c
index 2601b6155afb..111b025fbd45 100644
--- a/drivers/clk/ccf/clk-divider.c
+++ b/drivers/clk/ccf/clk-divider.c
@@ -6,12 +6,15 @@
  *
  * Adjustable divider clock implementation
  */
 
+#include <dm/device.h>
+#include <div64.h>
+#include <linux/bug.h>
 #include <linux/clk-provider.h>
+#include <dm/devres.h>
 #include <linux/device.h>
-#include <linux/module.h>
-#include <linux/slab.h>
+#include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/string.h>
 #include <linux/log2.h>
@@ -27,20 +30,18 @@
  */
 
 static inline u32 clk_div_readl(struct clk_divider *divider)
 {
-	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
-		return ioread32be(divider->reg);
-
+#if CONFIG_IS_ENABLED(SANDBOX)
+	return *(u32 *)divider->reg;
+#else
 	return readl(divider->reg);
+#endif
 }
 
 static inline void clk_div_writel(struct clk_divider *divider, u32 val)
 {
-	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
-		iowrite32be(val, divider->reg);
-	else
-		writel(val, divider->reg);
+	writel(val, divider->reg);
 }
 
 static unsigned int _get_table_maxdiv(const struct clk_div_table *table,
 				      u8 width)
@@ -473,21 +474,15 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 	int value;
-	unsigned long flags = 0;
 	u32 val;
 
 	value = divider_get_val(rate, parent_rate, divider->table,
 				divider->width, divider->flags);
 	if (value < 0)
 		return value;
 
-	if (divider->lock)
-		spin_lock_irqsave(divider->lock, flags);
-	else
-		__acquire(divider->lock);
-
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = clk_div_mask(divider->width) << (divider->shift + 16);
 	} else {
 		val = clk_div_readl(divider);
@@ -495,13 +490,8 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	}
 	val |= (u32)value << divider->shift;
 	clk_div_writel(divider, val);
 
-	if (divider->lock)
-		spin_unlock_irqrestore(divider->lock, flags);
-	else
-		__release(divider->lock);
-
 	return 0;
 }
 
 const struct clk_ops clk_divider_ops = {
@@ -516,10 +506,10 @@ const struct clk_ops clk_divider_ro_ops = {
 	.determine_rate = clk_divider_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_divider_ro_ops);
 
-struct clk_hw *__clk_hw_register_divider(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__clk_hw_register_divider(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		unsigned long clk_divider_flags,
@@ -560,9 +550,8 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
 	div->reg = reg;
 	div->shift = shift;
 	div->width = width;
 	div->flags = clk_divider_flags;
-	div->lock = lock;
 	div->hw.init = &init;
 	div->table = table;
 
 	/* register the clock */
@@ -590,17 +579,17 @@ EXPORT_SYMBOL_GPL(__clk_hw_register_divider);
  * @clk_divider_flags: divider-specific flags for this clock
  * @table: array of divider/value pairs ending with a div set to 0
  * @lock: shared register lock for this clock
  */
-struct clk *clk_register_divider_table(struct device *dev, const char *name,
+struct clk *clk_register_divider_table(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		unsigned long clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock)
 {
 	struct clk_hw *hw;
 
-	hw =  __clk_hw_register_divider(dev, NULL, name, parent_name, NULL,
+	hw =  __clk_hw_register_divider(dev, dev_ofnode(dev), name, parent_name, NULL,
 			NULL, flags, reg, shift, width, clk_divider_flags,
 			table, lock);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
@@ -638,15 +627,15 @@ void clk_hw_unregister_divider(struct clk_hw *hw)
 	kfree(div);
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_divider);
 
-static void devm_clk_hw_release_divider(struct device *dev, void *res)
+static void devm_clk_hw_release_divider(struct udevice *dev, void *res)
 {
 	clk_hw_unregister_divider(*(struct clk_hw **)res);
 }
 
-struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__devm_clk_hw_register_divider(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		unsigned long clk_divider_flags,
diff --git a/drivers/clk/ccf/clk-fixed-factor.c b/drivers/clk/ccf/clk-fixed-factor.c
index de658c9e4c53..14ddeea348e7 100644
--- a/drivers/clk/ccf/clk-fixed-factor.c
+++ b/drivers/clk/ccf/clk-fixed-factor.c
@@ -1,14 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
  */
-#include <linux/module.h>
+
+#include <dm/ofnode.h>
+#include <dm/device.h>
+#include <dm/device-internal.h>
+#include <dm/devres.h>
+#include <div64.h>
+#include <linux/compat.h>
 #include <linux/clk-provider.h>
-#include <linux/slab.h>
 #include <linux/err.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
+
+#include "clk.h"
 
 /*
  * DOC: basic fixed multiplier and divider clock that cannot gate
  *
@@ -77,9 +82,9 @@ const struct clk_ops clk_fixed_factor_ops = {
 	.recalc_accuracy = clk_factor_recalc_accuracy,
 };
 EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
-static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
+static void devm_clk_hw_register_fixed_factor_release(struct udevice *dev, void *res)
 {
 	struct clk_fixed_factor *fix = res;
 
 	/*
@@ -90,9 +95,9 @@ static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *
 	clk_hw_unregister(&fix->hw);
 }
 
 static struct clk_hw *
-__clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
+__clk_hw_register_fixed_factor(struct udevice *dev, ofnode np,
 		const char *name, const char *parent_name,
 		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
 		unsigned long flags, unsigned int mult, unsigned int div,
 		unsigned long acc, unsigned int fixflags, bool devm)
@@ -161,15 +166,15 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
  *
  * Return: Pointer to fixed factor clk_hw structure that was registered or
  * an error pointer.
  */
-struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
+struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct udevice *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = index };
 
-	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL, &pdata,
+	return __clk_hw_register_fixed_factor(dev, dev_ofnode(dev), name, NULL, NULL, &pdata,
 					      flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
 
@@ -185,43 +190,43 @@ EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
  *
  * Return: Pointer to fixed factor clk_hw structure that was registered or
  * an error pointer.
  */
-struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct udevice *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = -1 };
 
-	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
+	return __clk_hw_register_fixed_factor(dev, dev_ofnode(dev), name, NULL, parent_hw,
 					      &pdata, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
 
-struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct udevice *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = -1 };
 
-	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
+	return __clk_hw_register_fixed_factor(dev, dev_ofnode(dev), name, NULL, parent_hw,
 					      &pdata, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
 
-struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
+struct clk_hw *clk_hw_register_fixed_factor(struct udevice *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = -1 };
 
-	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
+	return __clk_hw_register_fixed_factor(dev, dev_ofnode(dev), name, parent_name, NULL,
 					      &pdata, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
-struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *clk_hw_register_fixed_factor_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
 
@@ -229,10 +234,10 @@ struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
 			&pdata, flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_fwname);
 
-struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div,
 		unsigned long acc)
 {
 	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
@@ -242,20 +247,20 @@ struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *
 			CLK_FIXED_FACTOR_FIXED_ACCURACY, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_with_accuracy_fwname);
 
-struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
+struct clk_hw *clk_hw_register_fixed_factor_index(struct udevice *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = index };
 
-	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL, &pdata,
+	return __clk_hw_register_fixed_factor(dev, dev_ofnode(dev), name, NULL, NULL, &pdata,
 					      flags, mult, div, 0, 0, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_index);
 
-struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
+struct clk *clk_register_fixed_factor(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
 	struct clk_hw *hw;
@@ -291,21 +296,21 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
 	kfree(fix);
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct udevice *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = -1 };
 
-	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
+	return __clk_hw_register_fixed_factor(dev, dev_ofnode(dev), name, parent_name, NULL,
 			&pdata, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div)
 {
 	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
 
@@ -313,10 +318,10 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
 			&pdata, flags, mult, div, 0, 0, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_fwname);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div,
 		unsigned long acc)
 {
 	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
@@ -325,40 +330,40 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct dev
 			&pdata, flags, mult, div, acc,
 			CLK_FIXED_FACTOR_FIXED_ACCURACY, true);
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_with_accuracy_fwname);
-
-#ifdef CONFIG_OF
-static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
+static struct clk_hw *_of_fixed_factor_clk_setup(struct udevice *dev)
 {
 	struct clk_hw *hw;
-	const char *clk_name = node->name;
+	const char *clk_name;
+	ofnode node = dev_ofnode(dev);
 	const struct clk_parent_data pdata = { .index = 0 };
 	u32 div, mult;
 	int ret;
 
-	if (of_property_read_u32(node, "clock-div", &div)) {
+	if (ofnode_read_u32(node, "clock-div", &div)) {
 		pr_err("%s Fixed factor clock <%pOFn> must have a clock-div property\n",
-			__func__, node);
+			__func__, &node);
 		return ERR_PTR(-EIO);
 	}
 
-	if (of_property_read_u32(node, "clock-mult", &mult)) {
+	if (ofnode_read_u32(node, "clock-mult", &mult)) {
 		pr_err("%s Fixed factor clock <%pOFn> must have a clock-mult property\n",
-			__func__, node);
+			__func__, &node);
 		return ERR_PTR(-EIO);
 	}
 
-	of_property_read_string(node, "clock-output-names", &clk_name);
+	clk_name = ofnode_read_string(node, "clock-output-names");
+	if (!clk_name)
+		clk_name = ofnode_get_name(node);
 
-	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, NULL,
+	hw = __clk_hw_register_fixed_factor(dev, node, clk_name, NULL, NULL,
 					    &pdata, 0, mult, div, 0, 0, false);
 	if (IS_ERR(hw)) {
 		/*
 		 * Clear OF_POPULATED flag so that clock registration can be
 		 * attempted again from probe function.
 		 */
-		of_node_clear_flag(node, OF_POPULATED);
 		return ERR_CAST(hw);
 	}
 
 	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
@@ -369,56 +374,36 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 
 	return hw;
 }
 
-/**
- * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
- * @node:	device node for the clock
- */
-void __init of_fixed_factor_clk_setup(struct device_node *node)
-{
-	_of_fixed_factor_clk_setup(node);
-}
-CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
-		of_fixed_factor_clk_setup);
-
-static void of_fixed_factor_clk_remove(struct platform_device *pdev)
-{
-	struct clk_hw *clk = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(pdev->dev.of_node);
-	clk_hw_unregister_fixed_factor(clk);
-}
-
-static int of_fixed_factor_clk_probe(struct platform_device *pdev)
+static int of_fixed_factor_clk_probe(struct udevice *dev)
 {
 	struct clk_hw *clk;
 
 	/*
 	 * This function is not executed when of_fixed_factor_clk_setup
 	 * succeeded.
 	 */
-	clk = _of_fixed_factor_clk_setup(pdev->dev.of_node);
-	if (IS_ERR(clk))
+	clk = _of_fixed_factor_clk_setup(dev);
+	if (IS_ERR(clk)) {
+		printf("%s: %s: err %ld\n", __func__, dev->name, PTR_ERR(clk));
 		return PTR_ERR(clk);
+	}
 
-	platform_set_drvdata(pdev, clk);
+	dev_set_priv(dev, clk);
 
 	return 0;
 }
 
-static const struct of_device_id of_fixed_factor_clk_ids[] = {
-	{ .compatible = "fixed-factor-clock" },
+static const struct udevice_id clk_fixed_factor_match_table[] = {
+	{
+		.compatible = "fixed-factor-clock",
+	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, of_fixed_factor_clk_ids);
 
-static struct platform_driver of_fixed_factor_clk_driver = {
-	.driver = {
-		.name = "of_fixed_factor_clk",
-		.of_match_table = of_fixed_factor_clk_ids,
-	},
+U_BOOT_DRIVER(clk_fixed_factor) = {
+	.name	= "clk-fixed-factor",
+	.id	= UCLASS_NOP,
 	.probe = of_fixed_factor_clk_probe,
-	.remove = of_fixed_factor_clk_remove,
+	.of_match = clk_fixed_factor_match_table,
 };
-builtin_platform_driver(of_fixed_factor_clk_driver);
-#endif
diff --git a/drivers/clk/ccf/clk-fixed-rate.c b/drivers/clk/ccf/clk-fixed-rate.c
index 6b4f76b9c4da..da1f3d22e1ca 100644
--- a/drivers/clk/ccf/clk-fixed-rate.c
+++ b/drivers/clk/ccf/clk-fixed-rate.c
@@ -6,14 +6,16 @@
  * Fixed rate clock implementation
  */
 
 #include <linux/clk-provider.h>
-#include <linux/module.h>
-#include <linux/slab.h>
+#include <dm.h>
+#include <dm/devres.h>
+#include <log.h>
+#include <dm/device-internal.h>
 #include <linux/io.h>
 #include <linux/err.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
+
+#include "clk.h"
 
 /*
  * DOC: basic fixed-rate clock that cannot gate
  *
@@ -48,9 +50,9 @@ const struct clk_ops clk_fixed_rate_ops = {
 	.recalc_accuracy = clk_fixed_rate_recalc_accuracy,
 };
 EXPORT_SYMBOL_GPL(clk_fixed_rate_ops);
 
-static void devm_clk_hw_register_fixed_rate_release(struct device *dev, void *res)
+static void devm_clk_hw_register_fixed_rate_release(struct udevice *dev, void *res)
 {
 	struct clk_fixed_rate *fix = res;
 
 	/*
@@ -60,10 +62,10 @@ static void devm_clk_hw_register_fixed_rate_release(struct device *dev, void *re
 	 */
 	clk_hw_unregister(&fix->hw);
 }
 
-struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__clk_hw_register_fixed_rate(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		unsigned long fixed_rate, unsigned long fixed_accuracy,
 		unsigned long clk_fixed_flags, bool devm)
@@ -100,9 +102,9 @@ struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 	fixed->hw.init = &init;
 
 	/* register the clock */
 	hw = &fixed->hw;
-	if (dev || !np)
+	if (dev || !ofnode_valid(np))
 		ret = clk_hw_register(dev, hw);
 	else
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
@@ -117,9 +119,9 @@ struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_rate);
 
-struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
+struct clk *clk_register_fixed_rate(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned long fixed_rate)
 {
 	struct clk_hw *hw;
@@ -155,25 +157,27 @@ void clk_hw_unregister_fixed_rate(struct clk_hw *hw)
 	kfree(fixed);
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_rate);
 
-#ifdef CONFIG_OF
-static struct clk_hw *_of_fixed_clk_setup(struct device_node *node)
+static struct clk_hw *_of_fixed_clk_setup(struct udevice *dev)
 {
 	struct clk_hw *hw;
-	const char *clk_name = node->name;
+	ofnode node = dev_ofnode(dev);
+	const char *clk_name;
 	u32 rate;
 	u32 accuracy = 0;
 	int ret;
 
-	if (of_property_read_u32(node, "clock-frequency", &rate))
+	if (ofnode_read_u32(node, "clock-frequency", &rate))
 		return ERR_PTR(-EIO);
 
-	of_property_read_u32(node, "clock-accuracy", &accuracy);
+	ofnode_read_u32(node, "clock-accuracy", &accuracy);
 
-	of_property_read_string(node, "clock-output-names", &clk_name);
+	clk_name = ofnode_read_string(node, "clock-output-names");
+	if (!clk_name)
+		clk_name = ofnode_get_name(node);
 
-	hw = clk_hw_register_fixed_rate_with_accuracy(NULL, clk_name, NULL,
+	hw = clk_hw_register_fixed_rate_with_accuracy(dev, clk_name, NULL,
 						    0, rate, accuracy);
 	if (IS_ERR(hw))
 		return hw;
 
@@ -185,54 +189,29 @@ static struct clk_hw *_of_fixed_clk_setup(struct device_node *node)
 
 	return hw;
 }
 
-/**
- * of_fixed_clk_setup() - Setup function for simple fixed rate clock
- * @node:	device node for the clock
- */
-void __init of_fixed_clk_setup(struct device_node *node)
+static int clk_fixed_rate_probe(struct udevice *dev)
 {
-	_of_fixed_clk_setup(node);
-}
-CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
+	struct clk_hw *hw = _of_fixed_clk_setup(dev);
 
-static void of_fixed_clk_remove(struct platform_device *pdev)
-{
-	struct clk_hw *hw = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(pdev->dev.of_node);
-	clk_hw_unregister_fixed_rate(hw);
-}
-
-static int of_fixed_clk_probe(struct platform_device *pdev)
-{
-	struct clk_hw *hw;
-
-	/*
-	 * This function is not executed when of_fixed_clk_setup
-	 * succeeded.
-	 */
-	hw = _of_fixed_clk_setup(pdev->dev.of_node);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
-
-	platform_set_drvdata(pdev, hw);
+	if (!IS_ERR_OR_NULL(hw))
+		dev_set_priv(dev, hw);
 
 	return 0;
 }
 
-static const struct of_device_id of_fixed_clk_ids[] = {
-	{ .compatible = "fixed-clock" },
-	{ }
+static const struct udevice_id clk_fixed_rate_match[] = {
+	{
+		.compatible = "fixed-clock",
+	},
+	{ /* sentinel */ }
 };
 
-static struct platform_driver of_fixed_clk_driver = {
-	.driver = {
-		.name = "of_fixed_clk",
-		.of_match_table = of_fixed_clk_ids,
-	},
-	.probe = of_fixed_clk_probe,
-	.remove = of_fixed_clk_remove,
+U_BOOT_DRIVER(fixed_clock) = {
+	.name = "fixed_clock",
+	.id = UCLASS_NOP,
+	.of_match = clk_fixed_rate_match,
+	.probe = clk_fixed_rate_probe,
+	.plat_auto	= sizeof(struct clk_fixed_rate),
+	.flags = DM_FLAG_PRE_RELOC,
 };
-builtin_platform_driver(of_fixed_clk_driver);
-#endif
diff --git a/drivers/clk/ccf/clk-gate.c b/drivers/clk/ccf/clk-gate.c
index 4746f8219132..ec4bc6ca4724 100644
--- a/drivers/clk/ccf/clk-gate.c
+++ b/drivers/clk/ccf/clk-gate.c
@@ -5,12 +5,11 @@
  *
  * Gated clock implementation
  */
 
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/slab.h>
+#include <linux/compat.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/string.h>
 
@@ -25,20 +24,22 @@
  */
 
 static inline u32 clk_gate_readl(struct clk_gate *gate)
 {
-	if (gate->flags & CLK_GATE_BIG_ENDIAN)
-		return ioread32be(gate->reg);
-
+#if CONFIG_IS_ENABLED(SANDBOX)
+	return *(u32 *)gate->reg;
+#else
 	return readl(gate->reg);
+#endif
 }
 
 static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
 {
-	if (gate->flags & CLK_GATE_BIG_ENDIAN)
-		iowrite32be(val, gate->reg);
-	else
-		writel(val, gate->reg);
+#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
+	*(u32 *)gate->reg = val;
+#else
+	writel(val, gate->reg);
+#endif
 }
 
 /*
  * It works on following logic:
@@ -123,10 +124,10 @@ const struct clk_ops clk_gate_ops = {
 	.is_enabled = clk_gate_is_enabled,
 };
 EXPORT_SYMBOL_GPL(clk_gate_ops);
 
-struct clk_hw *__clk_hw_register_gate(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__clk_hw_register_gate(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags,
 		void __iomem *reg, u8 bit_idx,
@@ -167,11 +168,11 @@ struct clk_hw *__clk_hw_register_gate(struct device *dev,
 	gate->lock = lock;
 	gate->hw.init = &init;
 
 	hw = &gate->hw;
-	if (dev || !np)
+	if (dev || !ofnode_valid(np))
 		ret = clk_hw_register(dev, hw);
-	else if (np)
+	else if (ofnode_valid(np))
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
 		kfree(gate);
 		hw = ERR_PTR(ret);
@@ -181,17 +182,17 @@ struct clk_hw *__clk_hw_register_gate(struct device *dev,
 
 }
 EXPORT_SYMBOL_GPL(__clk_hw_register_gate);
 
-struct clk *clk_register_gate(struct device *dev, const char *name,
+struct clk *clk_register_gate(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 bit_idx,
 		u8 clk_gate_flags, spinlock_t *lock)
 {
 	struct clk_hw *hw;
 
 	hw = clk_hw_register_gate(dev, name, parent_name, flags, reg,
-				  bit_idx, clk_gate_flags, lock);
+				  bit_idx, clk_gate_flags);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 	return hw->clk;
 }
@@ -223,15 +224,15 @@ void clk_hw_unregister_gate(struct clk_hw *hw)
 	kfree(gate);
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_gate);
 
-static void devm_clk_hw_release_gate(struct device *dev, void *res)
+static void devm_clk_hw_release_gate(struct udevice *dev, void *res)
 {
 	clk_hw_unregister_gate(*(struct clk_hw **)res);
 }
 
-struct clk_hw *__devm_clk_hw_register_gate(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__devm_clk_hw_register_gate(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags,
 		void __iomem *reg, u8 bit_idx,
diff --git a/drivers/clk/ccf/clk-mux.c b/drivers/clk/ccf/clk-mux.c
index fa817c317c2a..2d84d389a3a1 100644
--- a/drivers/clk/ccf/clk-mux.c
+++ b/drivers/clk/ccf/clk-mux.c
@@ -6,12 +6,11 @@
  *
  * Simple multiplexer clock implementation
  */
 
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/slab.h>
+#include <linux/compat.h>
 #include <linux/io.h>
 #include <linux/err.h>
 
 /*
@@ -25,20 +24,18 @@
  */
 
 static inline u32 clk_mux_readl(struct clk_mux *mux)
 {
-	if (mux->flags & CLK_MUX_BIG_ENDIAN)
-		return ioread32be(mux->reg);
-
+#if CONFIG_IS_ENABLED(SANDBOX)
+	return *(u32 *)mux->reg;
+#else
 	return readl(mux->reg);
+#endif
 }
 
 static inline void clk_mux_writel(struct clk_mux *mux, u32 val)
 {
-	if (mux->flags & CLK_MUX_BIG_ENDIAN)
-		iowrite32be(val, mux->reg);
-	else
-		writel(val, mux->reg);
+	writel(val, mux->reg);
 }
 
 int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
 			 unsigned int val)
@@ -145,9 +142,9 @@ const struct clk_ops clk_mux_ro_ops = {
 	.get_parent = clk_mux_get_parent,
 };
 EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
 
-struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
+struct clk_hw *__clk_hw_register_mux(struct udevice *dev, ofnode np,
 		const char *name, u8 num_parents,
 		const char * const *parent_names,
 		const struct clk_hw **parent_hws,
 		const struct clk_parent_data *parent_data,
@@ -193,11 +190,11 @@ struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
 	mux->table = table;
 	mux->hw.init = &init;
 
 	hw = &mux->hw;
-	if (dev || !np)
+	if (dev || !ofnode_valid(np))
 		ret = clk_hw_register(dev, hw);
-	else if (np)
+	else if (ofnode_valid(np))
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
 		kfree(mux);
 		hw = ERR_PTR(ret);
@@ -206,14 +203,14 @@ struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
 
-static void devm_clk_hw_release_mux(struct device *dev, void *res)
+static void devm_clk_hw_release_mux(struct udevice *dev, void *res)
 {
 	clk_hw_unregister_mux(*(struct clk_hw **)res);
 }
 
-struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+struct clk_hw *__devm_clk_hw_register_mux(struct udevice *dev, ofnode np,
 		const char *name, u8 num_parents,
 		const char * const *parent_names,
 		const struct clk_hw **parent_hws,
 		const struct clk_parent_data *parent_data,
@@ -240,18 +237,18 @@ struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node
 	return hw;
 }
 EXPORT_SYMBOL_GPL(__devm_clk_hw_register_mux);
 
-struct clk *clk_register_mux_table(struct device *dev, const char *name,
+struct clk *clk_register_mux_table(struct udevice *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, const u32 *table, spinlock_t *lock)
 {
 	struct clk_hw *hw;
 
 	hw = clk_hw_register_mux_table(dev, name, parent_names,
 				       num_parents, flags, reg, shift, mask,
-				       clk_mux_flags, table, lock);
+				       clk_mux_flags, table);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 	return hw->clk;
 }

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
