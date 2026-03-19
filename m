Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO7/FMYXwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529B2F0420
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6AEFC8F296;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF14C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so797664f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953906; x=1774558706;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=geeTFJxfIoKH4agH5iM4UtAr30/4Md9xbBZc/3+TNDE=;
 b=RIeBP6TcuYVrfhpOMyslOVU+dmeWaFhw/2VaHkqziMqcBS7zpRSaQUHwfw6aBY4W22
 dOtV8p6+4CcdrT+bfF9E4Uzcd7SfBRxzaa+IN96GZ7cuiXQKAH/3o60SC44bbLiAHWcv
 wjRUtmx6zMUaE+hVB5FA1wBr/wAg/lKXaUqCsOqL7dZYGSSctTlWZHZcq/JKyJD3+fwb
 R0biZqx9nS7f0iNWkhHrhXwcNbbDs4JNP8ApKi8Ei2dAZx6kmm3WiUE6m9Gwc6/tL4cH
 hxvvvhTtT5b3fuC6Hj0x5gDoTZJHv4+fnzl/KzbjBba8vdXLtxf4hsv/nEtg4KhEjhvg
 gH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953906; x=1774558706;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=geeTFJxfIoKH4agH5iM4UtAr30/4Md9xbBZc/3+TNDE=;
 b=GU34kPRmzvZE8ckxYXjRbQmzreKhvjcYJpxXSX3RSmSA80+oDmsx8/SvrohN00k0C5
 9dmKaxiIl8XJjp3PNIRjAjM5f9cKpZU0ZifzcpXzllLm0C/wqEbHwFuhyD8BIsdp/x34
 +9dKOHxLzTddyA5OibLoVeYhihASU+qm41NBs1ylno1N/LTsH1GMEijrYLucCWmIDAkt
 0NkA3TSiQAE0codQ/D+QXgPiRzO1bvm1K55pQjsXOKtf2aqUR9PSsFDpDIz7HuzL+4yp
 NXaLRTs/3sDkfcARurxFe0xjfyoslLe1dwtVr3Ua1QR0CGyA0hlBzrjE+JkVa0cqi5MV
 U/+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUki+WnhnxuUOTySrc6ac3elA6fc5xy1W56dvw6TiVEXKdemzlRHvnO8F6h+6aj9ncLfQx1xLY26/ynWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEuPD2bvFY15qNmdr0Vih5WInF9akUxNEaVSySW7kxAnwRiUM8
 BHMTNw3vMe6gx4YM3WqPNUqFohDI4Jgb1fz6Azof0DxCA2pfFB7DWooTOg8coNwCg/g=
X-Gm-Gg: ATEYQzz0N49wJPIjEaL50dIFgTuyq92WJaVGTd7t3JFd9bdSFRd7h1gg+elliS1YpHd
 ZCkNyhtb8gjhXJnCVb+0IcfZqknJNS6EIpPTowYiQoKTq+ORulP636zE3o1DdP7O3Gb8PljD8Sk
 AdcSBLkIE6YTLpdwetyy6udchHJ2oYwN43rWsceWa3N0gGAGoeOsjQNq+LR/Pi3unrHkHfX3GI+
 IO1td95g1TtsKaUXYRX/CnOd4J0GbbKI04YsgTweHtGRqJeWJBW2poFx+jHRNJx2GynBw2IxSsY
 iY31Lf1wiLsu/bR9fSfgnAuB1VkgEzH4ihREBhpc0pJOXvVwhL/mw/E+D36F+HEvc9Z48cABTNh
 p1ztYzME7imDUGhGWqY09QhQv39oKqPtrlNFleYs2log1gMgKmE2dZY8UjlozbIRc6plRh9fs7h
 R09MS33454wxOogT+jNDkE7iwZOvi3Pb/6eFhjQBpvAddy5GOdGfwFXputVSTbYEdTh48=
