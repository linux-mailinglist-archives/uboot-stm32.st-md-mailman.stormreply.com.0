Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMGcJMYXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3C2F0421
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C055FC8F26F;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1135CC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:32 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so14449095e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953911; x=1774558711;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=e1ilsZEl6RDnRmkG8UcXE3x/i0OJKkT2PfZ7Yh1Qkmw=;
 b=k6pyWxRcug5ORKVUjXG6d4BUQ69dNrjgRUKk/YytuwpdrEZK9dDKc5+eMO9YqwsTUw
 XGtBuu3G7LMq22wRQKXlto1qrksEiEFEAzlcJ0YcoaT4yq4eyLnj5gsl/X9XXRSKU3/9
 d4SBfhAFN11iDWG5YHL9WX56F4tFCX7iXRWdjMSsA4kHfCPkrqnDPDKNxI/3Q1SR994+
 Uv+N7z3n/QVaUGvmapORZkGTSS5/bE1Iib4TBkSSLff4M2KMo9cJaN8rmy0OpKrLJxCv
 vKWqMde/2fRjcRIC2sZXe1muX0XZ7crdqJfZWOIKzkCg2GG6gPX8Fo+UxaC9VIT7TzoP
 RojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953911; x=1774558711;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e1ilsZEl6RDnRmkG8UcXE3x/i0OJKkT2PfZ7Yh1Qkmw=;
 b=bJgCk/23sJHWOfMV1p2dB6KpNGhPTFOY0JhnhfPS/vJ45HphVLJX5YTOEuWnUA1GUM
 TPuFCUQM9j99A4/Qn/zFW6Pia/NpbqDEFchDzjVNnp15A6XtiLZjgViqd9DtV6F7V5yv
 a72sfLGmxQxZwl1nOOP6vKHhj7gWTRxw+FuKtXmT3++Z50J2fZtN3d0kBy2b6dgRrdCw
 5ZPfs6uBQhILHaPAV4ohhkSvDS+OGzN4HTo/BJ1cqj+T7jTso0gFSu35Jgr+FIygOW85
 J1nw92iVptwjBSgxP/YVF+Ul5iy52gB+p6tm7S+r6tu7s1GZTdqv0GX/JWF81YBlESVg
 xRCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKuiM3KwRKr/WuWSb6yc0gXyZHeBgS1Yr0bfI7dMj3Wa9D+pYDChGtCJl4yqhhxxhyFPExvBV00+JPVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwBJyIwLhVN+s78BSUOgQrAjRgNkXMhtGxpgH3nAQOgYBXzRRn3
 pf9Yj5wKuh/ZjK/WDkG+2rDsEqRnWTEKfrsZ1FXuVTWwHh2k/JilyA2jUeoK5FhVS7E=
X-Gm-Gg: ATEYQzyJ6nXBXjVP+fSXrbZm+X5exg7SlvXEX7QyJfAHXFWt0nmkAFQhba5+O7SfKwb
 E88XhewkS8GUGbg0PLhTeTgo6FfXDAeR8FV2VGdFGcpbm7kSN0mSBvD7EafUnJ61Q+vV9ar6gxD
 tOCNkfUYbYP4bAsbQN78y3xibqo4bfNjM7rM/WK48lygylg57mXwnG9vcF+bYI9aNzrDv02gG23
 Oqd0x84QbWKsIQerBJFw5wOA9vfxCQf5yGTQZDrTb5RowmTVZmQsOR5gcAfZdWjWG33VQzc7qS0
 OXskfDSICinwgbsCHAWSLt4v7goGxbnpr+nAwVuHPK7AjF2E1e1W9Z0FkqVTfePP+C0SqwWSzdi
 bLnqT8pr4I5nzhzIWDxrurmmIRrxAnQfhhuMWgJG9i0HIW7AbiUbbxn6lV9AysIUTGFZOvIE4jJ
 aSOs/gQB8lWcHNTid6Pfqpo0BpX4Nw+PKB3dLWWKrCqxi2UzOK+rmZ/IlW0tG8kyejQzHjWeLlN
 tRyTw==
X-Received: by 2002:a05:600c:6308:b0:482:f564:d613 with SMTP id
 5b1f17b1804b1-486fee0d9bcmr7554495e9.15.1773953910419; 
 Thu, 19 Mar 2026 13:58:30 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:29 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:46 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-24-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=170309;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=weBUeVeJoLKsZ/M61GxKvRkLmHiLISiJzZzJheHQh78=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yQJLZDUfbRSLl+ddcqL8idNDdz6WiaxOIU8spttqh
 7nYrfHoKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABNJWcfwv1KrM7eb/+3SmH72
 3jeKec9sI1si+ysf2//IOPci/AzvG4Z/WsW/i9nn+KSFT5j7qHH9x8XL2SLT179O8L8v31acfDz
 HBgA=
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
Subject: [Uboot-stm32] [PATCH RFC 24/40] clk/ccf: adapt CCF core for U-Boot
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,linaro.org:email,linaro.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,samsung.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 20D3C2F0421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Most of this is just removing locking code and making minor adjustments
to structs. We don't support clkdev since it doesn't seem necessary when
devicetrees are correct.

The most notable change here is in of_clk_get_hw_from_clkspec() where
we find the clock device (which could be of any uclass) and ensure it's
probed, this is necessary so that the clock device can register its
clocks and of_provider with CCF.

The CCF debugfs code is also adapted to be callable from U-Boot.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/ccf/clk.c                 | 2999 ++++-----------------------------
 drivers/clk/ccf/clk.h                 |   57 +-
 include/clk.h                         |   30 +
 include/linux/clk-provider-ccf_full.h |  325 ++--
 4 files changed, 526 insertions(+), 2885 deletions(-)

diff --git a/drivers/clk/ccf/clk.c b/drivers/clk/ccf/clk.c
index 73aaa96b3d0e..e21d494d6cbe 100644
--- a/drivers/clk/ccf/clk.c
+++ b/drivers/clk/ccf/clk.c
@@ -5,46 +5,43 @@
  *
  * Standard functionality for the common clock API.  See Documentation/driver-api/clk.rst
  */
 
-#include <linux/clk/clk-conf.h>
-#include <linux/clkdev.h>
-#include <linux/clk.h>
+#define pr_fmt(fmt) "[CLK] "fmt
+#define LOG_DEBUG
+
+#include <clk.h>
+#include <clk-uclass.h>
+#include <dm/devres.h>
+#include <linux/bug.h>
 #include <linux/clk-provider.h>
+#include <linux/compat.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/device.h>
-#include <linux/err.h>
-#include <linux/hashtable.h>
-#include <linux/init.h>
-#include <linux/list.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/pm_runtime.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/string.h>
-#include <linux/stringhash.h>
+#include <linux/kref.h>
+#include <log.h>
+#include <dm/device.h>
+#include <dm/uclass.h>
+#include <dm/lists.h>
+#include <dm/device-internal.h>
+#include <dm/device_compat.h>
 
-static DEFINE_SPINLOCK(enable_lock);
-static DEFINE_MUTEX(prepare_lock);
+#include "clk.h"
 
-static struct task_struct *prepare_owner;
-static struct task_struct *enable_owner;
+/*
+ * List of orphan clk_core's who's parents haven't been registered yet
+ */
+static struct hlist_head __section(".data") clk_orphan_list = HLIST_HEAD_INIT;
 
-static int prepare_refcnt;
-static int enable_refcnt;
+/*
+ * List of root clocks (which have no parent)
+ */
+static struct hlist_head __section(".data") clk_root_list = HLIST_HEAD_INIT;
 
-#define CLK_HASH_BITS 9
-static DEFINE_HASHTABLE(clk_hashtable, CLK_HASH_BITS);
-
-static HLIST_HEAD(clk_root_list);
-static HLIST_HEAD(clk_orphan_list);
-static LIST_HEAD(clk_notifier_list);
-
-/* List of registered clks that use runtime PM */
-static HLIST_HEAD(clk_rpm_list);
-static DEFINE_MUTEX(clk_rpm_list_lock);
+/*
+ * List of all initialise clk_core's. Linux uses a hashtable, we use a hlist
+ */
+static struct hlist_head __section(".data") clk_hashtable = HLIST_HEAD_INIT;
 
 static const struct hlist_head *all_lists[] = {
 	&clk_root_list,
 	&clk_orphan_list,
@@ -64,12 +61,10 @@ struct clk_parent_map {
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;
 	struct clk_hw		*hw;
-	struct module		*owner;
-	struct device		*dev;
-	struct hlist_node	rpm_node;
-	struct device_node	*of_node;
+	struct udevice		*dev;
+	ofnode			ofnode;
 	struct clk_core		*parent;
 	struct clk_parent_map	*parents;
 	u8			num_parents;
 	u8			new_parent_index;
@@ -79,217 +74,19 @@ struct clk_core {
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
 	unsigned long		flags;
 	bool			orphan;
-	bool			rpm_enabled;
-	unsigned int		enable_count;
-	unsigned int		prepare_count;
-	unsigned int		protect_count;
+	unsigned short		prepare_count;
+	unsigned short		enable_count;
 	unsigned long		min_rate;
 	unsigned long		max_rate;
-	unsigned long		accuracy;
-	int			phase;
-	struct clk_duty		duty;
 	struct hlist_head	children;
 	struct hlist_node	child_node;
 	struct hlist_node	hashtable_node;
 	struct hlist_head	clks;
-	unsigned int		notifier_count;
-#ifdef CONFIG_DEBUG_FS
-	struct dentry		*dentry;
-	struct hlist_node	debug_node;
-#endif
 	struct kref		ref;
 };
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/clk.h>
-
-struct clk {
-	struct clk_core	*core;
-	struct device *dev;
-	const char *dev_id;
-	const char *con_id;
-	unsigned long min_rate;
-	unsigned long max_rate;
-	unsigned int exclusive_count;
-	struct hlist_node clks_node;
-};
-
-/***           runtime pm          ***/
-static int clk_pm_runtime_get(struct clk_core *core)
-{
-	if (!core->rpm_enabled)
-		return 0;
-
-	return pm_runtime_resume_and_get(core->dev);
-}
-
-static void clk_pm_runtime_put(struct clk_core *core)
-{
-	if (!core->rpm_enabled)
-		return;
-
-	pm_runtime_put_sync(core->dev);
-}
-
-/**
- * clk_pm_runtime_get_all() - Runtime "get" all clk provider devices
- *
- * Call clk_pm_runtime_get() on all runtime PM enabled clks in the clk tree so
- * that disabling unused clks avoids a deadlock where a device is runtime PM
- * resuming/suspending and the runtime PM callback is trying to grab the
- * prepare_lock for something like clk_prepare_enable() while
- * clk_disable_unused_subtree() holds the prepare_lock and is trying to runtime
- * PM resume/suspend the device as well.
- *
- * Context: Acquires the 'clk_rpm_list_lock' and returns with the lock held on
- * success. Otherwise the lock is released on failure.
- *
- * Return: 0 on success, negative errno otherwise.
- */
-static int clk_pm_runtime_get_all(void)
-{
-	int ret;
-	struct clk_core *core, *failed;
-
-	/*
-	 * Grab the list lock to prevent any new clks from being registered
-	 * or unregistered until clk_pm_runtime_put_all().
-	 */
-	mutex_lock(&clk_rpm_list_lock);
-
-	/*
-	 * Runtime PM "get" all the devices that are needed for the clks
-	 * currently registered. Do this without holding the prepare_lock, to
-	 * avoid the deadlock.
-	 */
-	hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
-		ret = clk_pm_runtime_get(core);
-		if (ret) {
-			failed = core;
-			pr_err("clk: Failed to runtime PM get '%s' for clk '%s'\n",
-			       dev_name(failed->dev), failed->name);
-			goto err;
-		}
-	}
-
-	return 0;
-
-err:
-	hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
-		if (core == failed)
-			break;
-
-		clk_pm_runtime_put(core);
-	}
-	mutex_unlock(&clk_rpm_list_lock);
-
-	return ret;
-}
-
-/**
- * clk_pm_runtime_put_all() - Runtime "put" all clk provider devices
- *
- * Put the runtime PM references taken in clk_pm_runtime_get_all() and release
- * the 'clk_rpm_list_lock'.
- */
-static void clk_pm_runtime_put_all(void)
-{
-	struct clk_core *core;
-
-	hlist_for_each_entry(core, &clk_rpm_list, rpm_node)
-		clk_pm_runtime_put(core);
-	mutex_unlock(&clk_rpm_list_lock);
-}
-
-static void clk_pm_runtime_init(struct clk_core *core)
-{
-	struct device *dev = core->dev;
-
-	if (dev && pm_runtime_enabled(dev)) {
-		core->rpm_enabled = true;
-
-		mutex_lock(&clk_rpm_list_lock);
-		hlist_add_head(&core->rpm_node, &clk_rpm_list);
-		mutex_unlock(&clk_rpm_list_lock);
-	}
-}
-
-/***           locking             ***/
-static void clk_prepare_lock(void)
-{
-	if (!mutex_trylock(&prepare_lock)) {
-		if (prepare_owner == current) {
-			prepare_refcnt++;
-			return;
-		}
-		mutex_lock(&prepare_lock);
-	}
-	WARN_ON_ONCE(prepare_owner != NULL);
-	WARN_ON_ONCE(prepare_refcnt != 0);
-	prepare_owner = current;
-	prepare_refcnt = 1;
-}
-
-static void clk_prepare_unlock(void)
-{
-	WARN_ON_ONCE(prepare_owner != current);
-	WARN_ON_ONCE(prepare_refcnt == 0);
-
-	if (--prepare_refcnt)
-		return;
-	prepare_owner = NULL;
-	mutex_unlock(&prepare_lock);
-}
-
-static unsigned long clk_enable_lock(void)
-	__acquires(enable_lock)
-{
-	unsigned long flags;
-
-	/*
-	 * On UP systems, spin_trylock_irqsave() always returns true, even if
-	 * we already hold the lock. So, in that case, we rely only on
-	 * reference counting.
-	 */
-	if (!IS_ENABLED(CONFIG_SMP) ||
-	    !spin_trylock_irqsave(&enable_lock, flags)) {
-		if (enable_owner == current) {
-			enable_refcnt++;
-			__acquire(enable_lock);
-			if (!IS_ENABLED(CONFIG_SMP))
-				local_save_flags(flags);
-			return flags;
-		}
-		spin_lock_irqsave(&enable_lock, flags);
-	}
-	WARN_ON_ONCE(enable_owner != NULL);
-	WARN_ON_ONCE(enable_refcnt != 0);
-	enable_owner = current;
-	enable_refcnt = 1;
-	return flags;
-}
-
-static void clk_enable_unlock(unsigned long flags)
-	__releases(enable_lock)
-{
-	WARN_ON_ONCE(enable_owner != current);
-	WARN_ON_ONCE(enable_refcnt == 0);
-
-	if (--enable_refcnt) {
-		__release(enable_lock);
-		return;
-	}
-	enable_owner = NULL;
-	spin_unlock_irqrestore(&enable_lock, flags);
-}
-
-static bool clk_core_rate_is_protected(struct clk_core *core)
-{
-	return core->protect_count;
-}
-
 static bool clk_core_is_prepared(struct clk_core *core)
 {
 	bool ret = false;
 
@@ -299,12 +96,9 @@ static bool clk_core_is_prepared(struct clk_core *core)
 	 */
 	if (!core->ops->is_prepared)
 		return core->prepare_count;
 
-	if (!clk_pm_runtime_get(core)) {
-		ret = core->ops->is_prepared(core->hw);
-		clk_pm_runtime_put(core);
-	}
+	ret = core->ops->is_prepared(core->hw);
 
 	return ret;
 }
 
@@ -318,26 +112,8 @@ static bool clk_core_is_enabled(struct clk_core *core)
 	 */
 	if (!core->ops->is_enabled)
 		return core->enable_count;
 
-	/*
-	 * Check if clock controller's device is runtime active before
-	 * calling .is_enabled callback. If not, assume that clock is
-	 * disabled, because we might be called from atomic context, from
-	 * which pm_runtime_get() is not allowed.
-	 * This function is called mainly from clk_disable_unused_subtree,
-	 * which ensures proper runtime pm activation of controller before
-	 * taking enable spinlock, but the below check is needed if one tries
-	 * to call it from other places.
-	 */
-	if (core->rpm_enabled) {
-		pm_runtime_get_noresume(core->dev);
-		if (!pm_runtime_active(core->dev)) {
-			ret = false;
-			goto done;
-		}
-	}
-
 	/*
 	 * This could be called with the enable lock held, or from atomic
 	 * context. If the parent isn't enabled already, we can't do
 	 * anything here. We can also assume this clock isn't enabled.
@@ -348,10 +124,10 @@ static bool clk_core_is_enabled(struct clk_core *core)
 			goto done;
 		}
 
 	ret = core->ops->is_enabled(core->hw);
+
 done:
-	if (core->rpm_enabled)
 		pm_runtime_put(core->dev);
 
 	return ret;
 }
@@ -369,17 +145,17 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 	return hw->core->name;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
-struct device *clk_hw_get_dev(const struct clk_hw *hw)
+struct udevice *clk_hw_get_dev(const struct clk_hw *hw)
 {
 	return hw->core->dev;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_dev);
 
-struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
+ofnode clk_hw_get_of_node(const struct clk_hw *hw)
 {
-	return hw->core->of_node;
+	return hw->core->ofnode;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
 
 struct clk_hw *__clk_get_hw(struct clk *clk)
@@ -402,41 +178,24 @@ EXPORT_SYMBOL_GPL(clk_hw_get_parent);
 
 static struct clk_core *clk_core_lookup(const char *name)
 {
 	struct clk_core *core;
-	u32 hash;
 
 	if (!name)
 		return NULL;
 
-	hash = full_name_hash(NULL, name, strlen(name));
-
 	/* search the hashtable */
-	hash_for_each_possible(clk_hashtable, core, hashtable_node, hash)
-		if (!strcmp(core->name, name))
+	hlist_for_each_entry(core, &clk_hashtable, hashtable_node)
+		if (!strcmp(core->name, name) && strlen(name) == strlen(core->name))
 			return core;
 
 	return NULL;
 }
 
-#ifdef CONFIG_OF
-static int of_parse_clkspec(const struct device_node *np, int index,
-			    const char *name, struct of_phandle_args *out_args);
-static struct clk_hw *
-of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec);
-#else
-static inline int of_parse_clkspec(const struct device_node *np, int index,
-				   const char *name,
-				   struct of_phandle_args *out_args)
-{
-	return -ENOENT;
-}
-static inline struct clk_hw *
-of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
-{
-	return ERR_PTR(-ENOENT);
-}
-#endif
+static int of_parse_clkspec(const ofnode np, int index,
+			    const char *name, struct ofnode_phandle_args *out_args);
+struct clk_hw *
+of_clk_get_hw_from_clkspec(struct ofnode_phandle_args *clkspec);
 
 /**
  * clk_core_get - Find the clk_core parent of a clk
  * @core: clk to find parent of
@@ -477,23 +236,23 @@ static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
 {
 	const char *name = core->parents[p_index].fw_name;
 	int index = core->parents[p_index].index;
 	struct clk_hw *hw = ERR_PTR(-ENOENT);
-	struct device *dev = core->dev;
-	const char *dev_id = dev ? dev_name(dev) : NULL;
-	struct device_node *np = core->of_node;
-	struct of_phandle_args clkspec;
+	ofnode np = core->ofnode;
+	struct ofnode_phandle_args clkspec;
 
-	if (np && (name || index >= 0) &&
+	if (ofnode_valid(np) && (name || index >= 0) &&
 	    !of_parse_clkspec(np, index, name, &clkspec)) {
 		hw = of_clk_get_hw_from_clkspec(&clkspec);
-		of_node_put(clkspec.np);
+		ofnode_put(clkspec.node);
 	} else if (name) {
 		/*
 		 * If the DT search above couldn't find the provider fallback to
 		 * looking up via clkdev based clk_lookups.
 		 */
-		hw = clk_find_hw(dev_id, name);
+		// hw = clk_find_hw(dev_id, name);
+		WARN(1, "[CCF]: clkdev lookups aren't yet supported!\n");
+		return ERR_PTR(-ENOENT);
 	}
 
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
@@ -579,28 +338,14 @@ unsigned long clk_hw_get_rate(const struct clk_hw *hw)
 	return clk_core_get_rate_nolock(hw->core);
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_rate);
 
-static unsigned long clk_core_get_accuracy_no_lock(struct clk_core *core)
-{
-	if (!core)
-		return 0;
-
-	return core->accuracy;
-}
-
 unsigned long clk_hw_get_flags(const struct clk_hw *hw)
 {
 	return hw->core->flags;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_flags);
 
-bool clk_hw_is_prepared(const struct clk_hw *hw)
-{
-	return clk_core_is_prepared(hw->core);
-}
-EXPORT_SYMBOL_GPL(clk_hw_is_prepared);
-
 bool clk_hw_is_enabled(const struct clk_hw *hw)
 {
 	return clk_core_is_enabled(hw->core);
 }
@@ -690,16 +435,12 @@ clk_core_determine_rate_no_reparent(struct clk_hw *hw,
 
 		clk_core_forward_rate_req(core, req, parent, &parent_req,
 					  req->rate);
 
-		trace_clk_rate_request_start(&parent_req);
-
 		ret = clk_core_round_rate_nolock(parent, &parent_req);
 		if (ret)
 			return ret;
 
-		trace_clk_rate_request_done(&parent_req);
-
 		best = parent_req.rate;
 	} else if (parent) {
 		best = clk_core_get_rate_nolock(parent);
 	} else {
@@ -737,16 +478,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 			struct clk_rate_request parent_req;
 
 			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
 
-			trace_clk_rate_request_start(&parent_req);
-
 			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
 
-			trace_clk_rate_request_done(&parent_req);
-
 			parent_rate = parent_req.rate;
 		} else {
 			parent_rate = clk_core_get_rate_nolock(parent);
 		}
