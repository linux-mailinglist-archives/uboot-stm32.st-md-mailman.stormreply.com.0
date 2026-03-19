Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE8+MMQXwWmZQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5E2F03C1
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 188F6C8F264;
	Mon, 23 Mar 2026 10:36:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB563C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:57:14 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43b4f48c47cso1060696f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953834; x=1774558634;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJvm8hJq5dvTL5t+nuiKKxZ20+5uLhO/dmppj5+JcmU=;
 b=F/ObSq45B2aUh1ZgXoC2wjki4m/J/yfC40SPpqdcKcfPUGAGDzEW+smEhLpVaySvjN
 GbdoIWfAlygClcshnyogISbG+zVFdJ8OK+5lHRo0kKc9OMAYwpGPP4bwQ386cOx968j3
 GabejHKv6SHg1SnW5NB2yb/fv018iYqZggcbULxKeaUI3tyr2bf9YkYAl6w2KZyhDMC/
 Te6ipNTVz0jZnOd9pTJ82FAY9FL4ZM9B49gt6p11u57Lr/HgPQGvy8ONxYixYS9i4233
 vezV1kCTukDWH4+/J+EbtY6oPyTo0CnnDmtyhHsDoFVqqqvLevIBJJYU1NnbHlhQJCeX
 Ofvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953834; x=1774558634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OJvm8hJq5dvTL5t+nuiKKxZ20+5uLhO/dmppj5+JcmU=;
 b=fjiNf9xYauRWPItrk65lvplddStr2sko3W96o/9zwm0dnDL9Np+BIiu3uTSCBRnLu6
 jwOJ3rrwJl3ZffRFjp4E54tYsAEbOuMgXrr6aYaXrJZe5TYLAs6vHU+udggBWKR7IlXf
 kTyIuCJyX2mJ88OKcAiq6JfuhlhrXOJZY6/S0t6Awwd3Xrybf7kppGkS5zLKUWV7EMUA
 /0dy6ggDKPerxQsbheGjAf34Wl028gQWuXWnQhaR7PgEqj36DqTSZEWwkieCUxVXZajt
 RfvL8fbgs7tl/1Eal02gmJ92RmjQ/7CfFhbdK6hY9v2js4HZczt32sXF8ehB46BDBh+y
 ypug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT/9maH9Wdbx3f0bB+KWM97abSyeGUU48UB4vhVYZb6cexhzZmKj7sOAiLj/NHvXjwphla/N9fpRfxyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUNRxoDrWifwy3nsoCL0ha6mPZ/bNlezkpA8+PC4jC7bcJzrGB
 D3Ttr9Ia3h2WY9UULMXRyGQiAg+BXZAmRcsJtiIH3OvcZXgyDjnKKPRxGgptE9zFcwk=
X-Gm-Gg: ATEYQzzjYCGK46++anZqstqWjV+Mz/CbU80dDhUgEHKhm73MryYh8Mc+oQ6505ZAl5j
 FzOUBjjE0pEfffFmFwZA727oGhtWa50vGjTIXXMPUqfUUBXJUt+MbEwEmRvvtxo1s3FrDNcT58l
 LXa7SfYaaRIqubtypN4+DFP49qddgsI/F0i0uPwV6+w4e8hiE2IFEAUevPzazv1uxg+uTr3viZF
 h7m6/TW/TyjW1TWpbN4HuIoEWJDaY4nGz2X6+qFNAy7JDwOI8Npoc1o5focrOVP8XwpP0g1l74E
 p6335A0M2Wpu7CpgEL/jOAJj55aH0co3spfe/1pGauZ23nJQrXgX4OsOk71O+u0aW6xD0kGt06V
 s+zahr6+u62UmQgJ7mevM9+QxGsShs+cL5Mb7wqXysJVj8feMJHUxaYbQipCe1pxemvcDugps2c
 fwmnLKGgdb+Q9JvcxmAQvbrnqWhBfbqYddEV8bauq2N9AzaEMof1KXaR9B5lTUkE2ICzI=
