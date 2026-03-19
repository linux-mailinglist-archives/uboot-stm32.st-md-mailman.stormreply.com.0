Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH4dDsUXwWmcQgQAu9opvQ:T2
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C512F044B
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB4FC90081;
	Mon, 23 Mar 2026 10:36:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DA36C87ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:59:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43b40003d13so893448f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953942; x=1774558742;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9xvrXcpZ8i0ywOmDf+Q4Z8hYkutdUIK0fivHIy7piVE=;
 b=nu7CgIJxjm+EoFCh08B4UnTVAZtIwcyoay9rR+/7QXOedH/RIrteJby2VIE7P8hZDT
 JwTJiRmx1Q8WWagnaM1Mtp+JyB7/xFPJ1utACssQMiejWwQIrD+9GcXvzdLhpqf4R1zS
 wfuMKXyYSPRaox9n9yAXjeLBfCnwVzJn+S3uropqxdrZxZjlBLQ1Vesi5zlRwwbmR5I+
 cO3e6eLEZjDp3Culc2aYhyPmXMN+t5itMv4BEFIIehc40jtq2Q18xDrMBSvR8VpYqnDQ
 yQ4j1NNnZ9oeuWut0KYPU8fsYiD29mQXhiP1EA5mhLamIE9E818xGl1O/hNzo2GSrnJJ
 bV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953942; x=1774558742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9xvrXcpZ8i0ywOmDf+Q4Z8hYkutdUIK0fivHIy7piVE=;
 b=gnCL9IXQbV1V2mGY4jfl4sf1Mbp0C2nuyABNu46pEyLdtewXjzfopCP4yKZ9jNWIk2
 YFNiMq90FZWJDgmXyTbWUJxmQ5/WrYcbiGHKVN0GL19Wd+UswZ5sKnYUpfx+u8jn5v5I
 aI2wd6izNHm8StgYFYXw74aOX7enoOPyne0nZi+xmPpXMpJKltBCwFV3Fm/DIBj5rcuH
 lCQowDsi2RH3AZVgudwz0nk046caFfyBFqwGRR1EYuu0PZi9NusxpA5gV1BMlXSpb44D
 RL8FToudq4ArL17RNlbzuQdyjXE5lyAcNSZWd4Duws28bLolxv+hOCQ1bhs1H6xEzO5N
 QXnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFScTJe4zp3q5xZDijGlhT2wcAvDv5g0BF/aIl+UaHDwyX660dfcvnl42iyCTJL35ZVfGwYm+oDQ6o9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyzk17EeKjby2m33rFMFz/Fb+RY1jgUOHvs3f9HInOg609Tx1pY
 gSoTUH4gvowuAv1deWqMp/fa4tsWdZ5IF/j3t5tY8+lSpDCN8TJOhlff31xVSceuLyo=
X-Gm-Gg: ATEYQzz97fekiyR6vdw28qYiRGiKTcEUXoy535zEDykEyU6KVVnHsaomMbpBZSDuL/E
 KIi2lvw3EPVjwzIWMtMmX4wybMriMY1H47bbCbWRetJGAHUDM1WD/72qObfY/Qlkxbop3YL/isE
 5WjjM30l2WJ2m9Vg4bBcmdu8RzBHfI5vO/f4Tewa/jWB9tlRqq7Px/kBySQX0S4Vyxaj/vKx7jV
 ATJzDVq5lzoOTB1UyHFfEh/5z+Vogli+lXhpsQvu4bNnQwr6xzh5S+oJZa8nQxVfIrUq3wE7B7f
 r5MnurHA7w99KhTEP0S4EBRDPLpP0AMLRyzJNy60TSsGyeEZsRq8JKcEsxkwZo5qA7r9rhIKPh9
 mE56Fkwg9FD2D4zexhkdmmP2ZrJbPl/fIRV3+7a1VLLD/rWL9/JS71aBZTfMs+HK9qAU8Qc2ZzM
 VEbwZUf1pox/TBLLuexrAI5v2kJYxkhsVv9Z84hBUin2My9fkg8TVSgoT6DkuKT1VUHPs=
