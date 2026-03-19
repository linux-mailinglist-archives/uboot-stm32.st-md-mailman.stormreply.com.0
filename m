Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMfsB8UXwWmcQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C462F03D1
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E56AC8F273;
	Mon, 23 Mar 2026 10:36:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5177C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:57:38 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43b467dcf0bso1624626f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953858; x=1774558658;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IPZTkPmihzuAvcfZWVkcBaG4BgUinpIqzcMgHogzs9Y=;
 b=e48WR77e76HNiIqPoErFiaeg0uL1H1e1jTvaQdZ34TGxWlliwFHTYIn3I+E87egoAK
 +fgxQsvU4ZF9KL8RP687DcSnaH6pw2d7Khc5qHKRd5RrhYkTkZf/1EIi0va78C8Phopl
 bc9fZ6FGmX9O8pL8aT/0vaEMM+k+ebLwNH9rHsdn3VQU+LBr3hw8bF84QmvBwaDHIuXc
 CdHlmC6D4Ak2tBWaZzhrvc4Gha389jjfUM6bqXXEbFxRqJNWAjINM0oG5KT8mjs6acjL
 zMtqXil7JgMgrtwbZuGe0ua20GXbTIWlmqwoMWsG2vZy+A9gYiMfxv2EV7GYIVcNGDOQ
 mJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953858; x=1774558658;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IPZTkPmihzuAvcfZWVkcBaG4BgUinpIqzcMgHogzs9Y=;
 b=Qslf6L3aZAv/F0q3GXkqA+svZje7g5qSE9Q7Uv0st1fSxm5vPmqAsKaGZJfAfu9o+O
 YGkH7srOtZhMcs6JhL09cSykFr8keRMjmvIYhu4GWe5kS5NP9rAR5SY+07RBHT0vhgxT
 KwniCVfZBX2+pVT7cTeCcdy+avgetFHRETeqNcTtxUaIH7mLXdiYb0XiAcA3cNuY1udZ
 tCuF2Lc7n4HjCT6d6eB3hEHA7XEWUpG7hm5kjcDS8z0vbIXnpGKj6DuFz2a4Yt2Qryg2
 PfxkfjxPmwqLGbny54GzrWuKOgzxfAdCaUYcBcOi1E1SKd/wI4UCOHK8PN0uHNoKngXd
 +6ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmNtPFbn6OBlsv7ZKc3s9uRvWNYoHCNnqXamyLQ/Lv3GRO40XCj78DBkWMEtM9gaRIhbOJTlv80B5b3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yys1PBarYCON+TzmyKP/no1H0aay/CxSzMRRa5Ffkbht97WUKhw
 F2udNE4OhzIDifvP25pHoB4RqH4Kp9P00pp/4DeGfU03TPVm1Zk/GoEVML3gHcMjpHk=
X-Gm-Gg: ATEYQzzDjujHaHjeDZ28cJuUf2pGJJyyiDPQGjGrXGKg40/TUh0Rgg74iXz5ESz3F/e
 XDoIbx+DAXl8+B8szz65bFXBz2h3kE8+/iPvc4etgG/NempICU9q/HUntPZmnRaWAcFJRFh7mwI
 FDsj7Ue0WxBR6pVxK0gWBQxPZB8poBYWcyLO+ax29GkUfVv88RKcXVgeKEig/nmM5R/MX57ciIm
 k2gshXeUwV3hGu4dAWlGxm6m9foiINhewCFfscyuvUMqADmrKbIGgX1LnxjgBwva/viS0azKyeE
 Qome45JC6GIelMxmAbtW+N85ekcN+YF+MKiJ9itSSTTLywcfqpLH0k61dFMJoFDKZlAFtKZlcy9
 XeLmyxNwtg4N9mfx1Tq5qwriRCa0HP+BpXNZiaj+fcS8mX8tRsk1TS/CNR4CV25s8GvFZAdU0Ja
 6mi2yFuMMR8Esj2sDwxNJxg4PMK7fYYseIYywUo1bm5Et2mY969YVhhYzEm07PYLX/aGY=
