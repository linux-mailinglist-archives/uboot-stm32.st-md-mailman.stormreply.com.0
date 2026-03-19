Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5Xn3NcYXwWm5QgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 851042F043C
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34EF8C8F29B;
	Mon, 23 Mar 2026 10:36:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7C44C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-486b96760easo15185975e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953926; x=1774558726;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mw5badEuNe3CrA0BAnPAn55maOsXGTags+TNv5L2MA4=;
 b=TUSRoKVvZoVqTq4RxDQVzoyQ3R1rvGtnAMQTZwH4FZmIpBj1WaedavP9jQcLAIWXpq
 ro2reDFS2UewSe1Rr4ljLgUp/6o7H5QxcqwgcqNZGFrC8690GD9ky+7QMf/d38pKWCnK
 u1OUChL3XjOIHkz7TlOPabuyhTdZduNruoRo4CF/1KiEPVU6ZRuNH8O9uIZ9pd0kQcZ4
 7H420d5t8jb8aqOCly9RyY7NdyBEROJpFDND09XqnjfHepopQx1IwuqrEyezOtXwZ/lH
 UCRoTdhTqhB9MEsKo4m9fkK4Fvk1tbwRaRHTUTCf5BKqL2Xsm5TuiatfwTl69znsIu3U
 wpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953926; x=1774558726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mw5badEuNe3CrA0BAnPAn55maOsXGTags+TNv5L2MA4=;
 b=FjIoqA2VijvSFRT/rcaTCv/jK77j1hu+LKeKuZaj8EI6f6xLxN01Ot0qFqmhLYTB4E
 0E/E4bxmd0yV7K2ZHc2ioO/pGHF7eTBGNknKFzy9A8H5Ct0XenMmMcfJZy02LiicAg3M
 AN/MiMy5LTzTD06HBLA1KFjbbSOxbvk1Ioy39IA8r3y3oOiOapu7pTyRuHBRGOUCu//7
 uI1V4aABBUcaySI4dAoRrJknpJ2H8uNeWRGT7Qb1+t5NSkChN+kA3Riiwg6Ria4R7qAA
 58mu0rqOoTfmHB1zjlrpk/BW5LA4giQCyVBEUDZlJ3+5O5aQHiE9B1l9Ckd6w7YAvqGP
 7vWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJUjdr9zBJfBeucr/dgTLJPnFpJAbvruUNzjW6TuLUuqQEmOowd0HH3nVJtUYtddP0GpOdQZ5WzBnCTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YynIAWS9Rhv0WHmg1a0AE6WygaU6Ko3IbOxB5CcZ8aYew6vXeKU
 My2lDPOIbW0fjxb+w4M5RVXU3kHGL9gRHyjlI6rQ0N932gi2o9jIXEALQOk88Led640=
X-Gm-Gg: ATEYQzwJpUJ5AJRw4wi/mBXJVphpOCvtPkiUriSEiBMbr2OBQs8V+6QzqVL3nKQVK04
 a0NY34q9U35ge6mMT9d2SWRhp7rSmYTfiIxbbf9x3l3w3eUYAz7Q+b6CgwfywIayGaW60a/H1DV
 P9Te/wrqitURbnsIhkv0txz1HSmssD9XG5/OUOofjABgKmsrxEtOcW25MO+HxGTbIRzsT434j4m
 SIpNj76J3s/MYcz8m+TqwGWrrUOEvbZb2UmSLsL9lmco4xT4bYedyZx1iP8KAQik+APHyNsfGy6
 aWpXzU7ikM8D1RxS313zEbLVnQPGwjJkYNi5NLU7YxSBB+TcV6Rzg2Wi9A88oqiCOjr4zgBjUpZ
 KXcZEBioAfQ4NPNk5nMZfks6gkxWFSB0Z4XJ6NtT0sYbBwwViWCgmZxsD6HxT7C0nkLRIBNDgrG
 tAzPeM4yP9jQiY6GBZd9yDxKwlNCxTdgTdDLA6EAx1cvgXNiQtRj6JE6DEsmo5MNUj0HE=