X-Received: by 2002:a05:6000:40c7:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-43b64277ea7mr1269355f8f.25.1773953941616; 
 Thu, 19 Mar 2026 13:59:01 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:59:00 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:54 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-32-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8763;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=Qy527/8RecTsJ5eEbcqcHYJgzU6oqp8gpAtbhRyAq54=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yYIhip9/X98V8vZ6gt/M1bsMkljmKO/dFPHY9YP+s
 zLP6tU+HSUsDIIcDLJiiiziJ5ZZNq29bK+xfcEFmDmsTCBDGLg4BWAixx8wMuyW06wRcnqc4OMQ
 9vBu7bK6g1sYm3acWGV6lvGTze6vHu4M3/NSl8krzBOX63k8uyRW9MCUgnL3WNac6z3PzvyP/3n
 8BwA=
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
Subject: [Uboot-stm32] [PATCH RFC 32/40] clk/qcom: move existing clock
 drivers to clk/qcom/basic
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
X-Rspamd-Queue-Id: C9C512F044B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These drivers will be deprecated and removed in favour of CCF.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/qcom/Makefile                     | 28 ++++++---------------------
 drivers/clk/qcom/basic/Makefile               | 25 ++++++++++++++++++++++++
 drivers/clk/qcom/{ => basic}/clock-apq8016.c  |  0
 drivers/clk/qcom/{ => basic}/clock-apq8096.c  |  0
 drivers/clk/qcom/{ => basic}/clock-ipq4019.c  |  0
 drivers/clk/qcom/{ => basic}/clock-ipq5424.c  |  0
 drivers/clk/qcom/{ => basic}/clock-ipq9574.c  |  0
 drivers/clk/qcom/{ => basic}/clock-qcm2290.c  |  0
 drivers/clk/qcom/{ => basic}/clock-qcom.c     |  0
 drivers/clk/qcom/{ => basic}/clock-qcom.h     |  0
 drivers/clk/qcom/{ => basic}/clock-qcs404.c   |  0
 drivers/clk/qcom/{ => basic}/clock-qcs615.c   |  0
 drivers/clk/qcom/{ => basic}/clock-qcs8300.c  |  0
 drivers/clk/qcom/{ => basic}/clock-sa8775p.c  |  0
 drivers/clk/qcom/{ => basic}/clock-sc7280.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sdm845.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm6115.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm6350.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm7150.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm8150.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm8250.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm8550.c   |  0
 drivers/clk/qcom/{ => basic}/clock-sm8650.c   |  0
 drivers/clk/qcom/{ => basic}/clock-x1e80100.c |  0
 24 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 82a5b166196c..71b0bf7f44a7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -1,25 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0+
 #
-# (C) Copyright 2023 Linaro
+# (C) Copyright 2026 Linaro
 