X-Received: by 2002:a05:6000:2409:b0:439:c078:9a57 with SMTP id
 ffacd0b85a97d-43b6428769cmr1505763f8f.25.1773953858002; 
 Thu, 19 Mar 2026 13:57:38 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:57:37 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:33 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-11-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5758;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=0b2jzjydfkPAun+KPQliO692FtVj2RfqfyBqbUj4Fxw=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yXwen+ZN4K7YuPvskmBOs37ptUcvOZ87um/WobB9D
 D/CfdxbO0pZGAQ5GGTFFFnETyyzbFp72V5j+4ILMHNYmUCGMHBxCsBElvow/JUT0tG7f3+lYNfT
 nq4auRUfO174lGbeSDpwKevBWaXCzYkM/7SMeGs37pq5cRN37IXe+423/6XmfAz/t9Tkpp2aUu6
 PqfUA
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
Subject: [Uboot-stm32] [PATCH RFC 11/40] devres: add devm_krealloc
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,linaro.org:email,linaro.org:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E5C462F03D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Loosely based on the Linux version, this makes it possible to krealloc()
devm managed memory. Currently it depends on tracking the allocation
size in struct devres even when DEBUG_DEVRES is disabled, but it's a
relatively small tradeoff for the additional functionality.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/core/devres.c | 83 ++++++++++++++++++++++++++++++++++++++++++++-------
 include/dm/devres.h   | 10 +++++++
 2 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/drivers/core/devres.c b/drivers/core/devres.c
index 8df08b91021c..88f7c832f43e 100644
--- a/drivers/core/devres.c
+++ b/drivers/core/devres.c
@@ -45,18 +45,17 @@ struct devres {
 	dr_release_t			release;
 	enum devres_phase		phase;
 #ifdef CONFIG_DEBUG_DEVRES
 	const char			*name;
-	size_t				size;
 #endif
+	size_t				size;
 	unsigned long long		data[];
 };
 
 #ifdef CONFIG_DEBUG_DEVRES
-static void set_node_dbginfo(struct devres *dr, const char *name, size_t size)
+static void set_node_dbginfo(struct devres *dr, const char *name)
 {
 	dr->name = name;
-	dr->size = size;
 }
 
 static void devres_log(struct udevice *dev, struct devres *dr,
 		       const char *op)
@@ -64,9 +63,9 @@ static void devres_log(struct udevice *dev, struct devres *dr,
 	log_debug("%s: DEVRES %3s %p %s (%lu bytes)\n", dev->name, op, dr,
 		  dr->name, (unsigned long)dr->size);
 }
 #else /* CONFIG_DEBUG_DEVRES */
-#define set_node_dbginfo(dr, n, s)	do {} while (0)
+#define set_node_dbginfo(dr, n)	do {} while (0)
 #define devres_log(dev, dr, op)		do {} while (0)
 #endif
 
 #if CONFIG_DEBUG_DEVRES
@@ -84,9 +83,10 @@ void *_devres_alloc(dr_release_t release, size_t size, gfp_t gfp)
 		return NULL;
 
 	INIT_LIST_HEAD(&dr->entry);
 	dr->release = release;
-	set_node_dbginfo(dr, name, size);
+	dr->size = size;
+	set_node_dbginfo(dr, name);
 
 	return dr->data;
 }
 
@@ -99,23 +99,35 @@ void devres_free(void *res)
 		kfree(dr);
 	}
 }
 
-void devres_add(struct udevice *dev, void *res)
+static void devres_set_phase(struct udevice *dev, struct devres *dr)
 {
-	struct devres *dr = container_of(res, struct devres, data);
-
-	devres_log(dev, dr, "ADD");
-	assert_noisy(list_empty(&dr->entry));
 	if (dev_get_flags(dev) & DM_FLAG_PLATDATA_VALID)
 		dr->phase = DEVRES_PHASE_PROBE;
 	else if (dev_get_flags(dev) & DM_FLAG_BOUND)
 		dr->phase = DEVRES_PHASE_OFDATA;
 	else
 		dr->phase = DEVRES_PHASE_BIND;
+}
+
+void devres_add(struct udevice *dev, void *res)
+{
+	struct devres *dr = container_of(res, struct devres, data);
+
+	devres_log(dev, dr, "ADD");
+	assert_noisy(list_empty(&dr->entry));
+	devres_set_phase(dev, dr);
 	list_add_tail(&dr->entry, &dev->devres_head);
 }
 