X-Received: by 2002:a05:600c:4750:b0:485:3812:36dc with SMTP id
 5b1f17b1804b1-486fedbd0bbmr8054725e9.9.1773953926120; 
 Thu, 19 Mar 2026 13:58:46 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:45 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:50 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-28-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11289;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=j3qwhkeGh+bMPbESDj72o0O96bvue2HzZkd+eSfDkdA=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yQLqJvrJk6fmBmvOtP/v+Pby//XJlr56jBOr122Tt
 PlaUl3RUcrCIMjBICumyCJ+Ypll09rL9hrbF1yAmcPKBDKEgYtTACZincLwi6nL/vrE7Y3nuIPX
 dAW7xT6dabCiYYmVAqdx+Hbem25C8xgZ5ngHTttzPTc7vE1BdFFcaMMshuUrSnNPGHo37nSqezt
 JGQA=
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
Subject: [Uboot-stm32] [PATCH RFC 28/40] clk/sandbox: add a CCF_FULL port of
	clk_sandbox
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 851042F043C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is based on the uCCF version with trivial changes to use the full
CCF API and demonstrate how clk drivers can be ported from U-Boot CCF to
full CCF.

Notably, the line count drops by about 20% with the removal of the
different U_BOOT_DRIVER definitions. It also becomes possible to
register clocks with direct references to their parent clocks, avoiding
the need for global string lookups.

The test dts is also updated to give the clk-ccf device a proper handle
to the fixed osc clock, enabling proper lookup via the clock-names DT
property.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 arch/sandbox/dts/test.dts              |   4 +-
 arch/sandbox/include/asm/clk.h         |   2 +-
 drivers/clk/ccf/Makefile               |   1 +
 drivers/clk/ccf/clk_sandbox_ccf_full.c | 220 +++++++++++++++++++++++++++++++++
 drivers/clk/clk_sandbox.c              |  43 ++++++-
 include/sandbox-clk.h                  |   3 +
 6 files changed, 270 insertions(+), 3 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 762c1d9bbe29..5c9eb3f6f8eb 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -635,9 +635,9 @@
 			clock-mult = <2>;
 			clocks = <&clk_fixed>;
 		};
 
-		osc {
+		xo_board: osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <20000000>;
 		};