@@ -775,24 +512,15 @@ struct clk *__clk_lookup(const char *name)
 
 	return !core ? NULL : core->hw->clk;
 }
 
+/* U-Boot: we don't track requests per-user */
 static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
 				    unsigned long *max_rate)
 {
-	struct clk *clk_user;
-
-	lockdep_assert_held(&prepare_lock);
-
 	*min_rate = core->min_rate;
 	*max_rate = core->max_rate;
-
-	hlist_for_each_entry(clk_user, &core->clks, clks_node)
-		*min_rate = max(*min_rate, clk_user->min_rate);
-
-	hlist_for_each_entry(clk_user, &core->clks, clks_node)
-		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
 /*
  * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
@@ -809,26 +537,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 	clk_core_get_boundaries(hw->core, min_rate, max_rate);
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
 
-static bool clk_core_check_boundaries(struct clk_core *core,
-				      unsigned long min_rate,
-				      unsigned long max_rate)
-{
-	struct clk *user;
-
-	lockdep_assert_held(&prepare_lock);
-
-	if (min_rate > core->max_rate || max_rate < core->min_rate)
-		return false;
-
-	hlist_for_each_entry(user, &core->clks, clks_node)
-		if (min_rate > user->max_rate || max_rate < user->min_rate)
-			return false;
-
-	return true;
-}
-
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate)
 {
 	hw->core->min_rate = min_rate;
@@ -880,166 +590,10 @@ int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(clk_hw_determine_rate_no_reparent);
 
 /***        clk api        ***/
-
-static void clk_core_rate_unprotect(struct clk_core *core)
-{
-	lockdep_assert_held(&prepare_lock);
-
-	if (!core)
-		return;
-
-	if (WARN(core->protect_count == 0,
-	    "%s already unprotected\n", core->name))
-		return;
-
-	if (--core->protect_count > 0)
-		return;
-
-	clk_core_rate_unprotect(core->parent);
-}
-
-static int clk_core_rate_nuke_protect(struct clk_core *core)
-{
-	int ret;
-
-	lockdep_assert_held(&prepare_lock);
-
-	if (!core)
-		return -EINVAL;
-
-	if (core->protect_count == 0)
-		return 0;
-
-	ret = core->protect_count;
-	core->protect_count = 1;
-	clk_core_rate_unprotect(core);
-
-	return ret;
-}
-
-/**
- * clk_rate_exclusive_put - release exclusivity over clock rate control
- * @clk: the clk over which the exclusivity is released
- *
- * clk_rate_exclusive_put() completes a critical section during which a clock
- * consumer cannot tolerate any other consumer making any operation on the
- * clock which could result in a rate change or rate glitch. Exclusive clocks
- * cannot have their rate changed, either directly or indirectly due to changes
- * further up the parent chain of clocks. As a result, clocks up parent chain
- * also get under exclusive control of the calling consumer.
- *
- * If exlusivity is claimed more than once on clock, even by the same consumer,
- * the rate effectively gets locked as exclusivity can't be preempted.
- *
- * Calls to clk_rate_exclusive_put() must be balanced with calls to
- * clk_rate_exclusive_get(). Calls to this function may sleep, and do not return
- * error status.
- */
-void clk_rate_exclusive_put(struct clk *clk)
-{
-	if (!clk)
-		return;
-
-	clk_prepare_lock();
-
-	/*
-	 * if there is something wrong with this consumer protect count, stop
-	 * here before messing with the provider
-	 */
-	if (WARN_ON(clk->exclusive_count <= 0))
-		goto out;
-
-	clk_core_rate_unprotect(clk->core);
-	clk->exclusive_count--;
-out:
-	clk_prepare_unlock();
-}
-EXPORT_SYMBOL_GPL(clk_rate_exclusive_put);
-
-static void clk_core_rate_protect(struct clk_core *core)
-{
-	lockdep_assert_held(&prepare_lock);
-
-	if (!core)
-		return;
-
-	if (core->protect_count == 0)
-		clk_core_rate_protect(core->parent);
-
-	core->protect_count++;
-}
-
-static void clk_core_rate_restore_protect(struct clk_core *core, int count)
-{
-	lockdep_assert_held(&prepare_lock);
-
-	if (!core)
-		return;
-
-	if (count == 0)
-		return;
-
-	clk_core_rate_protect(core);
-	core->protect_count = count;
-}
-
-/**
- * clk_rate_exclusive_get - get exclusivity over the clk rate control
- * @clk: the clk over which the exclusity of rate control is requested
- *
- * clk_rate_exclusive_get() begins a critical section during which a clock
- * consumer cannot tolerate any other consumer making any operation on the
- * clock which could result in a rate change or rate glitch. Exclusive clocks
- * cannot have their rate changed, either directly or indirectly due to changes
- * further up the parent chain of clocks. As a result, clocks up parent chain
- * also get under exclusive control of the calling consumer.
- *
- * If exlusivity is claimed more than once on clock, even by the same consumer,
- * the rate effectively gets locked as exclusivity can't be preempted.
- *
- * Calls to clk_rate_exclusive_get() should be balanced with calls to
- * clk_rate_exclusive_put(). Calls to this function may sleep.
- * Returns 0 on success, -EERROR otherwise
- */
-int clk_rate_exclusive_get(struct clk *clk)
-{
-	if (!clk)
-		return 0;
-
-	clk_prepare_lock();
-	clk_core_rate_protect(clk->core);
-	clk->exclusive_count++;
-	clk_prepare_unlock();
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
-
-static void devm_clk_rate_exclusive_put(void *data)
-{
-	struct clk *clk = data;
-
-	clk_rate_exclusive_put(clk);
-}
-
-int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk)
-{
-	int ret;
-
-	ret = clk_rate_exclusive_get(clk);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev, devm_clk_rate_exclusive_put, clk);
-}
-EXPORT_SYMBOL_GPL(devm_clk_rate_exclusive_get);
-
 static void clk_core_unprepare(struct clk_core *core)
 {
-	lockdep_assert_held(&prepare_lock);
-
 	if (!core)
 		return;
 
 	if (WARN(core->prepare_count == 0,
@@ -1049,32 +603,20 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (WARN(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL,
 	    "Unpreparing critical %s\n", core->name))
 		return;
 
-	if (core->flags & CLK_SET_RATE_GATE)
-		clk_core_rate_unprotect(core);
-
 	if (--core->prepare_count > 0)
 		return;
 
 	WARN(core->enable_count > 0, "Unpreparing enabled %s\n", core->name);
 
-	trace_clk_unprepare(core);
-
 	if (core->ops->unprepare)
 		core->ops->unprepare(core->hw);
 
-	trace_clk_unprepare_complete(core);
 	clk_core_unprepare(core->parent);
-	clk_pm_runtime_put(core);
 }
 
-static void clk_core_unprepare_lock(struct clk_core *core)
-{
-	clk_prepare_lock();
-	clk_core_unprepare(core);
-	clk_prepare_unlock();
-}
+#define clk_core_unprepare_lock(core) clk_core_unprepare(core)
 
 /**
  * clk_unprepare - undo preparation of a clock source
  * @clk: the clk being unprepared
@@ -1090,71 +632,40 @@ void clk_unprepare(struct clk *clk)
 {
 	if (IS_ERR_OR_NULL(clk))
 		return;
 
-	clk_core_unprepare_lock(clk->core);
+	clk_core_unprepare(clk->core);
 }
 EXPORT_SYMBOL_GPL(clk_unprepare);
 
 static int clk_core_prepare(struct clk_core *core)
 {
 	int ret = 0;
 
-	lockdep_assert_held(&prepare_lock);
-
 	if (!core)
 		return 0;
 
 	if (core->prepare_count == 0) {
-		ret = clk_pm_runtime_get(core);
+		ret = clk_core_prepare(core->parent);
 		if (ret)
 			return ret;
 
-		ret = clk_core_prepare(core->parent);
-		if (ret)
-			goto runtime_put;
-
-		trace_clk_prepare(core);
-
 		if (core->ops->prepare)
 			ret = core->ops->prepare(core->hw);
 
-		trace_clk_prepare_complete(core);
-
 		if (ret)
 			goto unprepare;
 	}
 
 	core->prepare_count++;
 
-	/*
-	 * CLK_SET_RATE_GATE is a special case of clock protection
-	 * Instead of a consumer claiming exclusive rate control, it is
-	 * actually the provider which prevents any consumer from making any
-	 * operation which could result in a rate change or rate glitch while
-	 * the clock is prepared.
-	 */
-	if (core->flags & CLK_SET_RATE_GATE)
-		clk_core_rate_protect(core);
-
 	return 0;
 unprepare:
 	clk_core_unprepare(core->parent);
-runtime_put:
-	clk_pm_runtime_put(core);
 	return ret;
 }
 
-static int clk_core_prepare_lock(struct clk_core *core)
-{
-	int ret;
-
-	clk_prepare_lock();
-	ret = clk_core_prepare(core);
-	clk_prepare_unlock();
-
-	return ret;
-}
+#define clk_core_prepare_lock(core) clk_core_prepare(core)
 
 /**
  * clk_prepare - prepare a clock source
  * @clk: the clk being prepared
@@ -1177,13 +688,13 @@ int clk_prepare(struct clk *clk)
 EXPORT_SYMBOL_GPL(clk_prepare);
 
 static void clk_core_disable(struct clk_core *core)
 {
-	lockdep_assert_held(&enable_lock);
-
 	if (!core)
 		return;
 
+	pr_debug("%s disable\n", core->name);
+
 	if (WARN(core->enable_count == 0, "%s already disabled\n", core->name))
 		return;
 
 	if (WARN(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL,
@@ -1192,26 +703,15 @@ static void clk_core_disable(struct clk_core *core)
 
 	if (--core->enable_count > 0)
 		return;
 
-	trace_clk_disable(core);
-
 	if (core->ops->disable)
 		core->ops->disable(core->hw);
 
-	trace_clk_disable_complete(core);
-
 	clk_core_disable(core->parent);
 }
 
-static void clk_core_disable_lock(struct clk_core *core)
-{
-	unsigned long flags;
-
-	flags = clk_enable_lock();
-	clk_core_disable(core);
-	clk_enable_unlock(flags);
-}
+#define clk_core_disable_lock(core) clk_core_disable(core)
 
 /**
  * clk_disable - gate a clock
  * @clk: the clk being gated
@@ -1223,43 +723,42 @@ static void clk_core_disable_lock(struct clk_core *core)
  * complex case a clk gate operation may require a fast and a slow part.  It is
  * this reason that clk_unprepare and clk_disable are not mutually exclusive.
  * In fact clk_disable must be called before clk_unprepare.
  */
-void clk_disable(struct clk *clk)
+int clk_disable(struct clk *clk)
 {
 	if (IS_ERR_OR_NULL(clk))
-		return;
+		return -EINVAL;
 
-	clk_core_disable_lock(clk->core);
+	clk_core_disable(clk->core);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(clk_disable);
 
 static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
 
-	lockdep_assert_held(&enable_lock);
-
 	if (!core)
 		return 0;
 
-	if (WARN(core->prepare_count == 0,
-	    "Enabling unprepared %s\n", core->name))
-		return -ESHUTDOWN;
+	if (!clk_core_is_prepared(core) && core->ops->prepare) {
+		pr_debug("%s: enable without prepare!", core->name);
+		ret = clk_core_prepare(core);
+		if (ret)
+			return ret;
+	}
 
 	if (core->enable_count == 0) {
 		ret = clk_core_enable(core->parent);
 
 		if (ret)
 			return ret;
 
-		trace_clk_enable(core);
-
 		if (core->ops->enable)
 			ret = core->ops->enable(core->hw);
 
-		trace_clk_enable_complete(core);
-
 		if (ret) {
 			clk_core_disable(core->parent);
 			return ret;
 		}
@@ -1268,114 +767,9 @@ static int clk_core_enable(struct clk_core *core)
 	core->enable_count++;
 	return 0;
 }
 
-static int clk_core_enable_lock(struct clk_core *core)
-{
-	unsigned long flags;
-	int ret;
-
-	flags = clk_enable_lock();
-	ret = clk_core_enable(core);
-	clk_enable_unlock(flags);
-
-	return ret;
-}
-
-/**
- * clk_gate_restore_context - restore context for poweroff
- * @hw: the clk_hw pointer of clock whose state is to be restored
- *
- * The clock gate restore context function enables or disables
- * the gate clocks based on the enable_count. This is done in cases
- * where the clock context is lost and based on the enable_count
- * the clock either needs to be enabled/disabled. This
- * helps restore the state of gate clocks.
- */
-void clk_gate_restore_context(struct clk_hw *hw)
-{
-	struct clk_core *core = hw->core;
-
-	if (core->enable_count)
-		core->ops->enable(hw);
-	else
-		core->ops->disable(hw);
-}
-EXPORT_SYMBOL_GPL(clk_gate_restore_context);
-
-static int clk_core_save_context(struct clk_core *core)
-{
-	struct clk_core *child;
-	int ret = 0;
-
-	hlist_for_each_entry(child, &core->children, child_node) {
-		ret = clk_core_save_context(child);
-		if (ret < 0)
-			return ret;
-	}
-
-	if (core->ops && core->ops->save_context)
-		ret = core->ops->save_context(core->hw);
-
-	return ret;
-}
-
-static void clk_core_restore_context(struct clk_core *core)
-{
-	struct clk_core *child;
-
-	if (core->ops && core->ops->restore_context)
-		core->ops->restore_context(core->hw);
-
-	hlist_for_each_entry(child, &core->children, child_node)
-		clk_core_restore_context(child);
-}
-
-/**
- * clk_save_context - save clock context for poweroff
- *
- * Saves the context of the clock register for powerstates in which the
- * contents of the registers will be lost. Occurs deep within the suspend
- * code.  Returns 0 on success.
- */
-int clk_save_context(void)
-{
-	struct clk_core *clk;
-	int ret;
-
-	hlist_for_each_entry(clk, &clk_root_list, child_node) {
-		ret = clk_core_save_context(clk);
-		if (ret < 0)
-			return ret;
-	}
-
-	hlist_for_each_entry(clk, &clk_orphan_list, child_node) {
-		ret = clk_core_save_context(clk);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(clk_save_context);
-
-/**
- * clk_restore_context - restore clock context after poweroff
- *
- * Restore the saved clock context upon resume.
- *
- */
-void clk_restore_context(void)
-{
-	struct clk_core *core;
-
-	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_core_restore_context(core);
-
-	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_core_restore_context(core);
-}
-EXPORT_SYMBOL_GPL(clk_restore_context);
+#define clk_core_enable_lock(core) clk_core_enable(core)
 
 /**
  * clk_enable - ungate a clock
  * @clk: the clk being ungated
@@ -1397,28 +791,8 @@ int clk_enable(struct clk *clk)
 	return clk_core_enable_lock(clk->core);
 }
 EXPORT_SYMBOL_GPL(clk_enable);
 
-/**
- * clk_is_enabled_when_prepared - indicate if preparing a clock also enables it.
- * @clk: clock source
- *
- * Returns true if clk_prepare() implicitly enables the clock, effectively
- * making clk_enable()/clk_disable() no-ops, false otherwise.
- *
- * This is of interest mainly to power management code where actually
- * disabling the clock also requires unpreparing it to have any material
- * effect.
- *
- * Regardless of the value returned here, the caller must always invoke
- * clk_enable() or clk_prepare_enable()  and counterparts for usage counts
- * to be right.
- */
-bool clk_is_enabled_when_prepared(struct clk *clk)
-{
-	return clk && !(clk->core->ops->enable && clk->core->ops->disable);
-}
-EXPORT_SYMBOL_GPL(clk_is_enabled_when_prepared);
 
 static int clk_core_prepare_enable(struct clk_core *core)
 {
 	int ret;
@@ -1439,130 +813,13 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_disable_lock(core);
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
-{
-	struct clk_core *child;
-
-	lockdep_assert_held(&prepare_lock);
-
-	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
-
-	if (core->prepare_count)
-		return;
-
-	if (core->flags & CLK_IGNORE_UNUSED)
-		return;
-
-	if (clk_core_is_prepared(core)) {
-		trace_clk_unprepare(core);
-		if (core->ops->unprepare_unused)
-			core->ops->unprepare_unused(core->hw);
-		else if (core->ops->unprepare)
-			core->ops->unprepare(core->hw);
-		trace_clk_unprepare_complete(core);
-	}
-}
-
-static void __init clk_disable_unused_subtree(struct clk_core *core)
-{
-	struct clk_core *child;
-	unsigned long flags;
-
-	lockdep_assert_held(&prepare_lock);
-
-	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
-
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_prepare_enable(core->parent);
-
-	flags = clk_enable_lock();
-
-	if (core->enable_count)
-		goto unlock_out;
-
-	if (core->flags & CLK_IGNORE_UNUSED)
-		goto unlock_out;
-
-	/*
-	 * some gate clocks have special needs during the disable-unused
-	 * sequence.  call .disable_unused if available, otherwise fall
-	 * back to .disable
-	 */
-	if (clk_core_is_enabled(core)) {
-		trace_clk_disable(core);
-		if (core->ops->disable_unused)
-			core->ops->disable_unused(core->hw);
-		else if (core->ops->disable)
-			core->ops->disable(core->hw);
-		trace_clk_disable_complete(core);
-	}
-
-unlock_out:
-	clk_enable_unlock(flags);
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_disable_unprepare(core->parent);
-}
-
-static bool clk_ignore_unused __initdata;
-static int __init clk_ignore_unused_setup(char *__unused)
-{
-	clk_ignore_unused = true;
-	return 1;
-}
-__setup("clk_ignore_unused", clk_ignore_unused_setup);
-
-static int __init clk_disable_unused(void)
-{
-	struct clk_core *core;
-	int ret;
-
-	if (clk_ignore_unused) {
-		pr_warn("clk: Not disabling unused clocks\n");
-		return 0;
-	}
-
-	pr_info("clk: Disabling unused clocks\n");
-
-	ret = clk_pm_runtime_get_all();
-	if (ret)
-		return ret;
-	/*
-	 * Grab the prepare lock to keep the clk topology stable while iterating
-	 * over clks.
-	 */
-	clk_prepare_lock();
-
-	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
-
-	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
-
-	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
-
-	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
-
-	clk_prepare_unlock();
-
-	clk_pm_runtime_put_all();
-
-	return 0;
-}
-late_initcall_sync(clk_disable_unused);
-
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
 	long rate;
 
-	lockdep_assert_held(&prepare_lock);
-
 	if (!core)
 		return 0;
 
 	/*
@@ -1584,11 +841,11 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	 * - if the provider is not protected at all
 	 * - if the calling consumer is the only one which has exclusivity
 	 *   over the provider
 	 */
-	if (clk_core_rate_is_protected(core)) {
+	/*if (clk_core_rate_is_protected(core)) {
 		req->rate = core->rate;
-	} else if (core->ops->determine_rate) {
+	} else*/ if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
 	} else if (core->ops->round_rate) {
 		rate = core->ops->round_rate(core->hw, req->rate,
 					     &req->best_parent_rate);
@@ -1687,10 +944,8 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req)
 {
 	int ret;
 
-	lockdep_assert_held(&prepare_lock);
-
 	if (!core) {
 		req->rate = 0;
 		return 0;
 	}
@@ -1702,16 +957,12 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		struct clk_rate_request parent_req;
 
 		clk_core_forward_rate_req(core, req, core->parent, &parent_req, req->rate);
 
-		trace_clk_rate_request_start(&parent_req);
-
 		ret = clk_core_round_rate_nolock(core->parent, &parent_req);
 		if (ret)
 			return ret;
 
-		trace_clk_rate_request_done(&parent_req);
-
 		req->best_parent_rate = parent_req.rate;
 		req->rate = parent_req.rate;
 
 		return 0;
@@ -1760,16 +1011,12 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	struct clk_rate_request req;
 
 	clk_core_init_rate_req(hw->core, &req, rate);
 
-	trace_clk_rate_request_start(&req);
-
 	ret = clk_core_round_rate_nolock(hw->core, &req);
 	if (ret)
 		return 0;
 
-	trace_clk_rate_request_done(&req);
-
 	return req.rate;
 }
 EXPORT_SYMBOL_GPL(clk_hw_round_rate);
 
@@ -1781,9 +1028,9 @@ EXPORT_SYMBOL_GPL(clk_hw_round_rate);
  * Takes in a rate as input and rounds it to a rate that the clk can actually
  * use which is then returned.  If clk doesn't support round_rate operation
  * then the parent rate is returned.
  */
-long clk_round_rate(struct clk *clk, unsigned long rate)
+ulong clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk_rate_request req;
 	int ret;
 
@@ -1791,22 +1038,12 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 		return 0;
 
 	clk_prepare_lock();
 
-	if (clk->exclusive_count)
-		clk_core_rate_unprotect(clk->core);
-
 	clk_core_init_rate_req(clk->core, &req, rate);
 
-	trace_clk_rate_request_start(&req);
-
 	ret = clk_core_round_rate_nolock(clk->core, &req);
 
-	trace_clk_rate_request_done(&req);
-
-	if (clk->exclusive_count)
-		clk_core_rate_protect(clk->core);
-
 	clk_prepare_unlock();
 
 	if (ret)
 		return ret;
@@ -1814,114 +1051,15 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	return req.rate;
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
-/**
- * __clk_notify - call clk notifier chain
- * @core: clk that is changing rate
- * @msg: clk notifier type (see include/linux/clk.h)
- * @old_rate: old clk rate
- * @new_rate: new clk rate
- *
- * Triggers a notifier call chain on the clk rate-change notification
- * for 'clk'.  Passes a pointer to the struct clk and the previous
- * and current rates to the notifier callback.  Intended to be called by
- * internal clock code only.  Returns NOTIFY_DONE from the last driver
- * called if all went well, or NOTIFY_STOP or NOTIFY_BAD immediately if
- * a driver returns that.
- */
-static int __clk_notify(struct clk_core *core, unsigned long msg,
-		unsigned long old_rate, unsigned long new_rate)
-{
-	struct clk_notifier *cn;
-	struct clk_notifier_data cnd;
-	int ret = NOTIFY_DONE;
-
-	cnd.old_rate = old_rate;
-	cnd.new_rate = new_rate;
-
-	list_for_each_entry(cn, &clk_notifier_list, node) {
-		if (cn->clk->core == core) {
-			cnd.clk = cn->clk;
-			ret = srcu_notifier_call_chain(&cn->notifier_head, msg,
-					&cnd);
-			if (ret & NOTIFY_STOP_MASK)
-				return ret;
-		}
-	}
-
-	return ret;
-}
-
-/**
- * __clk_recalc_accuracies
- * @core: first clk in the subtree
- *
- * Walks the subtree of clks starting with clk and recalculates accuracies as
- * it goes.  Note that if a clk does not implement the .recalc_accuracy
- * callback then it is assumed that the clock will take on the accuracy of its
- * parent.
- */
-static void __clk_recalc_accuracies(struct clk_core *core)
-{
-	unsigned long parent_accuracy = 0;
-	struct clk_core *child;
-
-	lockdep_assert_held(&prepare_lock);
-
-	if (core->parent)
-		parent_accuracy = core->parent->accuracy;
-
-	if (core->ops->recalc_accuracy)
-		core->accuracy = core->ops->recalc_accuracy(core->hw,
-							  parent_accuracy);
-	else
-		core->accuracy = parent_accuracy;
-
-	hlist_for_each_entry(child, &core->children, child_node)
-		__clk_recalc_accuracies(child);
-}
-
-static long clk_core_get_accuracy_recalc(struct clk_core *core)
-{
-	if (core && (core->flags & CLK_GET_ACCURACY_NOCACHE))
-		__clk_recalc_accuracies(core);
-
-	return clk_core_get_accuracy_no_lock(core);
-}
-
-/**
- * clk_get_accuracy - return the accuracy of clk
- * @clk: the clk whose accuracy is being returned
- *
- * Simply returns the cached accuracy of the clk, unless
- * CLK_GET_ACCURACY_NOCACHE flag is set, which means a recalc_rate will be
- * issued.
- * If clk is NULL then returns 0.
- */
-long clk_get_accuracy(struct clk *clk)
-{
-	long accuracy;
-
-	if (!clk)
-		return 0;
-
-	clk_prepare_lock();
-	accuracy = clk_core_get_accuracy_recalc(clk->core);
-	clk_prepare_unlock();
-
-	return accuracy;
-}
-EXPORT_SYMBOL_GPL(clk_get_accuracy);
-
 static unsigned long clk_recalc(struct clk_core *core,
 				unsigned long parent_rate)
 {
 	unsigned long rate = parent_rate;
 
-	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
+	if (core->ops->recalc_rate) {
 		rate = core->ops->recalc_rate(core->hw, parent_rate);
-		clk_pm_runtime_put(core);
 	}
 	return rate;
 }
 
@@ -1937,17 +1075,14 @@ static unsigned long clk_recalc(struct clk_core *core,
  *
  * clk_recalc_rates also propagates the POST_RATE_CHANGE notification,
  * if necessary.
  */
-static void __clk_recalc_rates(struct clk_core *core, bool update_req,
-			       unsigned long msg)
+static void __clk_recalc_rates(struct clk_core *core, bool update_req)
 {
 	unsigned long old_rate;
 	unsigned long parent_rate = 0;
 	struct clk_core *child;
 
-	lockdep_assert_held(&prepare_lock);
-
 	old_rate = core->rate;
 
 	if (core->parent)
 		parent_rate = core->parent->rate;
@@ -1955,23 +1090,16 @@ static void __clk_recalc_rates(struct clk_core *core, bool update_req,
 	core->rate = clk_recalc(core, parent_rate);
 	if (update_req)
 		core->req_rate = core->rate;
 
-	/*
-	 * ignore NOTIFY_STOP and NOTIFY_BAD return values for POST_RATE_CHANGE
-	 * & ABORT_RATE_CHANGE notifiers
-	 */
-	if (core->notifier_count && msg)
-		__clk_notify(core, msg, old_rate, core->rate);
-
 	hlist_for_each_entry(child, &core->children, child_node)
-		__clk_recalc_rates(child, update_req, msg);
+		__clk_recalc_rates(child, update_req);
 }
 
 static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
 {
 	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
-		__clk_recalc_rates(core, false, 0);
+		__clk_recalc_rates(core, false);
 
 	return clk_core_get_rate_nolock(core);
 }
 
@@ -2173,16 +1301,12 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 	struct clk_core *old_parent;
 
 	old_parent = __clk_set_parent_before(core, parent);
 
-	trace_clk_set_parent(core, parent);
-
 	/* change clock input source */
 	if (parent && core->ops->set_parent)
 		ret = core->ops->set_parent(core->hw, p_index);
 
-	trace_clk_set_parent_complete(core, parent);
-
 	if (ret) {
 		flags = clk_enable_lock();
 		clk_reparent(core, old_parent);
 		clk_enable_unlock(flags);
@@ -2196,53 +1320,8 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 
 	return 0;
 }
 
-/**
- * __clk_speculate_rates
- * @core: first clk in the subtree
- * @parent_rate: the "future" rate of clk's parent
- *
- * Walks the subtree of clks starting with clk, speculating rates as it
- * goes and firing off PRE_RATE_CHANGE notifications as necessary.
- *
- * Unlike clk_recalc_rates, clk_speculate_rates exists only for sending
- * pre-rate change notifications and returns early if no clks in the
- * subtree have subscribed to the notifications.  Note that if a clk does not
- * implement the .recalc_rate callback then it is assumed that the clock will
- * take on the rate of its parent.
- */
-static int __clk_speculate_rates(struct clk_core *core,
-				 unsigned long parent_rate)
-{
-	struct clk_core *child;
-	unsigned long new_rate;
-	int ret = NOTIFY_DONE;
-
-	lockdep_assert_held(&prepare_lock);
-
-	new_rate = clk_recalc(core, parent_rate);
-
-	/* abort rate change if a driver returns NOTIFY_BAD or NOTIFY_STOP */
-	if (core->notifier_count)
-		ret = __clk_notify(core, PRE_RATE_CHANGE, core->rate, new_rate);
-
-	if (ret & NOTIFY_STOP_MASK) {
-		pr_debug("%s: clk notifier callback for clock %s aborted with error %d\n",
-				__func__, core->name, ret);
-		goto out;
-	}
-
-	hlist_for_each_entry(child, &core->children, child_node) {
-		ret = __clk_speculate_rates(child, new_rate);
-		if (ret & NOTIFY_STOP_MASK)
-			break;
-	}
-
-out:
-	return ret;
-}
-
 static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 			     struct clk_core *new_parent, u8 p_index)
 {
 	struct clk_core *child;
@@ -2293,16 +1372,12 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		struct clk_rate_request req;
 
 		clk_core_init_rate_req(core, &req, rate);
 
-		trace_clk_rate_request_start(&req);
-
 		ret = clk_core_determine_round_nolock(core, &req);
 		if (ret < 0)
 			return NULL;
 
-		trace_clk_rate_request_done(&req);
-
 		best_parent_rate = req.best_parent_rate;
 		new_rate = req.rate;
 		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
 
@@ -2346,47 +1421,8 @@ out:
 
 	return top;
 }
 
-/*
- * Notify about rate changes in a subtree. Always walk down the whole tree
- * so that in case of an error we can walk down the whole tree again and
- * abort the change.
- */
-static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
-						  unsigned long event)
-{
-	struct clk_core *child, *tmp_clk, *fail_clk = NULL;
-	int ret = NOTIFY_DONE;
-
-	if (core->rate == core->new_rate)
-		return NULL;
-
-	if (core->notifier_count) {
-		ret = __clk_notify(core, event, core->rate, core->new_rate);
-		if (ret & NOTIFY_STOP_MASK)
-			fail_clk = core;
-	}
-
-	hlist_for_each_entry(child, &core->children, child_node) {
-		/* Skip children who will be reparented to another clock */
-		if (child->new_parent && child->new_parent != core)
-			continue;
-		tmp_clk = clk_propagate_rate_change(child, event);
-		if (tmp_clk)
-			fail_clk = tmp_clk;
-	}
-
-	/* handle the new child who might not be in core->children yet */
-	if (core->new_child) {
-		tmp_clk = clk_propagate_rate_change(core->new_child, event);
-		if (tmp_clk)
-			fail_clk = tmp_clk;
-	}
-
-	return fail_clk;
-}
-
 /*
  * walk down a subtree and set the new rates notifying the rate
  * change on the way
  */
@@ -2409,19 +1445,15 @@ static void clk_change_rate(struct clk_core *core)
 		parent = core->parent;
 		best_parent_rate = core->parent->rate;
 	}
 
-	if (clk_pm_runtime_get(core))
-		return;
-
 	if (core->flags & CLK_SET_RATE_UNGATE) {
 		clk_core_prepare(core);
 		clk_core_enable_lock(core);
 	}
 
 	if (core->new_parent && core->new_parent != core->parent) {
 		old_parent = __clk_set_parent_before(core, core->new_parent);
-		trace_clk_set_parent(core, core->new_parent);
 
 		if (core->ops->set_rate_and_parent) {
 			skip_set_rate = true;
 			core->ops->set_rate_and_parent(core->hw, core->new_rate,
@@ -2429,23 +1461,17 @@ static void clk_change_rate(struct clk_core *core)
 					core->new_parent_index);
 		} else if (core->ops->set_parent) {
 			core->ops->set_parent(core->hw, core->new_parent_index);
 		}
-
-		trace_clk_set_parent_complete(core, core->new_parent);
 		__clk_set_parent_after(core, core->new_parent, old_parent);
 	}
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(parent);
 
-	trace_clk_set_rate(core, core->new_rate);
-
 	if (!skip_set_rate && core->ops->set_rate)
 		core->ops->set_rate(core->hw, core->new_rate, best_parent_rate);
 
-	trace_clk_set_rate_complete(core, core->new_rate);
-
 	core->rate = clk_recalc(core, best_parent_rate);
 
 	if (core->flags & CLK_SET_RATE_UNGATE) {
 		clk_core_disable_lock(core);
@@ -2454,11 +1480,8 @@ static void clk_change_rate(struct clk_core *core)
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_disable_unprepare(parent);
 
-	if (core->notifier_count && old_rate != core->rate)
-		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
-
 	if (core->flags & CLK_RECALC_NEW_RATES)
 		(void)clk_calc_new_rates(core, core->new_rate);
 
 	/*
@@ -2474,48 +1497,31 @@ static void clk_change_rate(struct clk_core *core)
 
 	/* handle the new child who might not be in core->children yet */
 	if (core->new_child)
 		clk_change_rate(core->new_child);
-
-	clk_pm_runtime_put(core);
 }
 
 static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 						     unsigned long req_rate)
 {
-	int ret, cnt;
+	int ret;
 	struct clk_rate_request req;
 
-	lockdep_assert_held(&prepare_lock);
-
 	if (!core)
 		return 0;
 
-	/* simulate what the rate would be if it could be freely set */
-	cnt = clk_core_rate_nuke_protect(core);
-	if (cnt < 0)
-		return cnt;
-
 	clk_core_init_rate_req(core, &req, req_rate);
 
-	trace_clk_rate_request_start(&req);
-
 	ret = clk_core_round_rate_nolock(core, &req);
 
-	trace_clk_rate_request_done(&req);
-
-	/* restore the protection */
-	clk_core_rate_restore_protect(core, cnt);
-
 	return ret ? 0 : req.rate;
 }
 
 static int clk_core_set_rate_nolock(struct clk_core *core,
 				    unsigned long req_rate)
 {
-	struct clk_core *top, *fail_clk;
+	struct clk_core *top;
 	unsigned long rate;
-	int ret;
 
 	if (!core)
 		return 0;
 
@@ -2524,39 +1530,19 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	/* bail early if nothing to do */
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
 
-	/* fail on a direct rate set of a protected provider */
-	if (clk_core_rate_is_protected(core))
-		return -EBUSY;
-
 	/* calculate new rates and get the topmost changed clock */
 	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
 		return -EINVAL;
 
-	ret = clk_pm_runtime_get(core);
-	if (ret)
-		return ret;
-
-	/* notify that we are about to change rates */
-	fail_clk = clk_propagate_rate_change(top, PRE_RATE_CHANGE);
-	if (fail_clk) {
-		pr_debug("%s: failed to set %s rate\n", __func__,
-				fail_clk->name);
-		clk_propagate_rate_change(top, ABORT_RATE_CHANGE);
-		ret = -EBUSY;
-		goto err;
-	}
-
 	/* change the rates */
 	clk_change_rate(top);
 
 	core->req_rate = req_rate;
-err:
-	clk_pm_runtime_put(core);
 
-	return ret;
+	return 0;
 }
 
 /**
  * clk_set_rate - specify a new rate for clk
@@ -2578,9 +1564,9 @@ err:
  * rates for the clocks and fires off POST_RATE_CHANGE notifiers.
  *
  * Returns 0 on success, -EERROR otherwise.
  */
-int clk_set_rate(struct clk *clk, unsigned long rate)
+long clk_set_rate(struct clk *clk, unsigned long rate)
 {
 	int ret;
 
 	if (!clk)
@@ -2588,201 +1574,19 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 
 	/* prevent racing with updates to the clock topology */
 	clk_prepare_lock();
 
-	if (clk->exclusive_count)
-		clk_core_rate_unprotect(clk->core);
-
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 
-	if (clk->exclusive_count)
-		clk_core_rate_protect(clk->core);
-
 	clk_prepare_unlock();
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	/* U-Boot: clk_set_rate() returns the new rate, many drivers rely on this */
+	return clk->core->new_rate;
 }
 EXPORT_SYMBOL_GPL(clk_set_rate);
 
-/**
- * clk_set_rate_exclusive - specify a new rate and get exclusive control
- * @clk: the clk whose rate is being changed
- * @rate: the new rate for clk
- *
- * This is a combination of clk_set_rate() and clk_rate_exclusive_get()
- * within a critical section
- *
- * This can be used initially to ensure that at least 1 consumer is
- * satisfied when several consumers are competing for exclusivity over the
- * same clock provider.
- *
- * The exclusivity is not applied if setting the rate failed.
- *
- * Calls to clk_rate_exclusive_get() should be balanced with calls to
- * clk_rate_exclusive_put().
- *
- * Returns 0 on success, -EERROR otherwise.
- */
-int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
-{
-	int ret;
-
-	if (!clk)
-		return 0;
-
-	/* prevent racing with updates to the clock topology */
-	clk_prepare_lock();
-
-	/*
-	 * The temporary protection removal is not here, on purpose
-	 * This function is meant to be used instead of clk_rate_protect,
-	 * so before the consumer code path protect the clock provider
-	 */
-
-	ret = clk_core_set_rate_nolock(clk->core, rate);
-	if (!ret) {
-		clk_core_rate_protect(clk->core);
-		clk->exclusive_count++;
-	}
-
-	clk_prepare_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
-
-static int clk_set_rate_range_nolock(struct clk *clk,
-				     unsigned long min,
-				     unsigned long max)
-{
-	int ret = 0;
-	unsigned long old_min, old_max, rate;
-
-	lockdep_assert_held(&prepare_lock);
-
-	if (!clk)
-		return 0;
-
-	trace_clk_set_rate_range(clk->core, min, max);
-
-	if (min > max) {
-		pr_err("%s: clk %s dev %s con %s: invalid range [%lu, %lu]\n",
-		       __func__, clk->core->name, clk->dev_id, clk->con_id,
-		       min, max);
-		return -EINVAL;
-	}
-
-	if (clk->exclusive_count)
-		clk_core_rate_unprotect(clk->core);
-
-	/* Save the current values in case we need to rollback the change */
-	old_min = clk->min_rate;
-	old_max = clk->max_rate;
-	clk->min_rate = min;
-	clk->max_rate = max;
-
-	if (!clk_core_check_boundaries(clk->core, min, max)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	rate = clk->core->req_rate;
-	if (clk->core->flags & CLK_GET_RATE_NOCACHE)
-		rate = clk_core_get_rate_recalc(clk->core);
-
-	/*
-	 * Since the boundaries have been changed, let's give the
-	 * opportunity to the provider to adjust the clock rate based on
-	 * the new boundaries.
-	 *
-	 * We also need to handle the case where the clock is currently
-	 * outside of the boundaries. Clamping the last requested rate
-	 * to the current minimum and maximum will also handle this.
-	 *
-	 * FIXME:
-	 * There is a catch. It may fail for the usual reason (clock
-	 * broken, clock protected, etc) but also because:
-	 * - round_rate() was not favorable and fell on the wrong
-	 *   side of the boundary
-	 * - the determine_rate() callback does not really check for
-	 *   this corner case when determining the rate
-	 */
-	rate = clamp(rate, min, max);
-	ret = clk_core_set_rate_nolock(clk->core, rate);
-	if (ret) {
-		/* rollback the changes */
-		clk->min_rate = old_min;
-		clk->max_rate = old_max;
-	}
-
-out:
-	if (clk->exclusive_count)
-		clk_core_rate_protect(clk->core);
-
-	return ret;
-}
-
-/**
- * clk_set_rate_range - set a rate range for a clock source
- * @clk: clock source
- * @min: desired minimum clock rate in Hz, inclusive
- * @max: desired maximum clock rate in Hz, inclusive
- *
- * Return: 0 for success or negative errno on failure.
- */
-int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
-{
-	int ret;
-
-	if (!clk)
-		return 0;
-
-	clk_prepare_lock();
-
-	ret = clk_set_rate_range_nolock(clk, min, max);
-
-	clk_prepare_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_set_rate_range);
-
-/**
- * clk_set_min_rate - set a minimum clock rate for a clock source
- * @clk: clock source
- * @rate: desired minimum clock rate in Hz, inclusive
- *
- * Returns success (0) or negative errno.
- */
-int clk_set_min_rate(struct clk *clk, unsigned long rate)
-{
-	if (!clk)
-		return 0;
-
-	trace_clk_set_min_rate(clk->core, rate);
-
-	return clk_set_rate_range(clk, rate, clk->max_rate);
-}
-EXPORT_SYMBOL_GPL(clk_set_min_rate);
-
-/**
- * clk_set_max_rate - set a maximum clock rate for a clock source
- * @clk: clock source
- * @rate: desired maximum clock rate in Hz, inclusive
- *
- * Returns success (0) or negative errno.
- */
-int clk_set_max_rate(struct clk *clk, unsigned long rate)
-{
-	if (!clk)
-		return 0;
-
-	trace_clk_set_max_rate(clk->core, rate);
-
-	return clk_set_rate_range(clk, clk->min_rate, rate);
-}
-EXPORT_SYMBOL_GPL(clk_set_max_rate);
-
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
  *
@@ -2813,15 +1617,9 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 
 	return clk_core_get_parent_by_index(core, index);
 }
 
-static void clk_core_reparent(struct clk_core *core,
-				  struct clk_core *new_parent)
-{
-	clk_reparent(core, new_parent);
-	__clk_recalc_accuracies(core);
-	__clk_recalc_rates(core, true, POST_RATE_CHANGE);
-}
+#define clk_core_reparent(core, new_parent) clk_reparent(core, new_parent)
 
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
 {
 	if (!hw)
@@ -2856,10 +1654,8 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	int ret = 0;
 	int p_index = 0;
 	unsigned long p_rate = 0;
 
-	lockdep_assert_held(&prepare_lock);
-
 	if (!core)
 		return 0;
 
 	if (core->parent == parent)
@@ -2872,11 +1668,8 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	/* check that we are allowed to re-parent if the clock is in use */
 	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
 		return -EBUSY;
 
-	if (clk_core_rate_is_protected(core))
-		return -EBUSY;
-
 	/* try finding the new parent index */
 	if (parent) {
 		p_index = clk_fetch_parent_index(core, parent);
 		if (p_index < 0) {
@@ -2886,33 +1679,18 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 		}
 		p_rate = parent->rate;
 	}
 
-	ret = clk_pm_runtime_get(core);
-	if (ret)
-		return ret;
-
-	/* propagate PRE_RATE_CHANGE notifications */
-	ret = __clk_speculate_rates(core, p_rate);
-
-	/* abort if a driver objects */
-	if (ret & NOTIFY_STOP_MASK)
-		goto runtime_put;
-
 	/* do the re-parent */
 	ret = __clk_set_parent(core, parent, p_index);
 
 	/* propagate rate an accuracy recalculation accordingly */
 	if (ret) {
-		__clk_recalc_rates(core, true, ABORT_RATE_CHANGE);
+		__clk_recalc_rates(core, true);
 	} else {
-		__clk_recalc_rates(core, true, POST_RATE_CHANGE);
-		__clk_recalc_accuracies(core);
+		__clk_recalc_rates(core, true);
 	}
 
-runtime_put:
-	clk_pm_runtime_put(core);
-
 	return ret;
 }
 
 int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
@@ -2946,300 +1724,17 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 		return 0;
 
 	clk_prepare_lock();
 
-	if (clk->exclusive_count)
-		clk_core_rate_unprotect(clk->core);
-
 	ret = clk_core_set_parent_nolock(clk->core,
 					 parent ? parent->core : NULL);
 
-	if (clk->exclusive_count)
-		clk_core_rate_protect(clk->core);
-
 	clk_prepare_unlock();
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
-static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
-{
-	int ret = -EINVAL;
-
-	lockdep_assert_held(&prepare_lock);
-
-	if (!core)
-		return 0;
-
-	if (clk_core_rate_is_protected(core))
-		return -EBUSY;
-
-	trace_clk_set_phase(core, degrees);
-
-	if (core->ops->set_phase) {
-		ret = core->ops->set_phase(core->hw, degrees);
-		if (!ret)
-			core->phase = degrees;
-	}
-
-	trace_clk_set_phase_complete(core, degrees);
-
-	return ret;
-}
-
-/**
- * clk_set_phase - adjust the phase shift of a clock signal
- * @clk: clock signal source
- * @degrees: number of degrees the signal is shifted
- *
- * Shifts the phase of a clock signal by the specified
- * degrees. Returns 0 on success, -EERROR otherwise.
- *
- * This function makes no distinction about the input or reference
- * signal that we adjust the clock signal phase against. For example
- * phase locked-loop clock signal generators we may shift phase with
- * respect to feedback clock signal input, but for other cases the
- * clock phase may be shifted with respect to some other, unspecified
- * signal.
- *
- * Additionally the concept of phase shift does not propagate through
- * the clock tree hierarchy, which sets it apart from clock rates and
- * clock accuracy. A parent clock phase attribute does not have an
- * impact on the phase attribute of a child clock.
- */
-int clk_set_phase(struct clk *clk, int degrees)
-{
-	int ret;
-
-	if (!clk)
-		return 0;
-
-	/* sanity check degrees */
-	degrees %= 360;
-	if (degrees < 0)
-		degrees += 360;
-
-	clk_prepare_lock();
-
-	if (clk->exclusive_count)
-		clk_core_rate_unprotect(clk->core);
-
-	ret = clk_core_set_phase_nolock(clk->core, degrees);
-
-	if (clk->exclusive_count)
-		clk_core_rate_protect(clk->core);
-
-	clk_prepare_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_set_phase);
-
-static int clk_core_get_phase(struct clk_core *core)
-{
-	int ret;
-
-	lockdep_assert_held(&prepare_lock);
-	if (!core->ops->get_phase)
-		return 0;
-
-	/* Always try to update cached phase if possible */
-	ret = core->ops->get_phase(core->hw);
-	if (ret >= 0)
-		core->phase = ret;
-
-	return ret;
-}
-
-/**
- * clk_get_phase - return the phase shift of a clock signal
- * @clk: clock signal source
- *
- * Returns the phase shift of a clock node in degrees, otherwise returns
- * -EERROR.
- */
-int clk_get_phase(struct clk *clk)
-{
-	int ret;
-
-	if (!clk)
-		return 0;
-
-	clk_prepare_lock();
-	ret = clk_core_get_phase(clk->core);
-	clk_prepare_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_get_phase);
-
-static void clk_core_reset_duty_cycle_nolock(struct clk_core *core)
-{
-	/* Assume a default value of 50% */
-	core->duty.num = 1;
-	core->duty.den = 2;
-}
-
-static int clk_core_update_duty_cycle_parent_nolock(struct clk_core *core);
-
-static int clk_core_update_duty_cycle_nolock(struct clk_core *core)
-{
-	struct clk_duty *duty = &core->duty;
-	int ret = 0;
-
-	if (!core->ops->get_duty_cycle)
-		return clk_core_update_duty_cycle_parent_nolock(core);
-
-	ret = core->ops->get_duty_cycle(core->hw, duty);
-	if (ret)
-		goto reset;
-
-	/* Don't trust the clock provider too much */
-	if (duty->den == 0 || duty->num > duty->den) {
-		ret = -EINVAL;
-		goto reset;
-	}
-
-	return 0;
-
-reset:
-	clk_core_reset_duty_cycle_nolock(core);
-	return ret;
-}
-
-static int clk_core_update_duty_cycle_parent_nolock(struct clk_core *core)
-{
-	int ret = 0;
-
-	if (core->parent &&
-	    core->flags & CLK_DUTY_CYCLE_PARENT) {
-		ret = clk_core_update_duty_cycle_nolock(core->parent);
-		memcpy(&core->duty, &core->parent->duty, sizeof(core->duty));
-	} else {
-		clk_core_reset_duty_cycle_nolock(core);
-	}
-
-	return ret;
-}
-
-static int clk_core_set_duty_cycle_parent_nolock(struct clk_core *core,
-						 struct clk_duty *duty);
-
-static int clk_core_set_duty_cycle_nolock(struct clk_core *core,
-					  struct clk_duty *duty)
-{
-	int ret;
-
-	lockdep_assert_held(&prepare_lock);
-
-	if (clk_core_rate_is_protected(core))
-		return -EBUSY;
-
-	trace_clk_set_duty_cycle(core, duty);
-
-	if (!core->ops->set_duty_cycle)
-		return clk_core_set_duty_cycle_parent_nolock(core, duty);
-
-	ret = core->ops->set_duty_cycle(core->hw, duty);
-	if (!ret)
-		memcpy(&core->duty, duty, sizeof(*duty));
-
-	trace_clk_set_duty_cycle_complete(core, duty);
-
-	return ret;
-}
-
-static int clk_core_set_duty_cycle_parent_nolock(struct clk_core *core,
-						 struct clk_duty *duty)
-{
-	int ret = 0;
-
-	if (core->parent &&
-	    core->flags & (CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)) {
-		ret = clk_core_set_duty_cycle_nolock(core->parent, duty);
-		memcpy(&core->duty, &core->parent->duty, sizeof(core->duty));
-	}
-
-	return ret;
-}
-
-/**
- * clk_set_duty_cycle - adjust the duty cycle ratio of a clock signal
- * @clk: clock signal source
- * @num: numerator of the duty cycle ratio to be applied
- * @den: denominator of the duty cycle ratio to be applied
- *
- * Apply the duty cycle ratio if the ratio is valid and the clock can
- * perform this operation
- *
- * Returns (0) on success, a negative errno otherwise.
- */
-int clk_set_duty_cycle(struct clk *clk, unsigned int num, unsigned int den)
-{
-	int ret;
-	struct clk_duty duty;
-
-	if (!clk)
-		return 0;
-
-	/* sanity check the ratio */
-	if (den == 0 || num > den)
-		return -EINVAL;
-
-	duty.num = num;
-	duty.den = den;
-
-	clk_prepare_lock();
-
-	if (clk->exclusive_count)
-		clk_core_rate_unprotect(clk->core);
-
-	ret = clk_core_set_duty_cycle_nolock(clk->core, &duty);
-
-	if (clk->exclusive_count)
-		clk_core_rate_protect(clk->core);
-
-	clk_prepare_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_set_duty_cycle);
-
-static int clk_core_get_scaled_duty_cycle(struct clk_core *core,
-					  unsigned int scale)
-{
-	struct clk_duty *duty = &core->duty;
-	int ret;
-
-	clk_prepare_lock();
-
-	ret = clk_core_update_duty_cycle_nolock(core);
-	if (!ret)
-		ret = mult_frac(scale, duty->num, duty->den);
-
-	clk_prepare_unlock();
-
-	return ret;
-}
-
-/**
- * clk_get_scaled_duty_cycle - return the duty cycle ratio of a clock signal
- * @clk: clock signal source
- * @scale: scaling factor to be applied to represent the ratio as an integer
- *
- * Returns the duty cycle ratio of a clock node multiplied by the provided
- * scaling factor, or negative errno on error.
- */
-int clk_get_scaled_duty_cycle(struct clk *clk, unsigned int scale)
-{
-	if (!clk)
-		return 0;
-
-	return clk_core_get_scaled_duty_cycle(clk->core, scale);
-}
-EXPORT_SYMBOL_GPL(clk_get_scaled_duty_cycle);
-
 /**
  * clk_is_match - check if two clk's point to the same hardware clock
  * @p: clk compared against q
  * @q: clk compared against p
@@ -3264,578 +1759,8 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 	return false;
 }
 EXPORT_SYMBOL_GPL(clk_is_match);
 
-/***        debugfs support        ***/
-
-#ifdef CONFIG_DEBUG_FS
-#include <linux/debugfs.h>
-
-static struct dentry *rootdir;
-static int inited = 0;
-static DEFINE_MUTEX(clk_debug_lock);
-static HLIST_HEAD(clk_debug_list);
-
-static struct hlist_head *orphan_list[] = {
-	&clk_orphan_list,
-	NULL,
-};
-
-static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
-				 int level)
-{
-	int phase;
-	struct clk *clk_user;
-	int multi_node = 0;
-
-	seq_printf(s, "%*s%-*s %-7d %-8d %-8d %-11lu %-10lu ",
-		   level * 3 + 1, "",
-		   35 - level * 3, c->name,
-		   c->enable_count, c->prepare_count, c->protect_count,
-		   clk_core_get_rate_recalc(c),
-		   clk_core_get_accuracy_recalc(c));
-
-	phase = clk_core_get_phase(c);
-	if (phase >= 0)
-		seq_printf(s, "%-5d", phase);
-	else
-		seq_puts(s, "-----");
-
-	seq_printf(s, " %-6d", clk_core_get_scaled_duty_cycle(c, 100000));
-
-	if (c->ops->is_enabled)
-		seq_printf(s, " %5c ", clk_core_is_enabled(c) ? 'Y' : 'N');
-	else if (!c->ops->enable)
-		seq_printf(s, " %5c ", 'Y');
-	else
-		seq_printf(s, " %5c ", '?');
-
-	hlist_for_each_entry(clk_user, &c->clks, clks_node) {
-		seq_printf(s, "%*s%-*s  %-25s\n",
-			   level * 3 + 2 + 105 * multi_node, "",
-			   30,
-			   clk_user->dev_id ? clk_user->dev_id : "deviceless",
-			   clk_user->con_id ? clk_user->con_id : "no_connection_id");
-
-		multi_node = 1;
-	}
-
-}
-
-static void clk_summary_show_subtree(struct seq_file *s, struct clk_core *c,
-				     int level)
-{
-	struct clk_core *child;
-
-	clk_summary_show_one(s, c, level);
-
-	hlist_for_each_entry(child, &c->children, child_node)
-		clk_summary_show_subtree(s, child, level + 1);
-}
-
-static int clk_summary_show(struct seq_file *s, void *data)
-{
-	struct clk_core *c;
-	struct hlist_head **lists = s->private;
-	int ret;
-
-	seq_puts(s, "                                 enable  prepare  protect                                duty  hardware                            connection\n");
-	seq_puts(s, "   clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id\n");
-	seq_puts(s, "---------------------------------------------------------------------------------------------------------------------------------------------\n");
-
-	ret = clk_pm_runtime_get_all();
-	if (ret)
-		return ret;
-
-	clk_prepare_lock();
-
-	for (; *lists; lists++)
-		hlist_for_each_entry(c, *lists, child_node)
-			clk_summary_show_subtree(s, c, 0);
-
-	clk_prepare_unlock();
-	clk_pm_runtime_put_all();
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(clk_summary);
-
-static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
-{
-	int phase;
-	unsigned long min_rate, max_rate;
-
-	clk_core_get_boundaries(c, &min_rate, &max_rate);
-
-	/* This should be JSON format, i.e. elements separated with a comma */
-	seq_printf(s, "\"%s\": { ", c->name);
-	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
-	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
-	seq_printf(s, "\"protect_count\": %d,", c->protect_count);
-	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate_recalc(c));
-	seq_printf(s, "\"min_rate\": %lu,", min_rate);
-	seq_printf(s, "\"max_rate\": %lu,", max_rate);
-	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy_recalc(c));
-	phase = clk_core_get_phase(c);
-	if (phase >= 0)
-		seq_printf(s, "\"phase\": %d,", phase);
-	seq_printf(s, "\"duty_cycle\": %u",
-		   clk_core_get_scaled_duty_cycle(c, 100000));
-}
-
-static void clk_dump_subtree(struct seq_file *s, struct clk_core *c, int level)
-{
-	struct clk_core *child;
-
-	clk_dump_one(s, c, level);
-
-	hlist_for_each_entry(child, &c->children, child_node) {
-		seq_putc(s, ',');
-		clk_dump_subtree(s, child, level + 1);
-	}
-
-	seq_putc(s, '}');
-}
-
-static int clk_dump_show(struct seq_file *s, void *data)
-{
-	struct clk_core *c;
-	bool first_node = true;
-	struct hlist_head **lists = s->private;
-	int ret;
-
-	ret = clk_pm_runtime_get_all();
-	if (ret)
-		return ret;
-
-	seq_putc(s, '{');
-
-	clk_prepare_lock();
-
-	for (; *lists; lists++) {
-		hlist_for_each_entry(c, *lists, child_node) {
-			if (!first_node)
-				seq_putc(s, ',');
-			first_node = false;
-			clk_dump_subtree(s, c, 0);
-		}
-	}
-
-	clk_prepare_unlock();
-	clk_pm_runtime_put_all();
-
-	seq_puts(s, "}\n");
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(clk_dump);
-
-#undef CLOCK_ALLOW_WRITE_DEBUGFS
-#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
-/*
- * This can be dangerous, therefore don't provide any real compile time
- * configuration option for this feature.
- * People who want to use this will need to modify the source code directly.
- */
-static int clk_rate_set(void *data, u64 val)
-{
-	struct clk_core *core = data;
-	int ret;
-
-	clk_prepare_lock();
-	ret = clk_core_set_rate_nolock(core, val);
-	clk_prepare_unlock();
-
-	return ret;
-}
-
-#define clk_rate_mode	0644
-
-static int clk_phase_set(void *data, u64 val)
-{
-	struct clk_core *core = data;
-	int degrees = do_div(val, 360);
-	int ret;
-
-	clk_prepare_lock();
-	ret = clk_core_set_phase_nolock(core, degrees);
-	clk_prepare_unlock();
-
-	return ret;
-}
-
-#define clk_phase_mode	0644
-
-static int clk_prepare_enable_set(void *data, u64 val)
-{
-	struct clk_core *core = data;
-	int ret = 0;
-
-	if (val)
-		ret = clk_prepare_enable(core->hw->clk);
-	else
-		clk_disable_unprepare(core->hw->clk);
-
-	return ret;
-}
-
-static int clk_prepare_enable_get(void *data, u64 *val)
-{
-	struct clk_core *core = data;
-
-	*val = core->enable_count && core->prepare_count;
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(clk_prepare_enable_fops, clk_prepare_enable_get,
-			 clk_prepare_enable_set, "%llu\n");
-
-#else
-#define clk_rate_set	NULL
-#define clk_rate_mode	0444
-
-#define clk_phase_set	NULL
-#define clk_phase_mode	0644
-#endif
-
-static int clk_rate_get(void *data, u64 *val)
-{
-	struct clk_core *core = data;
-
-	clk_prepare_lock();
-	*val = clk_core_get_rate_recalc(core);
-	clk_prepare_unlock();
-
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(clk_rate_fops, clk_rate_get, clk_rate_set, "%llu\n");
-
-static int clk_phase_get(void *data, u64 *val)
-{
-	struct clk_core *core = data;
-
-	*val = core->phase;
-	return 0;
-}
-
-DEFINE_DEBUGFS_ATTRIBUTE(clk_phase_fops, clk_phase_get, clk_phase_set, "%llu\n");
-
-static const struct {
-	unsigned long flag;
-	const char *name;
-} clk_flags[] = {
-#define ENTRY(f) { f, #f }
-	ENTRY(CLK_SET_RATE_GATE),
-	ENTRY(CLK_SET_PARENT_GATE),
-	ENTRY(CLK_SET_RATE_PARENT),
-	ENTRY(CLK_IGNORE_UNUSED),
-	ENTRY(CLK_GET_RATE_NOCACHE),
-	ENTRY(CLK_SET_RATE_NO_REPARENT),
-	ENTRY(CLK_GET_ACCURACY_NOCACHE),
-	ENTRY(CLK_RECALC_NEW_RATES),
-	ENTRY(CLK_SET_RATE_UNGATE),
-	ENTRY(CLK_IS_CRITICAL),
-	ENTRY(CLK_OPS_PARENT_ENABLE),
-	ENTRY(CLK_DUTY_CYCLE_PARENT),
-#undef ENTRY
-};
-
-static int clk_flags_show(struct seq_file *s, void *data)
-{
-	struct clk_core *core = s->private;
-	unsigned long flags = core->flags;
-	unsigned int i;
-
-	for (i = 0; flags && i < ARRAY_SIZE(clk_flags); i++) {
-		if (flags & clk_flags[i].flag) {
-			seq_printf(s, "%s\n", clk_flags[i].name);
-			flags &= ~clk_flags[i].flag;
-		}
-	}
-	if (flags) {
-		/* Unknown flags */
-		seq_printf(s, "0x%lx\n", flags);
-	}
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(clk_flags);
-
-static void possible_parent_show(struct seq_file *s, struct clk_core *core,
-				 unsigned int i, char terminator)
-{
-	struct clk_core *parent;
-	const char *name = NULL;
-
-	/*
-	 * Go through the following options to fetch a parent's name.
-	 *
-	 * 1. Fetch the registered parent clock and use its name
-	 * 2. Use the global (fallback) name if specified
-	 * 3. Use the local fw_name if provided
-	 * 4. Fetch parent clock's clock-output-name if DT index was set
-	 *
-	 * This may still fail in some cases, such as when the parent is
-	 * specified directly via a struct clk_hw pointer, but it isn't
-	 * registered (yet).
-	 */
-	parent = clk_core_get_parent_by_index(core, i);
-	if (parent) {
-		seq_puts(s, parent->name);
-	} else if (core->parents[i].name) {
-		seq_puts(s, core->parents[i].name);
-	} else if (core->parents[i].fw_name) {
-		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
-	} else {
-		if (core->parents[i].index >= 0)
-			name = of_clk_get_parent_name(core->of_node, core->parents[i].index);
-		if (!name)
-			name = "(missing)";
-
-		seq_puts(s, name);
-	}
-
-	seq_putc(s, terminator);
-}
-
-static int possible_parents_show(struct seq_file *s, void *data)
-{
-	struct clk_core *core = s->private;
-	int i;
-
-	for (i = 0; i < core->num_parents - 1; i++)
-		possible_parent_show(s, core, i, ' ');
-
-	possible_parent_show(s, core, i, '\n');
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(possible_parents);
-
-static int current_parent_show(struct seq_file *s, void *data)
-{
-	struct clk_core *core = s->private;
-
-	if (core->parent)
-		seq_printf(s, "%s\n", core->parent->name);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(current_parent);
-
-#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
-static ssize_t current_parent_write(struct file *file, const char __user *ubuf,
-				    size_t count, loff_t *ppos)
-{
-	struct seq_file *s = file->private_data;
-	struct clk_core *core = s->private;
-	struct clk_core *parent;
-	u8 idx;
-	int err;
-
-	err = kstrtou8_from_user(ubuf, count, 0, &idx);
-	if (err < 0)
-		return err;
-
-	parent = clk_core_get_parent_by_index(core, idx);
-	if (!parent)
-		return -ENOENT;
-
-	clk_prepare_lock();
-	err = clk_core_set_parent_nolock(core, parent);
-	clk_prepare_unlock();
-	if (err)
-		return err;
-
-	return count;
-}
-
-static const struct file_operations current_parent_rw_fops = {
-	.open		= current_parent_open,
-	.write		= current_parent_write,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-#endif
-
-static int clk_duty_cycle_show(struct seq_file *s, void *data)
-{
-	struct clk_core *core = s->private;
-	struct clk_duty *duty = &core->duty;
-
-	seq_printf(s, "%u/%u\n", duty->num, duty->den);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
-
-static int clk_min_rate_show(struct seq_file *s, void *data)
-{
-	struct clk_core *core = s->private;
-	unsigned long min_rate, max_rate;
-
-	clk_prepare_lock();
-	clk_core_get_boundaries(core, &min_rate, &max_rate);
-	clk_prepare_unlock();
-	seq_printf(s, "%lu\n", min_rate);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(clk_min_rate);
-
-static int clk_max_rate_show(struct seq_file *s, void *data)
-{
-	struct clk_core *core = s->private;
-	unsigned long min_rate, max_rate;
-
-	clk_prepare_lock();
-	clk_core_get_boundaries(core, &min_rate, &max_rate);
-	clk_prepare_unlock();
-	seq_printf(s, "%lu\n", max_rate);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(clk_max_rate);
-
-static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
-{
-	struct dentry *root;
-
-	if (!core || !pdentry)
-		return;
-
-	root = debugfs_create_dir(core->name, pdentry);
-	core->dentry = root;
-
-	debugfs_create_file("clk_rate", clk_rate_mode, root, core,
-			    &clk_rate_fops);
-	debugfs_create_file("clk_min_rate", 0444, root, core, &clk_min_rate_fops);
-	debugfs_create_file("clk_max_rate", 0444, root, core, &clk_max_rate_fops);
-	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
-	debugfs_create_file("clk_phase", clk_phase_mode, root, core,
-			    &clk_phase_fops);
-	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
-	debugfs_create_u32("clk_prepare_count", 0444, root, &core->prepare_count);
-	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
-	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
-	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
-	debugfs_create_file("clk_duty_cycle", 0444, root, core,
-			    &clk_duty_cycle_fops);
-#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
-	debugfs_create_file("clk_prepare_enable", 0644, root, core,
-			    &clk_prepare_enable_fops);
-
-	if (core->num_parents > 1)
-		debugfs_create_file("clk_parent", 0644, root, core,
-				    &current_parent_rw_fops);
-	else
-#endif
-	if (core->num_parents > 0)
-		debugfs_create_file("clk_parent", 0444, root, core,
-				    &current_parent_fops);
-
-	if (core->num_parents > 1)
-		debugfs_create_file("clk_possible_parents", 0444, root, core,
-				    &possible_parents_fops);
-
-	if (core->ops->debug_init)
-		core->ops->debug_init(core->hw, core->dentry);
-}
-
-/**
- * clk_debug_register - add a clk node to the debugfs clk directory
- * @core: the clk being added to the debugfs clk directory
- *
- * Dynamically adds a clk to the debugfs clk directory if debugfs has been
- * initialized.  Otherwise it bails out early since the debugfs clk directory
- * will be created lazily by clk_debug_init as part of a late_initcall.
- */
-static void clk_debug_register(struct clk_core *core)
-{
-	mutex_lock(&clk_debug_lock);
-	hlist_add_head(&core->debug_node, &clk_debug_list);
-	if (inited)
-		clk_debug_create_one(core, rootdir);
-	mutex_unlock(&clk_debug_lock);
-}
-
- /**
- * clk_debug_unregister - remove a clk node from the debugfs clk directory
- * @core: the clk being removed from the debugfs clk directory
- *
- * Dynamically removes a clk and all its child nodes from the
- * debugfs clk directory if clk->dentry points to debugfs created by
- * clk_debug_register in __clk_core_init.
- */
-static void clk_debug_unregister(struct clk_core *core)
-{
-	mutex_lock(&clk_debug_lock);
-	hlist_del_init(&core->debug_node);
-	debugfs_remove_recursive(core->dentry);
-	core->dentry = NULL;
-	mutex_unlock(&clk_debug_lock);
-}
-
-/**
- * clk_debug_init - lazily populate the debugfs clk directory
- *
- * clks are often initialized very early during boot before memory can be
- * dynamically allocated and well before debugfs is setup. This function
- * populates the debugfs clk directory once at boot-time when we know that
- * debugfs is setup. It should only be called once at boot-time, all other clks
- * added dynamically will be done so with clk_debug_register.
- */
-static int __init clk_debug_init(void)
-{
-	struct clk_core *core;
-
-#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
-	pr_warn("\n");
-	pr_warn("********************************************************************\n");
-	pr_warn("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE           **\n");
-	pr_warn("**                                                                **\n");
-	pr_warn("**  WRITEABLE clk DebugFS SUPPORT HAS BEEN ENABLED IN THIS KERNEL **\n");
-	pr_warn("**                                                                **\n");
-	pr_warn("** This means that this kernel is built to expose clk operations  **\n");
-	pr_warn("** such as parent or rate setting, enabling, disabling, etc.      **\n");
-	pr_warn("** to userspace, which may compromise security on your system.    **\n");
-	pr_warn("**                                                                **\n");
-	pr_warn("** If you see this message and you are not debugging the          **\n");
-	pr_warn("** kernel, report this immediately to your vendor!                **\n");
-	pr_warn("**                                                                **\n");
-	pr_warn("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE           **\n");
-	pr_warn("********************************************************************\n");
-#endif
-
-	rootdir = debugfs_create_dir("clk", NULL);
-
-	debugfs_create_file("clk_summary", 0444, rootdir, &all_lists,
-			    &clk_summary_fops);
-	debugfs_create_file("clk_dump", 0444, rootdir, &all_lists,
-			    &clk_dump_fops);
-	debugfs_create_file("clk_orphan_summary", 0444, rootdir, &orphan_list,
-			    &clk_summary_fops);
-	debugfs_create_file("clk_orphan_dump", 0444, rootdir, &orphan_list,
-			    &clk_dump_fops);
-
-	mutex_lock(&clk_debug_lock);
-	hlist_for_each_entry(core, &clk_debug_list, debug_node)
-		clk_debug_create_one(core, rootdir);
-
-	inited = 1;
-	mutex_unlock(&clk_debug_lock);
-
-	return 0;
-}
-late_initcall(clk_debug_init);
-#else
-static inline void clk_debug_register(struct clk_core *core) { }
-static inline void clk_debug_unregister(struct clk_core *core)
-{
-}
-#endif
-
 static void clk_core_reparent_orphans_nolock(void)
 {
 	struct clk_core *orphan;
 	struct hlist_node *tmp2;
@@ -3856,10 +1781,9 @@ static void clk_core_reparent_orphans_nolock(void)
 		if (parent) {
 			/* update the clk tree topology */
 			__clk_set_parent_before(orphan, parent);
 			__clk_set_parent_after(orphan, parent, NULL);
-			__clk_recalc_accuracies(orphan);
-			__clk_recalc_rates(orphan, true, 0);
+			__clk_recalc_rates(orphan, true);
 
 			/*
 			 * __clk_init_parent() will set the initial req_rate to
 			 * 0 if the clock doesn't have clk_ops::recalc_rate and
@@ -3887,9 +1811,8 @@ static int __clk_core_init(struct clk_core *core)
 {
 	int ret;
 	struct clk_core *parent;
 	unsigned long rate;
-	int phase;
 
 	clk_prepare_lock();
 
 	/*
@@ -3899,12 +1822,8 @@ static int __clk_core_init(struct clk_core *core)
 	 * that clks aren't parented until their parent is fully registered.
 	 */
 	core->hw->core = core;
 
-	ret = clk_pm_runtime_get(core);
-	if (ret)
-		goto unlock;
-
 	/* check to see if a clock with this name is already registered */
 	if (clk_core_lookup(core->name)) {
 		pr_debug("%s: clk %s already initialized\n",
 				__func__, core->name);
@@ -3992,43 +1911,9 @@ static int __clk_core_init(struct clk_core *core)
 	} else {
 		hlist_add_head(&core->child_node, &clk_orphan_list);
 		core->orphan = true;
 	}
-	hash_add(clk_hashtable, &core->hashtable_node,
-		 full_name_hash(NULL, core->name, strlen(core->name)));
-
-	/*
-	 * Set clk's accuracy.  The preferred method is to use
-	 * .recalc_accuracy. For simple clocks and lazy developers the default
-	 * fallback is to use the parent's accuracy.  If a clock doesn't have a
-	 * parent (or is orphaned) then accuracy is set to zero (perfect
-	 * clock).
-	 */
-	if (core->ops->recalc_accuracy)
-		core->accuracy = core->ops->recalc_accuracy(core->hw,
-					clk_core_get_accuracy_no_lock(parent));
-	else if (parent)
-		core->accuracy = parent->accuracy;
-	else
-		core->accuracy = 0;
-
-	/*
-	 * Set clk's phase by clk_core_get_phase() caching the phase.
-	 * Since a phase is by definition relative to its parent, just
-	 * query the current clock phase, or just assume it's in phase.
-	 */
-	phase = clk_core_get_phase(core);
-	if (phase < 0) {
-		ret = phase;
-		pr_warn("%s: Failed to get phase for clk '%s'\n", __func__,
-			core->name);
-		goto out;
-	}
-
-	/*
-	 * Set clk's duty cycle.
-	 */
-	clk_core_update_duty_cycle_nolock(core);
+	hlist_add_head(&core->hashtable_node, &clk_hashtable);
 
 	/*
 	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
 	 * simple clocks and lazy developers the default fallback is to use the
@@ -4053,35 +1938,32 @@ static int __clk_core_init(struct clk_core *core)
 		ret = clk_core_prepare(core);
 		if (ret) {
 			pr_warn("%s: critical clk '%s' failed to prepare\n",
 			       __func__, core->name);
-			goto out;
+			goto out_list_del;
 		}
 
 		ret = clk_core_enable_lock(core);
 		if (ret) {
 			pr_warn("%s: critical clk '%s' failed to enable\n",
 			       __func__, core->name);
 			clk_core_unprepare(core);
-			goto out;
+			goto out_list_del;
 		}
 	}
 
 	clk_core_reparent_orphans_nolock();
+out_list_del:
+	if (ret)
+		hlist_del(&core->hashtable_node);
 out:
-	clk_pm_runtime_put(core);
-unlock:
 	if (ret) {
-		hash_del(&core->hashtable_node);
 		hlist_del_init(&core->child_node);
 		core->hw->core = NULL;
 	}
 
 	clk_prepare_unlock();
 
-	if (!ret)
-		clk_debug_register(core);
-
 	return ret;
 }
 
 /**
@@ -4101,9 +1983,8 @@ static void clk_core_link_consumer(struct clk_core *core, struct clk *clk)
  * @clk: consumer to unlink
  */
 static void clk_core_unlink_consumer(struct clk *clk)
 {
-	lockdep_assert_held(&prepare_lock);
 	hlist_del(&clk->clks_node);
 }
 
 /**
@@ -4123,11 +2004,18 @@ static struct clk *alloc_clk(struct clk_core *core, const char *dev_id,
 	if (!clk)
 		return ERR_PTR(-ENOMEM);
 
 	clk->core = core;
-	clk->dev_id = dev_id;
-	clk->con_id = kstrdup_const(con_id, GFP_KERNEL);
-	clk->max_rate = ULONG_MAX;
+	/*
+	 * U-Boot: we don't yet support dev_id/con_id/max_rate in clock
+	 * consumers.
+	 */
+	// clk->dev_id = dev_id;
+	// clk->con_id = kstrdup_const(con_id, GFP_KERNEL);
+	// clk->max_rate = ULONG_MAX;
+
+	/* U-Boot: stash the provider device so we can get it via clk_hw */
+	clk->dev = core->dev;
 
 	return clk;
 }
 
@@ -4139,9 +2027,9 @@ static struct clk *alloc_clk(struct clk_core *core, const char *dev_id,
  * list.
  */
 static void free_clk(struct clk *clk)
 {
-	kfree_const(clk->con_id);
+	// kfree_const(clk->con_id);
 	kfree(clk);
 }
 
 /**
@@ -4155,9 +2043,9 @@ static void free_clk(struct clk *clk)
  * This is the main function used to create a clk pointer for use by clk
  * consumers. It connects a consumer to the clk_core and clk_hw structures
  * used by the framework and clk provider respectively.
  */
-struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
+struct clk *clk_hw_create_clk(struct udevice *dev, struct clk_hw *hw,
 			      const char *dev_id, const char *con_id)
 {
 	struct clk *clk;
 	struct clk_core *core;
@@ -4171,19 +2059,46 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 	if (IS_ERR(clk))
 		return clk;
 	clk->dev = dev;
 
-	if (!try_module_get(core->owner)) {
-		free_clk(clk);
-		return ERR_PTR(-ENOENT);
-	}
+	// if (!try_module_get(core->owner)) {
+	// 	free_clk(clk);
+	// 	return ERR_PTR(-ENOENT);
+	// }
 
 	kref_get(&core->ref);
 	clk_core_link_consumer(core, clk);
 
 	return clk;
 }
 
+/* U-Boot: consumers allocate struct clk, we just populate it! */
+int clk_hw_create_clk_uboot(struct clk *clk, struct clk_hw *hw)
+{
+	struct clk_core *core;
+
+	/* This is to allow this function to be chained to others */
+	if (IS_ERR_OR_NULL(hw))
+		return PTR_ERR(hw);
+
+	if (IS_ERR_OR_NULL(hw->core)) 
+		return -EINVAL;
+
+	core = hw->core;
+	clk->core = core;
+
+	if (core->dev)
+		clk->dev = core->dev;
+
+	/* U-Boot: necessary for UCLASS_CLK compat shim */
+	clk->id = hw->clk->id;
+	clk->data = hw->clk->data;
+
+	clk_core_link_consumer(core, clk);
+
+	return 0;
+}
+
 /**
  * clk_hw_get_clk - get clk consumer given an clk_hw
  * @hw: clk_hw associated with the clk being consumed
  * @con_id: connection ID string on device
@@ -4194,9 +2109,9 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
  * Calls to this function must be balanced with calls clk_put()
  */
 struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
 {
-	struct device *dev = hw->core->dev;
+	struct udevice *dev = hw->core->dev;
 	const char *name = dev ? dev_name(dev) : NULL;
 
 	return clk_hw_create_clk(dev, hw, name, con_id);
 }
@@ -4300,21 +2215,15 @@ static void clk_core_free_parent_map(struct clk_core *core)
 static void __clk_release(struct kref *ref)
 {
 	struct clk_core *core = container_of(ref, struct clk_core, ref);
 
-	if (core->rpm_enabled) {
-		mutex_lock(&clk_rpm_list_lock);
-		hlist_del(&core->rpm_node);
-		mutex_unlock(&clk_rpm_list_lock);
-	}
-
 	clk_core_free_parent_map(core);
 	kfree_const(core->name);
 	kfree(core);
 }
 
 static struct clk *
-__clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
+__clk_register(struct udevice *dev, ofnode np, struct clk_hw *hw)
 {
 	int ret;
 	struct clk_core *core;
 	const struct clk_init_data *init = hw->init;
@@ -4346,12 +2255,11 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	}
 	core->ops = init->ops;
 
 	core->dev = dev;
-	clk_pm_runtime_init(core);
-	core->of_node = np;
-	if (dev && dev->driver)
-		core->owner = dev->driver->owner;
+	core->ofnode = np;
+	// if (dev && dev->driver)
+	// 	core->owner = dev->driver->owner;
 	core->hw = hw;
 	core->flags = init->flags;
 	core->num_parents = init->num_parents;
 	core->min_rate = 0;
@@ -4372,8 +2280,11 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		ret = PTR_ERR(hw->clk);
 		goto fail_create_clk;
 	}
 
+	/* U-Boot: Copy clk flags to hw->clk for sandbox tests */
+	hw->clk->flags = core->flags;
+
 	clk_core_link_consumer(core, hw->clk);
 
 	ret = __clk_core_init(core);
 	if (!ret)
@@ -4392,13 +2303,13 @@ fail_ops:
 fail_name:
 	kref_put(&core->ref, __clk_release);
 fail_out:
 	if (dev) {
-		dev_err_probe(dev, ret, "failed to register clk '%s' (%pS)\n",
-			      init->name, hw);
+		dev_err(dev, "err %d failed to register clk '%s' (%pS)\n",
+			      ret, init->name, hw);
 	} else {
 		pr_err("%pOF: error %pe: failed to register clk '%s' (%pS)\n",
-		       np, ERR_PTR(ret), init->name, hw);
+		       &np, ERR_PTR(ret), init->name, hw);
 	}
 	return ERR_PTR(ret);
 }
 
@@ -4409,20 +2320,20 @@ fail_out:
  * Return: device node pointer of @dev, or the device node pointer of
  * @dev->parent if dev doesn't have a device node, or NULL if neither
  * @dev or @dev->parent have a device node.
  */
-static struct device_node *dev_or_parent_of_node(struct device *dev)
+static ofnode dev_or_parent_of_node(struct udevice *dev)
 {
-	struct device_node *np;
+	ofnode node;
 
 	if (!dev)
-		return NULL;
+		return ofnode_null();
 
-	np = dev_of_node(dev);
-	if (!np)
-		np = dev_of_node(dev->parent);
+	node = dev_ofnode(dev);
+	// if (!ofnode_valid(node))
+	// 	node = dev_ofnode(dev->parent);
 
-	return np;
+	return node;
 }
 
 /**
  * clk_register - allocate a new clock, register it and return an opaque cookie
@@ -4436,9 +2347,9 @@ static struct device_node *dev_or_parent_of_node(struct device *dev)
  * cannot be dereferenced by driver code but may be used in conjunction with the
  * rest of the clock API.  In the event of an error clk_register will return an
  * error code; drivers must test for an error code after calling clk_register.
  */
-struct clk *clk_register(struct device *dev, struct clk_hw *hw)
+struct clk *clk_register(struct udevice *dev, struct clk_hw *hw)
 {
 	return __clk_register(dev, dev_or_parent_of_node(dev), hw);
 }
 EXPORT_SYMBOL_GPL(clk_register);
@@ -4452,9 +2363,9 @@ EXPORT_SYMBOL_GPL(clk_register);
  * new clock nodes. It returns an integer equal to zero indicating success or
  * less than zero indicating failure. Drivers must test for an error code after
  * calling clk_hw_register().
  */
-int clk_hw_register(struct device *dev, struct clk_hw *hw)
+int clk_hw_register(struct udevice *dev, struct clk_hw *hw)
 {
 	return PTR_ERR_OR_ZERO(__clk_register(dev, dev_or_parent_of_node(dev),
 			       hw));
 }
@@ -4465,14 +2376,14 @@ EXPORT_SYMBOL_GPL(clk_hw_register);
  * @node: device_node of device that is registering this clock
  * @hw: link to hardware-specific clock data
  *
  * of_clk_hw_register() is the primary interface for populating the clock tree
- * with new clock nodes when a struct device is not available, but a struct
+ * with new clock nodes when a struct udevice is not available, but a struct
  * device_node is. It returns an integer equal to zero indicating success or
  * less than zero indicating failure. Drivers must test for an error code after
  * calling of_clk_hw_register().
  */
-int of_clk_hw_register(struct device_node *node, struct clk_hw *hw)
+int of_clk_hw_register(ofnode node, struct clk_hw *hw)
 {
 	return PTR_ERR_OR_ZERO(__clk_register(NULL, node, hw));
 }
 EXPORT_SYMBOL_GPL(of_clk_hw_register);
@@ -4538,10 +2449,8 @@ static void clk_core_evict_parent_cache(struct clk_core *core)
 {
 	const struct hlist_head **lists;
 	struct clk_core *root;
 
-	lockdep_assert_held(&prepare_lock);
-
 	for (lists = all_lists; *lists; lists++)
 		hlist_for_each_entry(root, *lists, child_node)
 			clk_core_evict_parent_cache_subtree(root, core);
 
@@ -4558,10 +2467,8 @@ void clk_unregister(struct clk *clk)
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
 
-	clk_debug_unregister(clk->core);
-
 	clk_prepare_lock();
 
 	ops = clk->core->ops;
 	if (ops == &clk_nodrv_ops) {
@@ -4592,18 +2499,15 @@ void clk_unregister(struct clk *clk)
 	}
 
 	clk_core_evict_parent_cache(clk->core);
 
-	hash_del(&clk->core->hashtable_node);
+	hlist_del(&clk->core->hashtable_node);
 	hlist_del_init(&clk->core->child_node);
 
 	if (clk->core->prepare_count)
 		pr_warn("%s: unregistering prepared clock: %s\n",
 					__func__, clk->core->name);
 
-	if (clk->core->protect_count)
-		pr_warn("%s: unregistering protected clock: %s\n",
-					__func__, clk->core->name);
 	clk_prepare_unlock();
 
 	kref_put(&clk->core->ref, __clk_release);
 	free_clk(clk);
@@ -4619,14 +2523,14 @@ void clk_hw_unregister(struct clk_hw *hw)
 	clk_unregister(hw->clk);
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister);
 
-static void devm_clk_unregister_cb(struct device *dev, void *res)
+static void devm_clk_unregister_cb(struct udevice *dev, void *res)
 {
 	clk_unregister(*(struct clk **)res);
 }
 
-static void devm_clk_hw_unregister_cb(struct device *dev, void *res)
+static void devm_clk_hw_unregister_cb(struct udevice *dev, void *res)
 {
 	clk_hw_unregister(*(struct clk_hw **)res);
 }
 
@@ -4639,9 +2543,9 @@ static void devm_clk_hw_unregister_cb(struct device *dev, void *res)
  *
  * Clocks returned from this function are automatically clk_unregister()ed on
  * driver detach. See clk_register() for more information.
  */
-struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw)
+struct clk *devm_clk_register(struct udevice *dev, struct clk_hw *hw)
 {
 	struct clk *clk;
 	struct clk **clkp;
 
@@ -4669,9 +2573,9 @@ EXPORT_SYMBOL_GPL(devm_clk_register);
  * Managed clk_hw_register(). Clocks registered by this function are
  * automatically clk_hw_unregister()ed on driver detach. See clk_hw_register()
  * for more information.
  */
-int devm_clk_hw_register(struct device *dev, struct clk_hw *hw)
+int devm_clk_hw_register(struct udevice *dev, struct clk_hw *hw)
 {
 	struct clk_hw **hwp;
 	int ret;
 
@@ -4690,11 +2594,11 @@ int devm_clk_hw_register(struct device *dev, struct clk_hw *hw)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_register);
 
-static void devm_clk_release(struct device *dev, void *res)
+static void devm_clk_release(struct udevice *dev, void *res)
 {
-	clk_put(*(struct clk **)res);
+	__clk_put(*(struct clk **)res);
 }
 
 /**
  * devm_clk_hw_get_clk - resource managed clk_hw_get_clk()
@@ -4705,9 +2609,9 @@ static void devm_clk_release(struct device *dev, void *res)
  * Managed clk_hw_get_clk(). Clocks got with this function are
  * automatically clk_put() on driver detach. See clk_put()
  * for more information.
  */
-struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
+struct clk *devm_clk_hw_get_clk(struct udevice *dev, struct clk_hw *hw,
 				const char *con_id)
 {
 	struct clk *clk;
 	struct clk **clkp;
@@ -4739,179 +2643,27 @@ EXPORT_SYMBOL_GPL(devm_clk_hw_get_clk);
  */
 
 void __clk_put(struct clk *clk)
 {
-	struct module *owner;
-
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
 
 	clk_prepare_lock();
 
-	/*
-	 * Before calling clk_put, all calls to clk_rate_exclusive_get() from a
-	 * given user should be balanced with calls to clk_rate_exclusive_put()
-	 * and by that same consumer
-	 */
-	if (WARN_ON(clk->exclusive_count)) {
-		/* We voiced our concern, let's sanitize the situation */
-		clk->core->protect_count -= (clk->exclusive_count - 1);
-		clk_core_rate_unprotect(clk->core);
-		clk->exclusive_count = 0;
-	}
-
 	clk_core_unlink_consumer(clk);
 
-	/* If we had any boundaries on that clock, let's drop them. */
-	if (clk->min_rate > 0 || clk->max_rate < ULONG_MAX)
-		clk_set_rate_range_nolock(clk, 0, ULONG_MAX);
-
 	clk_prepare_unlock();
 
-	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
 	module_put(owner);
 	free_clk(clk);
 }
 
-/***        clk rate change notifiers        ***/
-
-/**
- * clk_notifier_register - add a clk rate change notifier
- * @clk: struct clk * to watch
- * @nb: struct notifier_block * with callback info
- *
- * Request notification when clk's rate changes.  This uses an SRCU
- * notifier because we want it to block and notifier unregistrations are
- * uncommon.  The callbacks associated with the notifier must not
- * re-enter into the clk framework by calling any top-level clk APIs;
- * this will cause a nested prepare_lock mutex.
- *
- * In all notification cases (pre, post and abort rate change) the original
- * clock rate is passed to the callback via struct clk_notifier_data.old_rate
- * and the new frequency is passed via struct clk_notifier_data.new_rate.
- *
- * clk_notifier_register() must be called from non-atomic context.
- * Returns -EINVAL if called with null arguments, -ENOMEM upon
- * allocation failure; otherwise, passes along the return value of
- * srcu_notifier_chain_register().
- */
-int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
+// U-Boot: from clkdev.c
+void clk_put(struct clk *clk)
 {
-	struct clk_notifier *cn;
-	int ret = -ENOMEM;
-
-	if (!clk || !nb)
-		return -EINVAL;
-
-	clk_prepare_lock();
-
-	/* search the list of notifiers for this clk */
-	list_for_each_entry(cn, &clk_notifier_list, node)
-		if (cn->clk == clk)
-			goto found;
-
-	/* if clk wasn't in the notifier list, allocate new clk_notifier */
-	cn = kzalloc(sizeof(*cn), GFP_KERNEL);
-	if (!cn)
-		goto out;
-
-	cn->clk = clk;
-	srcu_init_notifier_head(&cn->notifier_head);
-
-	list_add(&cn->node, &clk_notifier_list);
-
-found:
-	ret = srcu_notifier_chain_register(&cn->notifier_head, nb);
-
-	clk->core->notifier_count++;
-
-out:
-	clk_prepare_unlock();
-
-	return ret;
+	__clk_put(clk);
 }
-EXPORT_SYMBOL_GPL(clk_notifier_register);
-
-/**
- * clk_notifier_unregister - remove a clk rate change notifier
- * @clk: struct clk *
- * @nb: struct notifier_block * with callback info
- *
- * Request no further notification for changes to 'clk' and frees memory
- * allocated in clk_notifier_register.
- *
- * Returns -EINVAL if called with null arguments; otherwise, passes
- * along the return value of srcu_notifier_chain_unregister().
- */
-int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
-{
-	struct clk_notifier *cn;
-	int ret = -ENOENT;
-
-	if (!clk || !nb)
-		return -EINVAL;
-
-	clk_prepare_lock();
-
-	list_for_each_entry(cn, &clk_notifier_list, node) {
-		if (cn->clk == clk) {
-			ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
-
-			clk->core->notifier_count--;
-
-			/* XXX the notifier code should handle this better */
-			if (!cn->notifier_head.head) {
-				srcu_cleanup_notifier_head(&cn->notifier_head);
-				list_del(&cn->node);
-				kfree(cn);
-			}
-			break;
-		}
-	}
-
-	clk_prepare_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(clk_notifier_unregister);
-
-struct clk_notifier_devres {
-	struct clk *clk;
-	struct notifier_block *nb;
-};
-
-static void devm_clk_notifier_release(struct device *dev, void *res)
-{
-	struct clk_notifier_devres *devres = res;
-
-	clk_notifier_unregister(devres->clk, devres->nb);
-}
-
-int devm_clk_notifier_register(struct device *dev, struct clk *clk,
-			       struct notifier_block *nb)
-{
-	struct clk_notifier_devres *devres;
-	int ret;
-
-	devres = devres_alloc(devm_clk_notifier_release,
-			      sizeof(*devres), GFP_KERNEL);
-
-	if (!devres)
-		return -ENOMEM;
-
-	ret = clk_notifier_register(clk, nb);
-	if (!ret) {
-		devres->clk = clk;
-		devres->nb = nb;
-		devres_add(dev, devres);
-	} else {
-		devres_free(devres);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_clk_notifier_register);
 
 static void clk_core_reparent_orphans(void)
 {
 	clk_prepare_lock();
@@ -4931,35 +2683,34 @@ static void clk_core_reparent_orphans(void)
  */
 struct of_clk_provider {
 	struct list_head link;
 
-	struct device_node *node;
-	struct clk *(*get)(struct of_phandle_args *clkspec, void *data);
-	struct clk_hw *(*get_hw)(struct of_phandle_args *clkspec, void *data);
+	ofnode node;
+	struct clk *(*get)(struct ofnode_phandle_args *clkspec, void *data);
+	struct clk_hw *(*get_hw)(struct ofnode_phandle_args *clkspec, void *data);
 	void *data;
 };
 
-extern struct of_device_id __clk_of_table;
-static const struct of_device_id __clk_of_table_sentinel
-	__used __section("__clk_of_table_end");
-
+/*
+ * List of ofnodes which provide clocks and associated data
+ * registered by the device to retrieve the clock
+ */
 static LIST_HEAD(of_clk_providers);
-static DEFINE_MUTEX(of_clk_mutex);
 
-struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
+struct clk *of_clk_src_simple_get(struct ofnode_phandle_args *clkspec,
 				     void *data)
 {
 	return data;
 }
 EXPORT_SYMBOL_GPL(of_clk_src_simple_get);
 
-struct clk_hw *of_clk_hw_simple_get(struct of_phandle_args *clkspec, void *data)
+struct clk_hw *of_clk_hw_simple_get(struct ofnode_phandle_args *clkspec, void *data)
 {
 	return data;
 }
 EXPORT_SYMBOL_GPL(of_clk_hw_simple_get);
 
-struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
+struct clk *of_clk_src_onecell_get(struct ofnode_phandle_args *clkspec, void *data)
 {
 	struct clk_onecell_data *clk_data = data;
 	unsigned int idx = clkspec->args[0];
 
@@ -4972,9 +2723,9 @@ struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
 }
 EXPORT_SYMBOL_GPL(of_clk_src_onecell_get);
 
 struct clk_hw *
-of_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
+of_clk_hw_onecell_get(struct ofnode_phandle_args *clkspec, void *data)
 {
 	struct clk_hw_onecell_data *hw_data = data;
 	unsigned int idx = clkspec->args[0];
 
@@ -4994,17 +2745,17 @@ EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
  * @data: context pointer for @clk_src_get callback.
  *
  * This function is *deprecated*. Use of_clk_add_hw_provider() instead.
  */
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *clkspec,
+int of_clk_add_provider(ofnode np,
+			struct clk *(*clk_src_get)(struct ofnode_phandle_args *clkspec,
 						   void *data),
 			void *data)
 {
 	struct of_clk_provider *cp;
 	int ret;
 
-	if (!np)
+	if (!ofnode_valid(np))
 		return 0;
 
 	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
 	if (!cp)
@@ -5016,18 +2767,16 @@ int of_clk_add_provider(struct device_node *np,
 
 	mutex_lock(&of_clk_mutex);
 	list_add(&cp->link, &of_clk_providers);
 	mutex_unlock(&of_clk_mutex);
-	pr_debug("Added clock from %pOF\n", np);
+	pr_debug("Added clock from %pOF\n", &np);
 
 	clk_core_reparent_orphans();
 
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
 
-	fwnode_dev_initialized(&np->fwnode, true);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_provider);
 
@@ -5036,17 +2785,17 @@ EXPORT_SYMBOL_GPL(of_clk_add_provider);
  * @np: Device node pointer associated with clock provider
  * @get: callback for decoding clk_hw
  * @data: context pointer for @get callback.
  */
-int of_clk_add_hw_provider(struct device_node *np,
-			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+int of_clk_add_hw_provider(ofnode np,
+			   struct clk_hw *(*get)(struct ofnode_phandle_args *clkspec,
 						 void *data),
 			   void *data)
 {
 	struct of_clk_provider *cp;
 	int ret;
 
-	if (!np)
+	if (!ofnode_valid(np))
 		return 0;
 
 	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
 	if (!cp)
@@ -5058,41 +2807,39 @@ int of_clk_add_hw_provider(struct device_node *np,
 
 	mutex_lock(&of_clk_mutex);
 	list_add(&cp->link, &of_clk_providers);
 	mutex_unlock(&of_clk_mutex);
-	pr_debug("Added clk_hw provider from %pOF\n", np);
+	pr_debug("Added clk_hw provider from %pOF\n", &np);
 
 	clk_core_reparent_orphans();
 
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
 
-	fwnode_dev_initialized(&np->fwnode, true);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);
 
-static void devm_of_clk_release_provider(struct device *dev, void *res)
+static void devm_of_clk_release_provider(struct udevice *dev, void *res)
 {
-	of_clk_del_provider(*(struct device_node **)res);
+	of_clk_del_provider(*(ofnode *)res);
 }
 
 /*
  * We allow a child device to use its parent device as the clock provider node
  * for cases like MFD sub-devices where the child device driver wants to use
  * devm_*() APIs but not list the device in DT as a sub-node.
  */
-static struct device_node *get_clk_provider_node(struct device *dev)
+static ofnode get_clk_provider_node(struct udevice *dev)
 {
-	struct device_node *np, *parent_np;
+	ofnode np, parent_np;
 
-	np = dev->of_node;
-	parent_np = dev->parent ? dev->parent->of_node : NULL;
+	np = dev_ofnode(dev);
+	parent_np = dev->parent ? dev_ofnode(dev->parent) : ofnode_null();
 
-	if (!of_property_present(np, "#clock-cells"))
-		if (of_property_present(parent_np, "#clock-cells"))
+	if (!ofnode_has_property(np, "#clock-cells"))
+		if (ofnode_has_property(parent_np, "#clock-cells"))
 			np = parent_np;
 
 	return np;
 }
@@ -5110,14 +2857,14 @@ static struct device_node *get_clk_provider_node(struct device *dev)
  * automatically released at device exit.
  *
  * Return: 0 on success or an errno on failure.
  */
-int devm_of_clk_add_hw_provider(struct device *dev,
-			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+int devm_of_clk_add_hw_provider(struct udevice *dev,
+			struct clk_hw *(*get)(struct ofnode_phandle_args *clkspec,
 					      void *data),
 			void *data)
 {
-	struct device_node **ptr, *np;
+	ofnode *ptr, np;
 	int ret;
 
 	ptr = devres_alloc(devm_of_clk_release_provider, sizeof(*ptr),
 			   GFP_KERNEL);
@@ -5140,21 +2887,20 @@ EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider);
 /**
  * of_clk_del_provider() - Remove a previously registered clock provider
  * @np: Device node pointer associated with clock provider
  */
-void of_clk_del_provider(struct device_node *np)
+void of_clk_del_provider(ofnode np)
 {
 	struct of_clk_provider *cp;
 
-	if (!np)
+	if (!ofnode_valid(np))
 		return;
 
 	mutex_lock(&of_clk_mutex);
 	list_for_each_entry(cp, &of_clk_providers, link) {
-		if (cp->node == np) {
+		if (ofnode_equal(cp->node, np)) {
 			list_del(&cp->link);
-			fwnode_dev_initialized(&np->fwnode, false);
-			of_node_put(cp->node);
+			ofnode_put(cp->node);
 			kfree(cp);
 			break;
 		}
 	}
@@ -5199,24 +2945,24 @@ EXPORT_SYMBOL_GPL(of_clk_del_provider);
  * Return: 0 upon successfully parsing the clock specifier. Otherwise, -ENOENT
  * if @name is NULL or -EINVAL if @name is non-NULL and it can't be found in
  * the "clock-names" property of @np.
  */
-static int of_parse_clkspec(const struct device_node *np, int index,
-			    const char *name, struct of_phandle_args *out_args)
+static int of_parse_clkspec(ofnode np, int index,
+			    const char *name, struct ofnode_phandle_args *out_args)
 {
 	int ret = -ENOENT;
 
 	/* Walk up the tree of devices looking for a clock property that matches */
-	while (np) {
+	while (ofnode_valid(np) && !ofnode_equal(np, ofnode_root())) {
 		/*
 		 * For named clocks, first look up the name in the
 		 * "clock-names" property.  If it cannot be found, then index
 		 * will be an error code and of_parse_phandle_with_args() will
 		 * return -EINVAL.
 		 */
 		if (name)
-			index = of_property_match_string(np, "clock-names", name);
-		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
+			index = ofnode_stringlist_search(np, "clock-names", name);
+		ret = ofnode_parse_phandle_with_args(np, "clocks", "#clock-cells", 0,
 						 index, out_args);
 		if (!ret)
 			break;
 		if (name && index >= 0)
@@ -5226,10 +2972,10 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 * No matching clock found on this node.  If the parent node
 		 * has a "clock-ranges" property, then we can try one of its
 		 * clocks.
 		 */
-		np = np->parent;
-		if (np && !of_property_present(np, "clock-ranges"))
+		np = ofnode_get_parent(np);
+		if (ofnode_valid(np) && !ofnode_has_property(np, "clock-ranges"))
 			break;
 		index = 0;
 	}
 
@@ -5237,9 +2983,9 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 }
 
 static struct clk_hw *
 __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
-			      struct of_phandle_args *clkspec)
+			      struct ofnode_phandle_args *clkspec)
 {
 	struct clk *clk;
 
 	if (provider->get_hw)
@@ -5250,31 +2996,43 @@ __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
 		return ERR_CAST(clk);
 	return __clk_get_hw(clk);
 }
 
-static struct clk_hw *
-of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
+/* U-Boot: export so we can call this from clk-uclass */
+struct clk_hw *of_clk_get_hw_from_clkspec(struct ofnode_phandle_args *clkspec)
 {
 	struct of_clk_provider *provider;
 	struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
+	struct udevice *dev;
+	int ret;
 
 	if (!clkspec)
 		return ERR_PTR(-EINVAL);
 
 	/* Check if node in clkspec is in disabled/fail state */
-	if (!of_device_is_available(clkspec->np))
+	if (!ofnode_is_enabled(clkspec->node))
 		return ERR_PTR(-ENOENT);
 
+	/* U-Boot: we need to probe devices on-demand so they register their clocks */
+	ret = device_get_global_by_ofnode(clkspec->node, &dev);
+	if (ret) {
+		pr_debug("Couldn't probe clock device %pOF: %d\n", &clkspec->node, ret);
+		return ERR_PTR(ret);
+	}
+
 	mutex_lock(&of_clk_mutex);
 	list_for_each_entry(provider, &of_clk_providers, link) {
-		if (provider->node == clkspec->np) {
+		if (ofnode_equal(provider->node,clkspec->node)) {
 			hw = __of_clk_get_hw_from_provider(provider, clkspec);
 			if (!IS_ERR(hw))
 				break;
 		}
 	}
 	mutex_unlock(&of_clk_mutex);
 
+	if (!IS_ERR(hw) && !hw->core->dev && !IS_ERR_OR_NULL(dev))
+		hw->core->dev = dev;
+
 	return hw;
 }
 
 /**
@@ -5284,45 +3042,45 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
  * This function looks up a struct clk from the registered list of clock
  * providers, an input is a clock specifier data structure as returned
  * from the of_parse_phandle_with_args() function call.
  */
-struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
+struct clk *of_clk_get_from_provider(struct ofnode_phandle_args *clkspec)
 {
 	struct clk_hw *hw = of_clk_get_hw_from_clkspec(clkspec);
 
 	return clk_hw_create_clk(NULL, hw, NULL, __func__);
 }
 EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
 
-struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
+struct clk_hw *of_clk_get_hw(ofnode np, int index,
 			     const char *con_id)
 {
 	int ret;
 	struct clk_hw *hw;
-	struct of_phandle_args clkspec;
+	struct ofnode_phandle_args clkspec;
 
 	ret = of_parse_clkspec(np, index, con_id, &clkspec);
 	if (ret)
 		return ERR_PTR(ret);
 
 	hw = of_clk_get_hw_from_clkspec(&clkspec);
-	of_node_put(clkspec.np);
+	ofnode_put(clkspec.node);
 
 	return hw;
 }
 
-static struct clk *__of_clk_get(struct device_node *np,
+static struct clk *__of_clk_get(ofnode np,
 				int index, const char *dev_id,
 				const char *con_id)
 {
 	struct clk_hw *hw = of_clk_get_hw(np, index, con_id);
 
 	return clk_hw_create_clk(NULL, hw, dev_id, con_id);
 }
 
-struct clk *of_clk_get(struct device_node *np, int index)
+struct clk *of_clk_get(ofnode np, int index)
 {
-	return __of_clk_get(np, index, np->full_name, NULL);
+	return __of_clk_get(np, index, ofnode_get_name(np), NULL);
 }
 EXPORT_SYMBOL(of_clk_get);
 
 /**
@@ -5333,14 +3091,14 @@ EXPORT_SYMBOL(of_clk_get);
  * This function parses the clocks and clock-names properties,
  * and uses them to look up the struct clk from the registered list of clock
  * providers.
  */
-struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
+struct clk *of_clk_get_by_name(ofnode np, const char *name)
 {
-	if (!np)
+	if (!ofnode_valid(np))
 		return ERR_PTR(-ENOENT);
 
-	return __of_clk_get(np, 0, np->full_name, name);
+	return __of_clk_get(np, 0, ofnode_get_name(np), name);
 }
 EXPORT_SYMBOL(of_clk_get_by_name);
 
 /**
@@ -5348,248 +3106,103 @@ EXPORT_SYMBOL(of_clk_get_by_name);
  * @np: device node to count
  *
  * Returns: The number of clocks that are possible parents of this node
  */
-unsigned int of_clk_get_parent_count(const struct device_node *np)
+unsigned int of_clk_get_parent_count(const ofnode np)
 {
 	int count;
 
-	count = of_count_phandle_with_args(np, "clocks", "#clock-cells");
+	count = ofnode_count_phandle_with_args(np, "clocks", "#clock-cells", 0);
 	if (count < 0)
 		return 0;
 
 	return count;
 }
 EXPORT_SYMBOL_GPL(of_clk_get_parent_count);
 
-const char *of_clk_get_parent_name(const struct device_node *np, int index)
+#if CONFIG_IS_ENABLED(UNIT_TEST)
+void clk_ccf_reset(void)
 {
-	struct of_phandle_args clkspec;
-	const char *clk_name;
-	bool found = false;
-	u32 pv;
-	int rc;
-	int count;
-	struct clk *clk;
-
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
-	if (rc)
-		return NULL;
-
-	index = clkspec.args_count ? clkspec.args[0] : 0;
-	count = 0;
-
-	/* if there is an indices property, use it to transfer the index
-	 * specified into an array offset for the clock-output-names property.
-	 */
-	of_property_for_each_u32(clkspec.np, "clock-indices", pv) {
-		if (index == pv) {
-			index = count;
-			found = true;
-			break;
-		}
-		count++;
-	}
-	/* We went off the end of 'clock-indices' without finding it */
-	if (of_property_present(clkspec.np, "clock-indices") && !found) {
-		of_node_put(clkspec.np);
-		return NULL;
-	}
-
-	if (of_property_read_string_index(clkspec.np, "clock-output-names",
-					  index,
-					  &clk_name) < 0) {
-		/*
-		 * Best effort to get the name if the clock has been
-		 * registered with the framework. If the clock isn't
-		 * registered, we return the node name as the name of
-		 * the clock as long as #clock-cells = 0.
-		 */
-		clk = of_clk_get_from_provider(&clkspec);
-		if (IS_ERR(clk)) {
-			if (clkspec.args_count == 0)
-				clk_name = clkspec.np->name;
-			else
-				clk_name = NULL;
-		} else {
-			clk_name = __clk_get_name(clk);
-			clk_put(clk);
-		}
-	}
-
-
-	of_node_put(clkspec.np);
-	return clk_name;
+	clk_root_list.first = NULL;
+	clk_orphan_list.first = NULL;
+	clk_hashtable.first = NULL;
+	of_clk_providers.next = of_clk_providers.prev = &of_clk_providers;
 }
-EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
+#endif
 
-/**
- * of_clk_parent_fill() - Fill @parents with names of @np's parents and return
- * number of parents
- * @np: Device node pointer associated with clock provider
- * @parents: pointer to char array that hold the parents' names
- * @size: size of the @parents array
- *
- * Return: number of parents for the clock node.
- */
-int of_clk_parent_fill(struct device_node *np, const char **parents,
-		       unsigned int size)
+static void clk_summary_show_one(struct clk_core *c,
+				 int level)
 {
-	unsigned int i = 0;
+	// struct clk *clk_user;
+	// int multi_node = 0;
 
-	while (i < size && (parents[i] = of_clk_get_parent_name(np, i)) != NULL)
-		i++;
+	printf("%*s%-*s %-7d %-11lu",
+		   level * 3 + 1, "",
+		   35 - level * 3, c->name,
+		   c->enable_count,
+		   clk_core_get_rate_recalc(c));
 
-	return i;
-}
-EXPORT_SYMBOL_GPL(of_clk_parent_fill);
+	if (c->ops->is_enabled)
+		printf(" %5c ", clk_core_is_enabled(c) ? 'Y' : 'N');
+	else if (!c->ops->enable)
+		printf(" %5c ", 'Y');
+	else
+		printf(" %5c ", '?');
 
-struct clock_provider {
-	void (*clk_init_cb)(struct device_node *);
-	struct device_node *np;
-	struct list_head node;
-};
+	printf("\n");
 
-/*
- * This function looks for a parent clock. If there is one, then it
- * checks that the provider for this parent clock was initialized, in
- * this case the parent clock will be ready.
- */
-static int parent_ready(struct device_node *np)
-{
-	int i = 0;
+	// hlist_for_each_entry(clk_user, &c->clks, clks_node) {
+	// 	if (!clk_user->dev || !clk_user->dev->name)
+	// 		continue;
 
-	while (true) {
-		struct clk *clk = of_clk_get(np, i);
+	// 	printf("%*s%-*s\n",
+	// 		   level * 3 + 2 + 105 * multi_node, "",
+	// 		   30,
+	// 		   clk_user->dev->name);
 
-		/* this parent is ready we can check the next one */
-		if (!IS_ERR(clk)) {
-			clk_put(clk);
-			i++;
-			continue;
-		}
+	// 	multi_node = 1;
+	// }
 
-		/* at least one parent is not ready, we exit now */
-		if (PTR_ERR(clk) == -EPROBE_DEFER)
-			return 0;
-
-		/*
-		 * Here we make assumption that the device tree is
-		 * written correctly. So an error means that there is
-		 * no more parent. As we didn't exit yet, then the
-		 * previous parent are ready. If there is no clock
-		 * parent, no need to wait for them, then we can
-		 * consider their absence as being ready
-		 */
-		return 1;
-	}
 }
 
-/**
- * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
- * @np: Device node pointer associated with clock provider
- * @index: clock index
- * @flags: pointer to top-level framework flags
- *
- * Detects if the clock-critical property exists and, if so, sets the
- * corresponding CLK_IS_CRITICAL flag.
- *
- * Do not use this function. It exists only for legacy Device Tree
- * bindings, such as the one-clock-per-node style that are outdated.
- * Those bindings typically put all clock data into .dts and the Linux
- * driver has no clock data, thus making it impossible to set this flag
- * correctly from the driver. Only those drivers may call
- * of_clk_detect_critical from their setup functions.
- *
- * Return: error code or zero on success
- */
-int of_clk_detect_critical(struct device_node *np, int index,
-			   unsigned long *flags)
+static void clk_summary_show_subtree(struct clk_core *c,
+				     int level)
 {
-	uint32_t idx;
+	struct clk_core *child;
 
-	if (!np || !flags)
-		return -EINVAL;
+	clk_summary_show_one(c, level);
 
-	of_property_for_each_u32(np, "clock-critical", idx)
-		if (index == idx)
-			*flags |= CLK_IS_CRITICAL;
+	hlist_for_each_entry(child, &c->children, child_node)
+		clk_summary_show_subtree(child, level + 1);
+}
+
+int clk_summary_show(void)
+{
+	struct clk_core *c;
+	const struct hlist_head **lists = all_lists;
+
+	printf("                                 enable              hardware           \n");
+	printf("   clock                          count        rate    enable   consumer\n");
+	printf("------------------------------------------------------------------------\n");
+
+	for (; *lists; lists++)
+		hlist_for_each_entry(c, *lists, child_node)
+			clk_summary_show_subtree(c, 0);
 
 	return 0;
 }
 
-/**
- * of_clk_init() - Scan and init clock providers from the DT
- * @matches: array of compatible values and init functions for providers.
- *
- * This function scans the device tree for matching clock providers
- * and calls their initialization functions. It also does it by trying
- * to follow the dependencies.
- */
-void __init of_clk_init(const struct of_device_id *matches)
+/* Exposed for sandbox DM tests only! */
+#if CONFIG_UNIT_TEST
+int clk_get_enable_count(struct clk *clk)
 {
-	const struct of_device_id *match;
-	struct device_node *np;
-	struct clock_provider *clk_provider, *next;
-	bool is_init_done;
-	bool force = false;
-	LIST_HEAD(clk_provider_list);
-
-	if (!matches)
-		matches = &__clk_of_table;
-
-	/* First prepare the list of the clocks providers */
-	for_each_matching_node_and_match(np, matches, &match) {
-		struct clock_provider *parent;
-
-		if (!of_device_is_available(np))
-			continue;
-
-		parent = kzalloc(sizeof(*parent), GFP_KERNEL);
-		if (!parent) {
-			list_for_each_entry_safe(clk_provider, next,
-						 &clk_provider_list, node) {
-				list_del(&clk_provider->node);
-				of_node_put(clk_provider->np);
-				kfree(clk_provider);
-			}
-			of_node_put(np);
-			return;
-		}
-
-		parent->clk_init_cb = match->data;
-		parent->np = of_node_get(np);
-		list_add_tail(&parent->node, &clk_provider_list);
-	}
-
-	while (!list_empty(&clk_provider_list)) {
-		is_init_done = false;
-		list_for_each_entry_safe(clk_provider, next,
-					&clk_provider_list, node) {
-			if (force || parent_ready(clk_provider->np)) {
-
-				/* Don't populate platform devices */
-				of_node_set_flag(clk_provider->np,
-						 OF_POPULATED);
-
-				clk_provider->clk_init_cb(clk_provider->np);
-				of_clk_set_defaults(clk_provider->np, true);
-
-				list_del(&clk_provider->node);
-				of_node_put(clk_provider->np);
-				kfree(clk_provider);
-				is_init_done = true;
-			}
-		}
-
-		/*
-		 * We didn't manage to initialize any of the
-		 * remaining providers during the last loop, so now we
-		 * initialize all the remaining ones unconditionally
-		 * in case the clock parent was not mandatory
-		 */
-		if (!is_init_done)
-			force = true;
-	}
+	return clk->core->enable_count;
 }
 
+void __clk_mark_critical(struct clk *clk, bool critical)
+{
+	if (critical)
+		clk->core->flags |= CLK_IS_CRITICAL;
+	else
+	 	clk->core->flags &= ~CLK_IS_CRITICAL;
+}
+#endif
diff --git a/drivers/clk/ccf/clk.h b/drivers/clk/ccf/clk.h
index 2d801900cad5..72607020ed8e 100644
--- a/drivers/clk/ccf/clk.h
+++ b/drivers/clk/ccf/clk.h
@@ -3,36 +3,51 @@
  * Copyright (C) 2013 Samsung Electronics Co., Ltd.
  * Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
 
+#ifndef __CLK_CCF_CLK_H__
+#define __CLK_CCF_CLK_H__
+
+#include <dm/ofnode.h>
+
 struct clk_hw;
-struct device;
+struct udevice;
 struct of_phandle_args;
 
-#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
-struct clk_hw *of_clk_get_hw(struct device_node *np,
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+struct clk_hw *of_clk_get_hw(ofnode np,
 				    int index, const char *con_id);
-#else /* !CONFIG_COMMON_CLK || !CONFIG_OF */
-static inline struct clk_hw *of_clk_get_hw(struct device_node *np,
-				    int index, const char *con_id)
-{
-	return ERR_PTR(-ENOENT);
-}
-#endif
 
-struct clk_hw *clk_find_hw(const char *dev_id, const char *con_id);
-
-#ifdef CONFIG_COMMON_CLK
-struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
+struct clk *clk_hw_create_clk(struct udevice *dev, struct clk_hw *hw,
 			      const char *dev_id, const char *con_id);
+int clk_hw_create_clk_uboot(struct clk *clk, struct clk_hw *hw);
 void __clk_put(struct clk *clk);
 #else
-/* All these casts to avoid ifdefs in clkdev... */
-static inline struct clk *
-clk_hw_create_clk(struct device *dev, struct clk_hw *hw, const char *dev_id,
-		  const char *con_id)
+struct clk_hw *of_clk_get_hw(ofnode np,
+				    int index, const char *con_id)
 {
-	return (struct clk *)hw;
+	return NULL;
 }
-static inline void __clk_put(struct clk *clk) { }
-
+struct clk *clk_hw_create_clk(struct udevice *dev, struct clk_hw *hw,
+			      const char *dev_id, const char *con_id)
+{
+	return NULL;
+}
+int clk_hw_create_clk_uboot(struct clk *clk, struct clk_hw *hw)
+{
+	return -ENOSYS;
+}
+void __clk_put(struct clk *clk) { }
 #endif
+
+// Linux compat
+
+#define clk_prepare_lock()
+#define clk_prepare_unlock()
+
+static inline unsigned long clk_enable_lock(void) {
+	return 0;
+}
+
+static inline void clk_enable_unlock(unsigned long flags) { }
+
+#endif /* __CLK_CCF_CLK_H__ */
diff --git a/include/clk.h b/include/clk.h
index 0520032f692c..f0fb5cb7904e 100644
--- a/include/clk.h
+++ b/include/clk.h
@@ -55,8 +55,12 @@ struct udevice;
  * @id: The clock signal ID within the provider.
  * @data: An optional data field for scenarios where a single integer ID is not
  *	  sufficient. If used, it can be populated through an .of_xlate op and
  *	  processed during the various clock ops.
+ * @clks_node: List entry used to reference this clk consumer from the clk_core
+ *	  it represents. Only used with CCF_FULL
+ * @core: Pointer to the underlying clk_core for this clk handle, used by CCF_FULL
+ *	  to access clk_ops and manage clk state.
  *
  * Clients provide storage for clock handles. The content of the structure is
  * managed solely by the clock API and clock drivers. A clock struct is
  * initialized by "get"ing the clock struct. The clock struct is passed to all
@@ -79,8 +83,12 @@ struct clk {
 	 * Written by of_xlate. In the future, we might add more fields here.
 	 */
 	unsigned long id;
 	unsigned long data;
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+	struct hlist_node clks_node;
+	struct clk_core *core;
+#endif
 };
 
 /**
  * struct clk_bulk - A handle to (allowing control of) a bulk of clocks.
@@ -589,8 +597,30 @@ bool clk_dev_binded(struct clk *clk);
  * device tree or in platdata
  */
 ulong clk_get_id(const struct clk *clk);
 
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+struct clk *of_clk_get(ofnode np, int index);
+struct clk *of_clk_get_by_name(ofnode np, const char *name);
+struct clk *of_clk_get_from_provider(struct ofnode_phandle_args *clkspec);
+#else
+static inline struct clk *of_clk_get(ofnode np, int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline struct clk *of_clk_get_by_name(ofnode np,
+					     const char *name)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline struct clk *of_clk_get_from_provider(struct ofnode_phandle_args *clkspec)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
+
 #else /* CONFIG_IS_ENABLED(CLK) */
 
 static inline int clk_request(struct udevice *dev, struct clk *clk)
 {
diff --git a/include/linux/clk-provider-ccf_full.h b/include/linux/clk-provider-ccf_full.h
index 0e160b13b3b2..b2b50ee2e47a 100644
--- a/include/linux/clk-provider-ccf_full.h
+++ b/include/linux/clk-provider-ccf_full.h
@@ -335,15 +335,15 @@ struct clk_fixed_rate {
 
 #define CLK_FIXED_RATE_PARENT_ACCURACY	BIT(0)
 
 extern const struct clk_ops clk_fixed_rate_ops;
-struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__clk_hw_register_fixed_rate(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		unsigned long fixed_rate, unsigned long fixed_accuracy,
 		unsigned long clk_fixed_flags, bool devm);
-struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
+struct clk *clk_register_fixed_rate(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned long fixed_rate);
 /**
  * clk_hw_register_fixed_rate - register fixed-rate clock with the clock
@@ -354,9 +354,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @flags: framework-specific flags
  * @fixed_rate: non-adjustable clock rate
  */
 #define clk_hw_register_fixed_rate(dev, name, parent_name, flags, fixed_rate)  \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name), NULL, \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), (parent_name), NULL, \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
 
 /**
  * devm_clk_hw_register_fixed_rate - register fixed-rate clock with the clock
@@ -367,9 +367,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @flags: framework-specific flags
  * @fixed_rate: non-adjustable clock rate
  */
 #define devm_clk_hw_register_fixed_rate(dev, name, parent_name, flags, fixed_rate)  \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name), NULL, \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), (parent_name), NULL, \
 				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * devm_clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework
@@ -380,9 +380,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @fixed_rate: non-adjustable clock rate
  */
 #define devm_clk_hw_register_fixed_rate_parent_data(dev, name, parent_data, flags, \
 						    fixed_rate)			   \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,		   \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), NULL, NULL,		   \
 				     (parent_data), (flags), (fixed_rate), 0,	   \
 				     0, true)
 /**
  * clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
@@ -394,9 +394,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @fixed_rate: non-adjustable clock rate
  */
 #define clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags,     \
 					     fixed_rate)		      \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework
@@ -407,9 +407,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @fixed_rate: non-adjustable clock rate
  */
 #define clk_hw_register_fixed_rate_parent_data(dev, name, parent_data, flags, \
 					     fixed_rate)		      \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), NULL, NULL,	      \
 				     (parent_data), (flags), (fixed_rate), 0, \
 				     0, false)
 /**
  * clk_hw_register_fixed_rate_with_accuracy - register fixed-rate clock with
@@ -423,9 +423,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  */
 #define clk_hw_register_fixed_rate_with_accuracy(dev, name, parent_name,      \
 						 flags, fixed_rate,	      \
 						 fixed_accuracy)	      \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), (parent_name),      \
 				     NULL, NULL, (flags), (fixed_rate),       \
 				     (fixed_accuracy), 0, false)
 /**
  * clk_hw_register_fixed_rate_with_accuracy_parent_hw - register fixed-rate
@@ -438,9 +438,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @fixed_accuracy: non-adjustable clock accuracy
  */
 #define clk_hw_register_fixed_rate_with_accuracy_parent_hw(dev, name,	      \
 		parent_hw, flags, fixed_rate, fixed_accuracy)		      \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate),	      \
 				     (fixed_accuracy), 0, false)
 /**
  * clk_hw_register_fixed_rate_with_accuracy_parent_data - register fixed-rate
@@ -453,9 +453,9 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @fixed_accuracy: non-adjustable clock accuracy
  */
 #define clk_hw_register_fixed_rate_with_accuracy_parent_data(dev, name,	      \
 		parent_data, flags, fixed_rate, fixed_accuracy)		      \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), NULL, NULL,	      \
 				     (parent_data), NULL, (flags),	      \
 				     (fixed_rate), (fixed_accuracy), 0, false)
 /**
  * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
@@ -467,16 +467,16 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
  * @fixed_rate: non-adjustable clock rate
  */
 #define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_data,    \
 						   flags, fixed_rate)	      \
-	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,      \
+	__clk_hw_register_fixed_rate((dev), dev_ofnode(dev), (name), NULL, NULL,      \
 				     (parent_data), (flags), (fixed_rate), 0,    \
 				     CLK_FIXED_RATE_PARENT_ACCURACY, false)
 
 void clk_unregister_fixed_rate(struct clk *clk);
 void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
 
-void of_fixed_clk_setup(struct device_node *np);
+void of_fixed_clk_setup(ofnode np);
 
 /**
  * struct clk_gate - gating clock
  *
@@ -514,23 +514,23 @@ struct clk_gate {
 #define CLK_GATE_HIWORD_MASK		BIT(1)
 #define CLK_GATE_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_gate_ops;
-struct clk_hw *__clk_hw_register_gate(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__clk_hw_register_gate(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags,
 		void __iomem *reg, u8 bit_idx,
 		u8 clk_gate_flags, spinlock_t *lock);
-struct clk_hw *__devm_clk_hw_register_gate(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__devm_clk_hw_register_gate(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags,
 		void __iomem *reg, u8 bit_idx,
 		u8 clk_gate_flags, spinlock_t *lock);
-struct clk *clk_register_gate(struct device *dev, const char *name,
+struct clk *clk_register_gate(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 bit_idx,
 		u8 clk_gate_flags, spinlock_t *lock);
 /**
@@ -544,12 +544,12 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
  * @clk_gate_flags: gate-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define clk_hw_register_gate(dev, name, parent_name, flags, reg, bit_idx,     \
-			     clk_gate_flags, lock)			      \
-	__clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL,      \
+			     clk_gate_flags)			      \
+	__clk_hw_register_gate((dev), dev_ofnode(dev), (name), (parent_name), NULL,      \
 			       NULL, (flags), (reg), (bit_idx),		      \
-			       (clk_gate_flags), (lock))
+			       (clk_gate_flags), NULL)
 /**
  * clk_hw_register_gate_parent_hw - register a gate clock with the clock
  * framework
  * @dev: device that is registering this clock
@@ -561,12 +561,12 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
  * @clk_gate_flags: gate-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags, reg,      \
-				       bit_idx, clk_gate_flags, lock)	      \
-	__clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),        \
+				       bit_idx, clk_gate_flags)	      \
+	__clk_hw_register_gate((dev), dev_ofnode(dev), (name), NULL, (parent_hw),        \
 			       NULL, (flags), (reg), (bit_idx),		      \
-			       (clk_gate_flags), (lock))
+			       (clk_gate_flags), NULL)
 /**
  * clk_hw_register_gate_parent_data - register a gate clock with the clock
  * framework
  * @dev: device that is registering this clock
@@ -578,12 +578,12 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
  * @clk_gate_flags: gate-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define clk_hw_register_gate_parent_data(dev, name, parent_data, flags, reg,  \
-				       bit_idx, clk_gate_flags, lock)	      \
-	__clk_hw_register_gate((dev), NULL, (name), NULL, NULL, (parent_data), \
+				       bit_idx, clk_gate_flags)	      \
+	__clk_hw_register_gate((dev), dev_ofnode(dev), (name), NULL, NULL, (parent_data), \
 			       (flags), (reg), (bit_idx),		      \
-			       (clk_gate_flags), (lock))
+			       (clk_gate_flags), NULL)
 /**
  * devm_clk_hw_register_gate - register a gate clock with the clock framework
  * @dev: device that is registering this clock
  * @name: name of this clock
@@ -594,12 +594,12 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
  * @clk_gate_flags: gate-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define devm_clk_hw_register_gate(dev, name, parent_name, flags, reg, bit_idx,\
-				  clk_gate_flags, lock)			      \
-	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
+				  clk_gate_flags)			      \
+	__devm_clk_hw_register_gate((dev), dev_ofnode(dev), (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
-			       (clk_gate_flags), (lock))
+			       (clk_gate_flags), NULL)
 /**
  * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
  * framework
  * @dev: device that is registering this clock
@@ -611,13 +611,12 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
  * @clk_gate_flags: gate-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
-					    reg, bit_idx, clk_gate_flags,     \
-					    lock)			      \
-	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+					    reg, bit_idx, clk_gate_flags) \
+	__devm_clk_hw_register_gate((dev), dev_ofnode(dev), (name), NULL, (parent_hw),   \
 				    NULL, (flags), (reg), (bit_idx),	      \
-				    (clk_gate_flags), (lock))
+				    (clk_gate_flags), NULL)
 /**
  * devm_clk_hw_register_gate_parent_data - register a gate clock with the
  * clock framework
  * @dev: device that is registering this clock
@@ -629,13 +628,12 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
  * @clk_gate_flags: gate-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
-					      reg, bit_idx, clk_gate_flags,   \
-					      lock)			      \
-	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
+					      reg, bit_idx, clk_gate_flags)  \
+	__devm_clk_hw_register_gate((dev), dev_ofnode(dev), (name), NULL, NULL,	      \
 				    (parent_data), (flags), (reg), (bit_idx), \
-				    (clk_gate_flags), (lock))
+				    (clk_gate_flags), NULL)
 
 void clk_unregister_gate(struct clk *clk);
 void clk_hw_unregister_gate(struct clk_hw *hw);
 int clk_gate_is_enabled(struct clk_hw *hw);
@@ -733,23 +731,23 @@ int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 int divider_get_val(unsigned long rate, unsigned long parent_rate,
 		const struct clk_div_table *table, u8 width,
 		unsigned long flags);
 
-struct clk_hw *__clk_hw_register_divider(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__clk_hw_register_divider(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		unsigned long clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
-struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
-		struct device_node *np, const char *name,
+struct clk_hw *__devm_clk_hw_register_divider(struct udevice *dev,
+		ofnode np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		unsigned long clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
-struct clk *clk_register_divider_table(struct device *dev, const char *name,
+struct clk *clk_register_divider_table(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
 		unsigned long clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
@@ -762,15 +760,14 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @reg: register address to adjust divider
  * @shift: number of bits to shift the bitfield
  * @width: width of the bitfield
  * @clk_divider_flags: divider-specific flags for this clock
- * @lock: shared register lock for this clock
  */
 #define clk_register_divider(dev, name, parent_name, flags, reg, shift, width, \
-			     clk_divider_flags, lock)			       \
+			     clk_divider_flags)			       \
 	clk_register_divider_table((dev), (name), (parent_name), (flags),      \
 				   (reg), (shift), (width),		       \
-				   (clk_divider_flags), NULL, (lock))
+				   (clk_divider_flags), NULL, NULL)
 /**
  * clk_hw_register_divider - register a divider clock with the clock framework
  * @dev: device registering this clock
  * @name: name of this clock
@@ -779,15 +776,14 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @reg: register address to adjust divider
  * @shift: number of bits to shift the bitfield
  * @width: width of the bitfield
  * @clk_divider_flags: divider-specific flags for this clock
- * @lock: shared register lock for this clock
  */
 #define clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
-				width, clk_divider_flags, lock)		      \
-	__clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				width, clk_divider_flags)		      \
+	__clk_hw_register_divider((dev), dev_ofnode(dev), (name), (parent_name), NULL,   \
 				  NULL, (flags), (reg), (shift), (width),     \
-				  (clk_divider_flags), NULL, (lock))
+				  (clk_divider_flags), NULL, NULL)
 /**
  * clk_hw_register_divider_parent_hw - register a divider clock with the clock
  * framework
  * @dev: device registering this clock
@@ -797,16 +793,14 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @reg: register address to adjust divider
  * @shift: number of bits to shift the bitfield
  * @width: width of the bitfield
  * @clk_divider_flags: divider-specific flags for this clock
- * @lock: shared register lock for this clock
  */
 #define clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags, reg,   \
-					  shift, width, clk_divider_flags,    \
-					  lock)				      \
-	__clk_hw_register_divider((dev), NULL, (name), NULL, (parent_hw),     \
+					  shift, width, clk_divider_flags)	\
+	__clk_hw_register_divider((dev), dev_ofnode(dev), (name), NULL, (parent_hw),     \
 				  NULL, (flags), (reg), (shift), (width),     \
-				  (clk_divider_flags), NULL, (lock))
+				  (clk_divider_flags), NULL, NULL)
 /**
  * clk_hw_register_divider_parent_data - register a divider clock with the clock
  * framework
  * @dev: device registering this clock
@@ -816,16 +810,15 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @reg: register address to adjust divider
  * @shift: number of bits to shift the bitfield
  * @width: width of the bitfield
  * @clk_divider_flags: divider-specific flags for this clock
- * @lock: shared register lock for this clock
  */
 #define clk_hw_register_divider_parent_data(dev, name, parent_data, flags,    \
 					    reg, shift, width,		      \
-					    clk_divider_flags, lock)	      \
-	__clk_hw_register_divider((dev), NULL, (name), NULL, NULL,	      \
+					    clk_divider_flags)	      \
+	__clk_hw_register_divider((dev), dev_ofnode(dev), (name), NULL, NULL,	      \
 				  (parent_data), (flags), (reg), (shift),     \
-				  (width), (clk_divider_flags), NULL, (lock))
+				  (width), (clk_divider_flags), NULL, NULL)
 /**
  * clk_hw_register_divider_table - register a table based divider clock with
  * the clock framework
  * @dev: device registering this clock
@@ -836,16 +829,14 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @shift: number of bits to shift the bitfield
  * @width: width of the bitfield
  * @clk_divider_flags: divider-specific flags for this clock
  * @table: array of divider/value pairs ending with a div set to 0
- * @lock: shared register lock for this clock
  */
 #define clk_hw_register_divider_table(dev, name, parent_name, flags, reg,     \
