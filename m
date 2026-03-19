Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM1dGsQXwWmcQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8192F03AC
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAB4AC87EC5;
	Mon, 23 Mar 2026 10:36:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F37FDC35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:56:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43b4d73463dso961030f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953814; x=1774558614;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P535AG/2k8ItRv7CW2LNXmHzd331bBJoGHddWlJiKB0=;
 b=xvRTmuRdatEwiYxJbH8JnCdgaW9l8nvS3CtBCBUgwjclJ7kLRLrT24e95qgXJiKzIz
 ThyPgOWz0zWpOfi2POS6/Ze45sPK0xsxCEDVSa9HnMxH6h0OrYAmgOE+U3KPRHn3itpX
 c1N90r5UMZtH1WLGFOsS6MVgeu8yBFJr9L9FQC/nSvmEtgrjPBudnDoay6N68BCWBkP0
 d1C7oUsbH2hxh0De0rlUaioRy+zC5pDYyQpuk+q42ij1FZd1oxPdiFwEHZdgWb+/aH73
 BPHohYVT9Zaz5nUrXr+6sQnekk2s060ACDeEo/dd4zJ6Z/0UW/Fwt9BR1Zye7a8PVYeb
 A0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953814; x=1774558614;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P535AG/2k8ItRv7CW2LNXmHzd331bBJoGHddWlJiKB0=;
 b=iQOPe6a5KHS09oiqjF6aN59CaN1Gjt7PPisMYGaDMASBnILNJGpLbzs7IOrfdHxNNn
 oEQfFTstVFbClY+tojfAvdb4WVXUMlv9uTtiYy9w1923K59npi2oRrySD6YQA7E6RSNo
 GlEuX5cWydmYPMm3nE15StwoUhMsIJY/4Oyx2oX2gLv2rEHSJD7XAn/kmW1p71tOoxuL
 HZyzYKBV7lTlMLFuGgl/MrdEjcXzUVAJBW1mBSFca057dt1KaCtRhwch2DCR6cHZcGYh
 JT7oYDF1YI6+TsBtGrKUDSe7o17cFBVsGhPSTXzTtWf6rKf5QN2okmxWpHxKsIADniUH
 o1qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5rdTUTHhObJw7t3j9AQ3fQv7yNKELV4M/pIscRXT7rweD0jaYXrQ22pDAJ+WWSSePFHxA8GysQcSu/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkYvN1lRkV3uLNpznzNtEV1anLZs2ziKxhpD4JwaWtyHFnsu27
 d1GyG0whB0/aCRRwH6yHsFbV/SvoGt94fSkGs6AGscF+0uy0yap3aERyN6ubt66ATdM=
X-Gm-Gg: ATEYQzxBEIqbRZNzPugiXkiac2Wb3Dn6TW0XUjbyuiwRogOEbglMayYAgygS9AKQm/G
 9I7oDvWfbzMQSb6VzrbiUmVZ4I5OywW5tgoJjEmowgJ9P+GyxdjmFEXjS+MsTGSwbdYLVku/QbU
 db6gBCGs3VD9e55qxomlazqtfTymB2cidQgh/9Fac4GeXTMDE9gHCtyTJwrdoh6d630vU8va4sZ
 2MFK+EXAzJE3u4s2EjML9OGg0wANRdNYWa6pwYo8/WtvYPaPu7eUd0VXBJbWQfbCLSfOFZAUGBL
 lYoPL3/JgW7RLv/KM3X5lUy/12RGTANkvNaOjrv5ZyzZc/t7X2fIwSG+qIYOoohlAn8jylDGrRJ
 6sMeszcSooTWDZC2ZFlIbaYJdytOQXNzty9u91WiTRekRlDZae+1pq2/OS4HlrI9MJIeDl2aB+l
 gXXMDM08O74iBJjCGQEery95yHSStK8PlbJQdBXiNvb8t8GOpx+yyzoGDzLR6cp13dvjA=
X-Received: by 2002:a05:6000:1886:b0:43b:3cdc:941f with SMTP id
 ffacd0b85a97d-43b6424a832mr1292002f8f.17.1773953813877; 
 Thu, 19 Mar 2026 13:56:53 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:56:53 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:22 +0100