@@ -678,8 +678,10 @@
 	};
 
 	ccf: clk-ccf {
 		compatible = "sandbox,clk-ccf";
+		clocks = <&xo_board>;
+		clock-names = "osc";
 		#clock-cells = <1>;
 	};
 
 	efi-media {
diff --git a/arch/sandbox/include/asm/clk.h b/arch/sandbox/include/asm/clk.h
index 37fe49c7fcf6..c67ea92d3331 100644
--- a/arch/sandbox/include/asm/clk.h
+++ b/arch/sandbox/include/asm/clk.h
@@ -145,9 +145,9 @@ ulong sandbox_clk_test_round_rate(struct udevice *dev, int id, ulong rate);
  * @dev:	The sandbox clock test (client) device.
  * @id:		The test device's clock ID to configure.
  * @return:	The new rate of the clock.
  */
-ulong sandbox_clk_test_set_rate(struct udevice *dev, int id, ulong rate);
+long sandbox_clk_test_set_rate(struct udevice *dev, int id, ulong rate);
 /**
  * sandbox_clk_test_enable - Ask the sandbox clock test device to enable a
  * clock.
  *
diff --git a/drivers/clk/ccf/Makefile b/drivers/clk/ccf/Makefile
index 39879b34e645..e831666ccdb9 100644
--- a/drivers/clk/ccf/Makefile
+++ b/drivers/clk/ccf/Makefile
@@ -15,4 +15,5 @@ obj-y += clk.o \
 
 obj-$(CONFIG_CLK_COMPOSITE_CCF) += clk-composite.o
 
 obj-$(CONFIG_CLK_CCF_FULL_COMPAT) += compat.o
+obj-$(CONFIG_SANDBOX_CLK_CCF) += clk_sandbox_ccf_full.o
diff --git a/drivers/clk/ccf/clk_sandbox_ccf_full.c b/drivers/clk/ccf/clk_sandbox_ccf_full.c
new file mode 100644
index 000000000000..921948022d91
--- /dev/null
+++ b/drivers/clk/ccf/clk_sandbox_ccf_full.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ *
+ * Common Clock Framework [CCF] driver for Sandbox
+ */
+
+#include <dm.h>
+#include <clk.h>
+#include <malloc.h>
+#include <asm/clk.h>
+#include <clk-uclass.h>
+#include <dm/devres.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <sandbox-clk.h>
+#include <linux/err.h>
+
+/*
+ * Sandbox implementation of CCF primitives necessary for clk-uclass testing
+ *
+ * --- Sandbox PLLv3 ---
+ */
+struct clk_pllv3 {
+	struct clk_hw	clk;
+	u32		div_mask;
+	u32		div_shift;
+};
+
+#if CONFIG_IS_ENABLED(UNIT_TEST)
+int clk_get_enable_count(struct clk *clk);
+#else
+#define clk_get_enable_count(clk) 0
+#endif
+
+int sandbox_clk_enable_count(struct clk *clk)
+{
+	return clk_get_enable_count(clk);
+}
+
+static ulong clk_pllv3_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	return parent_rate * 24;
+}
+
+static const struct clk_ops clk_pllv3_generic_ops = {
+	.recalc_rate       = clk_pllv3_recalc_rate,
+};
+
+static struct clk_hw *sb_clk_pllv3(enum sandbox_pllv3_type type, ofnode node, const char *name,
+			      const char *parent_name, void __iomem *base,
+			      u32 div_mask)
+{
+	struct clk_pllv3 *pll;
+	struct clk_hw *hw;
+	struct clk_init_data init = { 0 };
+	int ret;
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	pll->div_mask = div_mask;
+	hw = &pll->clk;
+	hw->init = &init;
+
+	init.name = name;
+	init.ops = &clk_pllv3_generic_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_data = &(struct clk_parent_data){
+		.fw_name = parent_name,
+	};
+	init.num_parents = 1;
+
+	ret = of_clk_hw_register(node, hw);
+	if (ret) {
+		kfree(pll);
+		return ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+/* --- Sandbox PLLv3 --- */
+
+struct clk_hw *sandbox_clk_composite(const char *name,
+				  const char * const *parent_names,
+				  int num_parents, void __iomem *reg,
+				  unsigned long flags)
+{
+	struct clk_hw *hw = ERR_PTR(-ENOMEM);
+	struct clk_divider *div = NULL;
+	struct clk_gate *gate = NULL;
+	struct clk_mux *mux = NULL;
+
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		goto fail;
+
+	mux->reg = reg;
+	mux->shift = 24;
+	mux->mask = 0x7;
+	mux->flags = flags;
+
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		goto fail;
+
+	div->reg = reg;
+	div->shift = 16;
+	div->width = 3;
+	div->flags = CLK_DIVIDER_ROUND_CLOSEST | flags;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		goto fail;
+
+	gate->reg = reg;
+	gate->bit_idx = 28;
+	gate->flags = flags;
+
+	hw = clk_hw_register_composite(NULL, name,
+				     parent_names, num_parents,
+				     &mux->hw, &clk_mux_ops, &div->hw,
+				     &clk_divider_ro_ops,
+				     &gate->hw, &clk_gate_ops, flags);
+	if (IS_ERR(hw))
+		goto fail;
+
+	return hw;
+
+fail:
+	kfree(gate);
+	kfree(div);
+	kfree(mux);
+	return ERR_CAST(hw);
+}
+
+/* --- Sandbox Gate --- */
+/* The CCF core driver itself */
+static const struct udevice_id sandbox_clk_ccf_test_ids[] = {
+	{ .compatible = "sandbox,clk-ccf" },
+	{ }
+};
+
+static const char *const usdhc_sels[] = { "pll3_60m", "pll3_80m", };
+static const char *const i2c_sels[] = { "pll3_60m", "pll3_80m", };
+
+static int sandbox_clk_ccf_probe(struct udevice *dev)
+{
+	ofnode node = dev_ofnode(dev);
+	struct clk_hw_onecell_data *data;
+	struct clk_hw **clks;
+	void *base = NULL;
+	u32 reg;
+	u32 *clk_regs;
+
+	data = devm_kzalloc(dev, sizeof(*data) + sizeof(struct clk_hw) * SANDBOX_CLK_MAX, __GFP_ZERO);
+	if (!data)
+		return -ENOMEM;
+
+	clk_regs = devm_kzalloc(dev, sizeof(u32) * SANDBOX_CLK_MAX, __GFP_ZERO);
+	if (!clk_regs)
+		return -ENOMEM;
+
+	data->num = SANDBOX_CLK_MAX;
+	clks = data->hws;
+
+	clks[SANDBOX_CLK_PLL3] = sb_clk_pllv3(SANDBOX_PLLV3_USB, node, "pll3_usb_otg", "osc",
+				     base + 0x10, 0x3);
+
+	clks[SANDBOX_CLK_PLL3_60M] =
+		clk_hw_register_fixed_factor_parent_hw(dev, "pll3_60m",
+						       clks[SANDBOX_CLK_PLL3],
+						       CLK_SET_RATE_PARENT, 1, 8);
+	
+	clks[SANDBOX_CLK_PLL3_80M] =
+		clk_hw_register_fixed_factor_parent_hw(dev, "pll3_80m",
+						       clks[SANDBOX_CLK_PLL3],
+						       CLK_SET_RATE_PARENT, 1, 6);
+
+	/* The HW adds +1 to the divider value (2+1) is the divider */
+	clk_regs[SANDBOX_CLK_ECSPI_ROOT] = (2 << 19);
+	clks[SANDBOX_CLK_ECSPI_ROOT] = clk_hw_register_divider_parent_hw(dev, "ecspi_root", clks[SANDBOX_CLK_PLL3_60M],
+									 CLK_SET_RATE_PARENT, &clk_regs[SANDBOX_CLK_ECSPI_ROOT], 19, 6, CLK_DIVIDER_READ_ONLY);
+	clk_regs[SANDBOX_CLK_ECSPI0] = 0;
+	clks[SANDBOX_CLK_ECSPI0] = clk_hw_register_gate_parent_hw(dev, "ecspi0", clks[SANDBOX_CLK_ECSPI_ROOT],
+								  CLK_SET_RATE_PARENT, &clk_regs[SANDBOX_CLK_ECSPI0], 0, 0);
+
+	clks[SANDBOX_CLK_ECSPI1] = clk_hw_register_gate_parent_hw(dev, "ecspi1", clks[SANDBOX_CLK_ECSPI_ROOT], CLK_SET_RATE_PARENT, base + 0x6c, 0, 0);
+
+	/* Select 'pll3_60m' */
+	reg = 0;
+	clk_regs[SANDBOX_CLK_USDHC1_SEL] = 0;
+	clks[SANDBOX_CLK_USDHC1_SEL] = clk_hw_register_mux(dev, "usdhc1_sel", usdhc_sels, ARRAY_SIZE(usdhc_sels),
+							   CLK_SET_RATE_NO_REPARENT, &clk_regs[SANDBOX_CLK_USDHC1_SEL], 16, 1, 0);
+
+	/* Select 'pll3_80m' */
+	clk_regs[SANDBOX_CLK_USDHC2_SEL] = BIT(17);
+	clks[SANDBOX_CLK_USDHC2_SEL] = clk_hw_register_mux(dev, "usdhc2_sel", usdhc_sels, ARRAY_SIZE(usdhc_sels),
+							   CLK_SET_RATE_NO_REPARENT, &clk_regs[SANDBOX_CLK_USDHC2_SEL], 17, 1, 0);
+
+	clk_regs[SANDBOX_CLK_I2C] = BIT(28) | BIT(24) | BIT(16);
+	clks[SANDBOX_CLK_I2C] = sandbox_clk_composite("i2c", i2c_sels, ARRAY_SIZE(i2c_sels),
+					 &clk_regs[SANDBOX_CLK_I2C], CLK_SET_RATE_UNGATE);
+		   
+
+	clk_regs[SANDBOX_CLK_I2C_ROOT] = 0;
+	clks[SANDBOX_CLK_I2C_ROOT] = clk_hw_register_gate(dev, "i2c_root", "i2c", 0, &clk_regs[SANDBOX_CLK_I2C_ROOT], 0, 0);
+
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
+}
+
+U_BOOT_DRIVER(sandbox_clk_ccf_full) = {
+	.name = "sandbox_clk_ccf_full",
+	.id = UCLASS_NOP,
+	.probe = sandbox_clk_ccf_probe,
+	.of_match = sandbox_clk_ccf_test_ids,
+};
diff --git a/drivers/clk/clk_sandbox.c b/drivers/clk/clk_sandbox.c
index 667526810fc2..36ca128892b5 100644
--- a/drivers/clk/clk_sandbox.c
+++ b/drivers/clk/clk_sandbox.c
@@ -165,9 +165,10 @@ int sandbox_clk_query_requested(struct udevice *dev, int id)
 		return -EINVAL;
 	return priv->requested[id];
 }
 
-int clk_fixed_rate_of_to_plat(struct udevice *dev)
+#if !CONFIG_IS_ENABLED(CLK_CCF_FULL)
+static int clk_fixed_rate_of_to_plat(struct udevice *dev)
 {
 	struct clk_fixed_rate *cplat;
 
 #if CONFIG_IS_ENABLED(OF_PLATDATA)
@@ -196,4 +197,44 @@ U_BOOT_DRIVER(sandbox_fixed_clock) = {
 	.plat_auto = sizeof(struct sandbox_clk_fixed_rate_plat),
 	.ops = &clk_fixed_rate_ops,
 	.flags = DM_FLAG_PRE_RELOC,
 };
+#else
+static int clk_fixed_rate_probe(struct udevice *dev)
+{
+	ofnode node = dev_ofnode(dev);
+	const char *clk_name;
+	struct clk_hw *hw;
+	u32 rate = 0;
+	int ret;
+
+	ofnode_read_u32(node, "clock-frequency", &rate);
+
+	clk_name = ofnode_read_string(node, "clock-output-names");
+	if (!clk_name)
+		clk_name = ofnode_get_name(node);
+
+	hw = clk_hw_register_fixed_rate(dev, clk_name, NULL, 0, rate);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
+	if (ret) {
+		clk_hw_unregister_fixed_rate(hw);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct udevice_id sandbox_clk_fixed_rate_match[] = {
+	{ .compatible = "sandbox,fixed-clock" },
+	{ /* sentinel */ }
+};
+
+U_BOOT_DRIVER(sandbox_fixed_clock) = {
+	.name = "sandbox_fixed_clock",
+	.id = UCLASS_NOP,
+	.of_match = sandbox_clk_fixed_rate_match,
+	.probe = clk_fixed_rate_probe,
+};
+#endif
diff --git a/include/sandbox-clk.h b/include/sandbox-clk.h
index eb02a474c741..fd16aacf1a73 100644
--- a/include/sandbox-clk.h
+++ b/include/sandbox-clk.h
@@ -20,8 +20,11 @@ enum {
 	SANDBOX_CLK_USDHC1_SEL,
 	SANDBOX_CLK_USDHC2_SEL,
 	SANDBOX_CLK_I2C,
 	SANDBOX_CLK_I2C_ROOT,
+
+	_SANDBOX_CLK_MAX,
+	SANDBOX_CLK_MAX = _SANDBOX_CLK_MAX,
 };
 
 enum sandbox_pllv3_type {
 	SANDBOX_PLLV3_GENERIC,

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