-				      shift, width, clk_divider_flags, table, \
-				      lock)				      \
-	__clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				      shift, width, clk_divider_flags, table) \
+	__clk_hw_register_divider((dev), dev_ofnode(dev), (name), (parent_name), NULL,   \
 				  NULL, (flags), (reg), (shift), (width),     \
-				  (clk_divider_flags), (table), (lock))
+				  (clk_divider_flags), (table), NULL)
 /**
  * clk_hw_register_divider_table_parent_hw - register a table based divider
  * clock with the clock framework
  * @dev: device registering this clock
@@ -856,17 +847,15 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @shift: number of bits to shift the bitfield
  * @width: width of the bitfield
  * @clk_divider_flags: divider-specific flags for this clock
  * @table: array of divider/value pairs ending with a div set to 0
- * @lock: shared register lock for this clock
  */
 #define clk_hw_register_divider_table_parent_hw(dev, name, parent_hw, flags,  \
 						reg, shift, width,	      \
-						clk_divider_flags, table,     \
-						lock)			      \
-	__clk_hw_register_divider((dev), NULL, (name), NULL, (parent_hw),     \
+						clk_divider_flags, table) \
+	__clk_hw_register_divider((dev), dev_ofnode(dev), (name), NULL, (parent_hw),     \
 				  NULL, (flags), (reg), (shift), (width),     \
-				  (clk_divider_flags), (table), (lock))
+				  (clk_divider_flags), (table), NULL)
 /**
  * clk_hw_register_divider_table_parent_data - register a table based divider
  * clock with the clock framework
  * @dev: device registering this clock
@@ -881,14 +870,13 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @lock: shared register lock for this clock
  */
 #define clk_hw_register_divider_table_parent_data(dev, name, parent_data,     \
 						  flags, reg, shift, width,   \