Message-Id: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPdivGkC/yWMwQrCQAwFf6XkbCC7gqhXwQ/wWjxs01eNYC2bV
 pTSf3fV4wzMzOTIBqd9NVPG09wefYGwqkivqb+ArS1MUeJG1mHHmhxvVu14GnzMSHdGktBKIxp
 lSyUcMjp7/aY1nY4HOv+lT80NOn53tCwfGs8/EXsAAAA=
X-Change-ID: 20260319-casey-ccf-upstream-ea01d0b0c208
To: u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>, 
 u-boot-qcom@groups.io, Aspeed BMC SW team <BMC-SW@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 Paul Barker <paul@pbarker.dev>, Dai Okamura <okamura.dai@socionext.com>, 
 linux@analog.com, uboot-snps-arc@synopsys.com, u-boot-amlogic@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com, 
 Sumit Garg <sumit.garg@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=26382;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=tjnK4RoAZ/HTyna9IlTHnXHrkoe2WzZCvGkqj2ScAbw=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9ybzPT9jdWX94uunfkx7PlN9X5s3VaNXbvKFAsKame
 6/R1rrlHaUsDIIcDLJiiiziJ5ZZNq29bK+xfcEFmDmsTCBDGLg4BWAiTkcZ/gpc0E3ecaonLe+q
 1IzpiyOibl4LCznOxKj19aJ22fO/d0KAKrq8fybrLpu4prhF+PHB9b5MxUVbWPO/PU37+nP75Mk
 e/wE=
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
Subject: [Uboot-stm32] [PATCH RFC 00/40] clk: port full Linux Common Clock
 Framework to U-Boot
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,linaro.org:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 0F8192F03AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This RFC provides a proof of concept for using the full Linux CCF in
U-Boot and consequently porting full Linux clock drivers with extremely
minimal changes.

== Overview ==

This RFC is pretty long but can be separated into a few chunks. The
first patches relate to Linux API compatibility and just contain small
self contained changes, these can go upstream regardless of CCF.

The next group of changes prepare for importing CCF from Linux, the
standalone fixed clock drivers are moved to clk/basic, the existing
U-Boot CCF drivers are moved to clk/uccf, and struct clk_ops is renamed
to clk_ops_uboot.

Additionally, clk_set_rate() is changed so that it returns a signed
long, since it can return negative values. This is also done to align
with CCF but it's a standalone improvement nonetheless.

The next changes import CCF from Linux 6.19 and then adjust it to
compile and work with U-Boot. These commits are split up mostly to
try and reduce the size. Finally clk-uclass is adjusted for CCF, this
definitely will need some additional passes to be a bit cleaner.

With CCF done, sandbox clk-ccf driver gets a CCF_FULL port, the clk_ccf
tests are adjusted to pass.

Lastly, a PoC port of Qualcomms Linux clock drivers is done, this
only has sm8650 clocks but they serve the desired purpose. The changes
necessary to the Linux drivers are mostly to deal with U-Boots driver
model, the actual platform specific clock drivers require essentially
zero changes!

=== Feedback ===

I'd like to get feedback on the overall architecture and ideas, feel
free to point out any dead code or printf's I forgot about, but I'll for
sure do a more detailed cleanup before the next revision.

I would definitely like to input on how to deal with clk-uclass, since
it's now supporting 3 different clock frameworks, but I'm now sure how
best to separate the code out without duplicating code.

In terms of overall architecture, CCF is a departure from the uclass
model that U-Boot has stuck too for so long. If this is a success then
I think it could make a lot of sense to make similar changes for power
domains and resets. I think this change offers a lot of additional
flexibility which has been sorely missed.

== Motivation ==

There were quite a few motivating factors behind this effort which I
think provide useful context for this series:

1. Existing UCLASS_CLK support in U-Boot (even with U-Boots minimal CCF)
   doesn't provide a fully cohesive API nor implement the necessary
   functionality to support complex modern platforms without a lot of
   additional effort.

