Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OBlK1AJvWkO5gIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Mar 2026 09:46:08 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE912D7685
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Mar 2026 09:46:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAF0BC87EBD;
	Fri, 20 Mar 2026 08:46:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F0AAC36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 08:46:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43b48ac2727so1310583f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 01:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773996365; cv=none;
 d=google.com; s=arc-20240605;
 b=Dwo5+FkTpNKDXDMSgJjUTSjBJeW++1LGa4Nb1DYjy7CCQhaUa7f3I9m0HW+oG03Vjw
 vc0v+yso2uY8St4gUBfPMw3A8lQaOviUy2ZZiAjlTmHAE8sPPjc/8ZZA7+4HCc59sMXv
 kOeAnUtPBd7/hjlhnDcoHo2b8yA/sJEi9IRnElohSd4cDMR5EB9hDtjv9L4/4ay7LvhK
 2TEPa0j6CL2LmotGG+TAXUQxmmRS/0c+xP0Zwqwoyk0WPBgX9Xe+rDdeXfqKq38LdROq
 l8qqQm81ifRzUSgYIYhkL7+VV7vzcPP4Hh++Ojh1RW7we6q5avY4/nvndhmxTHcUX8Fe
 rMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NzjrLGvYXwAoegWxWX8Fr18o2HG2OSxigt94VETtEG0=;
 fh=9MeHEasdXjeJ1JOu7JKzy5awz1aB5BWrDshxpvvo2qo=;
 b=KMH0VZSO9+qVOHufaeaAHZdNAYXTuSqEIKX3yfOifsxBXDldakl5D7buZunkCijdeE
 ROVkbvKSudmw8f/TH17U04Ky56GYEMS7/lGpMto/rXEnV9omBmcRZM6hEVWQj9IBmqBE
 AljbZIi663O4AqgJGmz9/Lt7QptuBrfaEK8IbrGfNTORDDVxg9fXNXZmodbPv3Kk9R71
 Qc0avbdxy/7rn/kopZAPP/qmTDSBnzd4FdKge7A3iNTlzH49z0wurOnrrWm0kAyU21m5
 5XgIdVPhUsBKnT0dc4BtzhCOUEZqNe0BF7aqpa+XowioV5WoTxBTCvzSns+r9UjwFFwY
 Yjqg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773996365; x=1774601165;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzjrLGvYXwAoegWxWX8Fr18o2HG2OSxigt94VETtEG0=;
 b=Tkgx6hqMi3c7RTor9mblQxqBeF8xXUCkaOS6+dmz2Bjz5F0iuDO23d6ISfBzyqkyAm
 gVuzK6qcEshICDYJW8cS1TXcQW2QRim4B67t+koo1apjqhGUMf+TKislpDi2eXaSNC5e
 dtzqWMfka00lYaDEBwCWHBHr02+R5hQ9aHWRrnP6GY+CAJWcbeZ8aBa6YFRn2lJsW1vT
 ZQK3kmxNGlI3mE9JEwpOlGkGzsyOwZw8XCnM47HeL2aIJA63rDWyoIBdpzw640NSi308
 WoXu7g9iWTwHgc7R49MnVd3YG3c3QaIlglydOa+7KnrC/0F6z20SST6MQ6K9o4aL/J+D
 uGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773996365; x=1774601165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NzjrLGvYXwAoegWxWX8Fr18o2HG2OSxigt94VETtEG0=;
 b=SoikS+Ux98TuhnFeYinDhl46GTzjGemcY7Y/OrDIj6i4cda7CVZ/FX6OJhcolJ9W0s
 wDasz0xK5a9DPVVyTQb3X8TyFYkKdu7ABP4BJrPfuIJYtwU+2n+2mgSo+EM81pleYkdo
 al3rWJ8rimnUZJNvXCpHvDUsJUcsHBhQOgyI1kuwWY7ttp+1qKNDKRyC0jSayhdC6CCY
 CDmnYPtsjM0sBPb/fu+dSQISumqZTn3JcAMLu5J5hJDChZ4J8++agvxL3inwDy7jvms9
 PxBJHA93HGc18OOyXAM0qXDdhTSaLFTi+KcG/oFiFVCEepgRmp5kYmnrkHK9keH/j82E
 lBCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIpojpW3LPo9IDOM9/Y31vg5A2NszEWf6WIM6ruAs8kWShtodsq8gNnaxk7HSEENKSEBZEubEcilRShg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzr5bm347SsDLdWTTMDpoqvO0WqUgDU37D28vF9cwq6enyY+N04
 t5NWW+f/ViOn6j0k4aTp/eu8gZJqK5645rqmOKS+BVr4pMkQ2uKYTypORV7mWzxRYFmdGRWU+TG
 WhA03P7E70ChbWtqi2PDOKY3Jx5r2CLM=
