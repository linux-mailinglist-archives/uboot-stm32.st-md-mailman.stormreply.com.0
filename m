Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ8vLsUXwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D22F0402
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53188C8F28E;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D8D1C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:11 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-439b611274bso607436f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953891; x=1774558691;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rH9VKQ+NPIFzTC/I359Kq6pydFHrM3SuyeA1OIwm26Q=;
 b=Hcx1cIr2u0h3p4aVx/fB8IBiy5/HHec/dgwik3cm80K9FquZlaEw2B/m40hPBMrhXb
 iY9xqWFoJYRH3hExjMoITiJrgHsWVAOZWj9iGpVpKYvqr70sedf6uVIUL/58UxmvZZGe
 k5MwVWBKOMyXZ5jeBt0WsYPXqwxl+/zWU/end9scqljBJ8gThKfU7whWSguabLIt+YaS
 53Ew/AVVmSpmE/2Fev23oXavZR6NE/4tJBGf+yrre3BU2ZzZ8LwRFkBjkwd7rHxIbCF4
 dqfL0wsrkGUF30GhnDFhP9RFu2cCXCaW19O7Vrag2xxysyH1mQx1oCzju/wTA+FVIEPC
 k17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953891; x=1774558691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rH9VKQ+NPIFzTC/I359Kq6pydFHrM3SuyeA1OIwm26Q=;
 b=L0l4AoyiHzh0pqVfSVA9i2fRCXQo/g38m7cvFYJ62mHMS/lChnMxpQJYNNF5PbZqzq
 BMs0MLcWN6t0R7nKETaK3jyg5kPJZM+W0g7kTY9NCey2IpQcNxXRNEgA/K9YcBozm0y7
 RD5U+fS2xBkCfvzE00gx3VzniZEsiClpxDDB4tbKe7QdxPCf6HMiyndOR5GKgIwhRm8r
 y2z1qQo8sQS0CiK6maRCdFhxjk9fj6WjdNqxIoPCcOCnirK1Znr+MDuyJH6FPFln/33e
 BImgyBKkxf8YACLb2rncMKXHpL8Uc0HLaKR++HWIMAAgRtRPiqf9RZzOYTOoohPS1D5J
 wdAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2HJ74GZDbEpURxqU/w5vhfWo906BxsrO15gQ+NKAUhqJPLJ4cmJr7MW4Ek82Y/1cr3JZQzNJyMDHigw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzt0lmmmAfAUgcAORvI2ZYBbKOPID9mkjAw92Q52GGcpkHjPpZ4
 eYqdAt8EuoM6eBJjKOAUzev3M+ReNbMr3ArOcLPSGiDoDUR73tjapPpglqmKpOraCUA=
X-Gm-Gg: ATEYQzzLvADTtjAO1CsaQBzb0XvT3jdJSzs5T8BJYe/2iy98igU/HVcGsPGM7jwbLCy
 ktm2aYDJjwDGBuukhg8qMn7uFVmw++GnPu4/ETf0HZFIDDO/e79c8V7ECPyfocaAO24HrvlpY98
 +iggv3M3sMZCk401jaJhNy1giilPR4igAUrsIuMO79U4PKtwSalQyQfyAlQZqOolm7tl+jwF2bE
 0fZ3OUZaQX29Uv/tEru7jiiErKDIJxz2N9t/8fvVBbhxCOuhDbzwp2RmI5KzBcp1A9u+g3ZS0oz
 LwhxYGs9Fg67VJXz7yLZro9yublABevVIr4Ldl/3eklxC/r6v5SlNzfvvt+YxOpdKxx6IIWJhen
 Tyfu4OpvNH2nzXWKrU789aGKK9BuIF4rGm+UAJog86aMaOdo2J3rZvel4qSV6nPqlTN5SfGa+ah
 Vsr+2EiXYjN4BFvAPnVDAmby3Qh4anW0jnLDFyLISBOZJ30F/DKkbUsdrNC12ngWTCDok=
X-Received: by 2002:a05:6000:2c0e:b0:439:c279:32df with SMTP id
 ffacd0b85a97d-43b6427feadmr1337111f8f.35.1773953890111; 
 Thu, 19 Mar 2026 13:58:10 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:09 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:41 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-19-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=90169;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=6LzN/x8Bf2LAkbO0CsquYHaViKfL932mlBHec9pQLdY=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yfzNb/s32BytEpSUONGe5XdC9O7tmekiCplXjG6du
 /P8k3JkRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjI+40M/5T2VYacZTXruhrS
 vVc64HXVzhNPtP+9+d0Qse8i7/OstW0M/8N+85xl3f340FOFEyzlevp8N95WbP57PEvyr4Abl/8
 O+z4A
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
Subject: [Uboot-stm32] [PATCH RFC 19/40] clk: make clk_set_rate() return
	signed long
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 936D22F0402
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The docs for clk_set_rate() indicate that it can return an error and
this is desirable for clock drivers to do, the ulong return type however
implies that this can't happen.

Fix the return type and adapt all clock drivers. Consumers can now more
easily handle error conditions.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/adi/clk-shared.c             |  2 +-
 drivers/clk/airoha/clk-airoha.c          |  2 +-
 drivers/clk/aspeed/clk_ast2500.c         |  2 +-
 drivers/clk/aspeed/clk_ast2600.c         |  2 +-
 drivers/clk/at91/clk-generic.c           |  2 +-
 drivers/clk/at91/clk-master.c            |  2 +-
 drivers/clk/at91/clk-peripheral.c        |  2 +-
 drivers/clk/at91/clk-programmable.c      |  2 +-
 drivers/clk/at91/clk-sam9x60-pll.c       |  4 ++--
 drivers/clk/at91/clk-sam9x60-usb.c       |  2 +-
 drivers/clk/at91/compat.c                |  8 ++++----
 drivers/clk/clk-cdce9xx.c                |  2 +-
 drivers/clk/clk-hsdk-cgu.c               |  2 +-
 drivers/clk/clk-stub.c                   |  2 +-
 drivers/clk/clk-uclass.c                 |  2 +-
 drivers/clk/clk-xlnx-clock-wizard.c      |  2 +-
 drivers/clk/clk_k210.c                   |  6 +++---
 drivers/clk/clk_pic32.c                  |  2 +-
 drivers/clk/clk_sandbox.c                |  2 +-
 drivers/clk/clk_sandbox_test.c           |  2 +-
 drivers/clk/clk_scmi.c                   |  4 ++--
 drivers/clk/clk_versaclock.c             |  8 ++++----
 drivers/clk/clk_versal.c                 |  2 +-
 drivers/clk/clk_vexpress_osc.c           |  2 +-
 drivers/clk/clk_zynq.c                   |  6 +++---
 drivers/clk/clk_zynqmp.c                 |  4 ++--
 drivers/clk/ics8n3qv01.c                 |  2 +-
 drivers/clk/imx/clk-composite-8m.c       |  2 +-
 drivers/clk/imx/clk-fracn-gppll.c        |  2 +-
 drivers/clk/imx/clk-gate-93.c            |  2 +-
 drivers/clk/imx/clk-gate2.c              |  2 +-
 drivers/clk/imx/clk-imx8.c               |  2 +-
 drivers/clk/imx/clk-imx8.h               |  2 +-
 drivers/clk/imx/clk-imx8qm.c             |  2 +-
 drivers/clk/imx/clk-imx8qxp.c            |  2 +-
 drivers/clk/imx/clk-imxrt1170.c          |  2 +-
 drivers/clk/imx/clk-pfd.c                |  2 +-
 drivers/clk/imx/clk-pll14xx.c            |  4 ++--
 drivers/clk/imx/clk-pllv3.c              |  8 ++++----
 drivers/clk/mediatek/clk-mtk.c           |  2 +-
 drivers/clk/meson/a1.c                   |  6 +++---
 drivers/clk/meson/g12a.c                 |  8 ++++----
 drivers/clk/meson/gxbb.c                 |  6 +++---
 drivers/clk/microchip/mpfs_clk_cfg.c     |  2 +-
 drivers/clk/mvebu/armada-37xx-periph.c   |  2 +-
 drivers/clk/nuvoton/clk_npcm.c           |  2 +-
 drivers/clk/owl/clk_owl.c                |  4 ++--
 drivers/clk/qcom/clock-apq8016.c         |  2 +-
 drivers/clk/qcom/clock-apq8096.c         |  2 +-
 drivers/clk/qcom/clock-ipq4019.c         |  2 +-
 drivers/clk/qcom/clock-ipq5424.c         |  2 +-
 drivers/clk/qcom/clock-ipq9574.c         |  2 +-
 drivers/clk/qcom/clock-qcm2290.c         |  2 +-
 drivers/clk/qcom/clock-qcom.c            |  2 +-
 drivers/clk/qcom/clock-qcom.h            |  2 +-
 drivers/clk/qcom/clock-qcs404.c          |  2 +-
 drivers/clk/qcom/clock-qcs615.c          |  2 +-
 drivers/clk/qcom/clock-qcs8300.c         |  2 +-
 drivers/clk/qcom/clock-sa8775p.c         |  2 +-
 drivers/clk/qcom/clock-sc7280.c          |  2 +-
 drivers/clk/qcom/clock-sdm845.c          |  4 ++--
 drivers/clk/qcom/clock-sm6115.c          |  2 +-
 drivers/clk/qcom/clock-sm6350.c          |  2 +-
 drivers/clk/qcom/clock-sm7150.c          |  2 +-
 drivers/clk/qcom/clock-sm8150.c          |  2 +-
 drivers/clk/qcom/clock-sm8250.c          |  2 +-
 drivers/clk/qcom/clock-sm8550.c          |  2 +-
 drivers/clk/qcom/clock-sm8650.c          |  2 +-
 drivers/clk/qcom/clock-x1e80100.c        |  2 +-
 drivers/clk/renesas/clk-rcar-gen2.c      |  2 +-
 drivers/clk/renesas/clk-rcar-gen3.c      |  2 +-
 drivers/clk/renesas/compound-clock.c     |  2 +-
 drivers/clk/renesas/r9a06g032-clocks.c   |  4 ++--
 drivers/clk/renesas/rzg2l-cpg.c          |  6 +++---
 drivers/clk/rockchip/clk_px30.c          |  8 ++++----
 drivers/clk/rockchip/clk_rk3036.c        |  2 +-
 drivers/clk/rockchip/clk_rk3066.c        |  2 +-
 drivers/clk/rockchip/clk_rk3128.c        |  2 +-
 drivers/clk/rockchip/clk_rk3188.c        |  2 +-
 drivers/clk/rockchip/clk_rk322x.c        |  2 +-
 drivers/clk/rockchip/clk_rk3288.c        |  2 +-
 drivers/clk/rockchip/clk_rk3308.c        |  2 +-
 drivers/clk/rockchip/clk_rk3328.c        |  2 +-
 drivers/clk/rockchip/clk_rk3368.c        |  2 +-
 drivers/clk/rockchip/clk_rk3399.c        |  4 ++--
 drivers/clk/rockchip/clk_rk3528.c        |  8 ++++----
 drivers/clk/rockchip/clk_rk3568.c        | 10 +++++-----
 drivers/clk/rockchip/clk_rk3576.c        |  6 +++---
 drivers/clk/rockchip/clk_rk3588.c        |  8 ++++----
 drivers/clk/rockchip/clk_rv1108.c        |  2 +-
 drivers/clk/rockchip/clk_rv1126.c        |  8 ++++----
 drivers/clk/sifive/sifive-prci.c         |  2 +-
 drivers/clk/sophgo/clk-cv1800b.c         |  2 +-
 drivers/clk/sophgo/clk-ip.c              | 12 ++++++------
 drivers/clk/sophgo/clk-pll.c             |  4 ++--
 drivers/clk/starfive/clk-jh7110-pll.c    |  2 +-
 drivers/clk/stm32/clk-stm32-core.c       |  2 +-
 drivers/clk/stm32/clk-stm32f.c           |  2 +-
 drivers/clk/stm32/clk-stm32mp1.c         |  2 +-
 drivers/clk/tegra/tegra-car-clk.c        |  2 +-
 drivers/clk/tegra/tegra186-clk.c         |  2 +-
 drivers/clk/thead/clk-th1520-ap.c        |  2 +-
 drivers/clk/ti/clk-am3-dpll.c            |  2 +-
 drivers/clk/ti/clk-divider.c             |  2 +-
 drivers/clk/ti/clk-k3-pll.c              |  2 +-
 drivers/clk/ti/clk-k3.c                  |  2 +-
 drivers/clk/ti/clk-mux.c                 |  2 +-
 drivers/clk/ti/clk-sci.c                 |  2 +-
 drivers/clk/uccf/clk-composite.c         |  2 +-
 drivers/clk/uccf/clk-divider.c           |  2 +-
 drivers/clk/uccf/clk.c                   |  2 +-
 drivers/clk/uniphier/clk-uniphier-core.c |  4 ++--
 include/clk-uclass.h                     |  2 +-
 include/clk.h                            |  2 +-
 114 files changed, 169 insertions(+), 169 deletions(-)

diff --git a/drivers/clk/adi/clk-shared.c b/drivers/clk/adi/clk-shared.c
index 5d0b7eb34655..7376b9b5668d 100644
--- a/drivers/clk/adi/clk-shared.c
+++ b/drivers/clk/adi/clk-shared.c
@@ -20,9 +20,9 @@ static ulong adi_get_rate(struct clk *clk)
 
 	return clk_get_rate(c);
 }
 