2. While trying to enable display support on Qualcomm, it became clear
   that U-Boots clock framework was a severe limiting factor,
   particularly for more complicated setups like "bonded" dual-DSI.

3. The current state of Qualcomm clock drivers in U-Boot is pretty poor,
   as the old very basic driver code is being expected to support more
   and more complicated usecases. Clock support is generally the most
   complicated part of bringing up any new Qualcomm platform, so being
   able to properly reuse Linux drivers with the familiar API greatly
   reduces the amount of friction when working on U-Boot support for
   complicated peripherals like the display.

Consequently, My aim with this effort was primarily to provide API
compatibility with Linux as much as possible, minimising the changes
that have to be made to clock drivers to port them from Linux, and
reducing the chance of introducing U-Boot specific bugs.

=== clk_ops/UCLASS_CLK ===

CCF_FULL drivers should NOT use UCLASS_CLK, since CCF uses a totally
independent clock API. If the clocks are provided by another device like
a phy, they can simply be registered with the clk core the same way they
are in Linux. Standalone clock drivers should use UCLASS_NOP.

Clocks must all be registered during driver probe, the CCF will ensure
that a given clock provider is probed (via a global ofnode -> device
lookup) before checking the of_providers, thus making sure the clocks
are registered so that the consumer can use them. There is currently no
special handling for cyclical dependencies.

=== struct clk ===

It's definitely debatable if it makes sense to have 3 different structs
for each clk (clk_hw, clk_core and clk). I do think clk_hw and clk_core
are justified, since clk_hw is more tied to the hardware description and
typically nested in a clk-specific descriptor while clk_core contains
the internal runtime state of the clk which should remain private to
CCF core.

It could make sense to merge clk and clk_core, but since struct clk is
public in U-Boot, where it's an opaque pointer in Linux this would be
a substantial effort. In Linux struct clk objects are allocated inside
CCF, but in U-Boot they're allocated by the driver, this would need to
be resolved before we investigate combining these structs.

=== Memory/perf overhead ===

The memory and size overhead of CCF is undoubtably bigger than uCCF,
although I suspect the difference is less than it might seem at
first glance. In particular: clk_core is only ~50 bytes larger than
struct udevice on ARM64, and an additional 120 bytes is saved for each
U_BOOT_DRIVER used by uCCF.

On the other hand, the CPU overhead is probably more significant,
but not an unreasonable cost to ensure correctness and propagate rate
changes across the clock tree.

Just comparing the binary size of sandbox64_defconfig with uCCF vs
CCF_FULL, CCF_FULL results in a 135k size increase in the binary. I
haven't done any more detailed analysis here (still haven't got buildman
to play nice...).

=== SPL ===

This RFC doesn't have any SPL specific support, I think this role is
better fulfilled by UCLASS_CLK.

=== U-Boot's old CCF port ===

The original CCF port done for IMX platforms is vastly different in API,
scope, and function to CCF_FULL, to differentiate I refer to it
as "uCCF".

I have kept support for this in and made it mutually exclusive with
CCF_FULL. uCCF drivers have been moved to drivers/clk/uccf, with the new
CCF port in drivers/clk/ccf.

Included near the end of this series is a port of Sandbox's clk-ccf
driver from uCCF over to CCF_FULL, this might be a useful reference for
other drivers (although it's probably better to just adapt the Linux
drivers).

=== Compat shim ===

Lastly, this series includes a compat shim which allows UCLASS_CLK
drivers to somewhat work with CCF, I would imagine this being useful
if some generic peripheral device provides a clock for example, but in
almost all cases I think it's better to implement a proper CCF clock
device. Unless there is a particular usecase for this I would probably
not include it in the next revision.

== TODO/Outstanding issues ==

* Clean up clk-uclass.c, does it make sense to somewhow split it in two?
* Assess test coverage, have basic sandbox tests, would like to mostly
  use integration tests (i.e. diff the clk summary) once more platforms
  are supported.
* pre-relocation support is currently missing, on Qualcomm at least I
  would prefer to completely skip FDT scanning pre-reloc, there is a
  patch in this series which does that. It is very non-trivial to try
  and handle clocks pre-reloc.