X-Received: by 2002:a05:6000:2f84:b0:43b:464a:28de with SMTP id
 ffacd0b85a97d-43b64243b0dmr1202144f8f.14.1773953906364; 
 Thu, 19 Mar 2026 13:58:26 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:25 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:45 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-23-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7465;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=roeni2Z1q01ICrw8UsZIOklSexsFxp8L4nYGbj+0P6Q=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yQL2y51qVykGJ5bm/g4Oi571M+FvcbJunqhzq8T7q
 7u4nGU7SlkYBDkYZMUUWcRPLLNsWnvZXmP7ggswc1iZQIYwcHEKwESS1Rn+cLrdDCo7P60kp/yp
 CP9lXbndodcNvK462bCuWLe3VPneJ4b/FanRnEUrFRU3t7zOVZ3OvVDU0onlrpL/R479X4If3da
 YAQA=
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
Subject: [Uboot-stm32] [PATCH RFC 23/40] clk/ccf: adapt clk-conf for U-Boot
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email,linaro.org:mid,samsung.com:email,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 0529B2F0420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Basic changes to adapt clk-conf to build properly on U-Boot

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/ccf/clk-conf.c   | 84 ++++++++++++++++++++++++--------------------
 include/linux/clk/clk-conf.h | 12 +++----
 2 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/ccf/clk-conf.c b/drivers/clk/ccf/clk-conf.c
index 303a0bb26e54..7b29562e297c 100644
--- a/drivers/clk/ccf/clk-conf.c
+++ b/drivers/clk/ccf/clk-conf.c
@@ -3,66 +3,65 @@
  * Copyright (C) 2014 Samsung Electronics Co., Ltd.
  * Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
 
-#include <linux/clk.h>
+#include <dm/ofnode.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/clk-conf.h>
+#include <linux/compat.h>
 #include <linux/device.h>
-#include <linux/of.h>
 #include <linux/printk.h>
-#include <linux/slab.h>
 
-static int __set_clk_parents(struct device_node *node, bool clk_supplier)
+static int __set_clk_parents(ofnode node, bool clk_supplier)
 {
-	struct of_phandle_args clkspec;
+	struct ofnode_phandle_args clkspec;
 	int index, rc, num_parents;
 	struct clk *clk, *pclk;
 
-	num_parents = of_count_phandle_with_args(node, "assigned-clock-parents",
-						 "#clock-cells");
+	num_parents = ofnode_count_phandle_with_args(node, "assigned-clock-parents",
+						 "#clock-cells", 0);
 	if (num_parents == -EINVAL)
 		pr_err("clk: invalid value of clock-parents property at %pOF\n",
-		       node);
+		       &node);
 
 	for (index = 0; index < num_parents; index++) {
-		rc = of_parse_phandle_with_args(node, "assigned-clock-parents",
-					"#clock-cells",	index, &clkspec);
+		rc = ofnode_parse_phandle_with_args(node, "assigned-clock-parents",
+					"#clock-cells", 0, index, &clkspec);
 		if (rc < 0) {
 			/* skip empty (null) phandles */
 			if (rc == -ENOENT)
 				continue;
 			else
 				return rc;
 		}
-		if (clkspec.np == node && !clk_supplier) {
-			of_node_put(clkspec.np);
+		if (ofnode_equal(clkspec.node, node) && !clk_supplier) {
+			ofnode_put(clkspec.node);
 			return 0;
 		}
 		pclk = of_clk_get_from_provider(&clkspec);
-		of_node_put(clkspec.np);
+		ofnode_put(clkspec.node);
 		if (IS_ERR(pclk)) {
 			if (PTR_ERR(pclk) != -EPROBE_DEFER)
 				pr_warn("clk: couldn't get parent clock %d for %pOF\n",
-					index, node);
+					index, &node);
 			return PTR_ERR(pclk);
 		}
 
-		rc = of_parse_phandle_with_args(node, "assigned-clocks",
-					"#clock-cells", index, &clkspec);
+		rc = ofnode_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells", 0, index, &clkspec);
 		if (rc < 0)
 			goto err;
-		if (clkspec.np == node && !clk_supplier) {
-			of_node_put(clkspec.np);
+		if (ofnode_equal(clkspec.node, node) && !clk_supplier) {
+			ofnode_put(clkspec.node);
 			rc = 0;
 			goto err;
 		}
 		clk = of_clk_get_from_provider(&clkspec);
-		of_node_put(clkspec.np);
+		ofnode_put(clkspec.node);
 		if (IS_ERR(clk)) {
 			if (PTR_ERR(clk) != -EPROBE_DEFER)
 				pr_warn("clk: couldn't get assigned clock %d for %pOF\n",
-					index, node);
+					index, &node);
 			rc = PTR_ERR(clk);
 			goto err;
 		}
 
@@ -78,40 +77,40 @@ err:
 	clk_put(pclk);
 	return rc;
 }
 