-						  clk_divider_flags, table,   \
-						  lock)			      \
-	__clk_hw_register_divider((dev), NULL, (name), NULL, NULL,	      \
+						  clk_divider_flags, table)   \
+	__clk_hw_register_divider((dev), dev_ofnode(dev), (name), NULL, NULL,	      \
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
-				  (lock))
+				  NULL)
 /**
  * devm_clk_hw_register_divider - register a divider clock with the clock framework
  * @dev: device registering this clock
  * @name: name of this clock
@@ -900,12 +888,12 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @clk_divider_flags: divider-specific flags for this clock
  * @lock: shared register lock for this clock
  */
 #define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
-				width, clk_divider_flags, lock)		      \
-	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				width, clk_divider_flags)		      \
+	__devm_clk_hw_register_divider((dev), dev_ofnode(dev), (name), (parent_name), NULL,   \
 				  NULL, (flags), (reg), (shift), (width),     \
-				  (clk_divider_flags), NULL, (lock))
+				  (clk_divider_flags), NULL, NULL)
 /**
  * devm_clk_hw_register_divider_parent_hw - register a divider clock with the clock framework
  * @dev: device registering this clock
  * @name: name of this clock
@@ -918,13 +906,13 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @lock: shared register lock for this clock
  */
 #define devm_clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags,   \
 					       reg, shift, width,	      \