-static ulong adi_set_rate(struct clk *clk, ulong rate)
+static long adi_set_rate(struct clk *clk, ulong rate)
 {
 	//Not yet implemented
 	return 0;
 }
diff --git a/drivers/clk/airoha/clk-airoha.c b/drivers/clk/airoha/clk-airoha.c
index 200324a4fffd..4e0ad1845021 100644
--- a/drivers/clk/airoha/clk-airoha.c
+++ b/drivers/clk/airoha/clk-airoha.c
@@ -399,9 +399,9 @@ static int airoha_clk_search_rate(const struct airoha_clk_desc *desc, int div,
 err:
 	return -EINVAL;
 }
 
-static ulong airoha_clk_set_rate(struct clk *clk, ulong rate)
+static long airoha_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct airoha_clk_priv *priv = dev_get_priv(clk->dev);
 	struct airoha_clk_soc_data *data = priv->data;
 	const struct airoha_clk_desc *desc;
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index 4d30ecb87d99..f284ae05503f 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -467,9 +467,9 @@ static ulong ast2500_enable_sdclk(struct ast2500_scu *scu)
 
 	return 0;
 }
 
-static ulong ast2500_clk_set_rate(struct clk *clk, ulong rate)
+static long ast2500_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct ast2500_clk_priv *priv = dev_get_priv(clk->dev);
 
 	ulong new_rate;
diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index b9bbe41a592f..c3e89a030be1 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -572,9 +572,9 @@ static uint32_t ast2600_configure_ddr(struct ast2600_scu *scu, ulong rate)
 
 	return ast2600_get_pll_rate(scu, ASPEED_CLK_MPLL);
 }
 
-static ulong ast2600_clk_set_rate(struct clk *clk, ulong rate)
+static long ast2600_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct ast2600_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong new_rate;
 
diff --git a/drivers/clk/at91/clk-generic.c b/drivers/clk/at91/clk-generic.c
index 0424fb1b6f4e..00b27612096f 100644
--- a/drivers/clk/at91/clk-generic.c
+++ b/drivers/clk/at91/clk-generic.c
@@ -83,9 +83,9 @@ static int clk_gck_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-static ulong clk_gck_set_rate(struct clk *clk, ulong rate)
+static long clk_gck_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_gck *gck = to_clk_gck(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	u32 div;
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 53652efc5740..feb7aea13bd8 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -267,9 +267,9 @@ static int clk_sama7g5_master_disable(struct clk *clk)
 
 	return 0;
 }
 
-static ulong clk_sama7g5_master_set_rate(struct clk *clk, ulong rate)
+static long clk_sama7g5_master_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_master *master = to_clk_master(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	ulong div, rrate;
diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index 8f0c7524e4cc..8c74b7015789 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -167,9 +167,9 @@ static ulong clk_sam9x5_peripheral_get_rate(struct clk *clk)
 
 	return parent_rate >> shift;
 }
 
-static ulong clk_sam9x5_peripheral_set_rate(struct clk *clk, ulong rate)
+static long clk_sam9x5_peripheral_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_sam9x5_peripheral *periph = to_clk_sam9x5_peripheral(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	int shift;
diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 9cf8e38af08c..ce4f63902c7d 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -83,9 +83,9 @@ static int clk_programmable_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-static ulong clk_programmable_set_rate(struct clk *clk, ulong rate)
+static long clk_programmable_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_programmable *prog = to_clk_programmable(clk);
 	const struct clk_programmable_layout *layout = prog->layout;
 	ulong parent_rate = clk_get_parent_rate(clk);
diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index b896be5fe238..cf56e2c86032 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -89,9 +89,9 @@ static long sam9x60_frac_pll_compute_mul_frac(const struct clk_range *core_clk,
 
 	return tmprate;
 }
 
-static ulong sam9x60_frac_pll_set_rate(struct clk *clk, ulong rate)
+static long sam9x60_frac_pll_set_rate(struct clk *clk, ulong rate)
 {
 	struct sam9x60_pll *pll = to_sam9x60_pll(clk);
 	void __iomem *base = pll->base;
 	ulong parent_rate = clk_get_parent_rate(clk);
@@ -299,9 +299,9 @@ static int sam9x60_div_pll_disable(struct clk *clk)
 
 	return 0;
 }
 
-static ulong sam9x60_div_pll_set_rate(struct clk *clk, ulong rate)
+static long sam9x60_div_pll_set_rate(struct clk *clk, ulong rate)
 {
 	struct sam9x60_pll *pll = to_sam9x60_pll(clk);
 	void __iomem *base = pll->base;
 	const struct clk_pll_characteristics *characteristics =
diff --git a/drivers/clk/at91/clk-sam9x60-usb.c b/drivers/clk/at91/clk-sam9x60-usb.c
index 92bfd45f5353..308548519c11 100644
--- a/drivers/clk/at91/clk-sam9x60-usb.c
+++ b/drivers/clk/at91/clk-sam9x60-usb.c
@@ -67,9 +67,9 @@ static ulong sam9x60_usb_clk_get_rate(struct clk *clk)
 		(ffs(usb->layout->usbdiv_mask) - 1);
 	return parent_rate / (usbdiv + 1);
 }
 
-static ulong sam9x60_usb_clk_set_rate(struct clk *clk, ulong rate)
+static long sam9x60_usb_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct sam9x60_usb *usb = to_sam9x60_usb(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	u32 usbdiv, val;
diff --git a/drivers/clk/at91/compat.c b/drivers/clk/at91/compat.c
index 5099fe3b8c62..6c1cf1b4192e 100644
--- a/drivers/clk/at91/compat.c
+++ b/drivers/clk/at91/compat.c
@@ -299,9 +299,9 @@ static ulong at91_plladiv_clk_get_rate(struct clk *clk)
 
 	return clk_rate;
 }
 
-static ulong at91_plladiv_clk_set_rate(struct clk *clk, ulong rate)
+static long at91_plladiv_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct pmc_plat *plat = dev_get_plat(clk->dev);
 	struct at91_pmc *pmc = plat->reg_base;
 	struct clk source;
@@ -391,9 +391,9 @@ static ulong system_clk_get_rate(struct clk *clk)
 
 	return clk_get_rate(&clk_dev);
 }
 
-static ulong system_clk_set_rate(struct clk *clk, ulong rate)
+static long system_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk clk_dev;
 	int ret;
 
@@ -774,9 +774,9 @@ static ulong generic_clk_get_rate(struct clk *clk)
 
 	return clk_get_rate(&parent) / (gckdiv + 1);
 }
 
-static ulong generic_clk_set_rate(struct clk *clk, ulong rate)
+static long generic_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct pmc_plat *plat = dev_get_plat(clk->dev);
 	struct at91_pmc *pmc = plat->reg_base;
 	struct generic_clk_priv *priv = dev_get_priv(clk->dev);
@@ -908,9 +908,9 @@ static ulong at91_usb_clk_get_rate(struct clk *clk)
 
 	return clk_get_rate(&source) / (usbdiv + 1);
 }
 
-static ulong at91_usb_clk_set_rate(struct clk *clk, ulong rate)
+static long at91_usb_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct pmc_plat *plat = dev_get_plat(clk->dev);
 	struct at91_pmc *pmc = plat->reg_base;
 	struct at91_usb_clk_priv *priv = dev_get_priv(clk->dev);
diff --git a/drivers/clk/clk-cdce9xx.c b/drivers/clk/clk-cdce9xx.c
index 9689283cec48..c4694aa86c28 100644
--- a/drivers/clk/clk-cdce9xx.c
+++ b/drivers/clk/clk-cdce9xx.c
@@ -170,9 +170,9 @@ static ulong cdce9xx_clk_get_rate(struct clk *clk)
 
 	return parent_rate / pdiv;
 }
 
-static ulong cdce9xx_clk_set_rate(struct clk *clk, ulong rate)
+static long cdce9xx_clk_set_rate(struct clk *clk, ulong rate)
 {
 	u32 parent_rate;
 	int pdiv;
 	u32 diff;
diff --git a/drivers/clk/clk-hsdk-cgu.c b/drivers/clk/clk-hsdk-cgu.c
index 4ff2b27205fd..b908fd75243b 100644
--- a/drivers/clk/clk-hsdk-cgu.c
+++ b/drivers/clk/clk-hsdk-cgu.c
@@ -707,9 +707,9 @@ static ulong hsdk_cgu_get_rate(struct clk *sclk)
 
 	return clk->map[sclk->id].get_rate(sclk);
 }
 
-static ulong hsdk_cgu_set_rate(struct clk *sclk, ulong rate)
+static long hsdk_cgu_set_rate(struct clk *sclk, ulong rate)
 {
 	struct hsdk_cgu_clk *clk = dev_get_priv(sclk->dev);
 
 	if (hsdk_prepare_clock_tree_branch(sclk))
diff --git a/drivers/clk/clk-stub.c b/drivers/clk/clk-stub.c
index ea77a4c720ae..d4cca5ff2ce7 100644
--- a/drivers/clk/clk-stub.c
+++ b/drivers/clk/clk-stub.c
@@ -25,9 +25,9 @@ U_BOOT_DRIVER(nop_parent) = {
 	.bind = dm_scan_fdt_dev,
 	.flags = DM_FLAG_DEFAULT_PD_CTRL_OFF,
 };
 
-static ulong stub_clk_set_rate(struct clk *clk, ulong rate)
+static long stub_clk_set_rate(struct clk *clk, ulong rate)
 {
 	return (clk->rate = rate);
 }
 
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 8a7033386a74..db4f056e4816 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -585,9 +585,9 @@ static void clk_clean_rate_cache(struct clk *clk)
 		clk_clean_rate_cache(clkp);
 	}
 }
 
-ulong clk_set_rate(struct clk *clk, ulong rate)
+long clk_set_rate(struct clk *clk, ulong rate)
 {
 	const struct clk_ops_uboot *ops;
 	struct clk *clkp;
 
diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 18c5ae43789a..598aac5f3a2a 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -86,9 +86,9 @@ static int clk_wzrd_enable(struct clk *clk)
 
 	return ret;
 }
 
-static unsigned long clk_wzrd_set_rate(struct clk *clk, ulong rate)
+static long clk_wzrd_set_rate(struct clk *clk, ulong rate)
 {
 	struct clkwzd *priv = dev_get_priv(clk->dev);
 	u64 div;
 	u32 cfg;
diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
index 329fc5bffd18..af9e5f172509 100644
--- a/drivers/clk/clk_k210.c
+++ b/drivers/clk/clk_k210.c
@@ -862,9 +862,9 @@ again:
 
 	return 0;
 }
 