X-Received: by 2002:a05:6000:22c7:b0:437:745f:a6b8 with SMTP id
 ffacd0b85a97d-43b642432d7mr1437628f8f.9.1773953834211; 
 Thu, 19 Mar 2026 13:57:14 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:57:13 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:27 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-5-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=5jwUMh0k+N1QnC8WW0D/qoE/XYGivWXyZ6pP2y+2UGs=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9ybwvjA6WOG9Zav4uzHiHZUrt3R5/MXmRHfcuf3j/9
 PjO69qHO0pZGAQ5GGTFFFnETyyzbFp72V5j+4ILMHNYmUCGMHBxCsBEFvEx/I/dz8bzxldfs27O
 qQ2/hFumnf/aclE7+bkQ36TMJw+al9Qx/DPkeqQ52V3YdcNpqzPhCc8VzhsHf3tx5ejPwB4t97m
 e94IB
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
Subject: [Uboot-stm32] [PATCH RFC 05/40] string: add strdup_const and
	kstrdup_const
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
X-Rspamd-Queue-Id: A7C5E2F03C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend Linux compat by adding kstrdup_const(), backed by lib/string.c.
This leverages U-Boots .rodata section on ARM64 to avoid pointlessly
duplicating const strings.

This is used by the Linux CCF_FULL port and may be useful elsewhere
in U-Boot.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 include/asm-generic/sections.h | 19 +++++++++++++++++++
 include/linux/compat.h         | 13 +++++++++++++
 include/linux/string.h         |  2 ++
 lib/string.c                   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index d59787948fd1..48bd4fa86043 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -8,8 +8,9 @@
 #ifndef _ASM_GENERIC_SECTIONS_H_
 #define _ASM_GENERIC_SECTIONS_H_
 
 #include <linux/types.h>
+#include <stdbool.h>
 
 /* References to section boundaries */
 
 extern char _text[], _stext[], _etext[];
@@ -61,8 +62,26 @@ static inline int arch_is_kernel_data(unsigned long addr)
 	return 0;
 }
 #endif
 
+/**
+ * is_kernel_rodata - checks if the pointer address is located in the
+ *                    .rodata section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .rodata, false otherwise.
+ */
+static inline bool is_kernel_rodata(unsigned long addr)
+{
+#ifdef CONFIG_ARM64
+	return addr >= (unsigned long)__start_rodata &&
+	       addr < (unsigned long)__end_rodata;
+#else
+	return false;
+#endif
+}
+
 /* U-Boot-specific things begin here */
 
 /* Start of U-Boot text region */
 extern char __text_start[];
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 623814516175..d4ba4d0088a0 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -66,8 +66,21 @@ static inline void vfree(const void *addr)
 {
 	free((void *)addr);
 }
 
+/**
+ * kstrdup_const - conditionally duplicate an existing const string
+ * @s: the string to duplicate
+ * @gfp: the GFP mask used in the kmalloc() call when allocating memory
+ *
+ * Note: Strings allocated by kstrdup_const should be freed by kfree_const and
+ * must not be passed to krealloc().
+ *
+ * Return: source string if it is in .rodata section otherwise
+ * fallback to kstrdup.
+ */
+#define kstrdup_const(s, gfp) strdup_const(s)
+
 struct kmem_cache { int sz; };
 
 struct kmem_cache *get_mem(int element_sz);
 #define kmem_cache_create(a, sz, c, d, e)	get_mem(sz)
diff --git a/include/linux/string.h b/include/linux/string.h
index d943fcce690c..a8a6cf4af505 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -103,8 +103,10 @@ size_t strcspn(const char *s, const char *reject);
 
 #ifndef __HAVE_ARCH_STRDUP
 extern char * strdup(const char *);
 extern char * strndup(const char *, size_t);
+extern const char *strdup_const(const char *s);
+extern void kfree_const(const void *x);
 #endif
 #ifndef __HAVE_ARCH_STRSWAB
 extern char * strswab(const char *);
 #endif
diff --git a/lib/string.c b/lib/string.c
index d56f88d4a847..302efe048b07 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -378,8 +378,39 @@ char * strndup(const char *s, size_t n)
 	new[len] = '\0';
 
 	return new;
 }
+
+/**
+ * strdup_const - conditionally duplicate an existing const string
+ * @s: the string to duplicate
+ *
+ * Note: Strings allocated by kstrdup_const should be freed by kfree_const and
+ * must not be passed to krealloc().
+ *
+ * Return: source string if it is in .rodata section otherwise
+ * fallback to kstrdup.
+ */
+const char *strdup_const(const char *s)
+{
+	if (is_kernel_rodata((unsigned long)s))
+		return s;
+
+	return strdup(s);
+}
+
+/**
+ * kfree_const - conditionally free memory
+ * @x: pointer to the memory
+ *
+ * Function calls kfree only if @x is not in .rodata section.
+ */
+void kfree_const(const void *x)
+{
+	if (!is_kernel_rodata((unsigned long)x))
+		free((void *)x);
+}
+
 #endif
 
 #ifndef __HAVE_ARCH_STRSPN
 /**

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