-					       clk_divider_flags, lock)       \
-	__devm_clk_hw_register_divider((dev), NULL, (name), NULL,	      \
+					       clk_divider_flags)       \
+	__devm_clk_hw_register_divider((dev), dev_ofnode(dev), (name), NULL,	      \
 				       (parent_hw), NULL, (flags), (reg),     \
 				       (shift), (width), (clk_divider_flags), \
-				       NULL, (lock))
+				       NULL, NULL)
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
  * @dev: device registering this clock
@@ -939,13 +927,13 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
  * @lock: shared register lock for this clock
  */
 #define devm_clk_hw_register_divider_table(dev, name, parent_name, flags,     \
 					   reg, shift, width,		      \
-					   clk_divider_flags, table, lock)    \
-	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name),    \
+					   clk_divider_flags, table)    \
+	__devm_clk_hw_register_divider((dev), dev_ofnode(dev), (name), (parent_name),    \
 				       NULL, NULL, (flags), (reg), (shift),   \
 				       (width), (clk_divider_flags), (table), \
-				       (lock))
+				       NULL)
 
 void clk_unregister_divider(struct clk *clk);
 void clk_hw_unregister_divider(struct clk_hw *hw);
 
@@ -999,99 +987,97 @@ struct clk_mux {
 
 extern const struct clk_ops clk_mux_ops;
 extern const struct clk_ops clk_mux_ro_ops;
 
-struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
+struct clk_hw *__clk_hw_register_mux(struct udevice *dev, ofnode np,
 		const char *name, u8 num_parents,
 		const char * const *parent_names,
 		const struct clk_hw **parent_hws,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, const u32 *table, spinlock_t *lock);
-struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+struct clk_hw *__devm_clk_hw_register_mux(struct udevice *dev, ofnode np,
 		const char *name, u8 num_parents,
 		const char * const *parent_names,
 		const struct clk_hw **parent_hws,
 		const struct clk_parent_data *parent_data,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, const u32 *table, spinlock_t *lock);
-struct clk *clk_register_mux_table(struct device *dev, const char *name,
+struct clk *clk_register_mux_table(struct udevice *dev, const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
 		u8 clk_mux_flags, const u32 *table, spinlock_t *lock);
 
 #define clk_register_mux(dev, name, parent_names, num_parents, flags, reg,    \
-			 shift, width, clk_mux_flags, lock)		      \
+			 shift, width, clk_mux_flags)		      \
 	clk_register_mux_table((dev), (name), (parent_names), (num_parents),  \
 			       (flags), (reg), (shift), BIT((width)) - 1,     \
-			       (clk_mux_flags), NULL, (lock))
+			       (clk_mux_flags), NULL, NULL)
 #define clk_hw_register_mux_table(dev, name, parent_names, num_parents,	      \
 				  flags, reg, shift, mask, clk_mux_flags,     \