-static ulong k210_pll_set_rate(struct k210_clk_priv *priv, int id, ulong rate,
+static long k210_pll_set_rate(struct k210_clk_priv *priv, int id, ulong rate,
 			       ulong rate_in)
 {
 	int err;
 	const struct k210_pll_params *pll = &k210_plls[id];
@@ -901,9 +901,9 @@ static ulong k210_pll_set_rate(struct k210_clk_priv *priv, int id, ulong rate,
 	serial_setbrg();
 	return k210_pll_get_rate(priv, id, rate);
 }
 #else
-static ulong k210_pll_set_rate(struct k210_clk_priv *priv, int id, ulong rate,
+static long k210_pll_set_rate(struct k210_clk_priv *priv, int id, ulong rate,
 			       ulong rate_in)
 {
 	return -ENOSYS;
 }
@@ -1108,9 +1108,9 @@ static int k210_clk_set_parent(struct clk *clk, struct clk *parent)
 	return do_k210_clk_set_parent(dev_get_priv(clk->dev), clk->id,
 				      parent->id);
 }
 
-static ulong k210_clk_set_rate(struct clk *clk, unsigned long rate)
+static long k210_clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	int parent, ret, err;
 	ulong rate_in, val;
 	const struct k210_div_params *div;
diff --git a/drivers/clk/clk_pic32.c b/drivers/clk/clk_pic32.c
index 0b8e2f7ad8ec..b51921240a1c 100644
--- a/drivers/clk/clk_pic32.c
+++ b/drivers/clk/clk_pic32.c
@@ -368,9 +368,9 @@ static ulong pic32_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong pic32_set_rate(struct clk *clk, ulong rate)
+static long pic32_set_rate(struct clk *clk, ulong rate)
 {
 	struct pic32_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong pll_hz;
 
diff --git a/drivers/clk/clk_sandbox.c b/drivers/clk/clk_sandbox.c
index dceba88852ab..667526810fc2 100644
--- a/drivers/clk/clk_sandbox.c
+++ b/drivers/clk/clk_sandbox.c
@@ -40,9 +40,9 @@ static ulong sandbox_clk_round_rate(struct clk *clk, ulong rate)
 
 	return rate;
 }
 
-static ulong sandbox_clk_set_rate(struct clk *clk, ulong rate)
+static long sandbox_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct sandbox_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong old_rate;
 	ulong id = clk_get_id(clk);
diff --git a/drivers/clk/clk_sandbox_test.c b/drivers/clk/clk_sandbox_test.c
index 87350212775c..b30888889ce9 100644
--- a/drivers/clk/clk_sandbox_test.c
+++ b/drivers/clk/clk_sandbox_test.c
@@ -89,9 +89,9 @@ ulong sandbox_clk_test_round_rate(struct udevice *dev, int id, ulong rate)
 
 	return clk_round_rate(sbct->clkps[id], rate);
 }
 
-ulong sandbox_clk_test_set_rate(struct udevice *dev, int id, ulong rate)
+long sandbox_clk_test_set_rate(struct udevice *dev, int id, ulong rate)
 {
 	struct sandbox_clk_test *sbct = dev_get_priv(dev);
 
 	if (id < 0 || id >= SANDBOX_CLK_TEST_ID_COUNT)
diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index 16374560f2b7..97a698dd5645 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -283,9 +283,9 @@ static ulong scmi_clk_get_rate(struct clk *clk)
 
 	return (ulong)(((u64)out.rate_msb << 32) | out.rate_lsb);
 }
 
-static ulong __scmi_clk_set_rate(struct clk *clk, ulong rate)
+static long __scmi_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct scmi_clk_rate_set_in in = {
 		.clock_id = clk_get_id(clk),
 		.flags = SCMI_CLK_RATE_ROUND_CLOSEST,
@@ -308,9 +308,9 @@ static ulong __scmi_clk_set_rate(struct clk *clk, ulong rate)
 
 	return scmi_clk_get_rate(clk);
 }
 
-static ulong scmi_clk_set_rate(struct clk *clk, ulong rate)
+static long scmi_clk_set_rate(struct clk *clk, ulong rate)
 {
 	u32 ctrl_flags;
 	int ret;
 
diff --git a/drivers/clk/clk_versaclock.c b/drivers/clk/clk_versaclock.c
index 35f7ded0137b..19f67cce1267 100644
--- a/drivers/clk/clk_versaclock.c
+++ b/drivers/clk/clk_versaclock.c
@@ -324,9 +324,9 @@ static unsigned long vc5_pfd_recalc_rate(struct clk *hw)
 	else
 		return parent_rate / VC5_REF_DIVIDER_REF_DIV(div);
 }
 
-static unsigned long vc5_pfd_set_rate(struct clk *hw, unsigned long rate)
+static long vc5_pfd_set_rate(struct clk *hw, unsigned long rate)
 {
 	struct vc5_driver_data *vc5 =
 		container_of(hw, struct vc5_driver_data, clk_pfd);
 	unsigned long idiv;
@@ -413,9 +413,9 @@ static unsigned long vc5_pll_round_rate(struct clk *hw, unsigned long rate)
 
 	return (parent_rate * div_int) + ((parent_rate * div_frc) >> 24);
 }
 
-static unsigned long vc5_pll_set_rate(struct clk *hw, unsigned long rate)
+static long vc5_pll_set_rate(struct clk *hw, unsigned long rate)
 {
 	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
 	struct vc5_driver_data *vc5 = hwdata->vc5;
 	u8 fb[5];
@@ -498,9 +498,9 @@ static unsigned long vc5_fod_round_rate(struct clk *hw, unsigned long rate)
 
 	return div64_u64((u64)f_in << 24ULL, ((u64)div_int << 24ULL) + div_frc);
 }
 
-static unsigned long vc5_fod_set_rate(struct clk *hw, unsigned long rate)
+static long vc5_fod_set_rate(struct clk *hw, unsigned long rate)
 {
 	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
 	struct vc5_driver_data *vc5 = hwdata->vc5;
 
@@ -616,9 +616,9 @@ static int vc5_clk_out_set_parent(struct vc5_driver_data *vc, u8 num, u8 index)
 
 	return vc5_update_bits(vc->i2c, VC5_OUT_DIV_CONTROL(num), mask, src);
 }
 
-static unsigned long vc5_clk_out_set_rate(struct clk *hw, unsigned long rate)
+static long vc5_clk_out_set_rate(struct clk *hw, unsigned long rate)
 {
 	struct udevice *dev;
 	struct vc5_driver_data *vc;
 	struct clk *parent;
diff --git a/drivers/clk/clk_versal.c b/drivers/clk/clk_versal.c
index 14dadf859a1f..7eb5370f0116 100644
--- a/drivers/clk/clk_versal.c
+++ b/drivers/clk/clk_versal.c
@@ -744,9 +744,9 @@ static ulong versal_clk_get_rate(struct clk *clk)
 
 	return clk_rate;
 }
 
-static ulong versal_clk_set_rate(struct clk *clk, ulong rate)
+static long versal_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct versal_clk_priv *priv = dev_get_priv(clk->dev);
 	u32 id = clk_get_id(clk);
 	u32 clk_id;
diff --git a/drivers/clk/clk_vexpress_osc.c b/drivers/clk/clk_vexpress_osc.c
index a6f0ba595a23..5e129b894f67 100644
--- a/drivers/clk/clk_vexpress_osc.c
+++ b/drivers/clk/clk_vexpress_osc.c
@@ -37,9 +37,9 @@ static ulong vexpress_osc_clk_get_rate(struct clk *clk)
 	return data;
 }
 
 #ifndef CONFIG_XPL_BUILD
-static ulong vexpress_osc_clk_set_rate(struct clk *clk, ulong rate)
+static long vexpress_osc_clk_set_rate(struct clk *clk, ulong rate)
 {
 	int err;
 	u32 buffer[2];
 	struct udevice *vexpress_cfg = dev_get_parent(clk->dev);
diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
index 229972fb505d..2a1ff3bd3feb 100644
--- a/drivers/clk/clk_zynq.c
+++ b/drivers/clk/clk_zynq.c
@@ -311,9 +311,9 @@ static unsigned long zynq_clk_calc_peripheral_two_divs(ulong rate,
 
 	return best_rate;
 }
 
-static ulong zynq_clk_set_peripheral_rate(struct zynq_clk_priv *priv,
+static long zynq_clk_set_peripheral_rate(struct zynq_clk_priv *priv,
 					  enum zynq_clk id, ulong rate,
 					  bool two_divs)
 {
 	enum zynq_clk pll;
@@ -346,9 +346,9 @@ static ulong zynq_clk_set_peripheral_rate(struct zynq_clk_priv *priv,
 
 	return new_rate;
 }
 
-static ulong zynq_clk_set_gem_rate(struct zynq_clk_priv *priv, enum zynq_clk id,
+static long zynq_clk_set_gem_rate(struct zynq_clk_priv *priv, enum zynq_clk id,
 				   ulong rate)
 {
 	struct clk *parent;
 
@@ -401,9 +401,9 @@ static ulong zynq_clk_get_rate(struct clk *clk)
 		return -ENXIO;
 	}
 }
 
-static ulong zynq_clk_set_rate(struct clk *clk, ulong rate)
+static long zynq_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct zynq_clk_priv *priv = dev_get_priv(clk->dev);
 	enum zynq_clk id = clk->id;
 	bool two_divs = false;
diff --git a/drivers/clk/clk_zynqmp.c b/drivers/clk/clk_zynqmp.c
index 1f23b06553bf..873862113b73 100644
--- a/drivers/clk/clk_zynqmp.c
+++ b/drivers/clk/clk_zynqmp.c
@@ -638,9 +638,9 @@ static unsigned long zynqmp_clk_calc_peripheral_two_divs(ulong rate,
 
 	return best_rate;
 }
 
-static ulong zynqmp_clk_set_peripheral_rate(struct zynqmp_clk_priv *priv,
+static long zynqmp_clk_set_peripheral_rate(struct zynqmp_clk_priv *priv,
 					  enum zynqmp_clk id, ulong rate,
 					  bool two_divs)
 {
 	enum zynqmp_clk pll;
@@ -734,9 +734,9 @@ static ulong zynqmp_clk_get_rate(struct clk *clk)
 		return -ENXIO;
 	}
 }
 
-static ulong zynqmp_clk_set_rate(struct clk *clk, ulong rate)
+static long zynqmp_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct zynqmp_clk_priv *priv = dev_get_priv(clk->dev);
 	enum zynqmp_clk id = clk->id;
 	bool two_divs = true;
diff --git a/drivers/clk/ics8n3qv01.c b/drivers/clk/ics8n3qv01.c
index 04e6a349436a..f0d8b7bcc660 100644
--- a/drivers/clk/ics8n3qv01.c
+++ b/drivers/clk/ics8n3qv01.c
@@ -105,9 +105,9 @@ static int ics8n3qv01_calc_parameters(uint fout, uint *_mint, uint *_mfrac,
 
 	return 0;
 }
 
-static ulong ics8n3qv01_set_rate(struct clk *clk, ulong fout)
+static long ics8n3qv01_set_rate(struct clk *clk, ulong fout)
 {
 	struct ics8n3qv01_priv *priv = dev_get_priv(clk->dev);
 	uint n, mint, mfrac;
 	uint fout_calc = 0;
diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index 848c7b9d3fb1..cbeb2bcc9f59 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -83,9 +83,9 @@ static int imx8m_clk_composite_compute_dividers(unsigned long rate,
 /*
  * The clk are bound to a dev, because it is part of composite clk
  * use composite clk to get dev
  */
-static ulong imx8m_clk_composite_divider_set_rate(struct clk *clk,
+static long imx8m_clk_composite_divider_set_rate(struct clk *clk,
 						  unsigned long rate)
 {
 	struct clk_divider *divider = (struct clk_divider *)to_clk_divider(clk);
 	struct clk_composite *composite = (struct clk_composite *)clk->data;
diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index b885c4bc01d4..d0b0f1e0479b 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -224,9 +224,9 @@ static int clk_fracn_gppll_wait_lock(struct clk_fracn_gppll *pll)
 	return readl_poll_timeout(pll->base + PLL_STATUS, val,
 				  val & LOCK_STATUS, LOCK_TIMEOUT_US);
 }
 
-static ulong clk_fracn_gppll_set_rate(struct clk *clk, unsigned long drate)
+static long clk_fracn_gppll_set_rate(struct clk *clk, unsigned long drate)
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(clk);
 	const struct imx_fracn_gppll_rate_table *rate;
 	u32 tmp, pll_div, ana_mfn;
diff --git a/drivers/clk/imx/clk-gate-93.c b/drivers/clk/imx/clk-gate-93.c
index ff3ae5b57d36..b6f905365178 100644
--- a/drivers/clk/imx/clk-gate-93.c
+++ b/drivers/clk/imx/clk-gate-93.c
@@ -92,9 +92,9 @@ static int imx93_clk_gate_disable(struct clk *clk)
 
 	return 0;
 }
 
-static ulong imx93_clk_set_rate(struct clk *clk, ulong rate)
+static long imx93_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk *parent = clk_get_parent(clk);
 
 	if (parent)
diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index b5cd1b31036e..d570915d3b64 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -72,9 +72,9 @@ static int clk_gate2_disable(struct clk *clk)
 
 	return 0;
 }
 
-static ulong clk_gate2_set_rate(struct clk *clk, ulong rate)
+static long clk_gate2_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk *parent = clk_get_parent(clk);
 
 	if (parent)
diff --git a/drivers/clk/imx/clk-imx8.c b/drivers/clk/imx/clk-imx8.c
index 423b052cc5b6..101f66c16a4e 100644
--- a/drivers/clk/imx/clk-imx8.c
+++ b/drivers/clk/imx/clk-imx8.c
@@ -20,9 +20,9 @@ __weak ulong imx8_clk_get_rate(struct clk *clk)
 {
 	return 0;
 }
 
-__weak ulong imx8_clk_set_rate(struct clk *clk, unsigned long rate)
+__weak long imx8_clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;
 }
 
diff --git a/drivers/clk/imx/clk-imx8.h b/drivers/clk/imx/clk-imx8.h
index 6e850ba26669..a5e73fcd95bd 100644
--- a/drivers/clk/imx/clk-imx8.h
+++ b/drivers/clk/imx/clk-imx8.h
@@ -14,6 +14,6 @@ extern struct imx8_clks imx8_clk_names[];
 extern int num_clks;
 #endif
 
 ulong imx8_clk_get_rate(struct clk *clk);
-ulong imx8_clk_set_rate(struct clk *clk, unsigned long rate);
+long imx8_clk_set_rate(struct clk *clk, unsigned long rate);
 int __imx8_clk_enable(struct clk *clk, bool enable);
diff --git a/drivers/clk/imx/clk-imx8qm.c b/drivers/clk/imx/clk-imx8qm.c
index 466d71786cfb..3239e7d9be6b 100644
--- a/drivers/clk/imx/clk-imx8qm.c
+++ b/drivers/clk/imx/clk-imx8qm.c
@@ -149,9 +149,9 @@ ulong imx8_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-ulong imx8_clk_set_rate(struct clk *clk, unsigned long rate)
+long imx8_clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	sc_pm_clk_t pm_clk;
 	u32 new_rate = rate;
 	u16 resource;
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 79098623bc8c..bf29443be060 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -142,9 +142,9 @@ ulong imx8_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-ulong imx8_clk_set_rate(struct clk *clk, unsigned long rate)
+long imx8_clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	sc_pm_clk_t pm_clk;
 	u32 new_rate = rate;
 	u16 resource;
diff --git a/drivers/clk/imx/clk-imxrt1170.c b/drivers/clk/imx/clk-imxrt1170.c
index ed31cb2d09ef..289d23dc0b81 100644
--- a/drivers/clk/imx/clk-imxrt1170.c
+++ b/drivers/clk/imx/clk-imxrt1170.c
@@ -27,9 +27,9 @@ static ulong imxrt1170_clk_get_rate(struct clk *clk)
 
 	return clk_get_rate(c);
 }
 
-static ulong imxrt1170_clk_set_rate(struct clk *clk, ulong rate)
+static long imxrt1170_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk *c;
 	int ret;
 
diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index de26b1e3f83d..58702034ab51 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -52,9 +52,9 @@ static unsigned long clk_pfd_recalc_rate(struct clk *clk)
 
 	return tmp;
 }
 
-static unsigned long clk_pfd_set_rate(struct clk *clk, unsigned long rate)
+static long clk_pfd_set_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk_pfd *pfd = to_clk_pfd(clk);
 	unsigned long parent_rate = clk_get_parent_rate(clk);
 	u64 tmp = parent_rate;
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 0bb4d2c7e28c..dacd5851f292 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -210,9 +210,9 @@ static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
 	return readl_poll_timeout(pll->base, val, val & LOCK_TIMEOUT_US,
 			LOCK_TIMEOUT_US);
 }
 