-static int __set_clk_rates(struct device_node *node, bool clk_supplier)
+static int __set_clk_rates(ofnode node, bool clk_supplier)
 {
-	struct of_phandle_args clkspec;
+	struct ofnode_phandle_args clkspec;
 	int rc, count, count_64, index;
 	struct clk *clk;
-	u64 *rates_64 __free(kfree) = NULL;
-	u32 *rates __free(kfree) = NULL;
+	u64 *rates_64 = NULL;
+	u32 *rates = NULL;
 
-	count = of_property_count_u32_elems(node, "assigned-clock-rates");
-	count_64 = of_property_count_u64_elems(node, "assigned-clock-rates-u64");
+	count = ofnode_count_u32_elems(node, "assigned-clock-rates");
+	count_64 = ofnode_count_u64_elems(node, "assigned-clock-rates-u64");
 	if (count_64 > 0) {
 		count = count_64;
 		rates_64 = kcalloc(count, sizeof(*rates_64), GFP_KERNEL);
 		if (!rates_64)
 			return -ENOMEM;
 
-		rc = of_property_read_u64_array(node,
+		rc = ofnode_read_u64_array(node,
 						"assigned-clock-rates-u64",
 						rates_64, count);
 	} else if (count > 0) {
 		rates = kcalloc(count, sizeof(*rates), GFP_KERNEL);
 		if (!rates)
 			return -ENOMEM;
 
-		rc = of_property_read_u32_array(node, "assigned-clock-rates",
+		rc = ofnode_read_u32_array(node, "assigned-clock-rates",
 						rates, count);
 	} else {
 		return 0;
 	}
 
 	if (rc)
-		return rc;
+		goto out_free;
 
 	for (index = 0; index < count; index++) {
 		unsigned long rate;
 
@@ -120,29 +119,30 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 		else
 			rate = rates[index];
 
 		if (rate) {
-			rc = of_parse_phandle_with_args(node, "assigned-clocks",
-					"#clock-cells",	index, &clkspec);
+			rc = ofnode_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells", 0,	index, &clkspec);
 			if (rc < 0) {
 				/* skip empty (null) phandles */
 				if (rc == -ENOENT)
 					continue;
 				else
-					return rc;
+					goto out_free;
 			}
-			if (clkspec.np == node && !clk_supplier) {
-				of_node_put(clkspec.np);
+			if (ofnode_equal(clkspec.node, node) && !clk_supplier) {
+				ofnode_put(clkspec.node);
 				return 0;
 			}
 
 			clk = of_clk_get_from_provider(&clkspec);
-			of_node_put(clkspec.np);
+			ofnode_put(clkspec.node);
 			if (IS_ERR(clk)) {
 				if (PTR_ERR(clk) != -EPROBE_DEFER)
 					pr_warn("clk: couldn't get clock %d for %pOF\n",
-						index, node);
-				return PTR_ERR(clk);
+						index, &node);
+				rc = PTR_ERR(clk);
+				goto out_free;
 			}
 
 			rc = clk_set_rate(clk, rate);
 			if (rc < 0)
@@ -152,8 +152,14 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 			clk_put(clk);
 		}
 	}
 	return 0;
+
+out_free:
+	kfree(rates);
+	kfree(rates_64);
+
+	return rc;
 }
 
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
@@ -166,13 +172,13 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
  * listed in its 'assigned-clocks' or 'assigned-clock-parents' properties.
  * If @clk_supplier is false the function exits returning 0 as soon as it
  * determines the @node is also a supplier of any of the clocks.
  */
-int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
+int of_clk_set_defaults(ofnode node, bool clk_supplier)
 {
 	int rc;
 
-	if (!node)
+	if (!ofnode_valid(node))
 		return 0;
 
 	rc = __set_clk_parents(node, clk_supplier);
 	if (rc < 0)
diff --git a/include/linux/clk/clk-conf.h b/include/linux/clk/clk-conf.h
index eae9652c70cd..93bb6c582b4e 100644
--- a/include/linux/clk/clk-conf.h
+++ b/include/linux/clk/clk-conf.h
@@ -6,19 +6,17 @@
 
 #ifndef __CLK_CONF_H
 #define __CLK_CONF_H
 
+#include <dm/ofnode.h>
 #include <linux/types.h>
 
-struct device_node;
-
-#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
-int of_clk_set_defaults(struct device_node *node, bool clk_supplier);
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+int of_clk_set_defaults(ofnode node, bool clk_supplier);
 #else
-static inline int of_clk_set_defaults(struct device_node *node,
-				      bool clk_supplier)
+int of_clk_set_defaults(ofnode node, bool clk_supplier)
 {
-	return 0;
+	return -ENOSYS;
 }
 #endif
 
 #endif /* __CLK_CONF_H */

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