-				  table, lock)				      \
-	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+				  table)				      \
+	__clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents),	      \
 			      (parent_names), NULL, NULL, (flags), (reg),     \
 			      (shift), (mask), (clk_mux_flags), (table),      \
-			      (lock))
+			      NULL)
 #define clk_hw_register_mux_table_parent_data(dev, name, parent_data,	      \
 				  num_parents, flags, reg, shift, mask,	      \
-				  clk_mux_flags, table, lock)		      \
-	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+				  clk_mux_flags, table)		      \
+	__clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents),	      \
 			      NULL, NULL, (parent_data), (flags), (reg),      \
 			      (shift), (mask), (clk_mux_flags), (table),      \
-			      (lock))
+			      NULL)
 #define clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
-			    shift, width, clk_mux_flags, lock)		      \
-	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			    shift, width, clk_mux_flags)		      \
+	__clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents),	      \
 			      (parent_names), NULL, NULL, (flags), (reg),     \
 			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
-			      NULL, (lock))
+			      NULL, NULL)
 #define clk_hw_register_mux_hws(dev, name, parent_hws, num_parents, flags,    \
-				reg, shift, width, clk_mux_flags, lock)	      \
-	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,	      \
+				reg, shift, width, clk_mux_flags)	      \
+	__clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents), NULL,	      \
 			      (parent_hws), NULL, (flags), (reg), (shift),    \