-static ulong clk_pll1416x_set_rate(struct clk *clk, unsigned long drate)
+static long clk_pll1416x_set_rate(struct clk *clk, unsigned long drate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(dev_get_clk_ptr(clk->dev));
 	const struct imx_pll14xx_rate_table *rate;
 	u32 tmp, div_val;
@@ -275,9 +275,9 @@ static ulong clk_pll1416x_set_rate(struct clk *clk, unsigned long drate)
 
 	return clk_pll1416x_recalc_rate(clk);
 }
 
-static ulong clk_pll1443x_set_rate(struct clk *clk, unsigned long drate)
+static long clk_pll1443x_set_rate(struct clk *clk, unsigned long drate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(dev_get_clk_ptr(clk->dev));
 	const struct imx_pll14xx_rate_table *rate;
 	u32 tmp, div_val;
diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index e907fd378c6d..2527ade99c88 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -54,9 +54,9 @@ static ulong clk_pllv3_genericv2_get_rate(struct clk *clk)
 
 	return (div == 0) ? parent_rate * 22 : parent_rate * 20;
 }
 
-static ulong clk_pllv3_genericv2_set_rate(struct clk *clk, ulong rate)
+static long clk_pllv3_genericv2_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_pllv3 *pll = to_clk_pllv3(clk);
 	unsigned long parent_rate = clk_get_parent_rate(clk);
 
@@ -78,9 +78,9 @@ static ulong clk_pllv3_generic_get_rate(struct clk *clk)
 
 	return (div == 1) ? parent_rate * 22 : parent_rate * 20;
 }
 
-static ulong clk_pllv3_generic_set_rate(struct clk *clk, ulong rate)
+static long clk_pllv3_generic_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_pllv3 *pll = to_clk_pllv3(clk);
 	unsigned long parent_rate = clk_get_parent_rate(clk);
 	u32 val, div;
@@ -162,9 +162,9 @@ static ulong clk_pllv3_sys_get_rate(struct clk *clk)
 
 	return parent_rate * div / 2;
 }
 
-static ulong clk_pllv3_sys_set_rate(struct clk *clk, ulong rate)
+static long clk_pllv3_sys_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_pllv3 *pll = to_clk_pllv3(clk);
 	unsigned long parent_rate = clk_get_parent_rate(clk);
 	unsigned long min_rate;
@@ -217,9 +217,9 @@ static ulong clk_pllv3_av_get_rate(struct clk *clk)
 
 	return parent_rate * div + (unsigned long)temp64;
 }
 
-static ulong clk_pllv3_av_set_rate(struct clk *clk, ulong rate)
+static long clk_pllv3_av_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_pllv3 *pll = to_clk_pllv3(clk);
 	unsigned long parent_rate = clk_get_parent_rate(clk);
 	unsigned long min_rate;
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 7c55bc4defa8..ebf29a6006b5 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -443,9 +443,9 @@ static void mtk_pll_calc_values(struct mtk_clk_priv *priv, u32 id,
 
 	*pcw = (u32)_pcw;
 }
 
-static ulong mtk_apmixedsys_set_rate(struct clk *clk, ulong rate)
+static long mtk_apmixedsys_set_rate(struct clk *clk, ulong rate)
 {
 	struct mtk_clk_priv *priv = dev_get_priv(clk->dev);
 	u32 pcw = 0;
 	u32 postdiv;
diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
index e87ad773da8f..ff9ec74b0e90 100644
--- a/drivers/clk/meson/a1.c
+++ b/drivers/clk/meson/a1.c
@@ -475,9 +475,9 @@ static ulong meson_clk_get_rate(struct clk *clk)
  *  ---------|\
  *     ..... | |---DIV--
  *  ---------|/
  */
-static ulong meson_composite_set_rate(struct clk *clk, ulong id, ulong rate)
+static long meson_composite_set_rate(struct clk *clk, ulong id, ulong rate)
 {
 	unsigned int i, best_div_val;
 	unsigned long best_delta, best_parent;
 	const struct meson_clk_info *div;
@@ -525,9 +525,9 @@ static ulong meson_composite_set_rate(struct clk *clk, ulong id, ulong rate)
 }
 
 static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned int id, ulong rate);
 
-static ulong meson_mux_set_rate(struct clk *clk, unsigned long id, ulong rate)
+static long meson_mux_set_rate(struct clk *clk, unsigned long id, ulong rate)
 {
 	int i;
 	ulong ret = -EINVAL;
 	struct meson_clk *priv = dev_get_priv(clk->dev);
@@ -569,9 +569,9 @@ static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned int id, ulong ra
 
 	return -EINVAL;
 }
 
-static ulong meson_clk_set_rate(struct clk *clk, ulong rate)
+static long meson_clk_set_rate(struct clk *clk, ulong rate)
 {
 	return meson_clk_set_rate_by_id(clk, clk->id, rate);
 }
 
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index c0172e243274..cff7dd2b838d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -95,9 +95,9 @@ struct meson_clk {
 	struct regmap *map;
 };
 
 static ulong meson_div_get_rate(struct clk *clk, unsigned long id);
-static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
+static long meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
 				ulong current_rate);
 static ulong meson_mux_set_parent(struct clk *clk, unsigned long id,
 				  unsigned long parent_id);
 static ulong meson_mux_get_rate(struct clk *clk, unsigned long id);
@@ -284,9 +284,9 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 
 	return rate;
 }
 
-static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
+static long meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
 				ulong current_rate)
 {
 	struct meson_clk *priv = dev_get_priv(clk->dev);
 	unsigned int new_div = -EINVAL;
@@ -862,9 +862,9 @@ static ulong meson_clk_get_rate(struct clk *clk)
 {
 	return meson_clk_get_rate_by_id(clk, clk->id);
 }
 
-static ulong meson_pcie_pll_set_rate(struct clk *clk, ulong rate)
+static long meson_pcie_pll_set_rate(struct clk *clk, ulong rate)
 {
 	struct meson_clk *priv = dev_get_priv(clk->dev);
 
 	regmap_write(priv->map, HHI_PCIE_PLL_CNTL0, 0x20090496);
@@ -952,9 +952,9 @@ static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned long id,
 
 	return -EINVAL;
 }
 
-static ulong meson_clk_set_rate(struct clk *clk, ulong rate)
+static long meson_clk_set_rate(struct clk *clk, ulong rate)
 {
 	ulong current_rate = meson_clk_get_rate_by_id(clk, clk->id);
 	int ret;
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 14c0d1f9158d..d44972e32452 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -74,9 +74,9 @@ struct meson_clk {
 	struct regmap *map;
 };
 
 static ulong meson_div_get_rate(struct clk *clk, unsigned long id);
-static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
+static long meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
 				ulong current_rate);
 static ulong meson_mux_set_parent(struct clk *clk, unsigned long id,
 				  unsigned long parent_id);
 static ulong meson_mux_get_rate(struct clk *clk, unsigned long id);
@@ -326,9 +326,9 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 
 	return rate;
 }
 
-static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
+static long meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
 				ulong current_rate)
 {
 	struct meson_clk *priv = dev_get_priv(clk->dev);
 	unsigned int new_div = -EINVAL;
@@ -906,9 +906,9 @@ static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned long id,
 
 	return -EINVAL;
 }
 
-static ulong meson_clk_set_rate(struct clk *clk, ulong rate)
+static long meson_clk_set_rate(struct clk *clk, ulong rate)
 {
 	ulong current_rate = meson_clk_get_rate_by_id(clk, clk->id);
 	int ret;
 
diff --git a/drivers/clk/microchip/mpfs_clk_cfg.c b/drivers/clk/microchip/mpfs_clk_cfg.c
index 294ee0f5cc0d..d24017b5cc11 100644
--- a/drivers/clk/microchip/mpfs_clk_cfg.c
+++ b/drivers/clk/microchip/mpfs_clk_cfg.c
@@ -80,9 +80,9 @@ static ulong mpfs_cfg_clk_recalc_rate(struct clk *hw)
 
 	return rate;
 }
 