X-Gm-Gg: ATEYQzz1938PAXM0VVJgfzQWJ+zP8TZGB0IzMbDVKGLhGQeknGa3F3k7BON1qrnEnb+
 R8HHY6a0OetvJaEh1G8jppLWxRAgYmFGIeImOOZPLY893HjvlT1ksSGkJQQCtFFVYyb5xjwk3nh
 VFAlAICv1DqC7ZdE9uByP005h934Fo5Kthlycz8Lhet6RRB1fri19jEiB3+SQJkvjvYHSzja1o1
 nR5AsWY1FR0a8zKjdsI4xPw0SWEi/fYka9ekXHaB1Kag7n/BJNQ/Ywqhpc66k3QwZT4RyEpCizh
 YgcACp8y
X-Received: by 2002:a05:6000:1a8f:b0:43b:43ae:8c25 with SMTP id
 ffacd0b85a97d-43b64291eabmr3603207f8f.52.1773996365312; Fri, 20 Mar 2026
 01:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
In-Reply-To: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Mar 2026 10:45:52 +0200
X-Gm-Features: AaiRm51Mwbxlj-hl5Dpc9uqfgwctj4ALzZG2MKiLKqmxjj9fG2skgTxP_eci6f0
Message-ID: <CAPVz0n2zRSTj7iNDCA_ExnRtcf5s0fDkzu5KdNjDjyr8mDZbkg@mail.gmail.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Hal Feng <hal.feng@starfivetech.com>, u-boot-qcom@groups.io,
 David Lechner <dlechner@baylibre.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Stephen Boyd <swboyd@chromium.org>, Jens Reidel <adrian@mainlining.org>,
 Heiko Schocher <hs@nabladev.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 David Wronek <david.wronek@mainlining.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 u-boot-amlogic@groups.io, Sam Shih <sam.shih@mediatek.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Greg Malysa <malysagreg@gmail.com>,
 Simon Glass <sjg@chromium.org>, linux@analog.com,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, uboot-snps-arc@synopsys.com,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Tom Rini <trini@konsulko.com>, Peter Korsgaard <peter@korsgaard.com>,
 Philip Molloy <philip.molloy@analog.com>, Udit Kumar <u-kumar1@ti.com>,
 Romain Gantois <romain.gantois@bootlin.com>, Joel Stanley <joel@jms.id.au>,
 Dai Okamura <okamura.dai@socionext.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Paul Sajna <sajattack@postmarketos.org>, Paul Barker <paul@pbarker.dev>,
 Raymond Mao <raymondmaoca@gmail.com>, Jonathan Currier <dullfire@yahoo.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Robert Marko <robert.marko@sartura.hr>, Thierry Reding <treding@nvidia.com>,
 Shmuel Leib Melamud <smelamud@redhat.com>, Nishanth Menon <nm@ti.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Yao Zi <me@ziyao.cc>,
 Sam Day <me@samcday.com>, Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 Naman Trivedi <naman.trivedimanojbhai@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Weijie Gao <weijie.gao@mediatek.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, Andrew Davis <afd@ti.com>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Manorit Chawdhry <m-chawdhry@ti.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:casey.connolly@linaro.org,m:peng.fan@nxp.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:conor.dooley@microchip.com,m:finley.xiao@rock-chips.com,m:miquel.raynal@bootlin.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:hal.feng@starfivetech.com,m:u-boot-qcom@groups.io,m:dlechner@baylibre.com,m:Eugeniy.Paltsev@synopsys.com,m:swboyd@chromium.org,m:adrian@mainlining.org,m:hs@nabladev.com,m:BMC-SW@aspeedtech.com,m:ilias.apalodimas@linaro.org,m:gabriel.fernandez@foss.st.com,m:padmarao.begari@amd.com,m:david.wronek@mainlining.org,m:hayashi.kunihiko@socionext.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:seanga2@gmail.com,m:u-boot@lists.denx.de,m:manivannan.sadhasivam@linaro.org,m:u-boot-amlogic@groups.io,m:sam.shih@mediatek.com,m:michael@amarulasolutions.com,m:ansuelsmth@gmail.com,m:chenjh@rock-chips.com,m:Ryan.Wanner@microchip.com,m:iwamatsu@nigauri.org,m:senthilnathan.thangaraj@amd.com,m:zhangqing@rock-chips.com,m:minda.ch
 en@starfivetech.com,m:philipp.tomsich@vrull.eu,m:msp@baylibre.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:neil.armstrong@linaro.org,m:ryan_chen@aspeedtech.com,m:malysagreg@gmail.com,m:sjg@chromium.org,m:linux@analog.com,m:quic_varada@quicinc.com,m:liviu.dudau@foss.arm.com,m:quentin.schulz@cherry.de,m:uboot-snps-arc@synopsys.com,m:varshini.rajendran@microchip.com,m:luca.weiss@fairphone.com,m:manikandan.m@microchip.com,m:trini@konsulko.com,m:peter@korsgaard.com,m:philip.molloy@analog.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:joel@jms.id.au,m:okamura.dai@socionext.com,m:mikhail.kshevetskiy@iopsys.eu,m:sajattack@postmarketos.org,m:paul@pbarker.dev,m:raymondmaoca@gmail.com,m:dullfire@yahoo.com,m:ycliang@andestech.com,m:robert.marko@sartura.hr,m:treding@nvidia.com,m:smelamud@redhat.com,m:nm@ti.com,m:valentin.caron@foss.st.com,m:me@ziyao.cc,m:me@samcday.com,m:aswin.murugan@oss.qualcomm.com,m:naman.trivedimanojbhai@amd.com,m:uboot-stm32@s
 t-md-mailman.stormreply.com,m:marex@denx.de,m:jorge.ramirez@oss.qualcomm.com,m:ryder.lee@mediatek.com,m:loic.poulain@oss.qualcomm.com,m:jonas@kwiboo.se,m:weijie.gao@mediatek.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:balaji.selvanathan@oss.qualcomm.com,m:chunfeng.yun@mediatek.com,m:arturs.artamonovs@analog.com,m:sumit.garg@kernel.org,m:venkatesh.abbarapu@amd.com,m:vasileios.bimpikas@analog.com,m:GSS_MTK_Uboot_upstream@mediatek.com,m:yannick.fertre@foss.st.com,m:stephan.gerhold@linaro.org,m:afd@ti.com,m:rui.silva@linaro.org,m:patrick.delaunay@foss.st.com,m:m-chawdhry@ti.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,sntech.de,kernel.org,microchip.com,rock-chips.com,bootlin.com,aspeedtech.com,denx.de,starfivetech.com,groups.io,baylibre.com,synopsys.com,chromium.org,mainlining.org,nabladev.com,linaro.org,foss.st.com,amd.com,socionext.com,mailbox.org,gmail.com,lists.denx.de,mediatek.com,amarulasolutions.com,nigauri.org,vrull.eu,altera.com,analog.com,quicinc.com,foss.arm.com,cherry.de,fairphone.com,konsulko.com,korsgaard.com,ti.com,jms.id.au,iopsys.eu,postmarketos.org,pbarker.dev,yahoo.com,andestech.com,sartura.hr,nvidia.com,redhat.com,ziyao.cc,samcday.com,oss.qualcomm.com,st-md-mailman.stormreply.com,kwiboo.se,samsung.com,mentallysanemainliners.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[99];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_SPAM(0.00)[0.974];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 3AE912D7685
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

0YfRgiwgMTkg0LHQtdGALiAyMDI24oCv0YAuINC+IDIyOjU2IENhc2V5IENvbm5vbGx5IDxjYXNl
eS5jb25ub2xseUBsaW5hcm8ub3JnPiDQv9C40YjQtToKPgo+IFRoaXMgUkZDIHByb3ZpZGVzIGEg
cHJvb2Ygb2YgY29uY2VwdCBmb3IgdXNpbmcgdGhlIGZ1bGwgTGludXggQ0NGIGluCj4gVS1Cb290
IGFuZCBjb25zZXF1ZW50bHkgcG9ydGluZyBmdWxsIExpbnV4IGNsb2NrIGRyaXZlcnMgd2l0aCBl
eHRyZW1lbHkKPiBtaW5pbWFsIGNoYW5nZXMuCj4KCkhlbGxvIENhc2V5LAoKUGF0Y2hzZXQgaXMg
aW5jb21wbGV0ZSAoMzIgcGF0Y2hlcyBvbmx5KS4gU3BsaXQgaXQgdXAgaW50byBzbWFsbGVyIGNo
dW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJv
b3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vdWJvb3Qtc3RtMzIK