-obj-y += clock-qcom.o
-obj-$(CONFIG_CLK_QCOM_SDM845) += clock-sdm845.o
-obj-$(CONFIG_CLK_QCOM_APQ8016) += clock-apq8016.o
-obj-$(CONFIG_CLK_QCOM_APQ8096) += clock-apq8096.o
-obj-$(CONFIG_CLK_QCOM_IPQ4019) += clock-ipq4019.o
-obj-$(CONFIG_CLK_QCOM_IPQ5424) += clock-ipq5424.o
-obj-$(CONFIG_CLK_QCOM_IPQ9574) += clock-ipq9574.o
-obj-$(CONFIG_CLK_QCOM_QCM2290) += clock-qcm2290.o
-obj-$(CONFIG_CLK_QCOM_QCS404) += clock-qcs404.o
-obj-$(CONFIG_CLK_QCOM_QCS8300) += clock-qcs8300.o
-obj-$(CONFIG_CLK_QCOM_QCS615) += clock-qcs615.o
-obj-$(CONFIG_CLK_QCOM_SA8775P) += clock-sa8775p.o
-obj-$(CONFIG_CLK_QCOM_SC7280) += clock-sc7280.o
-obj-$(CONFIG_CLK_QCOM_SM6115) += clock-sm6115.o
-obj-$(CONFIG_CLK_QCOM_SM6350) += clock-sm6350.o
-obj-$(CONFIG_CLK_QCOM_SM7150) += clock-sm7150.o
-obj-$(CONFIG_CLK_QCOM_SM8150) += clock-sm8150.o
-obj-$(CONFIG_CLK_QCOM_SM8250) += clock-sm8250.o
-obj-$(CONFIG_CLK_QCOM_SM8550) += clock-sm8550.o
-obj-$(CONFIG_CLK_QCOM_SM8650) += clock-sm8650.o
-obj-$(CONFIG_CLK_QCOM_X1E80100) += clock-x1e80100.o
+ifndef CONFIG_CLK_CCF_FULL
+obj-y += basic/
+else
+obj-y += ccf/
+endif
diff --git a/drivers/clk/qcom/basic/Makefile b/drivers/clk/qcom/basic/Makefile
new file mode 100644
index 000000000000..82a5b166196c
--- /dev/null
+++ b/drivers/clk/qcom/basic/Makefile
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# (C) Copyright 2023 Linaro
+
+obj-y += clock-qcom.o
+obj-$(CONFIG_CLK_QCOM_SDM845) += clock-sdm845.o
+obj-$(CONFIG_CLK_QCOM_APQ8016) += clock-apq8016.o
+obj-$(CONFIG_CLK_QCOM_APQ8096) += clock-apq8096.o
+obj-$(CONFIG_CLK_QCOM_IPQ4019) += clock-ipq4019.o
+obj-$(CONFIG_CLK_QCOM_IPQ5424) += clock-ipq5424.o
+obj-$(CONFIG_CLK_QCOM_IPQ9574) += clock-ipq9574.o
+obj-$(CONFIG_CLK_QCOM_QCM2290) += clock-qcm2290.o
+obj-$(CONFIG_CLK_QCOM_QCS404) += clock-qcs404.o
+obj-$(CONFIG_CLK_QCOM_QCS8300) += clock-qcs8300.o
+obj-$(CONFIG_CLK_QCOM_QCS615) += clock-qcs615.o
+obj-$(CONFIG_CLK_QCOM_SA8775P) += clock-sa8775p.o
+obj-$(CONFIG_CLK_QCOM_SC7280) += clock-sc7280.o
+obj-$(CONFIG_CLK_QCOM_SM6115) += clock-sm6115.o
+obj-$(CONFIG_CLK_QCOM_SM6350) += clock-sm6350.o
+obj-$(CONFIG_CLK_QCOM_SM7150) += clock-sm7150.o
+obj-$(CONFIG_CLK_QCOM_SM8150) += clock-sm8150.o
+obj-$(CONFIG_CLK_QCOM_SM8250) += clock-sm8250.o
+obj-$(CONFIG_CLK_QCOM_SM8550) += clock-sm8550.o
+obj-$(CONFIG_CLK_QCOM_SM8650) += clock-sm8650.o
+obj-$(CONFIG_CLK_QCOM_X1E80100) += clock-x1e80100.o
diff --git a/drivers/clk/qcom/clock-apq8016.c b/drivers/clk/qcom/basic/clock-apq8016.c
similarity index 100%
rename from drivers/clk/qcom/clock-apq8016.c
rename to drivers/clk/qcom/basic/clock-apq8016.c
diff --git a/drivers/clk/qcom/clock-apq8096.c b/drivers/clk/qcom/basic/clock-apq8096.c
similarity index 100%
rename from drivers/clk/qcom/clock-apq8096.c
rename to drivers/clk/qcom/basic/clock-apq8096.c
diff --git a/drivers/clk/qcom/clock-ipq4019.c b/drivers/clk/qcom/basic/clock-ipq4019.c
similarity index 100%
rename from drivers/clk/qcom/clock-ipq4019.c
rename to drivers/clk/qcom/basic/clock-ipq4019.c
diff --git a/drivers/clk/qcom/clock-ipq5424.c b/drivers/clk/qcom/basic/clock-ipq5424.c
similarity index 100%
rename from drivers/clk/qcom/clock-ipq5424.c
rename to drivers/clk/qcom/basic/clock-ipq5424.c
diff --git a/drivers/clk/qcom/clock-ipq9574.c b/drivers/clk/qcom/basic/clock-ipq9574.c
similarity index 100%
rename from drivers/clk/qcom/clock-ipq9574.c
rename to drivers/clk/qcom/basic/clock-ipq9574.c
diff --git a/drivers/clk/qcom/clock-qcm2290.c b/drivers/clk/qcom/basic/clock-qcm2290.c
similarity index 100%
rename from drivers/clk/qcom/clock-qcm2290.c
rename to drivers/clk/qcom/basic/clock-qcm2290.c
diff --git a/drivers/clk/qcom/clock-qcom.c b/drivers/clk/qcom/basic/clock-qcom.c
similarity index 100%
rename from drivers/clk/qcom/clock-qcom.c
rename to drivers/clk/qcom/basic/clock-qcom.c
diff --git a/drivers/clk/qcom/clock-qcom.h b/drivers/clk/qcom/basic/clock-qcom.h
similarity index 100%
rename from drivers/clk/qcom/clock-qcom.h
rename to drivers/clk/qcom/basic/clock-qcom.h
diff --git a/drivers/clk/qcom/clock-qcs404.c b/drivers/clk/qcom/basic/clock-qcs404.c
similarity index 100%
rename from drivers/clk/qcom/clock-qcs404.c
rename to drivers/clk/qcom/basic/clock-qcs404.c
diff --git a/drivers/clk/qcom/clock-qcs615.c b/drivers/clk/qcom/basic/clock-qcs615.c
similarity index 100%
rename from drivers/clk/qcom/clock-qcs615.c
rename to drivers/clk/qcom/basic/clock-qcs615.c
diff --git a/drivers/clk/qcom/clock-qcs8300.c b/drivers/clk/qcom/basic/clock-qcs8300.c
similarity index 100%
rename from drivers/clk/qcom/clock-qcs8300.c
rename to drivers/clk/qcom/basic/clock-qcs8300.c
diff --git a/drivers/clk/qcom/clock-sa8775p.c b/drivers/clk/qcom/basic/clock-sa8775p.c
similarity index 100%
rename from drivers/clk/qcom/clock-sa8775p.c
rename to drivers/clk/qcom/basic/clock-sa8775p.c
diff --git a/drivers/clk/qcom/clock-sc7280.c b/drivers/clk/qcom/basic/clock-sc7280.c
similarity index 100%
rename from drivers/clk/qcom/clock-sc7280.c
rename to drivers/clk/qcom/basic/clock-sc7280.c
diff --git a/drivers/clk/qcom/clock-sdm845.c b/drivers/clk/qcom/basic/clock-sdm845.c
similarity index 100%
rename from drivers/clk/qcom/clock-sdm845.c
rename to drivers/clk/qcom/basic/clock-sdm845.c
diff --git a/drivers/clk/qcom/clock-sm6115.c b/drivers/clk/qcom/basic/clock-sm6115.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm6115.c
rename to drivers/clk/qcom/basic/clock-sm6115.c
diff --git a/drivers/clk/qcom/clock-sm6350.c b/drivers/clk/qcom/basic/clock-sm6350.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm6350.c
rename to drivers/clk/qcom/basic/clock-sm6350.c
diff --git a/drivers/clk/qcom/clock-sm7150.c b/drivers/clk/qcom/basic/clock-sm7150.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm7150.c
rename to drivers/clk/qcom/basic/clock-sm7150.c
diff --git a/drivers/clk/qcom/clock-sm8150.c b/drivers/clk/qcom/basic/clock-sm8150.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm8150.c
rename to drivers/clk/qcom/basic/clock-sm8150.c
diff --git a/drivers/clk/qcom/clock-sm8250.c b/drivers/clk/qcom/basic/clock-sm8250.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm8250.c
rename to drivers/clk/qcom/basic/clock-sm8250.c
diff --git a/drivers/clk/qcom/clock-sm8550.c b/drivers/clk/qcom/basic/clock-sm8550.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm8550.c
rename to drivers/clk/qcom/basic/clock-sm8550.c
diff --git a/drivers/clk/qcom/clock-sm8650.c b/drivers/clk/qcom/basic/clock-sm8650.c
similarity index 100%
rename from drivers/clk/qcom/clock-sm8650.c
rename to drivers/clk/qcom/basic/clock-sm8650.c
diff --git a/drivers/clk/qcom/clock-x1e80100.c b/drivers/clk/qcom/basic/clock-x1e80100.c
similarity index 100%
rename from drivers/clk/qcom/clock-x1e80100.c
rename to drivers/clk/qcom/basic/clock-x1e80100.c

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