---
Casey Connolly (40):
      vsprintf: add %pOF
      common: add an option to skip DM pre-relocation
      serial: msm-geni: allow invalid clock
      qcom: rpmh: don't error for SLEEP requests
      string: add strdup_const and kstrdup_const
      ofnode: add read_u64_array and count_elems_of_size
      linux/compat: add PTR_ERR_OR_ZERO
      compat: add kref implementation
      compat: add dev_name()
      compat: add linux/regmap.h symlink
      devres: add devm_krealloc
      regmap: add regmap_assign_bits
      compat: regulator: add enable/disable macros
      compat: math64: add abs_diff()
      clk: restrict clk/imx to MACH_IMX
      clk: move U-Boot CCF to clk/uccf
      clk: rename clk_ops to clk_ops_uboot
      clk: move fixed clocks to clk/basic
      clk: make clk_set_rate() return signed long
      clk: make clk_get_parent_rate return signed long
      clk: import full CCF from Linux
      clk: move clock flags to common clk-provider.h
      clk/ccf: adapt clk-conf for U-Boot
      clk/ccf: adapt CCF core for U-Boot
      clk/ccf: adapt CCF generic clocks for U-Boot
      clk/clk-uclass: adapt for CCF_FULL
      RFC: clk/ccf: add UCLASS_CLK compat shim
      clk/sandbox: add a CCF_FULL port of clk_sandbox
      WIP: test: adjust tests for CCF_FULL
      configs: add sandbox CCF_FULL defconfig
      cmd/clk: add CCF_FULL support
      clk/qcom: move existing clock drivers to clk/qcom/basic
      clk/qcom: drop in Linux Qualcomm CCF drivers
      clk/qcom/ccf: drop in Linux rpmh clock driver
      clk/qcom/ccf: add sm8650 GCC, dispcc and tcsrcc.
      clk/qcom/ccf: add uboot common code
      clk/qcom/ccf: adapt common, gdsc, and reset code for U-Boot
      clk/qcom/ccf: adapt clocks for U-Boot
      clk/qcom/ccf: adjust sm8650 clock drivers for U-Boot
      TEST: configs: qcom_sm8650_ccf_defconfig: add a CCF sm8650 defconfig

 Kconfig                                            |   12 +
 arch/arm/cpu/armv7/bcm281xx/clk-core.c             |    8 +-
 arch/arm/cpu/armv7/bcm281xx/clk-core.h             |   14 +-
 arch/arm/dts/sm8650-hdk-u-boot.dtsi                |   26 +
 arch/sandbox/dts/test.dts                          |    4 +-
 arch/sandbox/include/asm/clk.h                     |    2 +-
 cmd/clk.c                                          |   21 +-
 common/board_f.c                                   |   11 +-
 configs/qcom_sm8650_ccf_defconfig                  |   24 +
 configs/sandbox64_ccf_full_defconfig               |    5 +
 drivers/clk/Kconfig                                |   52 +-
 drivers/clk/Makefile                               |   20 +-
 drivers/clk/adi/clk-adi-pll.c                      |    2 +-
 drivers/clk/adi/clk-shared.c                       |    4 +-
 drivers/clk/adi/clk.h                              |    2 +-
 drivers/clk/airoha/clk-airoha.c                    |    4 +-
 drivers/clk/altera/clk-agilex.c                    |    2 +-
 drivers/clk/altera/clk-agilex5.c                   |    2 +-
 drivers/clk/altera/clk-arria10.c                   |    2 +-
 drivers/clk/altera/clk-mem-n5x.c                   |    2 +-
 drivers/clk/altera/clk-n5x.c                       |    2 +-
 drivers/clk/aspeed/clk_ast2500.c                   |    4 +-
 drivers/clk/aspeed/clk_ast2600.c                   |    4 +-
 drivers/clk/at91/clk-generic.c                     |    4 +-
 drivers/clk/at91/clk-main.c                        |    8 +-
 drivers/clk/at91/clk-master.c                      |    8 +-
 drivers/clk/at91/clk-peripheral.c                  |    6 +-
 drivers/clk/at91/clk-programmable.c                |    4 +-
 drivers/clk/at91/clk-sam9x60-pll.c                 |   10 +-
 drivers/clk/at91/clk-sam9x60-usb.c                 |    4 +-
 drivers/clk/at91/clk-system.c                      |    2 +-
 drivers/clk/at91/clk-utmi.c                        |    4 +-
 drivers/clk/at91/compat.c                          |   30 +-
 drivers/clk/at91/pmc.c                             |    2 +-
 drivers/clk/at91/pmc.h                             |    2 +-
 drivers/clk/at91/sckc.c                            |    4 +-
 drivers/clk/basic/Makefile                         |    7 +
 drivers/clk/{ => basic}/clk_fixed_factor.c         |    2 +-
 drivers/clk/{ => basic}/clk_fixed_rate.c           |    4 +-
 drivers/clk/ccf/Kconfig                            |   15 +
 drivers/clk/ccf/Makefile                           |   19 +
 drivers/clk/ccf/clk-composite.c                    |  495 +++
 drivers/clk/ccf/clk-conf.c                         |  189 +
 drivers/clk/ccf/clk-divider.c                      |  663 ++++
 drivers/clk/ccf/clk-fixed-factor.c                 |  409 +++
 drivers/clk/ccf/clk-fixed-rate.c                   |  217 ++
 drivers/clk/ccf/clk-gate.c                         |  260 ++
 drivers/clk/ccf/clk-mux.c                          |  282 ++
 drivers/clk/ccf/clk.c                              | 3208 ++++++++++++++++
 drivers/clk/ccf/clk.h                              |   59 +
 drivers/clk/ccf/clk_sandbox_ccf_full.c             |  220 ++
 drivers/clk/ccf/compat.c                           |  227 ++
 drivers/clk/clk-cdce9xx.c                          |    4 +-
 drivers/clk/clk-gpio.c                             |    2 +-
 drivers/clk/clk-hsdk-cgu.c                         |    4 +-
 drivers/clk/clk-stub.c                             |    4 +-
 drivers/clk/clk-uclass.c                           |  326 +-
 drivers/clk/clk-xlnx-clock-wizard.c                |    4 +-
 drivers/clk/clk_bcm6345.c                          |    2 +-
 drivers/clk/clk_boston.c                           |    2 +-
 drivers/clk/clk_k210.c                             |    8 +-
 drivers/clk/clk_octeon.c                           |    2 +-
 drivers/clk/clk_pic32.c                            |    4 +-
 drivers/clk/clk_sandbox.c                          |   47 +-
 drivers/clk/clk_sandbox_test.c                     |    2 +-
 drivers/clk/clk_scmi.c                             |    6 +-
 drivers/clk/clk_versaclock.c                       |   22 +-
 drivers/clk/clk_versal.c                           |    4 +-
 drivers/clk/clk_vexpress_osc.c                     |    4 +-
 drivers/clk/clk_zynq.c                             |    8 +-
 drivers/clk/clk_zynqmp.c                           |    6 +-
 drivers/clk/exynos/clk-exynos7420.c                |    6 +-
 drivers/clk/exynos/clk-pll.c                       |    4 +-
 drivers/clk/exynos/clk.h                           |    2 +-
 drivers/clk/ics8n3qv01.c                           |    4 +-
 drivers/clk/imx/clk-composite-8m.c                 |    6 +-
 drivers/clk/imx/clk-composite-93.c                 |    2 +-
 drivers/clk/imx/clk-fracn-gppll.c                  |    4 +-
 drivers/clk/imx/clk-gate-93.c                      |    4 +-
 drivers/clk/imx/clk-gate2.c                        |    4 +-
 drivers/clk/imx/clk-imx6q.c                        |    2 +-
 drivers/clk/imx/clk-imx6ul.c                       |    2 +-
 drivers/clk/imx/clk-imx8.c                         |    4 +-
 drivers/clk/imx/clk-imx8.h                         |    2 +-
 drivers/clk/imx/clk-imx8qm.c                       |    2 +-
 drivers/clk/imx/clk-imx8qxp.c                      |    2 +-
 drivers/clk/imx/clk-imxrt1020.c                    |    2 +-
 drivers/clk/imx/clk-imxrt1170.c                    |    4 +-
 drivers/clk/imx/clk-pfd.c                          |    4 +-
 drivers/clk/imx/clk-pll14xx.c                      |    8 +-
 drivers/clk/imx/clk-pllv3.c                        |   18 +-
 drivers/clk/intel/clk_intel.c                      |    2 +-
 drivers/clk/mediatek/clk-mtk.c                     |   14 +-
 drivers/clk/mediatek/clk-mtk.h                     |   10 +-
 drivers/clk/meson/a1.c                             |    8 +-
 drivers/clk/meson/axg-ao.c                         |    2 +-
 drivers/clk/meson/axg.c                            |    2 +-
 drivers/clk/meson/clk-measure.c                    |    2 +-
 drivers/clk/meson/g12a-ao.c                        |    2 +-
 drivers/clk/meson/g12a.c                           |   10 +-
 drivers/clk/meson/gxbb.c                           |    8 +-
 drivers/clk/microchip/mpfs_clk_cfg.c               |    4 +-
 drivers/clk/microchip/mpfs_clk_msspll.c            |    2 +-
 drivers/clk/microchip/mpfs_clk_periph.c            |    2 +-
 drivers/clk/mpc83xx_clk.c                          |    2 +-
 drivers/clk/mtmips/clk-mt7620.c                    |    2 +-
 drivers/clk/mtmips/clk-mt7621.c                    |    2 +-
 drivers/clk/mtmips/clk-mt7628.c                    |    2 +-
 drivers/clk/mvebu/armada-37xx-periph.c             |    4 +-
 drivers/clk/mvebu/armada-37xx-tbg.c                |    2 +-
 drivers/clk/nuvoton/clk_npcm.c                     |    4 +-
 drivers/clk/nuvoton/clk_npcm.h                     |    2 +-
 drivers/clk/owl/clk_owl.c                          |    6 +-
 drivers/clk/qcom/Kconfig                           |    1 +
 drivers/clk/qcom/Makefile                          |   28 +-
 drivers/clk/qcom/basic/Makefile                    |   25 +
 drivers/clk/qcom/{ => basic}/clock-apq8016.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-apq8096.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-ipq4019.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-ipq5424.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-ipq9574.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-qcm2290.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-qcom.c          |    4 +-
 drivers/clk/qcom/{ => basic}/clock-qcom.h          |    2 +-
 drivers/clk/qcom/{ => basic}/clock-qcs404.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-qcs615.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-qcs8300.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sa8775p.c       |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sc7280.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sdm845.c        |    4 +-
 drivers/clk/qcom/{ => basic}/clock-sm6115.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sm6350.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sm7150.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sm8150.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sm8250.c        |    2 +-
 drivers/clk/qcom/{ => basic}/clock-sm8550.c        |    4 +-
 drivers/clk/qcom/{ => basic}/clock-sm8650.c        |    4 +-
 drivers/clk/qcom/{ => basic}/clock-x1e80100.c      |    4 +-
 drivers/clk/qcom/ccf/Makefile                      |   21 +
 drivers/clk/qcom/ccf/clk-alpha-pll.c               | 3196 ++++++++++++++++
 drivers/clk/qcom/ccf/clk-alpha-pll.h               |  251 ++
 drivers/clk/qcom/ccf/clk-branch.c                  |  203 ++
 drivers/clk/qcom/ccf/clk-branch.h                  |  125 +
 drivers/clk/qcom/ccf/clk-rcg.h                     |  217 ++
 drivers/clk/qcom/ccf/clk-rcg2.c                    | 1765 +++++++++
 drivers/clk/qcom/ccf/clk-regmap-divider.c          |   90 +
 drivers/clk/qcom/ccf/clk-regmap-divider.h          |   22 +
 drivers/clk/qcom/ccf/clk-regmap-mux-div.c          |  232 ++
 drivers/clk/qcom/ccf/clk-regmap-mux-div.h          |   44 +
 drivers/clk/qcom/ccf/clk-regmap-mux.c              |   57 +
 drivers/clk/qcom/ccf/clk-regmap-mux.h              |   23 +
 drivers/clk/qcom/ccf/clk-regmap-phy-mux.c          |   62 +
 drivers/clk/qcom/ccf/clk-regmap-phy-mux.h          |   33 +
 drivers/clk/qcom/ccf/clk-regmap.c                  |  104 +
 drivers/clk/qcom/ccf/clk-regmap.h                  |   38 +
 drivers/clk/qcom/ccf/clk-rpmh.c                    | 1030 ++++++
 drivers/clk/qcom/ccf/common-uboot.c                |  188 +
 drivers/clk/qcom/ccf/common-uboot.h                |   38 +
 drivers/clk/qcom/ccf/common.c                      |  252 ++
 drivers/clk/qcom/ccf/common.h                      |  106 +
 drivers/clk/qcom/ccf/dispcc-sm8550.c               | 1825 ++++++++++
 drivers/clk/qcom/ccf/gcc-sm8650.c                  | 3846 ++++++++++++++++++++
 drivers/clk/qcom/ccf/gdsc.c                        |  545 +++
 drivers/clk/qcom/ccf/gdsc.h                        |  103 +
 drivers/clk/qcom/ccf/reset.c                       |  112 +
 drivers/clk/qcom/ccf/reset.h                       |   29 +
 drivers/clk/qcom/ccf/tcsrcc-sm8650.c               |  174 +
 drivers/clk/renesas/clk-rcar-gen2.c                |    4 +-
 drivers/clk/renesas/clk-rcar-gen3.c                |    4 +-
 drivers/clk/renesas/compound-clock.c               |    4 +-
 drivers/clk/renesas/r9a06g032-clocks.c             |    6 +-
 drivers/clk/renesas/rcar-gen2-cpg.h                |    2 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |    2 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |    8 +-
 drivers/clk/rockchip/clk_px30.c                    |   12 +-
 drivers/clk/rockchip/clk_rk3036.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3066.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3128.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3188.c                  |    4 +-
 drivers/clk/rockchip/clk_rk322x.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3288.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3308.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3328.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3368.c                  |    4 +-
 drivers/clk/rockchip/clk_rk3399.c                  |    8 +-
 drivers/clk/rockchip/clk_rk3528.c                  |   10 +-
 drivers/clk/rockchip/clk_rk3568.c                  |   14 +-
 drivers/clk/rockchip/clk_rk3576.c                  |    8 +-
 drivers/clk/rockchip/clk_rk3588.c                  |   12 +-
 drivers/clk/rockchip/clk_rv1108.c                  |    4 +-
 drivers/clk/rockchip/clk_rv1126.c                  |   12 +-
 drivers/clk/sifive/sifive-prci.c                   |    4 +-
 drivers/clk/sophgo/clk-cv1800b.c                   |    4 +-
 drivers/clk/sophgo/clk-ip.c                        |   30 +-
 drivers/clk/sophgo/clk-ip.h                        |   18 +-
 drivers/clk/sophgo/clk-pll.c                       |    8 +-
 drivers/clk/sophgo/clk-pll.h                       |    4 +-
 drivers/clk/starfive/clk-jh7110-pll.c              |    4 +-
 drivers/clk/starfive/clk.h                         |    2 +-
 drivers/clk/stm32/clk-stm32-core.c                 |   22 +-
 drivers/clk/stm32/clk-stm32-core.h                 |    2 +-
 drivers/clk/stm32/clk-stm32f.c                     |    4 +-
 drivers/clk/stm32/clk-stm32h7.c                    |    2 +-
 drivers/clk/stm32/clk-stm32mp1.c                   |    4 +-
 drivers/clk/sunxi/clk_sun6i_rtc.c                  |    2 +-
 drivers/clk/sunxi/clk_sunxi.c                      |    2 +-
 drivers/clk/tegra/tegra-car-clk.c                  |    4 +-
 drivers/clk/tegra/tegra186-clk.c                   |    4 +-
 drivers/clk/thead/clk-th1520-ap.c                  |    8 +-
 drivers/clk/ti/clk-am3-dpll-x2.c                   |    2 +-
 drivers/clk/ti/clk-am3-dpll.c                      |    4 +-
 drivers/clk/ti/clk-ctrl.c                          |    2 +-
 drivers/clk/ti/clk-divider.c                       |    4 +-
 drivers/clk/ti/clk-gate.c                          |    2 +-
 drivers/clk/ti/clk-k3-pll.c                        |    4 +-
 drivers/clk/ti/clk-k3.c                            |    6 +-
 drivers/clk/ti/clk-mux.c                           |    4 +-
 drivers/clk/ti/clk-sci.c                           |    4 +-
 drivers/clk/uccf/Kconfig                           |   22 +
 drivers/clk/uccf/Makefile                          |   11 +
 drivers/clk/{ => uccf}/clk-composite.c             |   20 +-
 drivers/clk/{ => uccf}/clk-divider.c               |    4 +-
 drivers/clk/{ => uccf}/clk-fixed-factor.c          |    2 +-
 drivers/clk/{ => uccf}/clk-gate.c                  |    2 +-
 drivers/clk/{ => uccf}/clk-mux.c                   |    2 +-
 drivers/clk/{ => uccf}/clk.c                       |    4 +-
 .../{clk_sandbox_ccf.c => uccf/clk_sandbox_uccf.c} |    8 +-
 drivers/clk/uniphier/clk-uniphier-core.c           |    6 +-
 drivers/core/devres.c                              |   83 +-
 drivers/core/of_access.c                           |   52 +
 drivers/core/ofnode.c                              |   48 +
 drivers/phy/cadence/phy-cadence-sierra.c           |    2 +-
 drivers/phy/cadence/phy-cadence-torrent.c          |    2 +-
 drivers/phy/phy-stm32-usbphyc.c                    |    2 +-
 drivers/phy/phy-ti-am654.c                         |    2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      |    2 +-
 drivers/phy/ti/phy-j721e-wiz.c                     |    6 +-
 drivers/power/domain/imx8mp-hsiomix.c              |    2 +-
 drivers/serial/serial_msm_geni.c                   |   15 +-
 drivers/soc/qcom/rpmh-rsc.c                        |    8 +-
 drivers/soc/qcom/rpmh.c                            |    4 +-
 include/asm-generic/sections.h                     |   19 +
 include/clk-uclass.h                               |    6 +-
 include/clk.h                                      |   34 +-
 include/clk/sunxi.h                                |    2 +-
 include/dm/devres.h                                |   10 +
 include/dm/of_access.h                             |   20 +
 include/dm/ofnode.h                                |   50 +
 include/fdtdec.h                                   |   16 +
 include/linux/clk-provider-ccf_full.h              | 1461 ++++++++
 include/linux/clk-provider-uccf.h                  |  251 ++
 include/linux/clk-provider.h                       |  247 +-
 include/linux/clk/clk-conf.h                       |   22 +
 include/linux/compat.h                             |   13 +
 include/linux/device.h                             |   29 +
 include/linux/err.h                                |   25 +
 include/linux/kref.h                               |  124 +
 include/linux/math64.h                             |   19 +
 include/linux/regmap.h                             |    1 +
 include/linux/string.h                             |    2 +
 include/power/regulator.h                          |    3 +
 include/regmap.h                                   |    9 +
 include/sandbox-clk.h                              |    5 +-
 lib/fdtdec.c                                       |   18 +
 lib/string.c                                       |   31 +
 lib/vsprintf.c                                     |   37 +
 test/dm/Makefile                                   |    5 +-
 test/dm/clk_ccf.c                                  |  117 +-
 test/test-main.c                                   |    6 +
 269 files changed, 24338 insertions(+), 932 deletions(-)
---
base-commit: ba7bf918dafcd093ad733b07ba490baeb20cf5da

// Casey (she/they)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