+static void devres_replace(struct udevice *dev, struct devres *old, struct devres *new)
+{
+	devres_log(dev, old, "REPLACE");
+	devres_set_phase(dev, new);
+	list_replace(&old->entry, &new->entry);
+}
+
 void *devres_find(struct udevice *dev, dr_release_t release,
 		  dr_match_t match, void *match_data)
 {
 	struct devres *dr;
@@ -290,4 +302,55 @@ void devm_kfree(struct udevice *dev, void *p)
 
 	rc = devres_destroy(dev, devm_kmalloc_release, devm_kmalloc_match, p);
 	assert_noisy(!rc);
 }
+
+/**
+ * devm_krealloc - Resource-managed krealloc()
+ * @dev: Device to re-allocate memory for
+ * @ptr: Pointer to the memory chunk to re-allocate
+ * @new_size: New allocation size
+ * @gfp: Allocation gfp flags
+ *
+ * Managed krealloc(). Resizes the memory chunk allocated with devm_kmalloc().
+ * Behaves similarly to regular krealloc(): if @ptr is NULL or ZERO_SIZE_PTR,
+ * it's the equivalent of devm_kmalloc(). If new_size is zero, it frees the
+ * previously allocated memory and returns ZERO_SIZE_PTR. This function doesn't
+ * change the order in which the release callback for the re-alloc'ed devres
+ * will be called (except when falling back to devm_kmalloc() or when freeing
+ * resources when new_size is zero). The contents of the memory are preserved
+ * up to the lesser of new and old sizes.
+ */
+void *devm_krealloc(struct udevice *dev, void *ptr, size_t new_size, gfp_t gfp)
+{
+	struct devres *old_dr, *new_dr;
+
+	if (unlikely(!new_size)) {
+		devm_kfree(dev, ptr);
+		return NULL;
+	}
+
+	if (unlikely(!ptr))
+		return devm_kmalloc(dev, new_size, gfp);
+
+	old_dr = devres_find(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
+	if (!old_dr) {
+		printf("Devres realloc failed, memory chunk not managed or managed by a different device\n");
+		return NULL;
+	}
+
+	/* No need to realloc to shrink */
+	if (old_dr->size < new_size)
+		return old_dr->data;
+
+	new_dr = _devres_alloc(devm_kmalloc_release, new_size, gfp);
+	if (!new_dr)
+		return NULL;
+
+	devres_replace(dev, old_dr, new_dr);
+	memcpy(new_dr->data, old_dr->data,
+	       old_dr->size);
+
+	devres_free(old_dr->data);
+
+	return new_dr->data;
+}
diff --git a/include/dm/devres.h b/include/dm/devres.h
index 406d18686f4d..13d7d0eec43a 100644
--- a/include/dm/devres.h
+++ b/include/dm/devres.h
@@ -194,8 +194,18 @@ static inline void *devm_kcalloc(struct udevice *dev,
 {
 	return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
 }
 
+void *devm_krealloc(struct udevice *dev, void *ptr, size_t new_size, gfp_t gfp);
+
+static inline void *devm_krealloc_array(struct udevice *dev, void *p, size_t new_n, size_t new_size, gfp_t flags)
+{
+	if (new_size != 0 && new_n > SIZE_MAX / new_size)
+		return NULL;
+
+	return devm_krealloc(dev, p, new_n * new_size, flags);
+}
+
 /**
  * devm_kfree() - Resource-managed kfree
  * @dev: Device this memory belongs to
  * @ptr: Memory to free

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
