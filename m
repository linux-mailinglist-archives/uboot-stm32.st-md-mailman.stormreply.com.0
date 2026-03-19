Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL5mI8QXwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F62F03B1
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 035CEC8F260;
	Mon, 23 Mar 2026 10:36:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCBCEC35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:57:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso1031688f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953830; x=1774558630;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+IfOdxKnO5d2gX0DJUSfHZyr0om0CN4y9Pd0XspF9Lg=;
 b=c6bdpgLkZoOJ4Ww66vbk0GXLOr5uxvKNIpqUBgi22ERDD3AuBz7tgx7Lr0OliSB200
 XmUgeVn0cxZ1wrmzU/oNpWU/249RHW+AcFhfhC+2OsO55m4SGk8iTvJqUmIaj9cesi0t
 Kx+ufd1ad3xDF9F5X5it8ejI4MfvdtT7yR/xQIoY+5wwQYDX4sLEL7sKLg0dZySn0BFQ
 wZH0ddKUfURQR0RQ/Z9MMM/uUcd1oNWctk0YpCQyD+RQAYp30i7JUNVwSvMDNFHeP6/c
 C9iODw+MLCQzzCw321C1PNXKNXZ1Rn9+uQQ/lCVpHzm97KRvhZPEBIg2eYI8AB3RJ7PU
 2qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953830; x=1774558630;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+IfOdxKnO5d2gX0DJUSfHZyr0om0CN4y9Pd0XspF9Lg=;
 b=VLKyT2YZOKNdH1QAR/aDrsWxWse5yCOs1o0dz4BAstleZKTjYxayR8uO2SzS+ENMbs
 R2ddi2CO86sD+PmR47cxBJWD5eQLyNrQUMDGjm9BQ/r1faoc1i0yxXiVcbcPD5zqkH+B
 gdU7MeCV2wwSVQVJe+yIg5t69WjAFLPkZaBW5YLOffgsAUC3ec1NL78ptZlYfpK/tOPK
 ne+5wtIDBIadh2g8BoHiys30hVopKU7v021p9TMDVnGietnpxtehH5B+OJOzt9tHrckm
 VJOE/ZixdgvuoSA6VaqHThDTLVsVC9x433TuPieBQ9doorsojLAFqjyzvTgs2K2t3NcF
 vVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxUMBdNi3/1HOekzf3XXWk6OCyuT0JcoWzQqTrmpHWtBO2oUk/dCd8dmB1v+nlYgpAcrorE87BFcd2hA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6Ot5ip/nQ+guOCOiizljmeAzbiFS16ges72VD8Gs3O+72BCJG
 Acltd8ghUwwV/JbBq9R5v12xpSTJ8F/dX7QzdkbBp1VplUek0McZqz+ECgbulwB7tFc=
X-Gm-Gg: ATEYQzzNEOY1klfpeTt/xod9rhExSExsa979veX8y+mZzkjQvsFxGO/zZ7snROcADMq
 /R5HEj+uof38TnmJXa/1ZEZngv2v0t32ZsNqPybYS1ce4C6wH+sfXfCyEOjme2vZNCMipsM95MJ
 ZKf0hYO6BG1rxloUiRECGKSKdd080LBdafAicwAVOVYUmyw8HJp3si34sJFgVloxWKKTCmTCo0o
 Tlh8A8GYTBQyrSZQtZCVciasxQfdrO6XKPdodbdEzbSPXE0O0i0GXEy3t1H2PtCgBoksmAgvBKB
 iMgKqImV90PcxeWC2HEC0jZ3HAOika/vIOGDpBkrxtBdPwHTlwV8P1x11HIb0Y0W8XCjD0Ynb/6
 /bAw68b/kN39rpSkg0vxyXVNk4SKZhUIamTrKbxVIS8xb3zAB+/2BZ5qsVl3WXa8j+9iMcpR9gE
 YDvUKGLs+4rlDKIgnK5zmTupuUq4qBNhxd7O/T5613zR9Bc1loTrKFo+7k2aU+99Iw63O1CpP4Z
 45bSQ==
X-Received: by 2002:a05:6000:612:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-43b6427d39dmr1330209f8f.34.1773953830110; 
 Thu, 19 Mar 2026 13:57:10 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:57:09 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:26 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-4-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=EMYajq/tChEE6riKBZOgKjJcWcO1seCjnTJUt8+7XRc=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9ybxWnsm6/Y/eMPq3n0radJUvOop9kQzHhH+HnnTp5
 qbrn9rSUcrCIMjBICumyCJ+Ypll09rL9hrbF1yAmcPKBDKEgYtTACYi5MLwP72ITZt57pM3y/9a
 3Vq1c/7t7NM2Xzb+8vflVvc2Xq3yfBPD/1qzDXLxlm6PFHiMxH4/4ywILdwUOOO/+O9Db3+zXjl
 Q8RcA
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
Subject: [Uboot-stm32] [PATCH RFC 04/40] qcom: rpmh: don't error for SLEEP
	requests
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,linaro.org:email,linaro.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 761F62F03B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just stub them out since the caller might also send active votes. Since
we don't suspend there's no risk of missing votes here, we never enter
the sleep state.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 8 ++++----
 drivers/soc/qcom/rpmh.c     | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index dce61f262292..51af5a2a686b 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -260,10 +260,10 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
 	 * U-Boot: since we're single threaded and running synchronously we can
 	 * just always used the first active TCS.
 	 */
 	if (msg->state != RPMH_ACTIVE_ONLY_STATE) {
-		log_err("WARN: only ACTIVE_ONLY state supported\n");
-		return ERR_PTR(-EINVAL);
+		log_debug("WARN: only ACTIVE_ONLY state supported\n");
+		return NULL;
 	}
 
 	return &drv->tcs[ACTIVE_TCS];
 }
@@ -389,10 +389,10 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	int tcs_id, i = 0;
 	u32 val;
 
 	tcs = get_tcs_for_msg(drv, msg);
-	if (IS_ERR(tcs))
-		return PTR_ERR(tcs);
+	if (IS_ERR_OR_NULL(tcs))
+		return PTR_ERR_OR_ZERO(tcs);
 
 	/* U-Boot is single-threaded, always use the first TCS as we'll never conflict */
 	tcs_id = tcs->offset;
 	if (!read_tcs_reg(drv, drv->regs[RSC_DRV_STATUS], tcs_id)) {
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 8c222324c66d..b55e23c4417d 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -59,10 +59,10 @@ static int __rpmh_write(const struct udevice *dev, enum rpmh_state state,
 {
 	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 
 	if (state != RPMH_ACTIVE_ONLY_STATE) {
-		log_err("only ACTIVE_ONLY state supported\n");
-		return -EINVAL;
+		log_debug("WARN: Only ACTIVE_ONLY state supported\n");
+		return 0;
 	}
 
 	return rpmh_rsc_send_data(ctrlr_to_drv(ctrlr), &rpm_msg->msg);
 }

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