-			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+			      BIT((width)) - 1, (clk_mux_flags), NULL, NULL)
 #define clk_hw_register_mux_parent_data(dev, name, parent_data, num_parents,  \
 					flags, reg, shift, width,	      \
-					clk_mux_flags, lock)		      \
-	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
+					clk_mux_flags)		      \
+	__clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents), NULL, NULL, \
 			      (parent_data), (flags), (reg), (shift),	      \
-			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+			      BIT((width)) - 1, (clk_mux_flags), NULL, NULL)
 #define clk_hw_register_mux_parent_data_table(dev, name, parent_data,	      \
 					      num_parents, flags, reg, shift, \
-					      width, clk_mux_flags, table,    \
-					      lock)			      \
-	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
+					      width, clk_mux_flags, table) \
+	__clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents), NULL, NULL, \
 			      (parent_data), (flags), (reg), (shift),	      \
-			      BIT((width)) - 1, (clk_mux_flags), table, (lock))
+			      BIT((width)) - 1, (clk_mux_flags), table, NULL)
 #define devm_clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
-			    shift, width, clk_mux_flags, lock)		      \
-	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			    shift, width, clk_mux_flags)		      \
+	__devm_clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents),	      \
 			      (parent_names), NULL, NULL, (flags), (reg),     \
 			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