-static ulong mpfs_cfg_clk_set_rate(struct clk *hw, ulong rate)
+static long mpfs_cfg_clk_set_rate(struct clk *hw, ulong rate)
 {
 	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
 	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
 	u32  val;
diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index b25b3df3b666..988067afa3e0 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -383,9 +383,9 @@ static ulong find_best_div(const struct clk_div_table *t0,
 
 	return best_rate;
 }
 
-static ulong armada_37xx_periph_clk_set_rate(struct clk *clk, ulong req_rate)
+static long armada_37xx_periph_clk_set_rate(struct clk *clk, ulong req_rate)
 {
 	struct a37xx_periphclk *priv = dev_get_priv(clk->dev);
 	const struct clk_periph *periph_clk = &priv->clks[clk->id];
 	ulong rate, old_rate, parent_rate;
diff --git a/drivers/clk/nuvoton/clk_npcm.c b/drivers/clk/nuvoton/clk_npcm.c
index ecb23431ecbd..b609e6236cb7 100644
--- a/drivers/clk/nuvoton/clk_npcm.c
+++ b/drivers/clk/nuvoton/clk_npcm.c
@@ -245,9 +245,9 @@ static ulong npcm_clk_get_rate(struct clk *clk)
 	else
 		return npcm_clk_get_fout(clk);
 }
 
-static ulong npcm_clk_set_rate(struct clk *clk, ulong rate)
+static long npcm_clk_set_rate(struct clk *clk, ulong rate)
 {
 	ulong parent_rate;
 	u32 div;
 	int ret;
diff --git a/drivers/clk/owl/clk_owl.c b/drivers/clk/owl/clk_owl.c
index 832177b8547f..5782ce89e12e 100644
--- a/drivers/clk/owl/clk_owl.c
+++ b/drivers/clk/owl/clk_owl.c
@@ -165,9 +165,9 @@ static ulong owl_get_sd_clk_rate(struct owl_clk_priv *priv, int sd_index)
 
 	return (parent_rate / div);
 }
 
-static ulong owl_set_sd_clk_rate(struct owl_clk_priv *priv, ulong rate,
+static long owl_set_sd_clk_rate(struct owl_clk_priv *priv, ulong rate,
 				 int sd_index)
 {
 	uint div, val;
 	ulong parent_rate = get_sd_parent_rate(priv, sd_index);
@@ -207,9 +207,9 @@ static ulong owl_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong owl_clk_set_rate(struct clk *clk, ulong rate)
+static long owl_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct owl_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong new_rate;
 
diff --git a/drivers/clk/qcom/clock-apq8016.c b/drivers/clk/qcom/clock-apq8016.c
index b7bd9c9a342a..46a962f29bfe 100644
--- a/drivers/clk/qcom/clock-apq8016.c
+++ b/drivers/clk/qcom/clock-apq8016.c
@@ -109,9 +109,9 @@ int apq8016_clk_init_uart(phys_addr_t base, unsigned long id)
 
 	return 0;
 }
 
-static ulong apq8016_clk_set_rate(struct clk *clk, ulong rate)
+static long apq8016_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	switch (clk->id) {
diff --git a/drivers/clk/qcom/clock-apq8096.c b/drivers/clk/qcom/clock-apq8096.c
index 551f52d51977..063867303966 100644
--- a/drivers/clk/qcom/clock-apq8096.c
+++ b/drivers/clk/qcom/clock-apq8096.c
@@ -77,9 +77,9 @@ static int clk_init_uart(struct msm_clk_priv *priv)
 
 	return 0;
 }
 
-static ulong apq8096_clk_set_rate(struct clk *clk, ulong rate)
+static long apq8096_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	switch (clk->id) {
diff --git a/drivers/clk/qcom/clock-ipq4019.c b/drivers/clk/qcom/clock-ipq4019.c
index f6760c6fb3df..8b9c19dfae64 100644
--- a/drivers/clk/qcom/clock-ipq4019.c
+++ b/drivers/clk/qcom/clock-ipq4019.c
@@ -20,9 +20,9 @@
 #define BLSP1_QUP1_I2C_APPS_CMD_RCGR	(0x200C)
 #define BLSP1_QUP2_I2C_APPS_CBCR	(0x3010)
 #define BLSP1_QUP2_I2C_APPS_CMD_RCGR	(0x3000)
 
-static ulong ipq4019_clk_set_rate(struct clk *clk, ulong rate)
+static long ipq4019_clk_set_rate(struct clk *clk, ulong rate)
 {
 	switch (clk->id) {
 	case GCC_BLSP1_UART1_APPS_CLK: /*UART1*/
 		/* This clock is already initialized by SBL1 */
diff --git a/drivers/clk/qcom/clock-ipq5424.c b/drivers/clk/qcom/clock-ipq5424.c
index 40823a30ead2..a26ceda972c9 100644
--- a/drivers/clk/qcom/clock-ipq5424.c
+++ b/drivers/clk/qcom/clock-ipq5424.c
@@ -19,9 +19,9 @@
 #include "clock-qcom.h"
 
 #define GCC_IM_SLEEP_CBCR	0x1834020u
 
-static ulong ipq5424_set_rate(struct clk *clk, ulong rate)
+static long ipq5424_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	switch (clk->id) {
diff --git a/drivers/clk/qcom/clock-ipq9574.c b/drivers/clk/qcom/clock-ipq9574.c
index b0af40360598..1c5f5ec195d9 100644
--- a/drivers/clk/qcom/clock-ipq9574.c
+++ b/drivers/clk/qcom/clock-ipq9574.c
@@ -25,9 +25,9 @@
 #define GCC_SDCC1_AHB_CBCR			0x33034
 #define GCC_SDCC1_APPS_CMD_RCGR			0x33004
 #define GCC_SDCC1_ICE_CORE_CBCR			0x33030
 
-static ulong ipq9574_set_rate(struct clk *clk, ulong rate)
+static long ipq9574_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	switch (clk->id) {
diff --git a/drivers/clk/qcom/clock-qcm2290.c b/drivers/clk/qcom/clock-qcm2290.c
index 5a599085b500..2efa588968a3 100644
--- a/drivers/clk/qcom/clock-qcm2290.c
+++ b/drivers/clk/qcom/clock-qcm2290.c
@@ -103,9 +103,9 @@ static const struct gate_clk qcm2290_clks[] = {
 	GATE_CLK(GCC_USB3_PRIM_PHY_COM_AUX_CLK, 0x1a054, 0x00000001),
 	GATE_CLK(GCC_USB3_PRIM_PHY_PIPE_CLK, 0x1a058, 0x00000001),
 };
 
-static ulong qcm2290_set_rate(struct clk *clk, ulong rate)
+static long qcm2290_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-qcom.c b/drivers/clk/qcom/clock-qcom.c
index 6df8285cb301..c6dc4d8ebacc 100644
--- a/drivers/clk/qcom/clock-qcom.c
+++ b/drivers/clk/qcom/clock-qcom.c
@@ -241,9 +241,9 @@ static int msm_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static ulong msm_clk_set_rate(struct clk *clk, ulong rate)
+static long msm_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_data *data = (struct msm_clk_data *)dev_get_driver_data(clk->dev);
 
 	if (data->set_rate)
diff --git a/drivers/clk/qcom/clock-qcom.h b/drivers/clk/qcom/clock-qcom.h
index 3a4550d85366..324094f5c7c6 100644
--- a/drivers/clk/qcom/clock-qcom.h
+++ b/drivers/clk/qcom/clock-qcom.h
@@ -94,9 +94,9 @@ struct msm_clk_data {
 	unsigned long			num_rcgs;
 	const char * const		*dbg_rcg_names;
 
 	int (*enable)(struct clk *clk);
-	unsigned long (*set_rate)(struct clk *clk, unsigned long rate);
+	long (*set_rate)(struct clk *clk, unsigned long rate);
 };
 
 struct msm_clk_priv {
 	phys_addr_t		base;
diff --git a/drivers/clk/qcom/clock-qcs404.c b/drivers/clk/qcom/clock-qcs404.c
index 8b11de03a7d9..866666fe4549 100644
--- a/drivers/clk/qcom/clock-qcs404.c
+++ b/drivers/clk/qcom/clock-qcs404.c
@@ -92,9 +92,9 @@ static struct pll_vote_clk gpll1_vote_clk = {
 	.ena_vote = APCS_GPLL_ENA_VOTE,
 	.vote_bit = BIT(1),
 };
 
-static ulong qcs404_clk_set_rate(struct clk *clk, ulong rate)
+static long qcs404_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	switch (clk->id) {
diff --git a/drivers/clk/qcom/clock-qcs615.c b/drivers/clk/qcom/clock-qcs615.c
index 4700baba8c95..6a0620b4f57d 100644
--- a/drivers/clk/qcom/clock-qcs615.c
+++ b/drivers/clk/qcom/clock-qcs615.c
@@ -32,9 +32,9 @@
 #define GCC_QUPV3_WRAP1_S3_CLK_ENA_BIT BIT(25)
 #define GCC_QUPV3_WRAP1_S4_CLK_ENA_BIT BIT(26)
 #define GCC_QUPV3_WRAP1_S5_CLK_ENA_BIT BIT(27)
 
-static ulong qcs615_set_rate(struct clk *clk, ulong rate)
+static long qcs615_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	if (clk->id < priv->data->num_clks)
diff --git a/drivers/clk/qcom/clock-qcs8300.c b/drivers/clk/qcom/clock-qcs8300.c
index cd8aecdf788a..fd6359773e19 100644
--- a/drivers/clk/qcom/clock-qcs8300.c
+++ b/drivers/clk/qcom/clock-qcs8300.c
@@ -16,9 +16,9 @@
 
 #define USB30_PRIM_MOCK_UTMI_CLK_CMD_RCGR 0xf038
 #define USB30_PRIM_MASTER_CLK_CMD_RCGR 0xf020
 
-static ulong qcs8300_set_rate(struct clk *clk, ulong rate)
+static long qcs8300_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	if (clk->id < priv->data->num_clks)
diff --git a/drivers/clk/qcom/clock-sa8775p.c b/drivers/clk/qcom/clock-sa8775p.c
index 4957abf6f589..9b6c583e65c3 100644
--- a/drivers/clk/qcom/clock-sa8775p.c
+++ b/drivers/clk/qcom/clock-sa8775p.c
@@ -43,9 +43,9 @@
 #define GCC_QUPV3_WRAP2_S6_CLK_ENA_BIT BIT(29)
 
 #define GCC_QUPV3_WRAP3_S0_CLK_ENA_BIT BIT(25)
 
-static ulong sa8775p_set_rate(struct clk *clk, ulong rate)
+static long sa8775p_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 
 	if (clk->id < priv->data->num_clks)
diff --git a/drivers/clk/qcom/clock-sc7280.c b/drivers/clk/qcom/clock-sc7280.c
index 7b6ed8260236..dd17eb7e4e28 100644
--- a/drivers/clk/qcom/clock-sc7280.c
+++ b/drivers/clk/qcom/clock-sc7280.c
@@ -53,9 +53,9 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s2_clk_src[] = {
 	F(100000000, CFG_CLK_SRC_GPLL0, 6, 0, 0),
 	{ }
 };
 
-static ulong sc7280_set_rate(struct clk *clk, ulong rate)
+static long sc7280_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sdm845.c b/drivers/clk/qcom/clock-sdm845.c
index c9a057cf6f9b..6f76dbe06f44 100644
--- a/drivers/clk/qcom/clock-sdm845.c
+++ b/drivers/clk/qcom/clock-sdm845.c
@@ -67,9 +67,9 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(201500000, CFG_CLK_SRC_GPLL4, 4, 0, 0),
 	{ }
 };
 
-static ulong sdm670_clk_set_rate(struct clk *clk, ulong rate)
+static long sdm670_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
@@ -83,9 +83,9 @@ static ulong sdm670_clk_set_rate(struct clk *clk, ulong rate)
 		return 0;
 	}
 }
 
-static ulong sdm845_clk_set_rate(struct clk *clk, ulong rate)
+static long sdm845_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm6115.c b/drivers/clk/qcom/clock-sm6115.c
index 17c2e5617580..542153b1f67e 100644
--- a/drivers/clk/qcom/clock-sm6115.c
+++ b/drivers/clk/qcom/clock-sm6115.c
@@ -93,9 +93,9 @@ static const struct gate_clk sm6115_clks[] = {
 	GATE_CLK(GCC_AHB2PHY_USB_CLK, 0x1d008, 0x00000001),
 	GATE_CLK(GCC_UFS_CLKREF_CLK, 0x8c000, 0x00000001),
 };
 
-static ulong sm6115_set_rate(struct clk *clk, ulong rate)
+static long sm6115_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm6350.c b/drivers/clk/qcom/clock-sm6350.c
index ee6653848c7b..46a01981538f 100644
--- a/drivers/clk/qcom/clock-sm6350.c
+++ b/drivers/clk/qcom/clock-sm6350.c
@@ -63,9 +63,9 @@ static struct pll_vote_clk gpll7_vote_clk = {
 	.ena_vote = APCS_GPLLX_ENA_REG,
 	.vote_bit = BIT(7),
 };
 
-static ulong sm6350_set_rate(struct clk *clk, ulong rate)
+static long sm6350_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm7150.c b/drivers/clk/qcom/clock-sm7150.c
index 8fe2076e55eb..132526ffd01f 100644
--- a/drivers/clk/qcom/clock-sm7150.c
+++ b/drivers/clk/qcom/clock-sm7150.c
@@ -78,9 +78,9 @@ static const struct freq_tbl ftbl_gcc_usb3_prim_phy_aux_clk_src[] = {
 	F(19200000, CFG_CLK_SRC_CXO, 1, 0, 0),
 	{ }
 };
 
-static ulong sm7150_clk_set_rate(struct clk *clk, ulong rate)
+static long sm7150_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm8150.c b/drivers/clk/qcom/clock-sm8150.c
index 7dd0d56eb430..be88a280fcbf 100644
--- a/drivers/clk/qcom/clock-sm8150.c
+++ b/drivers/clk/qcom/clock-sm8150.c
@@ -92,9 +92,9 @@ static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(202000000, CFG_CLK_SRC_GPLL0, 4, 0, 0),
 	{ }
 };
 
-static ulong sm8150_clk_set_rate(struct clk *clk, ulong rate)
+static long sm8150_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm8250.c b/drivers/clk/qcom/clock-sm8250.c
index 37268c4eaf5a..eb5d802786cf 100644
--- a/drivers/clk/qcom/clock-sm8250.c
+++ b/drivers/clk/qcom/clock-sm8250.c
@@ -53,9 +53,9 @@ static struct pll_vote_clk gpll9_vote_clk = {
 	.ena_vote = APCS_GPLLX_ENA_REG,
 	.vote_bit = BIT(9),
 };
 
-static ulong sm8250_set_rate(struct clk *clk, ulong rate)
+static long sm8250_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm8550.c b/drivers/clk/qcom/clock-sm8550.c
index 02d6e8d77345..538b5f0bf553 100644
--- a/drivers/clk/qcom/clock-sm8550.c
+++ b/drivers/clk/qcom/clock-sm8550.c
@@ -66,9 +66,9 @@ static const struct freq_tbl ftbl_gcc_pcie_0_phy_rchng_clk_src[] = {
 	F(100000000, CFG_CLK_SRC_GPLL0_EVEN, 3, 0, 0),
 	{ }
 };
 
-static ulong sm8550_set_rate(struct clk *clk, ulong rate)
+static long sm8550_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-sm8650.c b/drivers/clk/qcom/clock-sm8650.c
index fbd1a186d1ba..3cdb7ff9877a 100644
--- a/drivers/clk/qcom/clock-sm8650.c
+++ b/drivers/clk/qcom/clock-sm8650.c
@@ -63,9 +63,9 @@ static const struct freq_tbl ftbl_gcc_pcie_0_phy_rchng_clk_src[] = {
 	F(100000000, CFG_CLK_SRC_GPLL0_EVEN, 3, 0, 0),
 	{ }
 };
 
-static ulong sm8650_set_rate(struct clk *clk, ulong rate)
+static long sm8650_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/qcom/clock-x1e80100.c b/drivers/clk/qcom/clock-x1e80100.c
index ee57a02564a3..c0421d7f6023 100644
--- a/drivers/clk/qcom/clock-x1e80100.c
+++ b/drivers/clk/qcom/clock-x1e80100.c
@@ -63,9 +63,9 @@ static const struct freq_tbl ftbl_gcc_pcie_0_phy_rchng_clk_src[] = {
 	F(100000000, CFG_CLK_SRC_GPLL0_EVEN, 3, 0, 0),
 	{ }
 };
 
-static ulong x1e80100_set_rate(struct clk *clk, ulong rate)
+static long x1e80100_set_rate(struct clk *clk, ulong rate)
 {
 	struct msm_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct freq_tbl *freq;
 
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index e659ad39da7d..435ea3f5f37e 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -240,9 +240,9 @@ static int gen2_clk_setup_mmcif_div(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static ulong gen2_clk_set_rate(struct clk *clk, ulong rate)
+static long gen2_clk_set_rate(struct clk *clk, ulong rate)
 {
 	/* Force correct MMC-IF divider configuration if applicable */
 	gen2_clk_setup_mmcif_div(clk, rate);
 	return gen2_clk_get_rate(clk);
diff --git a/drivers/clk/renesas/clk-rcar-gen3.c b/drivers/clk/renesas/clk-rcar-gen3.c
index ae21f2a663f8..4fe22b27c284 100644
--- a/drivers/clk/renesas/clk-rcar-gen3.c
+++ b/drivers/clk/renesas/clk-rcar-gen3.c
@@ -432,9 +432,9 @@ static ulong gen3_clk_get_rate(struct clk *clk)
 {
 	return gen3_clk_get_rate64(clk);
 }
 
-static ulong gen3_clk_set_rate(struct clk *clk, ulong rate)
+static long gen3_clk_set_rate(struct clk *clk, ulong rate)
 {
 	/* Force correct SD-IF divider configuration if applicable */
 	gen3_clk_setup_sdif_div(clk, rate);
 	return gen3_clk_get_rate64(clk);
diff --git a/drivers/clk/renesas/compound-clock.c b/drivers/clk/renesas/compound-clock.c
index 2dc3e2e0deea..fb8bf19398ba 100644
--- a/drivers/clk/renesas/compound-clock.c
+++ b/drivers/clk/renesas/compound-clock.c
@@ -42,9 +42,9 @@ static ulong clk_compound_rate_get_rate(struct clk *clk)
 
 	return clk_get_rate(&cc->per);
 }
 
-static ulong clk_compound_rate_set_rate(struct clk *clk, ulong rate)
+static long clk_compound_rate_set_rate(struct clk *clk, ulong rate)
 {
 	return 0;	/* Set rate is not forwarded to SCP */
 }
 
diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 3ef98237ba15..91e1ace17ad9 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -842,9 +842,9 @@ static ulong r9a06g032_div_get_rate(struct clk *clk)
 		div = desc->div_max;
 	return DIV_ROUND_UP(parent_rate, div);
 }
 
-static ulong r9a06g032_div_set_rate(struct clk *clk, ulong rate)
+static long r9a06g032_div_set_rate(struct clk *clk, ulong rate)
 {
 	struct r9a06g032_priv *clocks = dev_get_priv(clk->dev);
 	const struct r9a06g032_clkdesc *desc = r9a06g032_clk_get(clk);
 	unsigned long parent_rate = r9a06g032_clk_get_parent_rate(clk);
@@ -1018,9 +1018,9 @@ static ulong r9a06g032_clk_get_rate(struct clk *clk)
 
 	return ret;
 }
 
-static ulong r9a06g032_clk_set_rate(struct clk *clk, ulong rate)
+static long r9a06g032_clk_set_rate(struct clk *clk, ulong rate)
 {
 	const struct r9a06g032_clkdesc *desc = r9a06g032_clk_get(clk);
 	ulong ret = 0;
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 03cb4f26d474..0401205bb96f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -279,9 +279,9 @@ static ulong rzg2l_cpg_clk_get_rate(struct clk *clk)
 {
 	return rzg2l_cpg_clk_get_rate_by_id(clk->dev, clk->id);
 }
 
-static ulong rzg2l_sdhi_clk_set_rate(struct udevice *dev, const struct cpg_core_clk *cc, ulong rate)
+static long rzg2l_sdhi_clk_set_rate(struct udevice *dev, const struct cpg_core_clk *cc, ulong rate)
 {
 	struct rzg2l_cpg_data *data =
 		(struct rzg2l_cpg_data *)dev_get_driver_data(dev);
 	const ulong offset = CPG_CONF_OFFSET(cc->conf);
@@ -345,9 +345,9 @@ static ulong rzg2l_sdhi_clk_set_rate(struct udevice *dev, const struct cpg_core_
 
 	return target_rate;
 }
 
-static ulong rzg2l_core_clk_set_rate(struct udevice *dev, const struct cpg_core_clk *cc, ulong rate)
+static long rzg2l_core_clk_set_rate(struct udevice *dev, const struct cpg_core_clk *cc, ulong rate)
 {
 	if (cc->type == CLK_TYPE_SD_MUX)
 		return rzg2l_sdhi_clk_set_rate(dev, cc, rate);
 
@@ -391,9 +391,9 @@ static ulong rzg2l_cpg_clk_set_rate_by_id(struct udevice *dev, unsigned int id,
 	dev_err(dev, "Core clock ID %u not found\n", cpg_clk_id);
 	return -ENODEV;
 }
 
-static ulong rzg2l_cpg_clk_set_rate(struct clk *clk, ulong rate)
+static long rzg2l_cpg_clk_set_rate(struct clk *clk, ulong rate)
 {
 	return rzg2l_cpg_clk_set_rate_by_id(clk->dev, clk->id, rate);
 }
 
diff --git a/drivers/clk/rockchip/clk_px30.c b/drivers/clk/rockchip/clk_px30.c
index 6e7f745102d5..61ad0f7809e5 100644
--- a/drivers/clk/rockchip/clk_px30.c
+++ b/drivers/clk/rockchip/clk_px30.c
@@ -1128,9 +1128,9 @@ static ulong px30_clk_get_pll_rate(struct px30_clk_priv *priv,
 
 	return rkclk_pll_get_rate(&cru->pll[pll_id], &cru->mode, pll_id);
 }
 
-static ulong px30_clk_set_pll_rate(struct px30_clk_priv *priv,
+static long px30_clk_set_pll_rate(struct px30_clk_priv *priv,
 				   enum px30_pll_id pll_id, ulong hz)
 {
 	struct px30_cru *cru = priv->cru;
 
@@ -1273,9 +1273,9 @@ static ulong px30_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong px30_clk_set_rate(struct clk *clk, ulong rate)
+static long px30_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct px30_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
@@ -1563,9 +1563,9 @@ static ulong px30_pmuclk_get_gpll_rate(struct px30_pmuclk_priv *priv)
 
 	return rkclk_pll_get_rate(&pmucru->pll, &pmucru->pmu_mode, GPLL);
 }
 
-static ulong px30_pmuclk_set_gpll_rate(struct px30_pmuclk_priv *priv, ulong hz)
+static long px30_pmuclk_set_gpll_rate(struct px30_pmuclk_priv *priv, ulong hz)
 {
 	struct px30_pmucru *pmucru = priv->pmucru;
 	ulong pclk_pmu_rate;
 	u32 div;
@@ -1712,9 +1712,9 @@ static ulong px30_pmuclk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong px30_pmuclk_set_rate(struct clk *clk, ulong rate)
+static long px30_pmuclk_set_rate(struct clk *clk, ulong rate)
 {
 	struct px30_pmuclk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3036.c b/drivers/clk/rockchip/clk_rk3036.c
index e575143341d9..c0aa23825410 100644
--- a/drivers/clk/rockchip/clk_rk3036.c
+++ b/drivers/clk/rockchip/clk_rk3036.c
@@ -290,9 +290,9 @@ static ulong rk3036_clk_get_rate(struct clk *clk)
 		return -ENOENT;
 	}
 }
 
-static ulong rk3036_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3036_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3036_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong new_rate, gclk_rate;
 
diff --git a/drivers/clk/rockchip/clk_rk3066.c b/drivers/clk/rockchip/clk_rk3066.c
index 9b6f7a2b6b00..ce7c5956df31 100644
--- a/drivers/clk/rockchip/clk_rk3066.c
+++ b/drivers/clk/rockchip/clk_rk3066.c
@@ -539,9 +539,9 @@ static ulong rk3066_clk_get_rate(struct clk *clk)
 
 	return new_rate;
 }
 
-static ulong rk3066_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3066_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3066_clk_priv *priv = dev_get_priv(clk->dev);
 	struct rk3066_cru *cru = priv->cru;
 	ulong new_rate;
diff --git a/drivers/clk/rockchip/clk_rk3128.c b/drivers/clk/rockchip/clk_rk3128.c
index 4665f0d31152..0d132a1624c0 100644
--- a/drivers/clk/rockchip/clk_rk3128.c
+++ b/drivers/clk/rockchip/clk_rk3128.c
@@ -503,9 +503,9 @@ static ulong rk3128_clk_get_rate(struct clk *clk)
 		return -ENOENT;
 	}
 }
 
-static ulong rk3128_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3128_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3128_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong new_rate, gclk_rate;
 
diff --git a/drivers/clk/rockchip/clk_rk3188.c b/drivers/clk/rockchip/clk_rk3188.c
index 1c75c2d9bf5b..d54a5dbb14b8 100644
--- a/drivers/clk/rockchip/clk_rk3188.c
+++ b/drivers/clk/rockchip/clk_rk3188.c
@@ -494,9 +494,9 @@ static ulong rk3188_clk_get_rate(struct clk *clk)
 
 	return new_rate;
 }
 
-static ulong rk3188_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3188_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3188_clk_priv *priv = dev_get_priv(clk->dev);
 	struct rk3188_cru *cru = priv->cru;
 	ulong new_rate;
diff --git a/drivers/clk/rockchip/clk_rk322x.c b/drivers/clk/rockchip/clk_rk322x.c
index f40fe68de45b..fb438c6fabee 100644
--- a/drivers/clk/rockchip/clk_rk322x.c
+++ b/drivers/clk/rockchip/clk_rk322x.c
@@ -372,9 +372,9 @@ static ulong rk322x_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk322x_clk_set_rate(struct clk *clk, ulong rate)
+static long rk322x_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk322x_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong new_rate, gclk_rate;
 
diff --git a/drivers/clk/rockchip/clk_rk3288.c b/drivers/clk/rockchip/clk_rk3288.c
index b672e728fb0a..10aed7c757a6 100644
--- a/drivers/clk/rockchip/clk_rk3288.c
+++ b/drivers/clk/rockchip/clk_rk3288.c
@@ -787,9 +787,9 @@ static ulong rk3288_clk_get_rate(struct clk *clk)
 
 	return new_rate;
 }
 
-static ulong rk3288_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3288_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3288_clk_priv *priv = dev_get_priv(clk->dev);
 	struct rockchip_cru *cru = priv->cru;
 	ulong new_rate, gclk_rate;
diff --git a/drivers/clk/rockchip/clk_rk3308.c b/drivers/clk/rockchip/clk_rk3308.c
index 828d545f5fab..99f8d78b377e 100644
--- a/drivers/clk/rockchip/clk_rk3308.c
+++ b/drivers/clk/rockchip/clk_rk3308.c
@@ -1009,9 +1009,9 @@ static ulong rk3308_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk3308_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3308_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3308_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3328.c b/drivers/clk/rockchip/clk_rk3328.c
index cb5df70bfaa0..b251a48e17f5 100644
--- a/drivers/clk/rockchip/clk_rk3328.c
+++ b/drivers/clk/rockchip/clk_rk3328.c
@@ -713,9 +713,9 @@ static ulong rk3328_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk3328_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3328_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3328_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3368.c b/drivers/clk/rockchip/clk_rk3368.c
index 9949ebaf23fe..d056ed01e81d 100644
--- a/drivers/clk/rockchip/clk_rk3368.c
+++ b/drivers/clk/rockchip/clk_rk3368.c
@@ -484,9 +484,9 @@ static ulong rk3368_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk3368_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3368_clk_set_rate(struct clk *clk, ulong rate)
 {
 	__maybe_unused struct rk3368_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3399.c b/drivers/clk/rockchip/clk_rk3399.c
index 976afc57f0b7..3c736ce0de73 100644
--- a/drivers/clk/rockchip/clk_rk3399.c
+++ b/drivers/clk/rockchip/clk_rk3399.c
@@ -1008,9 +1008,9 @@ static ulong rk3399_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk3399_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3399_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3399_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
@@ -1626,9 +1626,9 @@ static ulong rk3399_pmuclk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk3399_pmuclk_set_rate(struct clk *clk, ulong rate)
+static long rk3399_pmuclk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3399_pmuclk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3528.c b/drivers/clk/rockchip/clk_rk3528.c
index f81ff829db9d..70de2efa7078 100644
--- a/drivers/clk/rockchip/clk_rk3528.c
+++ b/drivers/clk/rockchip/clk_rk3528.c
@@ -246,9 +246,9 @@ static ulong rk3528_ppll_matrix_get_rate(struct rk3528_clk_priv *priv,
 
 	return DIV_TO_RATE(priv->ppll_hz, div);
 }
 
-static ulong rk3528_ppll_matrix_set_rate(struct rk3528_clk_priv *priv,
+static long rk3528_ppll_matrix_set_rate(struct rk3528_clk_priv *priv,
 					 ulong clk_id, ulong rate)
 {
 	struct rk3528_cru *cru = priv->cru;
 	u32 id, div, mask, shift;
@@ -399,9 +399,9 @@ static ulong rk3528_cgpll_matrix_get_rate(struct rk3528_clk_priv *priv,
 	/* NOTE: '-1' to balance the DIV_TO_RATE() 'div+1' */
 	return is_halfdiv ? DIV_TO_RATE(prate * 2, (3 + 2 * div) - 1) : DIV_TO_RATE(prate, div);
 }
 
-static ulong rk3528_cgpll_matrix_set_rate(struct rk3528_clk_priv *priv,
+static long rk3528_cgpll_matrix_set_rate(struct rk3528_clk_priv *priv,
 					  ulong clk_id, ulong rate)
 {
 	struct rk3528_cru *cru = priv->cru;
 	u32 sel, div, mask, shift, con;
@@ -1199,9 +1199,9 @@ static ulong rk3528_uart_get_rate(struct rk3528_clk_priv *priv, ulong clk_id)
 
 	return rate;
 }
 
-static ulong rk3528_uart_set_rate(struct rk3528_clk_priv *priv,
+static long rk3528_uart_set_rate(struct rk3528_clk_priv *priv,
 				  ulong clk_id, ulong rate)
 {
 	struct rk3528_cru *cru = priv->cru;
 	u32 sel_shift, sel_mask, div_shift, div_mask;
@@ -1421,9 +1421,9 @@ static ulong rk3528_clk_get_rate(struct clk *clk)
 
 	return rate;
 };
 
-static ulong rk3528_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3528_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3528_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3568.c b/drivers/clk/rockchip/clk_rk3568.c
index e07838e2c82b..b8329c6d3ad0 100644
--- a/drivers/clk/rockchip/clk_rk3568.c
+++ b/drivers/clk/rockchip/clk_rk3568.c
@@ -385,9 +385,9 @@ static ulong rk3568_pmuclk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rk3568_pmuclk_set_rate(struct clk *clk, ulong rate)
+static long rk3568_pmuclk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3568_pmuclk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
@@ -647,9 +647,9 @@ static ulong rk3568_cpll_div_get_rate(struct rk3568_clk_priv *priv,
 	div = (readl(&cru->clksel_con[con]) & mask) >> shift;
 	return DIV_TO_RATE(priv->cpll_hz, div);
 }
 
-static ulong rk3568_cpll_div_set_rate(struct rk3568_clk_priv *priv,
+static long rk3568_cpll_div_set_rate(struct rk3568_clk_priv *priv,
 				      ulong clk_id, ulong rate)
 {
 	struct rk3568_cru *cru = priv->cru;
 	int div, mask, shift, con;
@@ -1334,9 +1334,9 @@ static ulong rk3568_crypto_get_rate(struct rk3568_clk_priv *priv, ulong clk_id)
 		return -ENOENT;
 	}
 }
 
-static ulong rk3568_crypto_set_rate(struct rk3568_clk_priv *priv,
+static long rk3568_crypto_set_rate(struct rk3568_clk_priv *priv,
 				    ulong clk_id, ulong rate)
 {
 	struct rk3568_cru *cru = priv->cru;
 	u32 src_clk, mask, shift;
@@ -2241,9 +2241,9 @@ static ulong rk3568_uart_get_rate(struct rk3568_clk_priv *priv, ulong clk_id)
 		return OSC_HZ;
 	}
 }
 
-static ulong rk3568_uart_set_rate(struct rk3568_clk_priv *priv,
+static long rk3568_uart_set_rate(struct rk3568_clk_priv *priv,
 				  ulong clk_id, ulong rate)
 {
 	struct rk3568_cru *cru = priv->cru;
 	u32 reg, clk_src, uart_src, div;
@@ -2492,9 +2492,9 @@ static ulong rk3568_clk_get_rate(struct clk *clk)
 
 	return rate;
 };
 
-static ulong rk3568_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3568_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3568_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3576.c b/drivers/clk/rockchip/clk_rk3576.c
index 60dc576bed4a..5c86ba773527 100644
--- a/drivers/clk/rockchip/clk_rk3576.c
+++ b/drivers/clk/rockchip/clk_rk3576.c
@@ -1654,9 +1654,9 @@ static ulong rk3576_uart_frac_get_rate(struct rk3576_clk_priv *priv, ulong clk_i
 	m >>= CLK_UART_FRAC_DENOMINATOR_SHIFT;
 	return p_rate * n / m;
 }
 
-static ulong rk3576_uart_frac_set_rate(struct rk3576_clk_priv *priv,
+static long rk3576_uart_frac_set_rate(struct rk3576_clk_priv *priv,
 				       ulong clk_id, ulong rate)
 {
 	struct rk3576_cru *cru = priv->cru;
 	u32 reg, clk_src, p_rate;
@@ -1786,9 +1786,9 @@ static ulong rk3576_uart_get_rate(struct rk3576_clk_priv *priv, ulong clk_id)
 
 	return DIV_TO_RATE(p_rate, div);
 }
 
-static ulong rk3576_uart_set_rate(struct rk3576_clk_priv *priv,
+static long rk3576_uart_set_rate(struct rk3576_clk_priv *priv,
 				  ulong clk_id, ulong rate)
 {
 	struct rk3576_cru *cru = priv->cru;
 	u32 reg, clk_src = 0, div = 0;
@@ -2056,9 +2056,9 @@ static ulong rk3576_clk_get_rate(struct clk *clk)
 
 	return rate;
 };
 
-static ulong rk3576_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3576_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3576_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
diff --git a/drivers/clk/rockchip/clk_rk3588.c b/drivers/clk/rockchip/clk_rk3588.c
index 3047f1630bcc..a1332ef8834e 100644
--- a/drivers/clk/rockchip/clk_rk3588.c
+++ b/drivers/clk/rockchip/clk_rk3588.c
@@ -1329,9 +1329,9 @@ static ulong rk3588_uart_get_rate(struct rk3588_clk_priv *priv, ulong clk_id)
 		return OSC_HZ;
 	}
 }
 
-static ulong rk3588_uart_set_rate(struct rk3588_clk_priv *priv,
+static long rk3588_uart_set_rate(struct rk3588_clk_priv *priv,
 				  ulong clk_id, ulong rate)
 {
 	struct rk3588_cru *cru = priv->cru;
 	u32 reg, clk_src, uart_src, div;
@@ -1438,9 +1438,9 @@ static ulong rk3588_pciephy_get_rate(struct rk3588_clk_priv *priv, ulong clk_id)
 	else
 		return OSC_HZ;
 }
 
-static ulong rk3588_pciephy_set_rate(struct rk3588_clk_priv *priv,
+static long rk3588_pciephy_set_rate(struct rk3588_clk_priv *priv,
 				     ulong clk_id, ulong rate)
 {
 	struct rk3588_cru *cru = priv->cru;
 	u32 clk_src, div;
@@ -1649,9 +1649,9 @@ static ulong rk3588_clk_get_rate(struct clk *clk)
 
 	return rate;
 };
 
-static ulong rk3588_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3588_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rk3588_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
@@ -2086,9 +2086,9 @@ static ulong rk3588_scru_clk_get_rate(struct clk *clk)
 		return -ENOENT;
 	}
 }
 
-static ulong rk3588_scru_clk_set_rate(struct clk *clk, ulong rate)
+static long rk3588_scru_clk_set_rate(struct clk *clk, ulong rate)
 {
 	u32 div, sel;
 
 	switch (clk->id) {
diff --git a/drivers/clk/rockchip/clk_rv1108.c b/drivers/clk/rockchip/clk_rv1108.c
index 98e226ec61a0..80658b2c5e02 100644
--- a/drivers/clk/rockchip/clk_rv1108.c
+++ b/drivers/clk/rockchip/clk_rv1108.c
@@ -571,9 +571,9 @@ static ulong rv1108_clk_get_rate(struct clk *clk)
 		return -ENOENT;
 	}
 }
 
-static ulong rv1108_clk_set_rate(struct clk *clk, ulong rate)
+static long rv1108_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rv1108_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong new_rate;
 
diff --git a/drivers/clk/rockchip/clk_rv1126.c b/drivers/clk/rockchip/clk_rv1126.c
index caa1512719eb..84f5a43599da 100644
--- a/drivers/clk/rockchip/clk_rv1126.c
+++ b/drivers/clk/rockchip/clk_rv1126.c
@@ -68,9 +68,9 @@ static struct rockchip_pll_clock rv1126_pll_clks[] = {
 	[GPLL] = PLL(pll_rk3328, PLL_GPLL, RV1126_PMU_PLL_CON(0),
 		     RV1126_PMU_MODE, 0, 10, 0, rv1126_pll_rates),
 };
 
-static ulong rv1126_gpll_set_rate(struct rv1126_clk_priv *priv,
+static long rv1126_gpll_set_rate(struct rv1126_clk_priv *priv,
 				  struct rv1126_pmuclk_priv *pmu_priv,
 				  ulong rate);
 /*
  *
@@ -404,9 +404,9 @@ static ulong rv1126_pmuclk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static ulong rv1126_pmuclk_set_rate(struct clk *clk, ulong rate)
+static long rv1126_pmuclk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rv1126_pmuclk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
@@ -1514,9 +1514,9 @@ static ulong rv1126_clk_get_rate(struct clk *clk)
 
 	return rate;
 };
 
-static ulong rv1126_clk_set_rate(struct clk *clk, ulong rate)
+static long rv1126_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct rv1126_clk_priv *priv = dev_get_priv(clk->dev);
 	ulong ret = 0;
 
@@ -1707,9 +1707,9 @@ static struct clk_ops_uboot rv1126_clk_ops = {
 	.set_parent = rv1126_clk_set_parent,
 #endif
 };
 
-static ulong rv1126_gpll_set_rate(struct rv1126_clk_priv *priv,
+static long rv1126_gpll_set_rate(struct rv1126_clk_priv *priv,
 				  struct rv1126_pmuclk_priv *pmu_priv,
 				  ulong rate)
 {
 	ulong emmc_rate, sfc_rate, nandc_rate;
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index dc84d4b6386d..f8e9d77e18fe 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -580,9 +580,9 @@ static ulong sifive_prci_get_rate(struct clk *clk)
 
 	return pc->ops->recalc_rate(pc, sifive_prci_parent_rate(pc, data));
 }
 
-static ulong sifive_prci_set_rate(struct clk *clk, ulong rate)
+static long sifive_prci_set_rate(struct clk *clk, ulong rate)
 {
 	int err;
 	struct __prci_clock *pc;
 	struct prci_clk_desc *data =
diff --git a/drivers/clk/sophgo/clk-cv1800b.c b/drivers/clk/sophgo/clk-cv1800b.c
index c8e5f7f53ea2..2cc702cb1b3b 100644
--- a/drivers/clk/sophgo/clk-cv1800b.c
+++ b/drivers/clk/sophgo/clk-cv1800b.c
@@ -707,9 +707,9 @@ static ulong cv1800b_clk_get_rate(struct clk *clk)
 		return err;
 	return clk_get_rate(c);
 }
 
-static ulong cv1800b_clk_set_rate(struct clk *clk, ulong rate)
+static long cv1800b_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk *c;
 	int err = clk_get_by_id(CV1800B_CLK_ID_TRANSFORM(clk->id), &c);
 
diff --git a/drivers/clk/sophgo/clk-ip.c b/drivers/clk/sophgo/clk-ip.c
index 7ac631126721..78ba582b4096 100644
--- a/drivers/clk/sophgo/clk-ip.c
+++ b/drivers/clk/sophgo/clk-ip.c
@@ -93,9 +93,9 @@ static ulong div_get_rate(struct clk *clk)
 
 	return DIV_ROUND_UP_ULL(clk_get_parent_rate(clk), val);
 }
 
-static ulong div_set_rate(struct clk *clk, ulong rate)
+static long div_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_div *div = to_cv1800b_clk_div(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	u32 val;
@@ -136,9 +136,9 @@ static ulong bypass_div_get_rate(struct clk *clk)
 
 	return div_get_rate(clk);
 }
 
-static ulong bypass_div_set_rate(struct clk *clk, ulong rate)
+static long bypass_div_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_bypass_div *div = to_cv1800b_clk_bypass_div(clk);
 
 	if (cv1800b_clk_getbit(div->div.base, &div->bypass))
@@ -291,9 +291,9 @@ static ulong mux_get_rate(struct clk *clk)
 
 	return DIV_ROUND_UP_ULL(clk_get_parent_rate(clk), val);
 }
 
-static ulong mux_set_rate(struct clk *clk, ulong rate)
+static long mux_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_mux *mux = to_cv1800b_clk_mux(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	ulong val;
@@ -347,9 +347,9 @@ static ulong bypass_mux_get_rate(struct clk *clk)
 
 	return mux_get_rate(clk);
 }
 
-static ulong bypass_mux_set_rate(struct clk *clk, ulong rate)
+static long bypass_mux_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_bypass_mux *mux = to_cv1800b_clk_bypass_mux(clk);
 
 	if (cv1800b_clk_getbit(mux->mux.base, &mux->bypass))
@@ -432,9 +432,9 @@ static ulong mmux_get_rate(struct clk *clk)
 
 	return DIV_ROUND_UP_ULL(clk_get_parent_rate(clk), val);
 }
 
-static ulong mmux_set_rate(struct clk *clk, ulong rate)
+static long mmux_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_mmux *mmux = to_cv1800b_clk_mmux(clk);
 	int clk_sel = 1;
 	ulong parent_rate = clk_get_parent_rate(clk);
@@ -561,9 +561,9 @@ static void aclk_determine_mn(ulong parent_rate, ulong rate, u32 *m, u32 *n)
 	*m = tm / tcommon;
 	*n = tn / tcommon;
 }
 
-static ulong aclk_set_rate(struct clk *clk, ulong rate)
+static long aclk_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_audio *aclk = to_cv1800b_clk_audio(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	u32 m, n;
diff --git a/drivers/clk/sophgo/clk-pll.c b/drivers/clk/sophgo/clk-pll.c
index 6ef50f00171d..72dfead33dd1 100644
--- a/drivers/clk/sophgo/clk-pll.c
+++ b/drivers/clk/sophgo/clk-pll.c
@@ -63,9 +63,9 @@ static ulong cv1800b_ipll_get_rate(struct clk *clk)
 
 	return DIV_ROUND_DOWN_ULL(parent_rate * div, pre_div * post_div);
 }
 
-static ulong cv1800b_ipll_set_rate(struct clk *clk, ulong rate)
+static long cv1800b_ipll_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_ipll *pll = to_clk_ipll(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	u32 pre_div, post_div, div;
@@ -187,9 +187,9 @@ static ulong cv1800b_find_syn(ulong rate, ulong parent_rate, ulong pre_div, ulon
 	*syn = syn_min;
 	return new_rate;
 }
 
-static ulong cv1800b_fpll_set_rate(struct clk *clk, ulong rate)
+static long cv1800b_fpll_set_rate(struct clk *clk, ulong rate)
 {
 	struct cv1800b_clk_fpll *pll = to_clk_fpll(clk);
 	ulong parent_rate = clk_get_parent_rate(clk);
 	u32 pre_div, post_div, div;
diff --git a/drivers/clk/starfive/clk-jh7110-pll.c b/drivers/clk/starfive/clk-jh7110-pll.c
index d12dec9a1f86..e9299aceee17 100644
--- a/drivers/clk/starfive/clk-jh7110-pll.c
+++ b/drivers/clk/starfive/clk-jh7110-pll.c
@@ -299,9 +299,9 @@ static ulong jh7110_pllx_recalc_rate(struct clk *clk)
 
 	return refclk;
 }
 
-static ulong jh7110_pllx_set_rate(struct clk *clk, ulong drate)
+static long jh7110_pllx_set_rate(struct clk *clk, ulong drate)
 {
 	struct clk_jh7110_pllx *pll = to_clk_pllx(dev_get_clk_ptr(clk->dev));
 	const struct starfive_pllx_rate *rate;
 
diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 834f0d8379e3..fe581a422eb2 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -165,9 +165,9 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 
 	return ops->get_rate(c);
 }
 
-static ulong stm32_clk_set_rate(struct clk *clk, unsigned long clk_rate)
+static long stm32_clk_set_rate(struct clk *clk, unsigned long clk_rate)
 {
 	const struct clk_ops_uboot *ops;
 	struct clk *c = NULL;
 
diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
index 6c3a369797d9..1cfa511ff088 100644
--- a/drivers/clk/stm32/clk-stm32f.c
+++ b/drivers/clk/stm32/clk-stm32f.c
@@ -494,9 +494,9 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 		return -EINVAL;
 	}
 }
 
-static ulong stm32_set_rate(struct clk *clk, ulong rate)
+static long stm32_set_rate(struct clk *clk, ulong rate)
 {
 #ifdef CONFIG_VIDEO_STM32
 	struct stm32_clk *priv = dev_get_priv(clk->dev);
 	struct stm32_rcc_regs *regs = priv->base;
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index a7d0b55e060b..74ce9b15eef6 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -2155,9 +2155,9 @@ static int pll_set_output_rate(struct udevice *dev,
 
 	return 0;
 }
 
-static ulong stm32mp1_clk_set_rate(struct clk *clk, unsigned long clk_rate)
+static long stm32mp1_clk_set_rate(struct clk *clk, unsigned long clk_rate)
 {
 	struct stm32mp1_clk_priv *priv = dev_get_priv(clk->dev);
 	int p;
 
diff --git a/drivers/clk/tegra/tegra-car-clk.c b/drivers/clk/tegra/tegra-car-clk.c
index 6e315f502aa5..fd2b9082a96b 100644
--- a/drivers/clk/tegra/tegra-car-clk.c
+++ b/drivers/clk/tegra/tegra-car-clk.c
@@ -59,9 +59,9 @@ static ulong tegra_car_clk_get_rate(struct clk *clk)
 
 	return -1U;
 }
 
-static ulong tegra_car_clk_set_rate(struct clk *clk, ulong rate)
+static long tegra_car_clk_set_rate(struct clk *clk, ulong rate)
 {
 	enum clock_id parent;
 
 	debug("%s(clk=%p, rate=%lu) (dev=%p, id=%lu)\n", __func__, clk, rate,
diff --git a/drivers/clk/tegra/tegra186-clk.c b/drivers/clk/tegra/tegra186-clk.c
index 99e0a9f28d9c..90c91096c411 100644
--- a/drivers/clk/tegra/tegra186-clk.c
+++ b/drivers/clk/tegra/tegra186-clk.c
@@ -27,9 +27,9 @@ static ulong tegra186_clk_get_rate(struct clk *clk)
 
 	return resp.clk_get_rate.rate;
 }
 
-static ulong tegra186_clk_set_rate(struct clk *clk, ulong rate)
+static long tegra186_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct mrq_clk_request req;
 	struct mrq_clk_response resp;
 	int ret;
diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 16188d56f73a..697a561f8030 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -989,9 +989,9 @@ static ulong th1520_clk_get_rate(struct clk *clk)
 
 	return clk_get_rate(c);
 }
 
-static ulong th1520_clk_set_rate(struct clk *clk, ulong rate)
+static long th1520_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk *c;
 	int ret;
 
diff --git a/drivers/clk/ti/clk-am3-dpll.c b/drivers/clk/ti/clk-am3-dpll.c
index 1726233df173..df90d157bb07 100644
--- a/drivers/clk/ti/clk-am3-dpll.c
+++ b/drivers/clk/ti/clk-am3-dpll.c
@@ -201,9 +201,9 @@ static void clk_ti_am3_dpll_ssc_program(struct clk *clk)
 
 	clk_ti_writel(ctrl, &priv->clkmode_reg);
 }
 
-static ulong clk_ti_am3_dpll_set_rate(struct clk *clk, ulong rate)
+static long clk_ti_am3_dpll_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_ti_am3_dpll_priv *priv = dev_get_priv(clk->dev);
 	u32 v;
 	ulong round_rate;
diff --git a/drivers/clk/ti/clk-divider.c b/drivers/clk/ti/clk-divider.c
index f959b5633d64..4d216dded96b 100644
--- a/drivers/clk/ti/clk-divider.c
+++ b/drivers/clk/ti/clk-divider.c
@@ -179,9 +179,9 @@ static ulong clk_ti_divider_round_rate(struct clk *clk, ulong rate)
 
 	return DIV_ROUND_UP(parent_rate, div);
 }
 
-static ulong clk_ti_divider_set_rate(struct clk *clk, ulong rate)
+static long clk_ti_divider_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_ti_divider_priv *priv = dev_get_priv(clk->dev);
 	ulong parent_rate;
 	int div;
diff --git a/drivers/clk/ti/clk-k3-pll.c b/drivers/clk/ti/clk-k3-pll.c
index 9766f50a2e4d..b47f7cd3a19e 100644
--- a/drivers/clk/ti/clk-k3-pll.c
+++ b/drivers/clk/ti/clk-k3-pll.c
@@ -343,9 +343,9 @@ static void ti_pll_clk_bypass(struct ti_pll_clk *pll, bool bypass)
 
 	writel(ctrl, pll->base + PLL_16FFT_CTRL);
 }
 
-static ulong ti_pll_clk_set_rate(struct clk *clk, ulong rate)
+static long ti_pll_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct ti_pll_clk *pll = to_clk_pll(clk);
 	u64 current_freq;
 	u64 parent_freq = clk_get_parent_rate(clk);
diff --git a/drivers/clk/ti/clk-k3.c b/drivers/clk/ti/clk-k3.c
index cb7e016c637a..f2afc7e7ec91 100644
--- a/drivers/clk/ti/clk-k3.c
+++ b/drivers/clk/ti/clk-k3.c
@@ -257,9 +257,9 @@ static ulong ti_clk_get_rate(struct clk *clk)
 
 	return clk_get_rate(clkp);
 }
 
-static ulong ti_clk_set_rate(struct clk *clk, ulong rate)
+static long ti_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct ti_clk_data *data = dev_get_priv(clk->dev);
 	struct clk *clkp = data->map[clk->id].clk;
 	int div = 1;
diff --git a/drivers/clk/ti/clk-mux.c b/drivers/clk/ti/clk-mux.c
index 60bdde35e510..1b29f2149b76 100644
--- a/drivers/clk/ti/clk-mux.c
+++ b/drivers/clk/ti/clk-mux.c
@@ -99,9 +99,9 @@ static int clk_ti_mux_set_parent(struct clk *clk, struct clk *parent)
 	clk_ti_latch(&priv->reg, priv->latch);
 	return 0;
 }
 
-static ulong clk_ti_mux_set_rate(struct clk *clk, ulong rate)
+static long clk_ti_mux_set_rate(struct clk *clk, ulong rate)
 {
 	struct clk_ti_mux_priv *priv = dev_get_priv(clk->dev);
 	struct clk *parent;
 	int index;
diff --git a/drivers/clk/ti/clk-sci.c b/drivers/clk/ti/clk-sci.c
index fdf49a759983..08637c136ec5 100644
--- a/drivers/clk/ti/clk-sci.c
+++ b/drivers/clk/ti/clk-sci.c
@@ -83,9 +83,9 @@ static ulong ti_sci_clk_get_rate(struct clk *clk)
 
 	return current_freq;
 }
 
-static ulong ti_sci_clk_set_rate(struct clk *clk, ulong rate)
+static long ti_sci_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct ti_sci_clk_data *data = dev_get_priv(clk->dev);
 	const struct ti_sci_handle *sci = data->sci;
 	const struct ti_sci_clk_ops *cops = &sci->ops.clk_ops;
diff --git a/drivers/clk/uccf/clk-composite.c b/drivers/clk/uccf/clk-composite.c
index 0fdc8c2e6fec..a77646d4f3f3 100644
--- a/drivers/clk/uccf/clk-composite.c
+++ b/drivers/clk/uccf/clk-composite.c
@@ -57,9 +57,9 @@ static unsigned long clk_composite_recalc_rate(struct clk *clk)
 	else
 		return clk_get_parent_rate(clk);
 }
 
-static ulong clk_composite_set_rate(struct clk *clk, unsigned long rate)
+static long clk_composite_set_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk_composite *composite = to_clk_composite(clk_dev_binded(clk) ?
 		(struct clk *)dev_get_clk_ptr(clk->dev) : clk);
 	const struct clk_ops_uboot *rate_ops = composite->rate_ops;
diff --git a/drivers/clk/uccf/clk-divider.c b/drivers/clk/uccf/clk-divider.c
index 8d65fd94c176..f5ed2a9974b3 100644
--- a/drivers/clk/uccf/clk-divider.c
+++ b/drivers/clk/uccf/clk-divider.c
@@ -153,9 +153,9 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 
 	return min_t(unsigned int, value, clk_div_mask(width));
 }
 
-static ulong clk_divider_set_rate(struct clk *clk, unsigned long rate)
+static long clk_divider_set_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk_divider *divider = to_clk_divider(clk);
 	unsigned long parent_rate = clk_get_parent_rate(clk);
 	int value;
diff --git a/drivers/clk/uccf/clk.c b/drivers/clk/uccf/clk.c
index f04b3b23dbd1..ee410db76932 100644
--- a/drivers/clk/uccf/clk.c
+++ b/drivers/clk/uccf/clk.c
@@ -87,9 +87,9 @@ ulong ccf_clk_get_rate(struct clk *clk)
 		return err;
 	return clk_get_rate(c);
 }
 
-ulong ccf_clk_set_rate(struct clk *clk, unsigned long rate)
+long ccf_clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk *c;
 	int err = clk_get_by_id(clk->id, &c);
 
diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 3a4c9f6687f7..f10c402a3e47 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -172,9 +172,9 @@ static unsigned long uniphier_clk_get_rate(struct clk *clk)
 
 	return __uniphier_clk_get_rate(priv, data);
 }
 
-static unsigned long __uniphier_clk_set_rate(
+static long __uniphier_clk_set_rate(
 					struct uniphier_clk_priv *priv,
 					const struct uniphier_clk_data *data,
 					unsigned long rate, bool set)
 {
@@ -228,9 +228,9 @@ static unsigned long __uniphier_clk_set_rate(
 	return best_rate = __uniphier_clk_set_rate(priv, best_parent_data,
 						   rate, true);
 }
 
-static unsigned long uniphier_clk_set_rate(struct clk *clk, ulong rate)
+static long uniphier_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct uniphier_clk_priv *priv = dev_get_priv(clk->dev);
 	const struct uniphier_clk_data *data;
 
diff --git a/include/clk-uclass.h b/include/clk-uclass.h
index a26603bf2f0a..6272dbb35799 100644
--- a/include/clk-uclass.h
+++ b/include/clk-uclass.h
@@ -33,9 +33,9 @@ struct clk_ops_uboot {
 			struct ofnode_phandle_args *args);
 	int (*request)(struct clk *clock);
 	ulong (*round_rate)(struct clk *clk, ulong rate);
 	ulong (*get_rate)(struct clk *clk);
-	ulong (*set_rate)(struct clk *clk, ulong rate);
+	long (*set_rate)(struct clk *clk, ulong rate);
 	int (*set_parent)(struct clk *clk, struct clk *parent);
 	int (*enable)(struct clk *clk);
 	int (*disable)(struct clk *clk);
 #if IS_ENABLED(CONFIG_CMD_CLK)
diff --git a/include/clk.h b/include/clk.h
index 90b42a618675..3cd080b43264 100644
--- a/include/clk.h
+++ b/include/clk.h
@@ -501,9 +501,9 @@ ulong clk_round_rate(struct clk *clk, ulong rate);
  * @rate:	New clock rate in Hz.
  *
  * Return: new rate, or -ve error code.
  */
-ulong clk_set_rate(struct clk *clk, ulong rate);
+long clk_set_rate(struct clk *clk, ulong rate);
 
 /**
  * clk_set_parent() - Set current clock parent.
  * @clk:	A clock struct that was previously successfully requested by

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