-			      NULL, (lock))
+			      NULL, NULL)
 #define devm_clk_hw_register_mux_parent_hws(dev, name, parent_hws,	      \
 					    num_parents, flags, reg, shift,   \
-					    width, clk_mux_flags, lock)       \
-	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,  \
+					    width, clk_mux_flags)       \
+	__devm_clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents), NULL,  \
 				   (parent_hws), NULL, (flags), (reg),        \
 				   (shift), BIT((width)) - 1,		      \
-				   (clk_mux_flags), NULL, (lock))
+				   (clk_mux_flags), NULL, NULL)
 #define devm_clk_hw_register_mux_parent_data_table(dev, name, parent_data,    \
 					      num_parents, flags, reg, shift, \
-					      width, clk_mux_flags, table,    \
-					      lock)			      \
-	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,  \
+					      width, clk_mux_flags, table) \
+	__devm_clk_hw_register_mux((dev), dev_ofnode(dev), (name), (num_parents), NULL,  \
 			      NULL, (parent_data), (flags), (reg), (shift),   \
-			      BIT((width)) - 1, (clk_mux_flags), table, (lock))
+			      BIT((width)) - 1, (clk_mux_flags), table, NULL)
 
 int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
 			 unsigned int val);
 unsigned int clk_mux_index_to_val(const u32 *table, unsigned int flags, u8 index);
 
 void clk_unregister_mux(struct clk *clk);
 void clk_hw_unregister_mux(struct clk_hw *hw);
 
-void of_fixed_factor_clk_setup(struct device_node *node);
+void of_fixed_factor_clk_setup(ofnode node);
 
 /**
  * struct clk_fixed_factor - fixed multiplier and divider clock
  *
@@ -1122,45 +1108,45 @@ struct clk_fixed_factor {
 
 #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor, hw)
 
 extern const struct clk_ops clk_fixed_factor_ops;
-struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
+struct clk *clk_register_fixed_factor(struct udevice *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_unregister_fixed_factor(struct clk *clk);
-struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
+struct clk_hw *clk_hw_register_fixed_factor(struct udevice *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
-struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *clk_hw_register_fixed_factor_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div);
-struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div,
 		unsigned long acc);
-struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
+struct clk_hw *clk_hw_register_fixed_factor_index(struct udevice *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
-struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct udevice *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
-struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div);
-struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
-		struct device_node *np, const char *name, const char *fw_name,
+struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct udevice *dev,
+		ofnode np, const char *name, const char *fw_name,
 		unsigned long flags, unsigned int mult, unsigned int div,
 		unsigned long acc);
-struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
+struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct udevice *dev,
 		const char *name, unsigned int index, unsigned long flags,
 		unsigned int mult, unsigned int div);
 
-struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct udevice *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div);
 
-struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct udevice *dev,
 		const char *name, const struct clk_hw *parent_hw,
 		unsigned long flags, unsigned int mult, unsigned int div);
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
@@ -1210,13 +1196,13 @@ struct clk_fractional_divider {
 #define CLK_FRAC_DIVIDER_ZERO_BASED		BIT(0)
 #define CLK_FRAC_DIVIDER_BIG_ENDIAN		BIT(1)
 #define CLK_FRAC_DIVIDER_POWER_OF_TWO_PS	BIT(2)
 
-struct clk *clk_register_fractional_divider(struct device *dev,
+struct clk *clk_register_fractional_divider(struct udevice *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 mshift, u8 mwidth, u8 nshift, u8 nwidth,
 		u8 clk_divider_flags, spinlock_t *lock);
-struct clk_hw *clk_hw_register_fractional_divider(struct device *dev,
+struct clk_hw *clk_hw_register_fractional_divider(struct udevice *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 mshift, u8 mwidth, u8 nshift, u8 nwidth,
 		u8 clk_divider_flags, spinlock_t *lock);
 void clk_hw_unregister_fractional_divider(struct clk_hw *hw);
@@ -1287,49 +1273,49 @@ struct clk_composite {
 };
 
 #define to_clk_composite(_hw) container_of(_hw, struct clk_composite, hw)
 
-struct clk *clk_register_composite(struct device *dev, const char *name,
+struct clk *clk_register_composite(struct udevice *dev, const char *name,
 		const char * const *parent_names, int num_parents,
 		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
 		unsigned long flags);
-struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
+struct clk *clk_register_composite_pdata(struct udevice *dev, const char *name,
 		const struct clk_parent_data *parent_data, int num_parents,
 		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
 		unsigned long flags);
 void clk_unregister_composite(struct clk *clk);
-struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
+struct clk_hw *clk_hw_register_composite(struct udevice *dev, const char *name,
 		const char * const *parent_names, int num_parents,
 		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
 		unsigned long flags);
-struct clk_hw *clk_hw_register_composite_pdata(struct device *dev,
+struct clk_hw *clk_hw_register_composite_pdata(struct udevice *dev,
 		const char *name,
 		const struct clk_parent_data *parent_data, int num_parents,
 		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
 		unsigned long flags);
-struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
+struct clk_hw *devm_clk_hw_register_composite_pdata(struct udevice *dev,
 		const char *name, const struct clk_parent_data *parent_data,
 		int num_parents,
 		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
 		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
 		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
 		unsigned long flags);
 void clk_hw_unregister_composite(struct clk_hw *hw);
 
-struct clk *clk_register(struct device *dev, struct clk_hw *hw);
-struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw);
+struct clk *clk_register(struct udevice *dev, struct clk_hw *hw);
+struct clk *devm_clk_register(struct udevice *dev, struct clk_hw *hw);
 
-int __must_check clk_hw_register(struct device *dev, struct clk_hw *hw);
-int __must_check devm_clk_hw_register(struct device *dev, struct clk_hw *hw);
-int __must_check of_clk_hw_register(struct device_node *node, struct clk_hw *hw);
+int __must_check clk_hw_register(struct udevice *dev, struct clk_hw *hw);
+int __must_check devm_clk_hw_register(struct udevice *dev, struct clk_hw *hw);
+int __must_check of_clk_hw_register(ofnode node, struct clk_hw *hw);
 
 void clk_unregister(struct clk *clk);
 
 void clk_hw_unregister(struct clk_hw *hw);
@@ -1339,19 +1325,19 @@ const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
 
 /**
  * clk_hw_get_dev() - get device from an hardware clock.
- * @hw: the clk_hw pointer to get the struct device from
+ * @hw: the clk_hw pointer to get the struct udevice from
  *
- * This is a helper to get the struct device associated with a hardware
+ * This is a helper to get the struct udevice associated with a hardware
  * clock. Some clock controllers, such as the one registered with
  * CLK_OF_DECLARE(), may have not provided a device pointer while
  * registering the clock.
  *
- * Return: the struct device associated with the clock, or NULL if there
+ * Return: the struct udevice associated with the clock, or NULL if there
  * is none.
  */
-struct device *clk_hw_get_dev(const struct clk_hw *hw);
+struct udevice *clk_hw_get_dev(const struct clk_hw *hw);
 
 /**
  * clk_hw_get_of_node() - get device_node from a hardware clock.
  * @hw: the clk_hw pointer to get the struct device_node from
@@ -1361,20 +1347,15 @@ struct device *clk_hw_get_dev(const struct clk_hw *hw);
  *
  * Return: the struct device_node associated with the clock, or NULL
  * if there is none.
  */
-struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
-#ifdef CONFIG_COMMON_CLK
+ofnode clk_hw_get_of_node(const struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
-#else
-static inline struct clk_hw *__clk_get_hw(struct clk *clk)
-{
-	return (struct clk_hw *)clk;
-}
-#endif
+
+void clk_put(struct clk *clk);
 
 struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id);
-struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
+struct clk *devm_clk_hw_get_clk(struct udevice *dev, struct clk_hw *hw,
 				const char *con_id);
 
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
@@ -1445,34 +1426,36 @@ struct clk_onecell_data {
 };
 
 struct clk_hw_onecell_data {
 	unsigned int num;
-	struct clk_hw *hws[] __counted_by(num);
+	struct clk_hw *hws[];
 };
 
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+int of_clk_add_provider(ofnode np,
+			struct clk *(*clk_src_get)(struct ofnode_phandle_args *args,
 						   void *data),
 			void *data);
-int of_clk_add_hw_provider(struct device_node *np,
-			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+int of_clk_add_hw_provider(ofnode np,
+			   struct clk_hw *(*get)(struct ofnode_phandle_args *clkspec,
 						 void *data),
 			   void *data);
-int devm_of_clk_add_hw_provider(struct device *dev,
-			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+int devm_of_clk_add_hw_provider(struct udevice *dev,
+			   struct clk_hw *(*get)(struct ofnode_phandle_args *clkspec,
 						 void *data),
 			   void *data);
-void of_clk_del_provider(struct device_node *np);
+void of_clk_del_provider(ofnode np);
 
-struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
+struct clk *of_clk_src_simple_get(struct ofnode_phandle_args *clkspec,
 				  void *data);
-struct clk_hw *of_clk_hw_simple_get(struct of_phandle_args *clkspec,
+struct clk_hw *of_clk_hw_simple_get(struct ofnode_phandle_args *clkspec,
 				    void *data);
-struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
-struct clk_hw *of_clk_hw_onecell_get(struct of_phandle_args *clkspec,
+struct clk *of_clk_src_onecell_get(struct ofnode_phandle_args *clkspec, void *data);
+struct clk_hw *of_clk_hw_onecell_get(struct ofnode_phandle_args *clkspec,
 				     void *data);
-int of_clk_parent_fill(struct device_node *np, const char **parents,
+int of_clk_parent_fill(ofnode np, const char **parents,
 		       unsigned int size);
-int of_clk_detect_critical(struct device_node *np, int index,
+int of_clk_detect_critical(ofnode np, int index,
 			    unsigned long *flags);
 
+struct clk_hw *of_clk_get_hw_from_clkspec(struct ofnode_phandle_args *clkspec);
+
 #endif /* __LINUX_CLK_PROVIDER_CCF_FULL_H */

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
