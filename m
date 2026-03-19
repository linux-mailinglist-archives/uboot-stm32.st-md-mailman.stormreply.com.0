Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLb0NcUXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE22F03FD
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 335ADC8F289;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92D4EC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso12858175e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953883; x=1774558683;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VOIa7PhqHHujOCa7QadNs8axpNpCZrE04tzAbsRAi2Y=;
 b=WPierT7n7U6qttXDeqYbQTPOcwM0iCaKVpSD/rJUCkpeROwLmWpUESWpt2Vk5mNL8w
 dqPfjfBcKrfbTPtyHuMsrhBbjKT8l3PlSmOQGUvoV6YDybvhI7b7CFkk2refEvUXP+Y3
 PeAsF9Yy78JqOEFMyPbksTV4lYUGiejk3jSCwIuxFe7ChNrM9lZznqGYwFVvevRJRyj6
 8YIRqEh6zXLfXQS6ZKTAnjbKkVcDV/S3bK5uhuHFJo+keXIqrknIKhuTnUyz6YeKwSEq
 jtjXxhH8dgCBhbRo2+s8tf7bKNrYJ9O6p1R4LOBzwdTWJjUyQs/s580epj00MW5WIV+f
 V9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953883; x=1774558683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VOIa7PhqHHujOCa7QadNs8axpNpCZrE04tzAbsRAi2Y=;
 b=PntXKHzThvA9QYftMiseumskFidVos721+ex0eMMp6jTr87szl71Sa7jJMHlKhlWzF
 Oi9TKC1ri8xNTOCFviPoRiWsPefHAYkScPX+S8B+hrIDFGZwvf8zQ1lJFuKXqcOtYeSc
 NqlYBRs1NTQAiABGBx+nXTwKevznV67G+16sSAuqim/fvJ7K4eUcGZvdtNnhRCc5D3uI
 HKC5PCBGgYs/ba1TOBh3NOOBSfA6oMAWWccT6NxHxDKQIzVQ9SxFo48yZOhhVOZUv1Cc
 lXngLzDsl4SGy/C5kIKUlmz2GynO6ecM9Aa2fCQGnXK88aL7WJ+ZpltU0H5asq6dxRJi
 bx3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeJkkeS0XcS/BOy0gID6u5UaafPEoDHlTmf6nPja5egx8HMBB2mCdBbKFF+b7U0UGDc8bgDELJzMV5FA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygFukmVe5nQQBi1s3DGr1US5cQ+1hfItHkv21Oyopq1PTuCjeF
 aUG7TrVdBEzqu2VBpzBjxgS/6+84oMkHDSHBHSKbCxS7oRXFDFdD0M97yb6E6xDvL1E=
X-Gm-Gg: ATEYQzwWR/9KDoSeQxzYvQn3dMi3Jfct9/j6icMyaCv7P37y8tbzpi/QvXlUtdOufn2
 2S7U4ceBafVqnYIdFhQ3T6PJcxL2kF14gatp4dD75RVcB9RnEHUAX8ou4ubnMpOGc10ZpFmO5QW
 TOYmd5+OMNjtrloo9bFFyus6Du19ofw4aZGYuV4cfkhqJ7KxVHOmCfgK588b/HRe1o3VXfNXk4x
 HAnp3KDBaaAQhZKQcFzXhsQN8+8IwMfuP0e5e78CDw2ZhA38ZSAe2rW4hBX3jMuyQQLzgOuE6NV
 HXu0ylhBQ5zWYzOQbmYyGUbDrisfUWVtXGS3lEocFWX0QoNxmjBJegYKaEOdcIl5uxxm9BqOyIb
 MvPSHtXrMT5pcG9SAYGum8+P/CPzxC5GuhC3gTxipACWYhDqaNwqUJOcFrvmBpHoVIqWsV9EXI5
 q41FWx+APK1vlmws0fSj49I4/34bxV5uoMFi8FPm4S5CP5JgQ2AhX7p3j6wzoikJymmm16y+KlK
 nzBZA==
X-Received: by 2002:a05:600c:4714:b0:485:3bc7:a231 with SMTP id
 5b1f17b1804b1-486ff01f1d0mr8324415e9.29.1773953882081; 
 Thu, 19 Mar 2026 13:58:02 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:01 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:39 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-17-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=129058;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=w/i3Dgl9enEsRv6+wLJ7FjaMxbF8tmgDMb4AmmiO8sc=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yfzS5h3d8yptAmLSUkI836heWuz33r+tykG8uvrU5
 j1Fy2I7SlkYBDkYZMUUWcRPLLNsWnvZXmP7ggswc1iZQIYwcHEKwEQqExn+8LtGLO+UffVrqUHq
 7but7ew672zOmmw6fOZX5TrlC7NjcxkZ1lx5t3rirNS3jX3LPyz8NVuBpercc80C02KZ6a5igqv
 KlwAA
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
Subject: [Uboot-stm32] [PATCH RFC 17/40] clk: rename clk_ops to clk_ops_uboot
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6DDE22F03FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation for supporting full CCF, rename U-Boot's clk_ops
to clk_ops_uboot, these ops are specific to UCLASS_CLK and are too
incompatible with full CCF.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 arch/arm/cpu/armv7/bcm281xx/clk-core.c        |  8 ++++----
 arch/arm/cpu/armv7/bcm281xx/clk-core.h        | 14 +++++++-------
 cmd/clk.c                                     |  2 +-
 drivers/clk/adi/clk-adi-pll.c                 |  2 +-
 drivers/clk/adi/clk-shared.c                  |  2 +-
 drivers/clk/adi/clk.h                         |  2 +-
 drivers/clk/airoha/clk-airoha.c               |  2 +-
 drivers/clk/altera/clk-agilex.c               |  2 +-
 drivers/clk/altera/clk-agilex5.c              |  2 +-
 drivers/clk/altera/clk-arria10.c              |  2 +-
 drivers/clk/altera/clk-mem-n5x.c              |  2 +-
 drivers/clk/altera/clk-n5x.c                  |  2 +-
 drivers/clk/aspeed/clk_ast2500.c              |  2 +-
 drivers/clk/aspeed/clk_ast2600.c              |  2 +-
 drivers/clk/at91/clk-generic.c                |  2 +-
 drivers/clk/at91/clk-main.c                   |  8 ++++----
 drivers/clk/at91/clk-master.c                 |  6 +++---
 drivers/clk/at91/clk-peripheral.c             |  4 ++--
 drivers/clk/at91/clk-programmable.c           |  2 +-
 drivers/clk/at91/clk-sam9x60-pll.c            |  6 +++---
 drivers/clk/at91/clk-sam9x60-usb.c            |  2 +-
 drivers/clk/at91/clk-system.c                 |  2 +-
 drivers/clk/at91/clk-utmi.c                   |  4 ++--
 drivers/clk/at91/compat.c                     | 22 +++++++++++-----------
 drivers/clk/at91/pmc.c                        |  2 +-
 drivers/clk/at91/pmc.h                        |  2 +-
 drivers/clk/at91/sckc.c                       |  4 ++--
 drivers/clk/clk-cdce9xx.c                     |  2 +-
 drivers/clk/clk-gpio.c                        |  2 +-
 drivers/clk/clk-hsdk-cgu.c                    |  2 +-
 drivers/clk/clk-stub.c                        |  2 +-
 drivers/clk/clk-uclass.c                      | 22 +++++++++++-----------
 drivers/clk/clk-xlnx-clock-wizard.c           |  2 +-
 drivers/clk/clk_bcm6345.c                     |  2 +-
 drivers/clk/clk_boston.c                      |  2 +-
 drivers/clk/clk_fixed_factor.c                |  2 +-
 drivers/clk/clk_fixed_rate.c                  |  4 ++--
 drivers/clk/clk_k210.c                        |  2 +-
 drivers/clk/clk_octeon.c                      |  2 +-
 drivers/clk/clk_pic32.c                       |  2 +-
 drivers/clk/clk_sandbox.c                     |  2 +-
 drivers/clk/clk_scmi.c                        |  2 +-
 drivers/clk/clk_versaclock.c                  | 14 +++++++-------
 drivers/clk/clk_versal.c                      |  2 +-
 drivers/clk/clk_vexpress_osc.c                |  2 +-
 drivers/clk/clk_zynq.c                        |  2 +-
 drivers/clk/clk_zynqmp.c                      |  2 +-
 drivers/clk/exynos/clk-exynos7420.c           |  6 +++---
 drivers/clk/exynos/clk-pll.c                  |  4 ++--
 drivers/clk/exynos/clk.h                      |  2 +-
 drivers/clk/ics8n3qv01.c                      |  2 +-
 drivers/clk/imx/clk-composite-8m.c            |  4 ++--
 drivers/clk/imx/clk-composite-93.c            |  2 +-
 drivers/clk/imx/clk-fracn-gppll.c             |  2 +-
 drivers/clk/imx/clk-gate-93.c                 |  2 +-
 drivers/clk/imx/clk-gate2.c                   |  2 +-
 drivers/clk/imx/clk-imx6q.c                   |  2 +-
 drivers/clk/imx/clk-imx6ul.c                  |  2 +-
 drivers/clk/imx/clk-imx8.c                    |  2 +-
 drivers/clk/imx/clk-imxrt1020.c               |  2 +-
 drivers/clk/imx/clk-imxrt1170.c               |  2 +-
 drivers/clk/imx/clk-pfd.c                     |  2 +-
 drivers/clk/imx/clk-pll14xx.c                 |  4 ++--
 drivers/clk/imx/clk-pllv3.c                   | 10 +++++-----
 drivers/clk/intel/clk_intel.c                 |  2 +-
 drivers/clk/mediatek/clk-mtk.c                | 12 ++++++------
 drivers/clk/mediatek/clk-mtk.h                | 10 +++++-----
 drivers/clk/meson/a1.c                        |  2 +-
 drivers/clk/meson/axg-ao.c                    |  2 +-
 drivers/clk/meson/axg.c                       |  2 +-
 drivers/clk/meson/clk-measure.c               |  2 +-
 drivers/clk/meson/g12a-ao.c                   |  2 +-
 drivers/clk/meson/g12a.c                      |  2 +-
 drivers/clk/meson/gxbb.c                      |  2 +-
 drivers/clk/microchip/mpfs_clk_cfg.c          |  2 +-
 drivers/clk/microchip/mpfs_clk_msspll.c       |  2 +-
 drivers/clk/microchip/mpfs_clk_periph.c       |  2 +-
 drivers/clk/mpc83xx_clk.c                     |  2 +-
 drivers/clk/mtmips/clk-mt7620.c               |  2 +-
 drivers/clk/mtmips/clk-mt7621.c               |  2 +-
 drivers/clk/mtmips/clk-mt7628.c               |  2 +-
 drivers/clk/mvebu/armada-37xx-periph.c        |  2 +-
 drivers/clk/mvebu/armada-37xx-tbg.c           |  2 +-
 drivers/clk/nuvoton/clk_npcm.c                |  2 +-
 drivers/clk/nuvoton/clk_npcm.h                |  2 +-
 drivers/clk/owl/clk_owl.c                     |  2 +-
 drivers/clk/qcom/clock-qcom.c                 |  2 +-
 drivers/clk/qcom/clock-sm8550.c               |  2 +-
 drivers/clk/qcom/clock-sm8650.c               |  2 +-
 drivers/clk/qcom/clock-x1e80100.c             |  2 +-
 drivers/clk/renesas/clk-rcar-gen2.c           |  2 +-
 drivers/clk/renesas/clk-rcar-gen3.c           |  2 +-
 drivers/clk/renesas/compound-clock.c          |  2 +-
 drivers/clk/renesas/r9a06g032-clocks.c        |  2 +-
 drivers/clk/renesas/rcar-gen2-cpg.h           |  2 +-
 drivers/clk/renesas/rcar-gen3-cpg.h           |  2 +-
 drivers/clk/renesas/rzg2l-cpg.c               |  2 +-
 drivers/clk/rockchip/clk_px30.c               |  4 ++--
 drivers/clk/rockchip/clk_rk3036.c             |  2 +-
 drivers/clk/rockchip/clk_rk3066.c             |  2 +-
 drivers/clk/rockchip/clk_rk3128.c             |  2 +-
 drivers/clk/rockchip/clk_rk3188.c             |  2 +-
 drivers/clk/rockchip/clk_rk322x.c             |  2 +-
 drivers/clk/rockchip/clk_rk3288.c             |  2 +-
 drivers/clk/rockchip/clk_rk3308.c             |  2 +-
 drivers/clk/rockchip/clk_rk3328.c             |  2 +-
 drivers/clk/rockchip/clk_rk3368.c             |  2 +-
 drivers/clk/rockchip/clk_rk3399.c             |  4 ++--
 drivers/clk/rockchip/clk_rk3528.c             |  2 +-
 drivers/clk/rockchip/clk_rk3568.c             |  4 ++--
 drivers/clk/rockchip/clk_rk3576.c             |  2 +-
 drivers/clk/rockchip/clk_rk3588.c             |  4 ++--
 drivers/clk/rockchip/clk_rv1108.c             |  2 +-
 drivers/clk/rockchip/clk_rv1126.c             |  4 ++--
 drivers/clk/sifive/sifive-prci.c              |  2 +-
 drivers/clk/sophgo/clk-cv1800b.c              |  2 +-
 drivers/clk/sophgo/clk-ip.c                   | 18 +++++++++---------
 drivers/clk/sophgo/clk-ip.h                   | 18 +++++++++---------
 drivers/clk/sophgo/clk-pll.c                  |  4 ++--
 drivers/clk/sophgo/clk-pll.h                  |  4 ++--
 drivers/clk/starfive/clk-jh7110-pll.c         |  2 +-
 drivers/clk/starfive/clk.h                    |  2 +-
 drivers/clk/stm32/clk-stm32-core.c            | 20 ++++++++++----------
 drivers/clk/stm32/clk-stm32-core.h            |  2 +-
 drivers/clk/stm32/clk-stm32f.c                |  2 +-
 drivers/clk/stm32/clk-stm32h7.c               |  2 +-
 drivers/clk/stm32/clk-stm32mp1.c              |  2 +-
 drivers/clk/sunxi/clk_sun6i_rtc.c             |  2 +-
 drivers/clk/sunxi/clk_sunxi.c                 |  2 +-
 drivers/clk/tegra/tegra-car-clk.c             |  2 +-
 drivers/clk/tegra/tegra186-clk.c              |  2 +-
 drivers/clk/thead/clk-th1520-ap.c             |  6 +++---
 drivers/clk/ti/clk-am3-dpll-x2.c              |  2 +-
 drivers/clk/ti/clk-am3-dpll.c                 |  2 +-
 drivers/clk/ti/clk-ctrl.c                     |  2 +-
 drivers/clk/ti/clk-divider.c                  |  2 +-
 drivers/clk/ti/clk-gate.c                     |  2 +-
 drivers/clk/ti/clk-k3-pll.c                   |  2 +-
 drivers/clk/ti/clk-k3.c                       |  4 ++--
 drivers/clk/ti/clk-mux.c                      |  2 +-
 drivers/clk/ti/clk-sci.c                      |  2 +-
 drivers/clk/uccf/clk-composite.c              | 18 +++++++++---------
 drivers/clk/uccf/clk-divider.c                |  2 +-
 drivers/clk/uccf/clk-fixed-factor.c           |  2 +-
 drivers/clk/uccf/clk-gate.c                   |  2 +-
 drivers/clk/uccf/clk-mux.c                    |  2 +-
 drivers/clk/uccf/clk.c                        |  2 +-
 drivers/clk/uccf/clk_sandbox_uccf.c           |  6 +++---
 drivers/clk/uniphier/clk-uniphier-core.c      |  2 +-
 drivers/phy/cadence/phy-cadence-sierra.c      |  2 +-
 drivers/phy/cadence/phy-cadence-torrent.c     |  2 +-
 drivers/phy/phy-stm32-usbphyc.c               |  2 +-
 drivers/phy/phy-ti-am654.c                    |  2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c |  2 +-
 drivers/phy/ti/phy-j721e-wiz.c                |  6 +++---
 drivers/power/domain/imx8mp-hsiomix.c         |  2 +-
 include/clk-uclass.h                          |  4 ++--
 include/clk/sunxi.h                           |  2 +-
 include/linux/clk-provider.h                  | 24 ++++++++++++------------
 159 files changed, 282 insertions(+), 282 deletions(-)

diff --git a/arch/arm/cpu/armv7/bcm281xx/clk-core.c b/arch/arm/cpu/armv7/bcm281xx/clk-core.c
index 71b3a9277b17..6d82fe603dd2 100644
--- a/arch/arm/cpu/armv7/bcm281xx/clk-core.c
+++ b/arch/arm/cpu/armv7/bcm281xx/clk-core.c
@@ -245,9 +245,9 @@ static unsigned long peri_clk_get_rate(struct clk *c)
 	return c->rate;
 }
 
 /* Peripheral clock operations */
-struct clk_ops peri_clk_ops = {
+struct clk_ops_uboot peri_clk_ops = {
 	.enable = peri_clk_enable,
 	.set_rate = peri_clk_set_rate,
 	.get_rate = peri_clk_get_rate,
 };
@@ -324,9 +324,9 @@ static unsigned long ccu_clk_get_rate(struct clk *c)
 	return c->rate;
 }
 
 /* CCU clock operations */
-struct clk_ops ccu_clk_ops = {
+struct clk_ops_uboot ccu_clk_ops = {
 	.enable = ccu_clk_enable,
 	.get_rate = ccu_clk_get_rate,
 };
 
@@ -384,9 +384,9 @@ static unsigned long bus_clk_get_rate(struct clk *c)
 	return c->rate;
 }
 
 /* Bus clock operations */
-struct clk_ops bus_clk_ops = {
+struct clk_ops_uboot bus_clk_ops = {
 	.enable = bus_clk_enable,
 	.get_rate = bus_clk_get_rate,
 };
 
@@ -397,9 +397,9 @@ static int ref_clk_enable(struct clk *c, int enable)
 	return 0;
 }
 
 /* Reference clock operations */
-struct clk_ops ref_clk_ops = {
+struct clk_ops_uboot ref_clk_ops = {
 	.enable = ref_clk_enable,
 };
 
 /*
diff --git a/arch/arm/cpu/armv7/bcm281xx/clk-core.h b/arch/arm/cpu/armv7/bcm281xx/clk-core.h
index f0fbff081d02..0a583bf495a4 100644
--- a/arch/arm/cpu/armv7/bcm281xx/clk-core.h
+++ b/arch/arm/cpu/armv7/bcm281xx/clk-core.h
@@ -34,9 +34,9 @@ struct clk_lookup {
 extern struct clk_lookup arch_clk_tbl[];
 extern unsigned int arch_clk_tbl_array_size;
 
 /**
- * struct clk_ops - standard clock operations
+ * struct clk_ops_uboot - standard clock operations
  * @enable: enable/disable clock, see clk_enable() and clk_disable()
  * @set_rate: set the clock rate, see clk_set_rate().
  * @get_rate: get the clock rate, see clk_get_rate().
  * @round_rate: round a given clock rate, see clk_round_rate().
@@ -46,9 +46,9 @@ extern unsigned int arch_clk_tbl_array_size;
  * don't have to keep setting the same fiels again. We leave
  * enable in struct clk.
  *
  */
-struct clk_ops {
+struct clk_ops_uboot {
 	int (*enable) (struct clk *c, int enable);
 	int (*set_rate) (struct clk *c, unsigned long rate);
 	unsigned long (*get_rate) (struct clk *c);
 	unsigned long (*round_rate) (struct clk *c, unsigned long rate);
@@ -64,9 +64,9 @@ struct clk {
 	/* programmable divider. 0 means fixed ratio to parent clock */
 	unsigned long div;
 
 	struct clk_src *src;
-	struct clk_ops *ops;
+	struct clk_ops_uboot *ops;
 
 	unsigned long ccu_clk_mgr_base;
 	int sel;
 };
@@ -482,10 +482,10 @@ static inline struct ref_clock *to_ref_clk(struct clk *clock)
 {
 	return container_of(clock, struct ref_clock, clk);
 }
 
-extern struct clk_ops peri_clk_ops;
-extern struct clk_ops ccu_clk_ops;
-extern struct clk_ops bus_clk_ops;
-extern struct clk_ops ref_clk_ops;
+extern struct clk_ops_uboot peri_clk_ops;
+extern struct clk_ops_uboot ccu_clk_ops;
+extern struct clk_ops_uboot bus_clk_ops;
+extern struct clk_ops_uboot ref_clk_ops;
 
 extern int clk_get_and_enable(char *clkstr);
diff --git a/cmd/clk.c b/cmd/clk.c
index 2fc834e5549c..1210a84ca2aa 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -57,9 +57,9 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 
 static int soc_clk_dump(void)
 {
 	struct udevice *dev;
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 
 	printf(" Rate               Usecnt      Name\n");
 	printf("------------------------------------------\n");
 
diff --git a/drivers/clk/adi/clk-adi-pll.c b/drivers/clk/adi/clk-adi-pll.c
index 34818cb1af00..44fc8842e758 100644
--- a/drivers/clk/adi/clk-adi-pll.c
+++ b/drivers/clk/adi/clk-adi-pll.c
@@ -48,9 +48,9 @@ static unsigned long sc5xx_cgu_pll_get_rate(struct clk *clk)
 		return parent_rate * m * 2;
 	return parent_rate * m;
 }
 
-static const struct clk_ops clk_sc5xx_cgu_pll_ops = {
+static const struct clk_ops_uboot clk_sc5xx_cgu_pll_ops = {
 	.get_rate = sc5xx_cgu_pll_get_rate,
 };
 
 struct clk *sc5xx_cgu_pll(const char *name, const char *parent_name,
diff --git a/drivers/clk/adi/clk-shared.c b/drivers/clk/adi/clk-shared.c
index afd5f46c8456..5d0b7eb34655 100644
--- a/drivers/clk/adi/clk-shared.c
+++ b/drivers/clk/adi/clk-shared.c
@@ -38,9 +38,9 @@ static int adi_disable(struct clk *clk)
 	//Not yet implemented
 	return 0;
 }
 
-const struct clk_ops adi_clk_ops = {
+const struct clk_ops_uboot adi_clk_ops = {
 	.set_rate = adi_set_rate,
 	.get_rate = adi_get_rate,
 	.enable = adi_enable,
 	.disable = adi_disable,
diff --git a/drivers/clk/adi/clk.h b/drivers/clk/adi/clk.h
index acd4e384746c..01e600b76a30 100644
--- a/drivers/clk/adi/clk.h
+++ b/drivers/clk/adi/clk.h
@@ -64,9 +64,9 @@
 #define CDU_MUX_SHIFT 1
 #define CDU_MUX_WIDTH 2
 #define CDU_EN_BIT 0
 
-extern const struct clk_ops adi_clk_ops;
+extern const struct clk_ops_uboot adi_clk_ops;
 
 struct clk *sc5xx_cgu_pll(const char *name, const char *parent_name,
 			  void __iomem *base, u8 shift, u8 width, u32 m_offset, bool half_m);
 
diff --git a/drivers/clk/airoha/clk-airoha.c b/drivers/clk/airoha/clk-airoha.c
index 49dbca821355..200324a4fffd 100644
--- a/drivers/clk/airoha/clk-airoha.c
+++ b/drivers/clk/airoha/clk-airoha.c
@@ -496,9 +496,9 @@ apply:
 
 	return rate;
 }
 
-const struct clk_ops airoha_clk_ops = {
+const struct clk_ops_uboot airoha_clk_ops = {
 	.enable = airoha_clk_enable,
 	.disable = airoha_clk_disable,
 	.get_rate = airoha_clk_get_rate,
 	.set_rate = airoha_clk_set_rate,
diff --git a/drivers/clk/altera/clk-agilex.c b/drivers/clk/altera/clk-agilex.c
index fdbf834bb2f6..beb428dd548e 100644
--- a/drivers/clk/altera/clk-agilex.c
+++ b/drivers/clk/altera/clk-agilex.c
@@ -786,9 +786,9 @@ static int socfpga_clk_of_to_plat(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops socfpga_clk_ops = {
+static struct clk_ops_uboot socfpga_clk_ops = {
 	.enable		= socfpga_clk_enable,
 	.disable	= socfpga_clk_disable,
 	.get_rate	= socfpga_clk_get_rate,
 };
diff --git a/drivers/clk/altera/clk-agilex5.c b/drivers/clk/altera/clk-agilex5.c
index fb1e72ffc5cd..2278a4a77809 100644
--- a/drivers/clk/altera/clk-agilex5.c
+++ b/drivers/clk/altera/clk-agilex5.c
@@ -735,9 +735,9 @@ static int socfpga_clk_of_to_plat(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops socfpga_clk_ops = {
+static struct clk_ops_uboot socfpga_clk_ops = {
 	.enable		= socfpga_clk_enable,
 	.get_rate	= socfpga_clk_get_rate,
 };
 
diff --git a/drivers/clk/altera/clk-arria10.c b/drivers/clk/altera/clk-arria10.c
index 1840f73beeec..f1ee995670cb 100644
--- a/drivers/clk/altera/clk-arria10.c
+++ b/drivers/clk/altera/clk-arria10.c
@@ -169,9 +169,9 @@ static ulong socfpga_a10_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static struct clk_ops socfpga_a10_clk_ops = {
+static struct clk_ops_uboot socfpga_a10_clk_ops = {
 	.enable		= socfpga_a10_clk_enable,
 	.disable	= socfpga_a10_clk_disable,
 	.get_rate	= socfpga_a10_clk_get_rate,
 };
diff --git a/drivers/clk/altera/clk-mem-n5x.c b/drivers/clk/altera/clk-mem-n5x.c
index b75f52d203b2..372635bab569 100644
--- a/drivers/clk/altera/clk-mem-n5x.c
+++ b/drivers/clk/altera/clk-mem-n5x.c
@@ -115,9 +115,9 @@ static int socfpga_mem_clk_of_to_plat(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops socfpga_mem_clk_ops = {
+static struct clk_ops_uboot socfpga_mem_clk_ops = {
 	.enable		= socfpga_mem_clk_enable
 };
 
 static const struct udevice_id socfpga_mem_clk_match[] = {
diff --git a/drivers/clk/altera/clk-n5x.c b/drivers/clk/altera/clk-n5x.c
index 9e4e7a1d9087..a1c7b0b53d19 100644
--- a/drivers/clk/altera/clk-n5x.c
+++ b/drivers/clk/altera/clk-n5x.c
@@ -466,9 +466,9 @@ static int socfpga_clk_of_to_plat(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops socfpga_clk_ops = {
+static struct clk_ops_uboot socfpga_clk_ops = {
 	.enable		= socfpga_clk_enable,
 	.get_rate	= socfpga_clk_get_rate,
 };
 
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index a330dcda4dcb..4d30ecb87d99 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -533,9 +533,9 @@ static int ast2500_clk_enable(struct clk *clk)
 
 	return 0;
 }
 
-struct clk_ops ast2500_clk_ops = {
+struct clk_ops_uboot ast2500_clk_ops = {
 	.get_rate = ast2500_clk_get_rate,
 	.set_rate = ast2500_clk_set_rate,
 	.enable = ast2500_clk_enable,
 };
diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index 535010b79414..b9bbe41a592f 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -1160,9 +1160,9 @@ static void ast2600_clk_dump(struct udevice *dev)
 	return 0;
 }
 #endif
 
-struct clk_ops ast2600_clk_ops = {
+struct clk_ops_uboot ast2600_clk_ops = {
 	.get_rate = ast2600_clk_get_rate,
 	.set_rate = ast2600_clk_set_rate,
 	.enable = ast2600_clk_enable,
 #if IS_ENABLED(CONFIG_CMD_CLK)
diff --git a/drivers/clk/at91/clk-generic.c b/drivers/clk/at91/clk-generic.c
index c410cd2b5052..0424fb1b6f4e 100644
--- a/drivers/clk/at91/clk-generic.c
+++ b/drivers/clk/at91/clk-generic.c
@@ -128,9 +128,9 @@ static ulong clk_gck_get_rate(struct clk *clk)
 
 	return parent_rate / (div + 1);
 }
 
-static const struct clk_ops gck_ops = {
+static const struct clk_ops_uboot gck_ops = {
 	.enable = clk_gck_enable,
 	.disable = clk_gck_disable,
 	.set_parent = clk_gck_set_parent,
 	.set_rate = clk_gck_set_rate,
diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 0542b0667883..5b802cdbdaba 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -96,9 +96,9 @@ static int main_rc_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops main_rc_clk_ops = {
+static const struct clk_ops_uboot main_rc_clk_ops = {
 	.enable = main_rc_enable,
 	.disable = main_rc_disable,
 	.get_rate = clk_generic_get_rate,
 };
@@ -182,9 +182,9 @@ static int clk_main_osc_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops main_osc_clk_ops = {
+static const struct clk_ops_uboot main_osc_clk_ops = {
 	.enable = clk_main_osc_enable,
 	.disable = clk_main_osc_disable,
 	.get_rate = clk_generic_get_rate,
 };
@@ -250,9 +250,9 @@ static int clk_rm9200_main_enable(struct clk *clk)
 
 	return clk_main_probe_frequency(main->reg);
 }
 
-static const struct clk_ops rm9200_main_clk_ops = {
+static const struct clk_ops_uboot rm9200_main_clk_ops = {
 	.enable = clk_rm9200_main_enable,
 };
 
 struct clk *at91_clk_rm9200_main(void __iomem *reg, const char *name,
@@ -337,9 +337,9 @@ static int clk_sam9x5_main_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-static const struct clk_ops sam9x5_main_clk_ops = {
+static const struct clk_ops_uboot sam9x5_main_clk_ops = {
 	.enable = clk_sam9x5_main_enable,
 	.set_parent = clk_sam9x5_main_set_parent,
 	.get_rate = clk_generic_get_rate,
 };
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 530205b8c6be..53652efc5740 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -99,9 +99,9 @@ static ulong clk_master_pres_get_rate(struct clk *clk)
 
 	return DIV_ROUND_CLOSEST_ULL(rate, pres);
 }
 
-static const struct clk_ops master_pres_ops = {
+static const struct clk_ops_uboot master_pres_ops = {
 	.enable = clk_master_enable,
 	.get_rate = clk_master_pres_get_rate,
 };
 
@@ -175,9 +175,9 @@ static ulong clk_master_div_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static const struct clk_ops master_div_ops = {
+static const struct clk_ops_uboot master_div_ops = {
 	.enable = clk_master_enable,
 	.get_rate = clk_master_div_get_rate,
 };
 
@@ -319,9 +319,9 @@ static ulong clk_sama7g5_master_get_rate(struct clk *clk)
 
 	return DIV_ROUND_CLOSEST(parent_rate, div);
 }
 
-static const struct clk_ops sama7g5_master_ops = {
+static const struct clk_ops_uboot sama7g5_master_ops = {
 	.enable = clk_sama7g5_master_enable,
 	.disable = clk_sama7g5_master_disable,
 	.set_rate = clk_sama7g5_master_set_rate,
 	.get_rate = clk_sama7g5_master_get_rate,
diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index 08d7e7dddc9e..8f0c7524e4cc 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -76,9 +76,9 @@ static int clk_peripheral_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops peripheral_ops = {
+static const struct clk_ops_uboot peripheral_ops = {
 	.enable = clk_peripheral_enable,
 	.disable = clk_peripheral_disable,
 	.get_rate = clk_generic_get_rate,
 };
@@ -203,9 +203,9 @@ static ulong clk_sam9x5_peripheral_set_rate(struct clk *clk, ulong rate)
 
 	return parent_rate >> shift;
 }
 
-static const struct clk_ops sam9x5_peripheral_ops = {
+static const struct clk_ops_uboot sam9x5_peripheral_ops = {
 	.enable = clk_sam9x5_peripheral_enable,
 	.disable = clk_sam9x5_peripheral_disable,
 	.get_rate = clk_sam9x5_peripheral_get_rate,
 	.set_rate = clk_sam9x5_peripheral_set_rate,
diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index d0b14656c4d6..9cf8e38af08c 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -119,9 +119,9 @@ static ulong clk_programmable_set_rate(struct clk *clk, ulong rate)
 
 	return parent_rate >> shift;
 }
 
-static const struct clk_ops programmable_ops = {
+static const struct clk_ops_uboot programmable_ops = {
 	.get_rate = clk_programmable_get_rate,
 	.set_parent = clk_programmable_set_parent,
 	.set_rate = clk_programmable_set_rate,
 };
diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index 66f014727390..b896be5fe238 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -244,9 +244,9 @@ static int sam9x60_frac_pll_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops sam9x60_frac_pll_ops = {
+static const struct clk_ops_uboot sam9x60_frac_pll_ops = {
 	.enable = sam9x60_frac_pll_enable,
 	.disable = sam9x60_frac_pll_disable,
 	.set_rate = sam9x60_frac_pll_set_rate,
 	.get_rate = sam9x60_frac_pll_get_rate,
@@ -371,16 +371,16 @@ static ulong sam9x60_fixed_div_pll_get_rate(struct clk *clk)
 
 	return parent_rate >> 1;
 }
 
-static const struct clk_ops sam9x60_div_pll_ops = {
+static const struct clk_ops_uboot sam9x60_div_pll_ops = {
 	.enable = sam9x60_div_pll_enable,
 	.disable = sam9x60_div_pll_disable,
 	.set_rate = sam9x60_div_pll_set_rate,
 	.get_rate = sam9x60_div_pll_get_rate,
 };
 
-static const struct clk_ops sam9x60_fixed_div_pll_ops = {
+static const struct clk_ops_uboot sam9x60_fixed_div_pll_ops = {
 	.enable = sam9x60_div_pll_enable,
 	.disable = sam9x60_div_pll_disable,
 	.get_rate = sam9x60_fixed_div_pll_get_rate,
 };
diff --git a/drivers/clk/at91/clk-sam9x60-usb.c b/drivers/clk/at91/clk-sam9x60-usb.c
index 798fa9eb3cca..92bfd45f5353 100644
--- a/drivers/clk/at91/clk-sam9x60-usb.c
+++ b/drivers/clk/at91/clk-sam9x60-usb.c
@@ -88,9 +88,9 @@ static ulong sam9x60_usb_clk_set_rate(struct clk *clk, ulong rate)
 
 	return parent_rate / usbdiv;
 }
 
-static const struct clk_ops sam9x60_usb_ops = {
+static const struct clk_ops_uboot sam9x60_usb_ops = {
 	.set_parent = sam9x60_usb_clk_set_parent,
 	.set_rate = sam9x60_usb_clk_set_rate,
 	.get_rate = sam9x60_usb_clk_get_rate,
 };
diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index 3545b0b24bd7..faa3ddba5d57 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -68,9 +68,9 @@ static int clk_system_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops system_ops = {
+static const struct clk_ops_uboot system_ops = {
 	.enable = clk_system_enable,
 	.disable = clk_system_disable,
 	.get_rate = clk_generic_get_rate,
 };
diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index 84784ae41ce8..db3d7d69f2cf 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -112,9 +112,9 @@ static ulong clk_utmi_get_rate(struct clk *clk)
 	/* UTMI clk rate is fixed. */
 	return UTMI_RATE;
 }
 
-static const struct clk_ops utmi_ops = {
+static const struct clk_ops_uboot utmi_ops = {
 	.enable = clk_utmi_enable,
 	.disable = clk_utmi_disable,
 	.get_rate = clk_utmi_get_rate,
 };
@@ -192,9 +192,9 @@ static int clk_utmi_sama7g5_enable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops sama7g5_utmi_ops = {
+static const struct clk_ops_uboot sama7g5_utmi_ops = {
 	.enable = clk_utmi_sama7g5_enable,
 	.get_rate = clk_utmi_get_rate,
 };
 
diff --git a/drivers/clk/at91/compat.c b/drivers/clk/at91/compat.c
index 1d738f160b6e..5099fe3b8c62 100644
--- a/drivers/clk/at91/compat.c
+++ b/drivers/clk/at91/compat.c
@@ -152,9 +152,9 @@ static ulong at91_slow_clk_get_rate(struct clk *clk)
 {
 	return CFG_SYS_AT91_SLOW_CLOCK;
 }
 
-static struct clk_ops at91_slow_clk_ops = {
+static struct clk_ops_uboot at91_slow_clk_ops = {
 	.enable = at91_slow_clk_enable,
 	.get_rate = at91_slow_clk_get_rate,
 };
 
@@ -175,9 +175,9 @@ static ulong at91_master_clk_get_rate(struct clk *clk)
 {
 	return gd->arch.mck_rate_hz;
 }
 
-static struct clk_ops at91_master_clk_ops = {
+static struct clk_ops_uboot at91_master_clk_ops = {
 	.get_rate = at91_master_clk_get_rate,
 };
 
 static const struct udevice_id at91_master_clk_match[] = {
@@ -209,9 +209,9 @@ static ulong main_osc_clk_get_rate(struct clk *clk)
 {
 	return gd->arch.main_clk_rate_hz;
 }
 
-static struct clk_ops main_osc_clk_ops = {
+static struct clk_ops_uboot main_osc_clk_ops = {
 	.enable = main_osc_clk_enable,
 	.get_rate = main_osc_clk_get_rate,
 };
 
@@ -250,9 +250,9 @@ static ulong plla_clk_get_rate(struct clk *clk)
 {
 	return gd->arch.plla_rate_hz;
 }
 
-static struct clk_ops plla_clk_ops = {
+static struct clk_ops_uboot plla_clk_ops = {
 	.enable = plla_clk_enable,
 	.get_rate = plla_clk_get_rate,
 };
 
@@ -323,9 +323,9 @@ static ulong at91_plladiv_clk_set_rate(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static struct clk_ops at91_plladiv_clk_ops = {
+static struct clk_ops_uboot at91_plladiv_clk_ops = {
 	.enable = at91_plladiv_clk_enable,
 	.get_rate = at91_plladiv_clk_get_rate,
 	.set_rate = at91_plladiv_clk_set_rate,
 };
@@ -430,9 +430,9 @@ static int system_clk_enable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops system_clk_ops = {
+static struct clk_ops_uboot system_clk_ops = {
 	.of_xlate = at91_clk_of_xlate,
 	.get_rate = system_clk_get_rate,
 	.set_rate = system_clk_set_rate,
 	.enable = system_clk_enable,
@@ -526,9 +526,9 @@ static ulong periph_get_rate(struct clk *clk)
 
 	return clk_get_rate(&clk_dev);
 }
 
-static struct clk_ops periph_clk_ops = {
+static struct clk_ops_uboot periph_clk_ops = {
 	.of_xlate = at91_clk_of_xlate,
 	.enable = periph_clk_enable,
 	.get_rate = periph_get_rate,
 };
@@ -632,9 +632,9 @@ static ulong utmi_clk_get_rate(struct clk *clk)
 	/* UTMI clk rate is fixed. */
 	return UTMI_RATE;
 }
 
-static struct clk_ops utmi_clk_ops = {
+static struct clk_ops_uboot utmi_clk_ops = {
 	.enable = utmi_clk_enable,
 	.get_rate = utmi_clk_get_rate,
 };
 
@@ -693,9 +693,9 @@ static ulong sama5d4_h32mx_clk_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static struct clk_ops sama5d4_h32mx_clk_ops = {
+static struct clk_ops_uboot sama5d4_h32mx_clk_ops = {
 	.get_rate = sama5d4_h32mx_clk_get_rate,
 };
 
 static int sama5d4_h32mx_clk_probe(struct udevice *dev)
@@ -841,9 +841,9 @@ static ulong generic_clk_set_rate(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static struct clk_ops generic_clk_ops = {
+static struct clk_ops_uboot generic_clk_ops = {
 	.of_xlate = at91_clk_of_xlate,
 	.get_rate = generic_clk_get_rate,
 	.set_rate = generic_clk_set_rate,
 };
@@ -966,9 +966,9 @@ static ulong at91_usb_clk_set_rate(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static struct clk_ops at91_usb_clk_ops = {
+static struct clk_ops_uboot at91_usb_clk_ops = {
 	.get_rate = at91_usb_clk_get_rate,
 	.set_rate = at91_usb_clk_set_rate,
 };
 
diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index aa4bc8fa47ad..2a7de0bf6ff1 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -20,9 +20,9 @@ static int at91_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 
 	return 0;
 }
 
-const struct clk_ops at91_clk_ops = {
+const struct clk_ops_uboot at91_clk_ops = {
 	.of_xlate	= at91_clk_of_xlate,
 	.set_rate	= ccf_clk_set_rate,
 	.get_rate	= ccf_clk_get_rate,
 	.enable		= ccf_clk_enable,
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index f38868d16655..638c9b769ceb 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -97,9 +97,9 @@ struct pmc_clk_setup {
 extern const struct clk_programmable_layout at91rm9200_programmable_layout;
 extern const struct clk_programmable_layout at91sam9g45_programmable_layout;
 extern const struct clk_programmable_layout at91sam9x5_programmable_layout;
 
-extern const struct clk_ops at91_clk_ops;
+extern const struct clk_ops_uboot at91_clk_ops;
 
 struct clk *at91_clk_main_rc(void __iomem *reg, const char *name,
 			const char *parent_name);
 struct clk *at91_clk_main_osc(void __iomem *reg, const char *name,
diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 3fde8ea71382..9dba31562c6a 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -41,9 +41,9 @@ static int sam9x60_sckc_of_xlate(struct clk *clk,
 
 	return 0;
 }
 
-static const struct clk_ops sam9x60_sckc_ops = {
+static const struct clk_ops_uboot sam9x60_sckc_ops = {
 	.of_xlate = sam9x60_sckc_of_xlate,
 	.get_rate = clk_generic_get_rate,
 };
 
@@ -63,9 +63,9 @@ static int sam9x60_td_slck_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-static const struct clk_ops sam9x60_td_slck_ops = {
+static const struct clk_ops_uboot sam9x60_td_slck_ops = {
 	.get_rate = clk_generic_get_rate,
 	.set_parent = sam9x60_td_slck_set_parent,
 };
 
diff --git a/drivers/clk/clk-cdce9xx.c b/drivers/clk/clk-cdce9xx.c
index 996cc30683ea..9689283cec48 100644
--- a/drivers/clk/clk-cdce9xx.c
+++ b/drivers/clk/clk-cdce9xx.c
@@ -231,9 +231,9 @@ static const struct udevice_id cdce9xx_clk_of_match[] = {
 	{ .compatible = "ti,cdce949", .data = (u32)&cdce949_chip_info },
 	{ /* sentinel */ },
 };
 
-static const struct clk_ops cdce9xx_clk_ops = {
+static const struct clk_ops_uboot cdce9xx_clk_ops = {
 	.request = cdce9xx_clk_request,
 	.get_rate = cdce9xx_clk_get_rate,
 	.set_rate = cdce9xx_clk_set_rate,
 };
diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 4ed143065754..6c2bc91c6a77 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -41,9 +41,9 @@ static ulong clk_gpio_get_rate(struct clk *clk)
 
 	return clk_get_rate(priv->clk);
 }
 
-const struct clk_ops clk_gpio_ops = {
+const struct clk_ops_uboot clk_gpio_ops = {
 	.enable		= clk_gpio_enable,
 	.disable	= clk_gpio_disable,
 	.get_rate	= clk_gpio_get_rate,
 };
diff --git a/drivers/clk/clk-hsdk-cgu.c b/drivers/clk/clk-hsdk-cgu.c
index 53655059279e..4ff2b27205fd 100644
--- a/drivers/clk/clk-hsdk-cgu.c
+++ b/drivers/clk/clk-hsdk-cgu.c
@@ -733,9 +733,9 @@ static int hsdk_cgu_disable(struct clk *sclk)
 
 	return -EINVAL;
 }
 
-static const struct clk_ops hsdk_cgu_ops = {
+static const struct clk_ops_uboot hsdk_cgu_ops = {
 	.set_rate = hsdk_cgu_set_rate,
 	.get_rate = hsdk_cgu_get_rate,
 	.disable = hsdk_cgu_disable,
 };
diff --git a/drivers/clk/clk-stub.c b/drivers/clk/clk-stub.c
index 117266ac7789..ea77a4c720ae 100644
--- a/drivers/clk/clk-stub.c
+++ b/drivers/clk/clk-stub.c
@@ -40,9 +40,9 @@ static int stub_clk_nop(struct clk *clk)
 {
 	return 0;
 }
 
-static struct clk_ops stub_clk_ops = {
+static struct clk_ops_uboot stub_clk_ops = {
 	.set_rate = stub_clk_set_rate,
 	.get_rate = stub_clk_get_rate,
 	.enable = stub_clk_nop,
 	.disable = stub_clk_nop,
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index c33f415917e9..8a7033386a74 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -23,11 +23,11 @@
 #include <linux/bug.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 
-static inline const struct clk_ops *clk_dev_ops(struct udevice *dev)
+static inline const struct clk_ops_uboot *clk_dev_ops(struct udevice *dev)
 {
-	return (const struct clk_ops *)dev->driver->ops;
+	return (const struct clk_ops_uboot *)dev->driver->ops;
 }
 
 struct clk *dev_get_clk_ptr(struct udevice *dev)
 {
@@ -80,9 +80,9 @@ static int clk_get_by_index_tail(int ret, ofnode node,
 				 const char *list_name, int index,
 				 struct clk *clk)
 {
 	struct udevice *dev_clk;
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 
 	assert(clk);
 	clk->dev = NULL;
 	if (ret)
@@ -465,9 +465,9 @@ int clk_release_all(struct clk *clk, unsigned int count)
 }
 
 int clk_request(struct udevice *dev, struct clk *clk)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 
 	debug("%s(dev=%s, clk=%p)\n", __func__, dev_read_name(dev), clk);
 	if (!clk)
 		return 0;
@@ -482,9 +482,9 @@ int clk_request(struct udevice *dev, struct clk *clk)
 }
 
 ulong clk_get_rate(struct clk *clk)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 
 	debug("%s(clk=%p)\n", __func__, clk);
 	if (!clk_valid(clk))
 		return 0;
@@ -516,9 +516,9 @@ struct clk *clk_get_parent(struct clk *clk)
 }
 
 ulong clk_get_parent_rate(struct clk *clk)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *pclk;
 
 	debug("%s(clk=%p)\n", __func__, clk);
 	if (!clk_valid(clk))
@@ -540,9 +540,9 @@ ulong clk_get_parent_rate(struct clk *clk)
 }
 
 ulong clk_round_rate(struct clk *clk, ulong rate)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 
 	debug("%s(clk=%p, rate=%lu)\n", __func__, clk, rate);
 	if (!clk_valid(clk))
 		return 0;
@@ -587,9 +587,9 @@ static void clk_clean_rate_cache(struct clk *clk)
 }
 
 ulong clk_set_rate(struct clk *clk, ulong rate)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *clkp;
 
 	debug("%s(clk=%p, rate=%lu)\n", __func__, clk, rate);
 	if (!clk_valid(clk))
@@ -620,9 +620,9 @@ ulong clk_set_rate(struct clk *clk, ulong rate)
 }
 
 int clk_set_parent(struct clk *clk, struct clk *parent)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	int ret;
 
 	debug("%s(clk=%p, parent=%p)\n", __func__, clk, parent);
 	if (!clk_valid(clk))
@@ -658,9 +658,9 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 
 int clk_enable(struct clk *clk)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *clkp = NULL;
 	int ret;
 
 	debug("%s(clk=%p name=%s)\n", __func__, clk, clk ? clk->dev->name : "NULL");
@@ -719,9 +719,9 @@ int clk_enable_bulk(struct clk_bulk *bulk)
 }
 
 int clk_disable(struct clk *clk)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *clkp = NULL;
 	int ret;
 
 	debug("%s(clk=%p name=%s)\n", __func__, clk, clk ? clk->dev->name : "NULL");
diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 4a3f50c638b1..18c5ae43789a 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -104,9 +104,9 @@ static unsigned long clk_wzrd_set_rate(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static struct clk_ops clk_wzrd_ops = {
+static struct clk_ops_uboot clk_wzrd_ops = {
 	.enable = clk_wzrd_enable,
 	.set_rate = clk_wzrd_set_rate,
 };
 
diff --git a/drivers/clk/clk_bcm6345.c b/drivers/clk/clk_bcm6345.c
index 0b41872b7192..ae72957bbda7 100644
--- a/drivers/clk/clk_bcm6345.c
+++ b/drivers/clk/clk_bcm6345.c
@@ -41,9 +41,9 @@ static int bcm6345_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops bcm6345_clk_ops = {
+static struct clk_ops_uboot bcm6345_clk_ops = {
 	.disable = bcm6345_clk_disable,
 	.enable = bcm6345_clk_enable,
 };
 
diff --git a/drivers/clk/clk_boston.c b/drivers/clk/clk_boston.c
index 71e030f463e1..e7b346ea18e0 100644
--- a/drivers/clk/clk_boston.c
+++ b/drivers/clk/clk_boston.c
@@ -53,9 +53,9 @@ static ulong clk_boston_get_rate(struct clk *clk)
 
 	return (in_rate * mul * 1000000) / div;
 }
 
-const struct clk_ops clk_boston_ops = {
+const struct clk_ops_uboot clk_boston_ops = {
 	.get_rate = clk_boston_get_rate,
 };
 
 static int clk_boston_probe(struct udevice *dev)
diff --git a/drivers/clk/clk_fixed_factor.c b/drivers/clk/clk_fixed_factor.c
index 1d740cf49f62..536639912f1f 100644
--- a/drivers/clk/clk_fixed_factor.c
+++ b/drivers/clk/clk_fixed_factor.c
@@ -35,9 +35,9 @@ static ulong clk_fixed_factor_get_rate(struct clk *clk)
 
 	return rate * ff->mult;
 }
 
-const struct clk_ops clk_fixed_factor_ops = {
+const struct clk_ops_uboot clk_fixed_factor_ops = {
 	.get_rate = clk_fixed_factor_get_rate,
 };
 
 static int clk_fixed_factor_of_to_plat(struct udevice *dev)
diff --git a/drivers/clk/clk_fixed_rate.c b/drivers/clk/clk_fixed_rate.c
index 681bd3db20ed..ee10cdc21613 100644
--- a/drivers/clk/clk_fixed_rate.c
+++ b/drivers/clk/clk_fixed_rate.c
@@ -24,9 +24,9 @@ static int dummy_enable(struct clk *clk)
 {
 	return 0;
 }
 
-const struct clk_ops clk_fixed_rate_ops = {
+const struct clk_ops_uboot clk_fixed_rate_ops = {
 	.get_rate = clk_fixed_rate_get_rate,
 	.enable = dummy_enable,
 	.disable = dummy_enable,
 };
@@ -52,9 +52,9 @@ static ulong clk_fixed_rate_raw_get_rate(struct clk *clk)
 {
 	return container_of(clk, struct clk_fixed_rate, clk)->fixed_rate;
 }
 
-const struct clk_ops clk_fixed_rate_raw_ops = {
+const struct clk_ops_uboot clk_fixed_rate_raw_ops = {
 	.get_rate = clk_fixed_rate_raw_get_rate,
 };
 
 static int clk_fixed_rate_of_to_plat(struct udevice *dev)
diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
index d1a6cde8f0f8..329fc5bffd18 100644
--- a/drivers/clk/clk_k210.c
+++ b/drivers/clk/clk_k210.c
@@ -1289,9 +1289,9 @@ static void k210_clk_dump(struct udevice *dev)
 	show_clks(priv, K210_CLK_IN0, 1);
 }
 #endif
 
-static const struct clk_ops k210_clk_ops = {
+static const struct clk_ops_uboot k210_clk_ops = {
 	.request = k210_clk_request,
 	.set_rate = k210_clk_set_rate,
 	.get_rate = k210_clk_get_rate,
 	.set_parent = k210_clk_set_parent,
diff --git a/drivers/clk/clk_octeon.c b/drivers/clk/clk_octeon.c
index fa50265184f0..b2e6221b5bc7 100644
--- a/drivers/clk/clk_octeon.c
+++ b/drivers/clk/clk_octeon.c
@@ -38,9 +38,9 @@ static ulong octeon_clk_get_rate(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops octeon_clk_ops = {
+static struct clk_ops_uboot octeon_clk_ops = {
 	.enable = octeon_clk_enable,
 	.get_rate = octeon_clk_get_rate,
 };
 
diff --git a/drivers/clk/clk_pic32.c b/drivers/clk/clk_pic32.c
index 885aa8345165..0b8e2f7ad8ec 100644
--- a/drivers/clk/clk_pic32.c
+++ b/drivers/clk/clk_pic32.c
@@ -417,9 +417,9 @@ static void pic32_dump(struct udevice *dev)
 	}
 }
 #endif
 
-static struct clk_ops pic32_pic32_clk_ops = {
+static struct clk_ops_uboot pic32_pic32_clk_ops = {
 	.set_rate = pic32_set_rate,
 	.get_rate = pic32_get_rate,
 #if IS_ENABLED(CONFIG_CMD_CLK)
 	.dump = pic32_dump,
diff --git a/drivers/clk/clk_sandbox.c b/drivers/clk/clk_sandbox.c
index c8c5a88c52d9..dceba88852ab 100644
--- a/drivers/clk/clk_sandbox.c
+++ b/drivers/clk/clk_sandbox.c
@@ -105,9 +105,9 @@ static int sandbox_clk_request(struct clk *clk)
 	priv->requested[id] = true;
 	return 0;
 }
 
-static struct clk_ops sandbox_clk_ops = {
+static struct clk_ops_uboot sandbox_clk_ops = {
 	.round_rate	= sandbox_clk_round_rate,
 	.get_rate	= sandbox_clk_get_rate,
 	.set_rate	= sandbox_clk_set_rate,
 	.enable		= sandbox_clk_enable,
diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index ee237ed6337c..16374560f2b7 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -419,9 +419,9 @@ static int scmi_clk_set_parent(struct clk *clk, struct clk *parent)
 		"%s: SCMI CLOCK: the clock's parent cannot be changed by the agent.\n", __func__);
 	return 0;
 }
 
-static const struct clk_ops scmi_clk_ops = {
+static const struct clk_ops_uboot scmi_clk_ops = {
 	.enable = scmi_clk_enable,
 	.disable = scmi_clk_disable,
 	.get_rate = scmi_clk_get_rate,
 	.set_rate = scmi_clk_set_rate,
diff --git a/drivers/clk/clk_versaclock.c b/drivers/clk/clk_versaclock.c
index 19a787eaf0c5..35f7ded0137b 100644
--- a/drivers/clk/clk_versaclock.c
+++ b/drivers/clk/clk_versaclock.c
@@ -276,9 +276,9 @@ static int vc5_mux_set_parent(struct clk *hw, unsigned char index)
 
 	return vc5_update_bits(vc5->i2c, VC5_PRIM_SRC_SHDN, mask, src);
 }
 
-static const struct clk_ops vc5_mux_ops = {
+static const struct clk_ops_uboot vc5_mux_ops = {
 	.get_rate	= vc5_mux_get_rate,
 };
 
 static unsigned long vc5_pfd_round_rate(struct clk *hw, unsigned long rate)
@@ -357,9 +357,9 @@ static unsigned long vc5_pfd_set_rate(struct clk *hw, unsigned long rate)
 
 	return 0;
 }
 
-static const struct clk_ops vc5_pfd_ops = {
+static const struct clk_ops_uboot vc5_pfd_ops = {
 	.round_rate	= vc5_pfd_round_rate,
 	.get_rate	= vc5_pfd_recalc_rate,
 	.set_rate	= vc5_pfd_set_rate,
 };
@@ -428,9 +428,9 @@ static unsigned long vc5_pll_set_rate(struct clk *hw, unsigned long rate)
 
 	return dm_i2c_write(vc5->i2c, VC5_FEEDBACK_INT_DIV, fb, 5);
 }
 
-static const struct clk_ops vc5_pll_ops = {
+static const struct clk_ops_uboot vc5_pll_ops = {
 	.round_rate	= vc5_pll_round_rate,
 	.get_rate	= vc5_pll_recalc_rate,
 	.set_rate	= vc5_pll_set_rate,
 };
@@ -529,9 +529,9 @@ static unsigned long vc5_fod_set_rate(struct clk *hw, unsigned long rate)
 
 	return 0;
 }
 
-static const struct clk_ops vc5_fod_ops = {
+static const struct clk_ops_uboot vc5_fod_ops = {
 	.round_rate	= vc5_fod_round_rate,
 	.get_rate	= vc5_fod_recalc_rate,
 	.set_rate	= vc5_fod_set_rate,
 };
@@ -635,22 +635,22 @@ static unsigned long vc5_clk_out_get_rate(struct clk *hw)
 {
 	return clk_get_parent_rate(hw);
 }
 
-static const struct clk_ops vc5_clk_out_ops = {
+static const struct clk_ops_uboot vc5_clk_out_ops = {
 	.enable	= vc5_clk_out_prepare,
 	.disable	= vc5_clk_out_unprepare,
 	.set_rate	= vc5_clk_out_set_rate,
 	.get_rate	= vc5_clk_out_get_rate,
 };
 
-static const struct clk_ops vc5_clk_out_sel_ops = {
+static const struct clk_ops_uboot vc5_clk_out_sel_ops = {
 	.enable	= vc5_clk_out_prepare,
 	.disable	= vc5_clk_out_unprepare,
 	.get_rate	= vc5_clk_out_get_rate,
 };
 
-static const struct clk_ops vc5_clk_ops = {
+static const struct clk_ops_uboot vc5_clk_ops = {
 	.enable	= vc5_clk_out_prepare,
 	.disable	= vc5_clk_out_unprepare,
 	.set_rate	= vc5_clk_out_set_rate,
 	.get_rate	= vc5_clk_out_get_rate,
diff --git a/drivers/clk/clk_versal.c b/drivers/clk/clk_versal.c
index 78a2410ca21c..14dadf859a1f 100644
--- a/drivers/clk/clk_versal.c
+++ b/drivers/clk/clk_versal.c
@@ -801,9 +801,9 @@ static int versal_clk_enable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops versal_clk_ops = {
+static struct clk_ops_uboot versal_clk_ops = {
 	.set_rate = versal_clk_set_rate,
 	.get_rate = versal_clk_get_rate,
 	.enable = versal_clk_enable,
 #if IS_ENABLED(CONFIG_CMD_CLK)
diff --git a/drivers/clk/clk_vexpress_osc.c b/drivers/clk/clk_vexpress_osc.c
index 85ac92c908a7..a6f0ba595a23 100644
--- a/drivers/clk/clk_vexpress_osc.c
+++ b/drivers/clk/clk_vexpress_osc.c
@@ -61,9 +61,9 @@ static ulong vexpress_osc_clk_set_rate(struct clk *clk, ulong rate)
 	return rate;
 }
 #endif
 
-static struct clk_ops vexpress_osc_clk_ops = {
+static struct clk_ops_uboot vexpress_osc_clk_ops = {
 	.get_rate = vexpress_osc_clk_get_rate,
 #ifndef CONFIG_XPL_BUILD
 	.set_rate = vexpress_osc_clk_set_rate,
 #endif
diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
index a8505f62bbad..229972fb505d 100644
--- a/drivers/clk/clk_zynq.c
+++ b/drivers/clk/clk_zynq.c
@@ -499,9 +499,9 @@ static void zynq_clk_dump(struct udevice *dev)
 	}
 }
 #endif
 
-static struct clk_ops zynq_clk_ops = {
+static struct clk_ops_uboot zynq_clk_ops = {
 	.get_rate = zynq_clk_get_rate,
 #ifndef CONFIG_XPL_BUILD
 	.set_rate = zynq_clk_set_rate,
 #endif
diff --git a/drivers/clk/clk_zynqmp.c b/drivers/clk/clk_zynqmp.c
index 765cae92241d..1f23b06553bf 100644
--- a/drivers/clk/clk_zynqmp.c
+++ b/drivers/clk/clk_zynqmp.c
@@ -883,9 +883,9 @@ static int zynqmp_clk_enable(struct clk *clk)
 
 	return ret;
 }
 
-static const struct clk_ops zynqmp_clk_ops = {
+static const struct clk_ops_uboot zynqmp_clk_ops = {
 	.set_rate = zynqmp_clk_set_rate,
 	.get_rate = zynqmp_clk_get_rate,
 	.enable = zynqmp_clk_enable,
 #if IS_ENABLED(CONFIG_CMD_CLK)
diff --git a/drivers/clk/exynos/clk-exynos7420.c b/drivers/clk/exynos/clk-exynos7420.c
index 7de4e688f036..8c8d2ce0d069 100644
--- a/drivers/clk/exynos/clk-exynos7420.c
+++ b/drivers/clk/exynos/clk-exynos7420.c
@@ -103,9 +103,9 @@ static ulong exynos7420_topc_get_rate(struct clk *clk)
 		return 0;
 	}
 }
 
-static struct clk_ops exynos7420_clk_topc_ops = {
+static struct clk_ops_uboot exynos7420_clk_topc_ops = {
 	.get_rate	= exynos7420_topc_get_rate,
 };
 
 static int exynos7420_clk_topc_probe(struct udevice *dev)
@@ -154,9 +154,9 @@ static ulong exynos7420_top0_get_rate(struct clk *clk)
 		return 0;
 	}
 }
 
-static struct clk_ops exynos7420_clk_top0_ops = {
+static struct clk_ops_uboot exynos7420_clk_top0_ops = {
 	.get_rate	= exynos7420_top0_get_rate,
 };
 
 static int exynos7420_clk_top0_probe(struct udevice *dev)
@@ -206,9 +206,9 @@ static ulong exynos7420_peric1_get_rate(struct clk *clk)
 
 	return freq;
 }
 
-static struct clk_ops exynos7420_clk_peric1_ops = {
+static struct clk_ops_uboot exynos7420_clk_peric1_ops = {
 	.get_rate	= exynos7420_peric1_get_rate,
 };
 
 static const struct udevice_id exynos7420_clk_topc_compat[] = {
diff --git a/drivers/clk/exynos/clk-pll.c b/drivers/clk/exynos/clk-pll.c
index 4b67591af109..ec0f4511ebf9 100644
--- a/drivers/clk/exynos/clk-pll.c
+++ b/drivers/clk/exynos/clk-pll.c
@@ -55,9 +55,9 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk *clk)
 	do_div(fvco, (pdiv << sdiv));
 	return (unsigned long)fvco;
 }
 
-static const struct clk_ops samsung_pll0822x_clk_min_ops = {
+static const struct clk_ops_uboot samsung_pll0822x_clk_min_ops = {
 	.get_rate = samsung_pll0822x_recalc_rate,
 };
 
 /*
@@ -93,9 +93,9 @@ static unsigned long samsung_pll0831x_recalc_rate(struct clk *clk)
 
 	return (unsigned long)fvco;
 }
 
-static const struct clk_ops samsung_pll0831x_clk_min_ops = {
+static const struct clk_ops_uboot samsung_pll0831x_clk_min_ops = {
 	.get_rate = samsung_pll0831x_recalc_rate,
 };
 
 static struct clk *_samsung_clk_register_pll(void __iomem *base,
diff --git a/drivers/clk/exynos/clk.h b/drivers/clk/exynos/clk.h
index c25b7cb59d4f..c8d5d61991ee 100644
--- a/drivers/clk/exynos/clk.h
+++ b/drivers/clk/exynos/clk.h
@@ -32,9 +32,9 @@ static int _name##_of_xlate(struct clk *clk,				\
 									\
 	return 0;							\
 }									\
 									\
-static const struct clk_ops _name##_clk_ops = {				\
+static const struct clk_ops_uboot _name##_clk_ops = {				\
 	.set_rate = ccf_clk_set_rate,					\
 	.get_rate = ccf_clk_get_rate,					\
 	.set_parent = ccf_clk_set_parent,				\
 	.enable = ccf_clk_enable,					\
diff --git a/drivers/clk/ics8n3qv01.c b/drivers/clk/ics8n3qv01.c
index 9c61a84ea61f..04e6a349436a 100644
--- a/drivers/clk/ics8n3qv01.c
+++ b/drivers/clk/ics8n3qv01.c
@@ -195,9 +195,9 @@ static int ics8n3qv01_disable(struct clk *clk)
 {
 	return 0;
 }
 
-static const struct clk_ops ics8n3qv01_ops = {
+static const struct clk_ops_uboot ics8n3qv01_ops = {
 	.get_rate = ics8n3qv01_get_rate,
 	.set_rate = ics8n3qv01_set_rate,
 	.enable = ics8n3qv01_enable,
 	.disable = ics8n3qv01_disable,
diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index e1a3c0af308b..848c7b9d3fb1 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -110,9 +110,9 @@ static ulong imx8m_clk_composite_divider_set_rate(struct clk *clk,
 
 	return clk_get_rate(&composite->clk);
 }
 
-static const struct clk_ops imx8m_clk_composite_divider_ops = {
+static const struct clk_ops_uboot imx8m_clk_composite_divider_ops = {
 	.get_rate = imx8m_clk_composite_divider_recalc_rate,
 	.set_rate = imx8m_clk_composite_divider_set_rate,
 };
 
@@ -173,9 +173,9 @@ static int imx8m_clk_mux_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-const struct clk_ops imx8m_clk_mux_ops = {
+const struct clk_ops_uboot imx8m_clk_mux_ops = {
 	.get_rate = clk_generic_get_rate,
 	.set_parent = imx8m_clk_mux_set_parent,
 };
 
diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index 61692d34f926..b591db04c249 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -77,9 +77,9 @@ static int imx93_clk_composite_gate_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops imx93_clk_composite_gate_ops = {
+static const struct clk_ops_uboot imx93_clk_composite_gate_ops = {
 	.enable = imx93_clk_composite_gate_enable,
 	.disable = imx93_clk_composite_gate_disable,
 };
 
diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index b3926564a226..b885c4bc01d4 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -324,9 +324,9 @@ static int clk_fracn_gppll_unprepare(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops clk_fracn_gppll_ops = {
+static const struct clk_ops_uboot clk_fracn_gppll_ops = {
 	.enable		= clk_fracn_gppll_prepare,
 	.disable	= clk_fracn_gppll_unprepare,
 	.get_rate	= clk_fracn_gppll_recalc_rate,
 	.set_rate	= clk_fracn_gppll_set_rate,
diff --git a/drivers/clk/imx/clk-gate-93.c b/drivers/clk/imx/clk-gate-93.c
index d7f2640fbb7c..ff3ae5b57d36 100644
--- a/drivers/clk/imx/clk-gate-93.c
+++ b/drivers/clk/imx/clk-gate-93.c
@@ -102,9 +102,9 @@ static ulong imx93_clk_set_rate(struct clk *clk, ulong rate)
 
 	return -ENODEV;
 }
 
-static const struct clk_ops imx93_clk_gate_ops = {
+static const struct clk_ops_uboot imx93_clk_gate_ops = {
 	.enable = imx93_clk_gate_enable,
 	.disable = imx93_clk_gate_disable,
 	.get_rate = clk_generic_get_rate,
 	.set_rate = imx93_clk_set_rate,
diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index fa07b13249b6..b5cd1b31036e 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -82,9 +82,9 @@ static ulong clk_gate2_set_rate(struct clk *clk, ulong rate)
 
 	return -ENODEV;
 }
 
-static const struct clk_ops clk_gate2_ops = {
+static const struct clk_ops_uboot clk_gate2_ops = {
 	.set_rate = clk_gate2_set_rate,
 	.enable = clk_gate2_enable,
 	.disable = clk_gate2_disable,
 	.get_rate = clk_generic_get_rate,
diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index b69355cefc76..a11db0a3ac40 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -22,9 +22,9 @@ static int imx6q_clk_request(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops imx6q_clk_ops = {
+static struct clk_ops_uboot imx6q_clk_ops = {
 	.request = imx6q_clk_request,
 	.set_rate = ccf_clk_set_rate,
 	.get_rate = ccf_clk_get_rate,
 	.enable = ccf_clk_enable,
diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 32fb949ffbcc..541e63e8717b 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -24,9 +24,9 @@ static int imx6ul_clk_request(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops imx6ul_clk_ops = {
+static struct clk_ops_uboot imx6ul_clk_ops = {
 	.request = imx6ul_clk_request,
 	.set_rate = ccf_clk_set_rate,
 	.get_rate = ccf_clk_get_rate,
 	.enable = ccf_clk_enable,
diff --git a/drivers/clk/imx/clk-imx8.c b/drivers/clk/imx/clk-imx8.c
index 96cf5fece75f..423b052cc5b6 100644
--- a/drivers/clk/imx/clk-imx8.c
+++ b/drivers/clk/imx/clk-imx8.c
@@ -77,9 +77,9 @@ static void imx8_clk_dump(struct udevice *dev)
 	}
 }
 #endif
 
-static struct clk_ops imx8_clk_ops = {
+static struct clk_ops_uboot imx8_clk_ops = {
 	.set_rate = imx8_clk_set_rate,
 	.get_rate = imx8_clk_get_rate,
 	.enable = imx8_clk_enable,
 	.disable = imx8_clk_disable,
diff --git a/drivers/clk/imx/clk-imxrt1020.c b/drivers/clk/imx/clk-imxrt1020.c
index c14afdaf2364..c2797237a002 100644
--- a/drivers/clk/imx/clk-imxrt1020.c
+++ b/drivers/clk/imx/clk-imxrt1020.c
@@ -12,9 +12,9 @@
 #include <dt-bindings/clock/imxrt1020-clock.h>
 
 #include "clk.h"
 
-static struct clk_ops imxrt1020_clk_ops = {
+static struct clk_ops_uboot imxrt1020_clk_ops = {
 	.set_rate = ccf_clk_set_rate,
 	.get_rate = ccf_clk_get_rate,
 	.enable = ccf_clk_enable,
 	.disable = ccf_clk_disable,
diff --git a/drivers/clk/imx/clk-imxrt1170.c b/drivers/clk/imx/clk-imxrt1170.c
index bfd5dd6c4644..ed31cb2d09ef 100644
--- a/drivers/clk/imx/clk-imxrt1170.c
+++ b/drivers/clk/imx/clk-imxrt1170.c
@@ -88,9 +88,9 @@ static int imxrt1170_clk_set_parent(struct clk *clk, struct clk *parent)
 
 	return clk_set_parent(c, cp);
 }
 
-static struct clk_ops imxrt1170_clk_ops = {
+static struct clk_ops_uboot imxrt1170_clk_ops = {
 	.set_rate = imxrt1170_clk_set_rate,
 	.get_rate = imxrt1170_clk_get_rate,
 	.enable = imxrt1170_clk_enable,
 	.disable = imxrt1170_clk_disable,
diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index 378cdff072fe..de26b1e3f83d 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -73,9 +73,9 @@ static unsigned long clk_pfd_set_rate(struct clk *clk, unsigned long rate)
 
 	return 0;
 }
 
-static const struct clk_ops clk_pfd_ops = {
+static const struct clk_ops_uboot clk_pfd_ops = {
 	.get_rate	= clk_pfd_recalc_rate,
 	.set_rate	= clk_pfd_set_rate,
 };
 
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index f9fcec18f9f8..0bb4d2c7e28c 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -371,16 +371,16 @@ static int clk_pll14xx_unprepare(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops clk_pll1416x_ops = {
+static const struct clk_ops_uboot clk_pll1416x_ops = {
 	.enable		= clk_pll14xx_prepare,
 	.disable	= clk_pll14xx_unprepare,
 	.set_rate	= clk_pll1416x_set_rate,
 	.get_rate	= clk_pll1416x_recalc_rate,
 };
 
-static const struct clk_ops clk_pll1443x_ops = {
+static const struct clk_ops_uboot clk_pll1443x_ops = {
 	.enable		= clk_pll14xx_prepare,
 	.disable	= clk_pll14xx_unprepare,
 	.set_rate	= clk_pll1443x_set_rate,
 	.get_rate	= clk_pll1443x_recalc_rate,
diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 85b6a9809e8d..e907fd378c6d 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -139,16 +139,16 @@ static int clk_pllv3_generic_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops clk_pllv3_generic_ops = {
+static const struct clk_ops_uboot clk_pllv3_generic_ops = {
 	.get_rate	= clk_pllv3_generic_get_rate,
 	.enable		= clk_pllv3_generic_enable,
 	.disable	= clk_pllv3_generic_disable,
 	.set_rate	= clk_pllv3_generic_set_rate,
 };
 
-static const struct clk_ops clk_pllv3_genericv2_ops = {
+static const struct clk_ops_uboot clk_pllv3_genericv2_ops = {
 	.get_rate	= clk_pllv3_genericv2_get_rate,
 	.enable		= clk_pllv3_generic_enable,
 	.disable	= clk_pllv3_generic_disable,
 	.set_rate	= clk_pllv3_genericv2_set_rate,
@@ -192,9 +192,9 @@ static ulong clk_pllv3_sys_set_rate(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static const struct clk_ops clk_pllv3_sys_ops = {
+static const struct clk_ops_uboot clk_pllv3_sys_ops = {
 	.enable		= clk_pllv3_generic_enable,
 	.disable	= clk_pllv3_generic_disable,
 	.get_rate	= clk_pllv3_sys_get_rate,
 	.set_rate	= clk_pllv3_sys_set_rate,
@@ -260,9 +260,9 @@ static ulong clk_pllv3_av_set_rate(struct clk *clk, ulong rate)
 
 	return 0;
 }
 
-static const struct clk_ops clk_pllv3_av_ops = {
+static const struct clk_ops_uboot clk_pllv3_av_ops = {
 	.enable		= clk_pllv3_generic_enable,
 	.disable	= clk_pllv3_generic_disable,
 	.get_rate	= clk_pllv3_av_get_rate,
 	.set_rate	= clk_pllv3_av_set_rate,
@@ -274,9 +274,9 @@ static ulong clk_pllv3_enet_get_rate(struct clk *clk)
 
 	return pll->ref_clock;
 }
 
-static const struct clk_ops clk_pllv3_enet_ops = {
+static const struct clk_ops_uboot clk_pllv3_enet_ops = {
 	.enable	= clk_pllv3_generic_enable,
 	.disable	= clk_pllv3_generic_disable,
 	.get_rate	= clk_pllv3_enet_get_rate,
 };
diff --git a/drivers/clk/intel/clk_intel.c b/drivers/clk/intel/clk_intel.c
index a677a7caac7c..1d473ebb4d90 100644
--- a/drivers/clk/intel/clk_intel.c
+++ b/drivers/clk/intel/clk_intel.c
@@ -18,9 +18,9 @@ static ulong intel_clk_get_rate(struct clk *clk)
 		return -ENODEV;
 	}
 }
 
-static struct clk_ops intel_clk_ops = {
+static struct clk_ops_uboot intel_clk_ops = {
 	.get_rate	= intel_clk_get_rate,
 };
 
 static const struct udevice_id intel_clk_ids[] = {
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b4de38719e1c..7c55bc4defa8 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -160,9 +160,9 @@ static ulong mtk_clk_find_parent_rate(struct clk *clk, int id,
 	else
 		parent.dev = clk->dev;
 
 	args.node = dev_ofnode(parent.dev);
-	ret = ((struct clk_ops *)parent.dev->driver->ops)->of_xlate(&parent, &args);
+	ret = ((struct clk_ops_uboot *)parent.dev->driver->ops)->of_xlate(&parent, &args);
 	if (ret)
 		return ret;
 
 	return clk_get_rate(&parent);
@@ -1177,9 +1177,9 @@ static void mtk_clk_gate_dump(struct udevice *dev)
 	}
 }
 #endif
 
-const struct clk_ops mtk_clk_apmixedsys_ops = {
+const struct clk_ops_uboot mtk_clk_apmixedsys_ops = {
 	.of_xlate = mtk_apmixedsys_of_xlate,
 	.enable = mtk_apmixedsys_enable,
 	.disable = mtk_apmixedsys_disable,
 	.set_rate = mtk_apmixedsys_set_rate,
@@ -1188,9 +1188,9 @@ const struct clk_ops mtk_clk_apmixedsys_ops = {
 	.dump = mtk_apmixedsys_dump,
 #endif
 };
 
-const struct clk_ops mtk_clk_fixed_pll_ops = {
+const struct clk_ops_uboot mtk_clk_fixed_pll_ops = {
 	.of_xlate = mtk_topckgen_of_xlate,
 	.enable = mtk_dummy_enable,
 	.disable = mtk_dummy_enable,
 	.get_rate = mtk_topckgen_get_rate,
@@ -1198,9 +1198,9 @@ const struct clk_ops mtk_clk_fixed_pll_ops = {
 	.dump = mtk_topckgen_dump,
 #endif
 };
 
-const struct clk_ops mtk_clk_topckgen_ops = {
+const struct clk_ops_uboot mtk_clk_topckgen_ops = {
 	.of_xlate = mtk_topckgen_of_xlate,
 	.enable = mtk_topckgen_enable,
 	.disable = mtk_topckgen_disable,
 	.get_rate = mtk_topckgen_get_rate,
@@ -1209,9 +1209,9 @@ const struct clk_ops mtk_clk_topckgen_ops = {
 	.dump = mtk_topckgen_dump,
 #endif
 };
 
-const struct clk_ops mtk_clk_infrasys_ops = {
+const struct clk_ops_uboot mtk_clk_infrasys_ops = {
 	.of_xlate = mtk_infrasys_of_xlate,
 	.enable = mtk_clk_infrasys_enable,
 	.disable = mtk_clk_infrasys_disable,
 	.get_rate = mtk_infrasys_get_rate,
@@ -1220,9 +1220,9 @@ const struct clk_ops mtk_clk_infrasys_ops = {
 	.dump = mtk_infrasys_dump,
 #endif
 };
 
-const struct clk_ops mtk_clk_gate_ops = {
+const struct clk_ops_uboot mtk_clk_gate_ops = {
 	.of_xlate = mtk_clk_gate_of_xlate,
 	.enable = mtk_clk_gate_enable,
 	.disable = mtk_clk_gate_disable,
 	.get_rate = mtk_clk_gate_get_rate,
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index e618e982e8b9..3fef8b0d7bd6 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -289,13 +289,13 @@ struct mtk_cg_priv {
 	int num_gates;
 	int gates_offs;
 };
 
-extern const struct clk_ops mtk_clk_apmixedsys_ops;
-extern const struct clk_ops mtk_clk_fixed_pll_ops;
-extern const struct clk_ops mtk_clk_topckgen_ops;
-extern const struct clk_ops mtk_clk_infrasys_ops;
-extern const struct clk_ops mtk_clk_gate_ops;
+extern const struct clk_ops_uboot mtk_clk_apmixedsys_ops;
+extern const struct clk_ops_uboot mtk_clk_fixed_pll_ops;
+extern const struct clk_ops_uboot mtk_clk_topckgen_ops;
+extern const struct clk_ops_uboot mtk_clk_infrasys_ops;
+extern const struct clk_ops_uboot mtk_clk_gate_ops;
 
 int mtk_common_clk_init(struct udevice *dev,
 			const struct mtk_clk_tree *tree);
 int mtk_common_clk_infrasys_init(struct udevice *dev,
diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
index a1b8d7914910..e87ad773da8f 100644
--- a/drivers/clk/meson/a1.c
+++ b/drivers/clk/meson/a1.c
@@ -700,9 +700,9 @@ static void meson_clk_dump(struct udevice *dev)
 	}
 }
 #endif
 
-static struct clk_ops meson_clk_ops = {
+static struct clk_ops_uboot meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.get_rate	= meson_clk_get_rate,
 	.set_rate	= meson_clk_set_rate,
diff --git a/drivers/clk/meson/axg-ao.c b/drivers/clk/meson/axg-ao.c
index 6ccf52127b02..e105b8512c20 100644
--- a/drivers/clk/meson/axg-ao.c
+++ b/drivers/clk/meson/axg-ao.c
@@ -63,9 +63,9 @@ static int meson_clk_request(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops meson_clk_ops = {
+static struct clk_ops_uboot meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.request	= meson_clk_request,
 };
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index c421a622a587..6ec9c4586ca2 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -303,9 +303,9 @@ static int meson_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops meson_clk_ops = {
+static struct clk_ops_uboot meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.get_rate	= meson_clk_get_rate,
 };
diff --git a/drivers/clk/meson/clk-measure.c b/drivers/clk/meson/clk-measure.c
index f653fc635527..a89721638bcb 100644
--- a/drivers/clk/meson/clk-measure.c
+++ b/drivers/clk/meson/clk-measure.c
@@ -590,9 +590,9 @@ static int meson_clk_msr_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops meson_clk_msr_ops = {
+static struct clk_ops_uboot meson_clk_msr_ops = {
 	.of_xlate = meson_clk_msr_xlate,
 	.dump = meson_clk_msr_dump,
 };
 
diff --git a/drivers/clk/meson/g12a-ao.c b/drivers/clk/meson/g12a-ao.c
index 61d489c6e1c8..1f00744abacc 100644
--- a/drivers/clk/meson/g12a-ao.c
+++ b/drivers/clk/meson/g12a-ao.c
@@ -63,9 +63,9 @@ static int meson_clk_request(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops meson_clk_ops = {
+static struct clk_ops_uboot meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.request	= meson_clk_request,
 };
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index a7a42b2edb6a..c0172e243274 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -993,9 +993,9 @@ static int meson_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops meson_clk_ops = {
+static struct clk_ops_uboot meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.get_rate	= meson_clk_get_rate,
 	.set_parent	= meson_clk_set_parent,
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 51f124869c9c..14c0d1f9158d 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -947,9 +947,9 @@ static int meson_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops meson_clk_ops = {
+static struct clk_ops_uboot meson_clk_ops = {
 	.disable	= meson_clk_disable,
 	.enable		= meson_clk_enable,
 	.get_rate	= meson_clk_get_rate,
 	.set_parent	= meson_clk_set_parent,
diff --git a/drivers/clk/microchip/mpfs_clk_cfg.c b/drivers/clk/microchip/mpfs_clk_cfg.c
index b64fb6b71931..294ee0f5cc0d 100644
--- a/drivers/clk/microchip/mpfs_clk_cfg.c
+++ b/drivers/clk/microchip/mpfs_clk_cfg.c
@@ -137,9 +137,9 @@ int mpfs_clk_register_cfgs(struct clk *parent, struct regmap *regmap)
 	}
 	return 0;
 }
 
-const struct clk_ops mpfs_cfg_clk_ops = {
+const struct clk_ops_uboot mpfs_cfg_clk_ops = {
 	.set_rate = mpfs_cfg_clk_set_rate,
 	.get_rate = mpfs_cfg_clk_recalc_rate,
 };
 
diff --git a/drivers/clk/microchip/mpfs_clk_msspll.c b/drivers/clk/microchip/mpfs_clk_msspll.c
index 02b4a3444671..489f6cc67d4b 100644
--- a/drivers/clk/microchip/mpfs_clk_msspll.c
+++ b/drivers/clk/microchip/mpfs_clk_msspll.c
@@ -105,9 +105,9 @@ int mpfs_clk_register_msspll(void __iomem *base, struct clk *parent)
 
 	return 0;
 }
 
-const struct clk_ops mpfs_msspll_clk_ops = {
+const struct clk_ops_uboot mpfs_msspll_clk_ops = {
 	.get_rate = mpfs_clk_msspll_recalc_rate,
 };
 
 U_BOOT_DRIVER(mpfs_msspll_clock) = {
diff --git a/drivers/clk/microchip/mpfs_clk_periph.c b/drivers/clk/microchip/mpfs_clk_periph.c
index 706d6841ee49..ecdfa9c36359 100644
--- a/drivers/clk/microchip/mpfs_clk_periph.c
+++ b/drivers/clk/microchip/mpfs_clk_periph.c
@@ -183,9 +183,9 @@ int mpfs_clk_register_periphs(struct udevice *dev, struct regmap *regmap)
 
 	return 0;
 }
 
-const struct clk_ops mpfs_periph_clk_ops = {
+const struct clk_ops_uboot mpfs_periph_clk_ops = {
 	.enable = mpfs_periph_clk_enable,
 	.disable = mpfs_periph_clk_disable,
 	.get_rate = mpfs_periph_clk_recalc_rate,
 };
diff --git a/drivers/clk/mpc83xx_clk.c b/drivers/clk/mpc83xx_clk.c
index a43fff2e7ed9..e163959a7b75 100644
--- a/drivers/clk/mpc83xx_clk.c
+++ b/drivers/clk/mpc83xx_clk.c
@@ -311,9 +311,9 @@ int get_serial_clock(void)
 
 	return priv->speed[MPC83XX_CLK_CSB];
 }
 
-const struct clk_ops mpc83xx_clk_ops = {
+const struct clk_ops_uboot mpc83xx_clk_ops = {
 	.request = mpc83xx_clk_request,
 	.get_rate = mpc83xx_clk_get_rate,
 	.enable = mpc83xx_clk_enable,
 };
diff --git a/drivers/clk/mtmips/clk-mt7620.c b/drivers/clk/mtmips/clk-mt7620.c
index 57d2e2f04c64..812e7bb5a570 100644
--- a/drivers/clk/mtmips/clk-mt7620.c
+++ b/drivers/clk/mtmips/clk-mt7620.c
@@ -104,9 +104,9 @@ static int mt7620_clk_disable(struct clk *clk)
 
 	return mt7620_clkcfg1_rmw(priv, BIT(clk->id), 0);
 }
 
-const struct clk_ops mt7620_clk_ops = {
+const struct clk_ops_uboot mt7620_clk_ops = {
 	.enable = mt7620_clk_enable,
 	.disable = mt7620_clk_disable,
 	.get_rate = mt7620_clk_get_rate,
 };
diff --git a/drivers/clk/mtmips/clk-mt7621.c b/drivers/clk/mtmips/clk-mt7621.c
index 03363b70d74e..6e780b7c9c45 100644
--- a/drivers/clk/mtmips/clk-mt7621.c
+++ b/drivers/clk/mtmips/clk-mt7621.c
@@ -180,9 +180,9 @@ static int mt7621_clk_request(struct clk *clk)
 		return -EINVAL;
 	return 0;
 }
 
-const struct clk_ops mt7621_clk_ops = {
+const struct clk_ops_uboot mt7621_clk_ops = {
 	.request = mt7621_clk_request,
 	.enable = mt7621_clk_enable,
 	.disable = mt7621_clk_disable,
 	.get_rate = mt7621_clk_get_rate,
diff --git a/drivers/clk/mtmips/clk-mt7628.c b/drivers/clk/mtmips/clk-mt7628.c
index 2e263fb2cd28..a8cb5f7ae100 100644
--- a/drivers/clk/mtmips/clk-mt7628.c
+++ b/drivers/clk/mtmips/clk-mt7628.c
@@ -100,9 +100,9 @@ static int mt7628_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-const struct clk_ops mt7628_clk_ops = {
+const struct clk_ops_uboot mt7628_clk_ops = {
 	.enable = mt7628_clk_enable,
 	.disable = mt7628_clk_disable,
 	.get_rate = mt7628_clk_get_rate,
 };
diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 30330393f760..b25b3df3b666 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -598,9 +598,9 @@ static int armada_37xx_periph_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static const struct clk_ops armada_37xx_periph_clk_ops = {
+static const struct clk_ops_uboot armada_37xx_periph_clk_ops = {
 	.get_rate = armada_37xx_periph_clk_get_rate,
 	.set_rate = armada_37xx_periph_clk_set_rate,
 	.set_parent = armada_37xx_periph_clk_set_parent,
 	.enable = armada_37xx_periph_clk_enable,
diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index c1bab84c070e..598604f10c47 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -134,9 +134,9 @@ static int armada_37xx_tbg_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static const struct clk_ops armada_37xx_tbg_clk_ops = {
+static const struct clk_ops_uboot armada_37xx_tbg_clk_ops = {
 	.get_rate = armada_37xx_tbg_clk_get_rate,
 };
 
 static const struct udevice_id armada_37xx_tbg_clk_ids[] = {
diff --git a/drivers/clk/nuvoton/clk_npcm.c b/drivers/clk/nuvoton/clk_npcm.c
index 18cb9cddbf38..ecb23431ecbd 100644
--- a/drivers/clk/nuvoton/clk_npcm.c
+++ b/drivers/clk/nuvoton/clk_npcm.c
@@ -299,9 +299,9 @@ static int npcm_clk_request(struct clk *clk)
 
 	return 0;
 }
 
-const struct clk_ops npcm_clk_ops = {
+const struct clk_ops_uboot npcm_clk_ops = {
 	.get_rate = npcm_clk_get_rate,
 	.set_rate = npcm_clk_set_rate,
 	.set_parent = npcm_clk_set_parent,
 	.request = npcm_clk_request,
diff --git a/drivers/clk/nuvoton/clk_npcm.h b/drivers/clk/nuvoton/clk_npcm.h
index b4726d8381ea..0e5b1ba8b432 100644
--- a/drivers/clk/nuvoton/clk_npcm.h
+++ b/drivers/clk/nuvoton/clk_npcm.h
@@ -100,7 +100,7 @@ struct npcm_clk_priv {
 	struct npcm_clk_data *clk_data;
 	int num_clks;
 };
 
-extern const struct clk_ops npcm_clk_ops;
+extern const struct clk_ops_uboot npcm_clk_ops;
 
 #endif
diff --git a/drivers/clk/owl/clk_owl.c b/drivers/clk/owl/clk_owl.c
index 513112c1146c..832177b8547f 100644
--- a/drivers/clk/owl/clk_owl.c
+++ b/drivers/clk/owl/clk_owl.c
@@ -237,9 +237,9 @@ static int owl_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static const struct clk_ops owl_clk_ops = {
+static const struct clk_ops_uboot owl_clk_ops = {
 	.enable = owl_clk_enable,
 	.disable = owl_clk_disable,
 	.get_rate = owl_clk_get_rate,
 	.set_rate = owl_clk_set_rate,
diff --git a/drivers/clk/qcom/clock-qcom.c b/drivers/clk/qcom/clock-qcom.c
index 6b46d9db744b..6df8285cb301 100644
--- a/drivers/clk/qcom/clock-qcom.c
+++ b/drivers/clk/qcom/clock-qcom.c
@@ -376,9 +376,9 @@ static void __maybe_unused msm_dump_clks(struct udevice *dev)
 	dump_gplls(dev, priv->base);
 	dump_rcgs(dev);
 }
 
-static struct clk_ops msm_clk_ops = {
+static struct clk_ops_uboot msm_clk_ops = {
 	.set_rate = msm_clk_set_rate,
 	.enable = msm_clk_enable,
 #if IS_ENABLED(CONFIG_CMD_CLK)
 	.dump = msm_dump_clks,
diff --git a/drivers/clk/qcom/clock-sm8550.c b/drivers/clk/qcom/clock-sm8550.c
index 7c06489b9c4d..02d6e8d77345 100644
--- a/drivers/clk/qcom/clock-sm8550.c
+++ b/drivers/clk/qcom/clock-sm8550.c
@@ -344,9 +344,9 @@ static int tcsrcc_sm8550_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops tcsrcc_sm8550_clk_ops = {
+static struct clk_ops_uboot tcsrcc_sm8550_clk_ops = {
 	.enable = tcsrcc_sm8550_clk_enable,
 	.get_rate = tcsrcc_sm8550_clk_get_rate,
 };
 
diff --git a/drivers/clk/qcom/clock-sm8650.c b/drivers/clk/qcom/clock-sm8650.c
index 7c49e99c005c..fbd1a186d1ba 100644
--- a/drivers/clk/qcom/clock-sm8650.c
+++ b/drivers/clk/qcom/clock-sm8650.c
@@ -342,9 +342,9 @@ static int tcsrcc_sm8650_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops tcsrcc_sm8650_clk_ops = {
+static struct clk_ops_uboot tcsrcc_sm8650_clk_ops = {
 	.enable = tcsrcc_sm8650_clk_enable,
 	.get_rate = tcsrcc_sm8650_clk_get_rate,
 };
 
diff --git a/drivers/clk/qcom/clock-x1e80100.c b/drivers/clk/qcom/clock-x1e80100.c
index 542d6248d658..ee57a02564a3 100644
--- a/drivers/clk/qcom/clock-x1e80100.c
+++ b/drivers/clk/qcom/clock-x1e80100.c
@@ -375,9 +375,9 @@ static int tcsrcc_x1e80100_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops tcsrcc_x1e80100_clk_ops = {
+static struct clk_ops_uboot tcsrcc_x1e80100_clk_ops = {
 	.enable = tcsrcc_x1e80100_clk_enable,
 	.get_rate = tcsrcc_x1e80100_clk_get_rate,
 };
 
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 9b6fce4675c0..e659ad39da7d 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -259,9 +259,9 @@ static int gen2_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 
 	return 0;
 }
 
-const struct clk_ops gen2_clk_ops = {
+const struct clk_ops_uboot gen2_clk_ops = {
 	.enable		= gen2_clk_enable,
 	.disable	= gen2_clk_disable,
 	.get_rate	= gen2_clk_get_rate,
 	.set_rate	= gen2_clk_set_rate,
diff --git a/drivers/clk/renesas/clk-rcar-gen3.c b/drivers/clk/renesas/clk-rcar-gen3.c
index 5745acf4023c..ae21f2a663f8 100644
--- a/drivers/clk/renesas/clk-rcar-gen3.c
+++ b/drivers/clk/renesas/clk-rcar-gen3.c
@@ -451,9 +451,9 @@ static int gen3_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 
 	return 0;
 }
 
-const struct clk_ops gen3_clk_ops = {
+const struct clk_ops_uboot gen3_clk_ops = {
 	.enable		= gen3_clk_enable,
 	.disable	= gen3_clk_disable,
 	.get_rate	= gen3_clk_get_rate,
 	.set_rate	= gen3_clk_set_rate,
diff --git a/drivers/clk/renesas/compound-clock.c b/drivers/clk/renesas/compound-clock.c
index 499a2598833c..2dc3e2e0deea 100644
--- a/drivers/clk/renesas/compound-clock.c
+++ b/drivers/clk/renesas/compound-clock.c
@@ -47,9 +47,9 @@ static ulong clk_compound_rate_set_rate(struct clk *clk, ulong rate)
 {
 	return 0;	/* Set rate is not forwarded to SCP */
 }
 
-const struct clk_ops clk_compound_rate_ops = {
+const struct clk_ops_uboot clk_compound_rate_ops = {
 	.enable		= clk_compound_rate_enable,
 	.disable	= clk_compound_rate_disable,
 	.get_rate	= clk_compound_rate_get_rate,
 	.set_rate	= clk_compound_rate_set_rate,
diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index d207bf615cee..3ef98237ba15 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1048,9 +1048,9 @@ static int r9a06g032_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *a
 
 	return 0;
 }
 
-static const struct clk_ops r9a06g032_clk_ops = {
+static const struct clk_ops_uboot r9a06g032_clk_ops = {
 	.enable		= r9a06g032_clk_enable,
 	.disable	= r9a06g032_clk_disable,
 	.get_rate	= r9a06g032_clk_get_rate,
 	.set_rate	= r9a06g032_clk_set_rate,
diff --git a/drivers/clk/renesas/rcar-gen2-cpg.h b/drivers/clk/renesas/rcar-gen2-cpg.h
index ca7c3ed6b544..e1f075b03597 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.h
+++ b/drivers/clk/renesas/rcar-gen2-cpg.h
@@ -42,7 +42,7 @@ struct gen2_clk_priv {
 
 int gen2_clk_probe(struct udevice *dev);
 int gen2_clk_remove(struct udevice *dev);
 
-extern const struct clk_ops gen2_clk_ops;
+extern const struct clk_ops_uboot gen2_clk_ops;
 
 #endif
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 4efb9b6ceefd..318fa9a3c741 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -165,7 +165,7 @@ struct gen3_clk_priv {
 };
 
 int gen3_cpg_bind(struct udevice *parent);
 
-extern const struct clk_ops gen3_clk_ops;
+extern const struct clk_ops_uboot gen3_clk_ops;
 
 #endif
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7fce1f70d138..03cb4f26d474 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -396,9 +396,9 @@ static ulong rzg2l_cpg_clk_set_rate(struct clk *clk, ulong rate)
 {
 	return rzg2l_cpg_clk_set_rate_by_id(clk->dev, clk->id, rate);
 }
 
-static const struct clk_ops rzg2l_cpg_clk_ops = {
+static const struct clk_ops_uboot rzg2l_cpg_clk_ops = {
 	.enable		= rzg2l_cpg_clk_enable,
 	.disable	= rzg2l_cpg_clk_disable,
 	.of_xlate	= rzg2l_cpg_clk_of_xlate,
 	.get_rate	= rzg2l_cpg_clk_get_rate,
diff --git a/drivers/clk/rockchip/clk_px30.c b/drivers/clk/rockchip/clk_px30.c
index b5054e84c326..6e7f745102d5 100644
--- a/drivers/clk/rockchip/clk_px30.c
+++ b/drivers/clk/rockchip/clk_px30.c
@@ -1424,9 +1424,9 @@ static int px30_clk_enable(struct clk *clk)
 	debug("%s: unsupported clk %ld\n", __func__, clk->id);
 	return -ENOENT;
 }
 
-static struct clk_ops px30_clk_ops = {
+static struct clk_ops_uboot px30_clk_ops = {
 	.get_rate = px30_clk_get_rate,
 	.set_rate = px30_clk_set_rate,
 #if CONFIG_IS_ENABLED(OF_REAL)
 	.set_parent = px30_clk_set_parent,
@@ -1738,9 +1738,9 @@ static ulong px30_pmuclk_set_rate(struct clk *clk, ulong rate)
 
 	return ret;
 }
 
-static struct clk_ops px30_pmuclk_ops = {
+static struct clk_ops_uboot px30_pmuclk_ops = {
 	.get_rate = px30_pmuclk_get_rate,
 	.set_rate = px30_pmuclk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rk3036.c b/drivers/clk/rockchip/clk_rk3036.c
index 274428f2b4bd..e575143341d9 100644
--- a/drivers/clk/rockchip/clk_rk3036.c
+++ b/drivers/clk/rockchip/clk_rk3036.c
@@ -311,9 +311,9 @@ static ulong rk3036_clk_set_rate(struct clk *clk, ulong rate)
 
 	return new_rate;
 }
 
-static struct clk_ops rk3036_clk_ops = {
+static struct clk_ops_uboot rk3036_clk_ops = {
 	.get_rate	= rk3036_clk_get_rate,
 	.set_rate	= rk3036_clk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rk3066.c b/drivers/clk/rockchip/clk_rk3066.c
index f7dea7859f74..9b6f7a2b6b00 100644
--- a/drivers/clk/rockchip/clk_rk3066.c
+++ b/drivers/clk/rockchip/clk_rk3066.c
@@ -624,9 +624,9 @@ static int rk3066_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops rk3066_clk_ops = {
+static struct clk_ops_uboot rk3066_clk_ops = {
 	.disable	= rk3066_clk_disable,
 	.enable	= rk3066_clk_enable,
 	.get_rate	= rk3066_clk_get_rate,
 	.set_rate	= rk3066_clk_set_rate,
diff --git a/drivers/clk/rockchip/clk_rk3128.c b/drivers/clk/rockchip/clk_rk3128.c
index a07285593b55..4665f0d31152 100644
--- a/drivers/clk/rockchip/clk_rk3128.c
+++ b/drivers/clk/rockchip/clk_rk3128.c
@@ -539,9 +539,9 @@ static ulong rk3128_clk_set_rate(struct clk *clk, ulong rate)
 
 	return new_rate;
 }
 
-static struct clk_ops rk3128_clk_ops = {
+static struct clk_ops_uboot rk3128_clk_ops = {
 	.get_rate	= rk3128_clk_get_rate,
 	.set_rate	= rk3128_clk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rk3188.c b/drivers/clk/rockchip/clk_rk3188.c
index d8b03e1d7ab3..1c75c2d9bf5b 100644
--- a/drivers/clk/rockchip/clk_rk3188.c
+++ b/drivers/clk/rockchip/clk_rk3188.c
@@ -530,9 +530,9 @@ static ulong rk3188_clk_set_rate(struct clk *clk, ulong rate)
 
 	return new_rate;
 }
 
-static struct clk_ops rk3188_clk_ops = {
+static struct clk_ops_uboot rk3188_clk_ops = {
 	.get_rate	= rk3188_clk_get_rate,
 	.set_rate	= rk3188_clk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rk322x.c b/drivers/clk/rockchip/clk_rk322x.c
index 9b71fd863bad..f40fe68de45b 100644
--- a/drivers/clk/rockchip/clk_rk322x.c
+++ b/drivers/clk/rockchip/clk_rk322x.c
@@ -467,9 +467,9 @@ static int rk322x_clk_set_parent(struct clk *clk, struct clk *parent)
 	debug("%s: unsupported clk %ld\n", __func__, clk->id);
 	return -ENOENT;
 }
 
-static struct clk_ops rk322x_clk_ops = {
+static struct clk_ops_uboot rk322x_clk_ops = {
 	.get_rate	= rk322x_clk_get_rate,
 	.set_rate	= rk322x_clk_set_rate,
 	.set_parent	= rk322x_clk_set_parent,
 };
diff --git a/drivers/clk/rockchip/clk_rk3288.c b/drivers/clk/rockchip/clk_rk3288.c
index a4ff1c41abb8..b672e728fb0a 100644
--- a/drivers/clk/rockchip/clk_rk3288.c
+++ b/drivers/clk/rockchip/clk_rk3288.c
@@ -945,9 +945,9 @@ static int __maybe_unused rk3288_clk_set_parent(struct clk *clk, struct clk *par
 	debug("%s: unsupported clk %ld\n", __func__, clk->id);
 	return -ENOENT;
 }
 
-static struct clk_ops rk3288_clk_ops = {
+static struct clk_ops_uboot rk3288_clk_ops = {
 	.get_rate	= rk3288_clk_get_rate,
 	.set_rate	= rk3288_clk_set_rate,
 #if CONFIG_IS_ENABLED(OF_REAL)
 	.set_parent	= rk3288_clk_set_parent,
diff --git a/drivers/clk/rockchip/clk_rk3308.c b/drivers/clk/rockchip/clk_rk3308.c
index e73bb6790af2..828d545f5fab 100644
--- a/drivers/clk/rockchip/clk_rk3308.c
+++ b/drivers/clk/rockchip/clk_rk3308.c
@@ -1128,9 +1128,9 @@ static int __maybe_unused rk3308_clk_set_parent(struct clk *clk, struct clk *par
 	return -ENOENT;
 }
 #endif
 
-static struct clk_ops rk3308_clk_ops = {
+static struct clk_ops_uboot rk3308_clk_ops = {
 	.get_rate = rk3308_clk_get_rate,
 	.set_rate = rk3308_clk_set_rate,
 #if CONFIG_IS_ENABLED(OF_REAL)
 	.set_parent = rk3308_clk_set_parent,
diff --git a/drivers/clk/rockchip/clk_rk3328.c b/drivers/clk/rockchip/clk_rk3328.c
index 7701a9734ee0..cb5df70bfaa0 100644
--- a/drivers/clk/rockchip/clk_rk3328.c
+++ b/drivers/clk/rockchip/clk_rk3328.c
@@ -886,9 +886,9 @@ static int rk3328_clk_set_parent(struct clk *clk, struct clk *parent)
 	debug("%s: unsupported clk %ld\n", __func__, clk->id);
 	return -ENOENT;
 }
 
-static struct clk_ops rk3328_clk_ops = {
+static struct clk_ops_uboot rk3328_clk_ops = {
 	.get_rate = rk3328_clk_get_rate,
 	.set_rate = rk3328_clk_set_rate,
 	.set_parent = rk3328_clk_set_parent,
 };
diff --git a/drivers/clk/rockchip/clk_rk3368.c b/drivers/clk/rockchip/clk_rk3368.c
index 630253fbb1df..9949ebaf23fe 100644
--- a/drivers/clk/rockchip/clk_rk3368.c
+++ b/drivers/clk/rockchip/clk_rk3368.c
@@ -569,9 +569,9 @@ static int __maybe_unused rk3368_clk_set_parent(struct clk *clk, struct clk *par
 	debug("%s: unsupported clk %ld\n", __func__, clk->id);
 	return -ENOENT;
 }
 
-static struct clk_ops rk3368_clk_ops = {
+static struct clk_ops_uboot rk3368_clk_ops = {
 	.get_rate = rk3368_clk_get_rate,
 	.set_rate = rk3368_clk_set_rate,
 #if CONFIG_IS_ENABLED(OF_REAL)
 	.set_parent = rk3368_clk_set_parent,
diff --git a/drivers/clk/rockchip/clk_rk3399.c b/drivers/clk/rockchip/clk_rk3399.c
index 6e87db18be07..976afc57f0b7 100644
--- a/drivers/clk/rockchip/clk_rk3399.c
+++ b/drivers/clk/rockchip/clk_rk3399.c
@@ -1363,9 +1363,9 @@ static int rk3399_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops rk3399_clk_ops = {
+static struct clk_ops_uboot rk3399_clk_ops = {
 	.get_rate = rk3399_clk_get_rate,
 	.set_rate = rk3399_clk_set_rate,
 #if CONFIG_IS_ENABLED(OF_REAL)
 	.set_parent = rk3399_clk_set_parent,
@@ -1651,9 +1651,9 @@ static ulong rk3399_pmuclk_set_rate(struct clk *clk, ulong rate)
 
 	return ret;
 }
 
-static struct clk_ops rk3399_pmuclk_ops = {
+static struct clk_ops_uboot rk3399_pmuclk_ops = {
 	.get_rate = rk3399_pmuclk_get_rate,
 	.set_rate = rk3399_pmuclk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rk3528.c b/drivers/clk/rockchip/clk_rk3528.c
index d58557ff56de..f81ff829db9d 100644
--- a/drivers/clk/rockchip/clk_rk3528.c
+++ b/drivers/clk/rockchip/clk_rk3528.c
@@ -1545,9 +1545,9 @@ static ulong rk3528_clk_set_rate(struct clk *clk, ulong rate)
 
 	return ret;
 };
 
-static struct clk_ops rk3528_clk_ops = {
+static struct clk_ops_uboot rk3528_clk_ops = {
 	.get_rate = rk3528_clk_get_rate,
 	.set_rate = rk3528_clk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rk3568.c b/drivers/clk/rockchip/clk_rk3568.c
index 533031caead6..e07838e2c82b 100644
--- a/drivers/clk/rockchip/clk_rk3568.c
+++ b/drivers/clk/rockchip/clk_rk3568.c
@@ -458,9 +458,9 @@ static int rk3568_pmuclk_set_parent(struct clk *clk, struct clk *parent)
 		return -ENOENT;
 	}
 }
 
-static struct clk_ops rk3568_pmuclk_ops = {
+static struct clk_ops_uboot rk3568_pmuclk_ops = {
 	.get_rate = rk3568_pmuclk_get_rate,
 	.set_rate = rk3568_pmuclk_set_rate,
 	.set_parent = rk3568_pmuclk_set_parent,
 };
@@ -2855,9 +2855,9 @@ static int rk3568_clk_set_parent(struct clk *clk, struct clk *parent)
 	return 0;
 }
 #endif
 
-static struct clk_ops rk3568_clk_ops = {
+static struct clk_ops_uboot rk3568_clk_ops = {
 	.get_rate = rk3568_clk_get_rate,
 	.set_rate = rk3568_clk_set_rate,
 #if (CONFIG_IS_ENABLED(OF_CONTROL)) || (!CONFIG_IS_ENABLED(OF_PLATDATA))
 	.set_parent = rk3568_clk_set_parent,
diff --git a/drivers/clk/rockchip/clk_rk3576.c b/drivers/clk/rockchip/clk_rk3576.c
index 125b08ee8322..60dc576bed4a 100644
--- a/drivers/clk/rockchip/clk_rk3576.c
+++ b/drivers/clk/rockchip/clk_rk3576.c
@@ -2355,9 +2355,9 @@ static int rk3576_clk_set_parent(struct clk *clk, struct clk *parent)
 	return 0;
 }
 #endif
 
-static struct clk_ops rk3576_clk_ops = {
+static struct clk_ops_uboot rk3576_clk_ops = {
 	.get_rate = rk3576_clk_get_rate,
 	.set_rate = rk3576_clk_set_rate,
 #if (IS_ENABLED(OF_CONTROL)) || (!IS_ENABLED(OF_PLATDATA))
 	.set_parent = rk3576_clk_set_parent,
diff --git a/drivers/clk/rockchip/clk_rk3588.c b/drivers/clk/rockchip/clk_rk3588.c
index 8c3a113526f9..3047f1630bcc 100644
--- a/drivers/clk/rockchip/clk_rk3588.c
+++ b/drivers/clk/rockchip/clk_rk3588.c
@@ -1911,9 +1911,9 @@ static int rk3588_clk_set_parent(struct clk *clk, struct clk *parent)
 	return 0;
 }
 #endif
 
-static struct clk_ops rk3588_clk_ops = {
+static struct clk_ops_uboot rk3588_clk_ops = {
 	.get_rate = rk3588_clk_get_rate,
 	.set_rate = rk3588_clk_set_rate,
 #if (CONFIG_IS_ENABLED(OF_CONTROL)) || (!CONFIG_IS_ENABLED(OF_PLATDATA))
 	.set_parent = rk3588_clk_set_parent,
@@ -2139,9 +2139,9 @@ static int rk3588_scru_clk_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static const struct clk_ops rk3588_scru_clk_ops = {
+static const struct clk_ops_uboot rk3588_scru_clk_ops = {
 	.get_rate = rk3588_scru_clk_get_rate,
 	.set_rate = rk3588_scru_clk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rv1108.c b/drivers/clk/rockchip/clk_rv1108.c
index 75202a66aa68..98e226ec61a0 100644
--- a/drivers/clk/rockchip/clk_rv1108.c
+++ b/drivers/clk/rockchip/clk_rv1108.c
@@ -624,9 +624,9 @@ static ulong rv1108_clk_set_rate(struct clk *clk, ulong rate)
 
 	return new_rate;
 }
 
-static const struct clk_ops rv1108_clk_ops = {
+static const struct clk_ops_uboot rv1108_clk_ops = {
 	.get_rate	= rv1108_clk_get_rate,
 	.set_rate	= rv1108_clk_set_rate,
 };
 
diff --git a/drivers/clk/rockchip/clk_rv1126.c b/drivers/clk/rockchip/clk_rv1126.c
index aeeea9569147..caa1512719eb 100644
--- a/drivers/clk/rockchip/clk_rv1126.c
+++ b/drivers/clk/rockchip/clk_rv1126.c
@@ -470,9 +470,9 @@ static int rv1126_pmuclk_set_parent(struct clk *clk, struct clk *parent)
 		return -ENOENT;
 	}
 }
 
-static struct clk_ops rv1126_pmuclk_ops = {
+static struct clk_ops_uboot rv1126_pmuclk_ops = {
 	.get_rate = rv1126_pmuclk_get_rate,
 	.set_rate = rv1126_pmuclk_set_rate,
 	.set_parent = rv1126_pmuclk_set_parent,
 };
@@ -1699,9 +1699,9 @@ static int rv1126_clk_set_parent(struct clk *clk, struct clk *parent)
 	return 0;
 }
 #endif
 
-static struct clk_ops rv1126_clk_ops = {
+static struct clk_ops_uboot rv1126_clk_ops = {
 	.get_rate = rv1126_clk_get_rate,
 	.set_rate = rv1126_clk_set_rate,
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 	.set_parent = rv1126_clk_set_parent,
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index de55504b5c90..dc84d4b6386d 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -701,9 +701,9 @@ static int sifive_prci_probe(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops sifive_prci_ops = {
+static struct clk_ops_uboot sifive_prci_ops = {
 	.set_rate = sifive_prci_set_rate,
 	.get_rate = sifive_prci_get_rate,
 	.enable = sifive_prci_enable,
 	.disable = sifive_prci_disable,
diff --git a/drivers/clk/sophgo/clk-cv1800b.c b/drivers/clk/sophgo/clk-cv1800b.c
index d946ea57a460..c8e5f7f53ea2 100644
--- a/drivers/clk/sophgo/clk-cv1800b.c
+++ b/drivers/clk/sophgo/clk-cv1800b.c
@@ -730,9 +730,9 @@ static int cv1800b_clk_set_parent(struct clk *clk, struct clk *parent)
 		return err;
 	return clk_set_parent(c, p);
 }
 
-const struct clk_ops cv1800b_clk_ops = {
+const struct clk_ops_uboot cv1800b_clk_ops = {
 	.enable = cv1800b_clk_enable,
 	.disable = cv1800b_clk_disable,
 	.get_rate = cv1800b_clk_get_rate,
 	.set_rate = cv1800b_clk_set_rate,
diff --git a/drivers/clk/sophgo/clk-ip.c b/drivers/clk/sophgo/clk-ip.c
index d571fa671b08..7ac631126721 100644
--- a/drivers/clk/sophgo/clk-ip.c
+++ b/drivers/clk/sophgo/clk-ip.c
@@ -47,9 +47,9 @@ static ulong gate_get_rate(struct clk *clk)
 {
 	return clk_get_parent_rate(clk);
 }
 
-const struct clk_ops cv1800b_clk_gate_ops = {
+const struct clk_ops_uboot cv1800b_clk_gate_ops = {
 	.disable = gate_disable,
 	.enable = gate_enable,
 	.get_rate = gate_get_rate,
 };
@@ -109,9 +109,9 @@ static ulong div_set_rate(struct clk *clk, ulong rate)
 
 	return DIV_ROUND_UP_ULL(parent_rate, val);
 }
 
-const struct clk_ops cv1800b_clk_div_ops = {
+const struct clk_ops_uboot cv1800b_clk_div_ops = {
 	.disable = div_disable,
 	.enable = div_enable,
 	.get_rate = div_get_rate,
 	.set_rate = div_set_rate,
@@ -162,9 +162,9 @@ static int bypass_div_set_parent(struct clk *clk, struct clk *pclk)
 	cv1800b_clk_clrbit(div->div.base, &div->bypass);
 	return 0;
 }
 
-const struct clk_ops cv1800b_clk_bypass_div_ops = {
+const struct clk_ops_uboot cv1800b_clk_bypass_div_ops = {
 	.disable = div_disable,
 	.enable = div_enable,
 	.get_rate = bypass_div_get_rate,
 	.set_rate = bypass_div_set_rate,
@@ -202,9 +202,9 @@ static ulong fixed_div_get_rate(struct clk *clk)
 
 	return DIV_ROUND_UP_ULL(clk_get_parent_rate(clk), div->div);
 }
 
-const struct clk_ops cv1800b_clk_fixed_div_ops = {
+const struct clk_ops_uboot cv1800b_clk_fixed_div_ops = {
 	.disable = fixed_div_disable,
 	.enable = fixed_div_enable,
 	.get_rate = fixed_div_get_rate,
 };
@@ -246,9 +246,9 @@ static int bypass_fixed_div_set_parent(struct clk *clk, struct clk *pclk)
 	cv1800b_clk_clrbit(div->div.base, &div->bypass);
 	return 0;
 }
 
-const struct clk_ops cv1800b_clk_bypass_fixed_div_ops = {
+const struct clk_ops_uboot cv1800b_clk_bypass_fixed_div_ops = {
 	.disable = fixed_div_disable,
 	.enable = fixed_div_enable,
 	.get_rate = bypass_fixed_div_get_rate,
 	.set_parent = bypass_fixed_div_set_parent,
@@ -319,9 +319,9 @@ static int mux_set_parent(struct clk *clk, struct clk *pclk)
 	cv1800b_clk_setfield(mux->base, &mux->mux, index);
 	return 0;
 }
 
-const struct clk_ops cv1800b_clk_mux_ops = {
+const struct clk_ops_uboot cv1800b_clk_mux_ops = {
 	.disable = mux_disable,
 	.enable = mux_enable,
 	.get_rate = mux_get_rate,
 	.set_rate = mux_set_rate,
@@ -377,9 +377,9 @@ static int bypass_mux_set_parent(struct clk *clk, struct clk *pclk)
 	cv1800b_clk_setfield(mux->mux.base, &mux->mux.mux, index);
 	return 0;
 }
 
-const struct clk_ops cv1800b_clk_bypass_mux_ops = {
+const struct clk_ops_uboot cv1800b_clk_bypass_mux_ops = {
 	.disable = mux_disable,
 	.enable = mux_enable,
 	.get_rate = bypass_mux_get_rate,
 	.set_rate = bypass_mux_set_rate,
@@ -488,9 +488,9 @@ static int mmux_set_parent(struct clk *clk, struct clk *pclk)
 	cv1800b_clk_setfield(mmux->base, &mmux->mux[clk_sel], index);
 	return 0;
 }
 
-const struct clk_ops cv1800b_clk_mmux_ops = {
+const struct clk_ops_uboot cv1800b_clk_mmux_ops = {
 	.disable = mmux_disable,
 	.enable = mmux_enable,
 	.get_rate = mmux_get_rate,
 	.set_rate = mmux_set_rate,
@@ -578,9 +578,9 @@ static ulong aclk_set_rate(struct clk *clk, ulong rate)
 
 	return DIV_ROUND_UP_ULL(parent_rate * n, m * 2);
 }
 
-const struct clk_ops cv1800b_clk_audio_ops = {
+const struct clk_ops_uboot cv1800b_clk_audio_ops = {
 	.disable = aclk_disable,
 	.enable = aclk_enable,
 	.get_rate = aclk_get_rate,
 	.set_rate = aclk_set_rate,
diff --git a/drivers/clk/sophgo/clk-ip.h b/drivers/clk/sophgo/clk-ip.h
index 09d15d86dc9a..b2ad044523c8 100644
--- a/drivers/clk/sophgo/clk-ip.h
+++ b/drivers/clk/sophgo/clk-ip.h
@@ -274,15 +274,15 @@ struct cv1800b_clk_audio {
 		.n = CV1800B_CLK_REGFIELD(_n_offset, _n_shift,		\
 					  _n_width),			\
 	}
 
-extern const struct clk_ops cv1800b_clk_gate_ops;
-extern const struct clk_ops cv1800b_clk_div_ops;
-extern const struct clk_ops cv1800b_clk_bypass_div_ops;
-extern const struct clk_ops cv1800b_clk_fixed_div_ops;
-extern const struct clk_ops cv1800b_clk_bypass_fixed_div_ops;
-extern const struct clk_ops cv1800b_clk_mux_ops;
-extern const struct clk_ops cv1800b_clk_bypass_mux_ops;
-extern const struct clk_ops cv1800b_clk_mmux_ops;
-extern const struct clk_ops cv1800b_clk_audio_ops;
+extern const struct clk_ops_uboot cv1800b_clk_gate_ops;
+extern const struct clk_ops_uboot cv1800b_clk_div_ops;
+extern const struct clk_ops_uboot cv1800b_clk_bypass_div_ops;
+extern const struct clk_ops_uboot cv1800b_clk_fixed_div_ops;
+extern const struct clk_ops_uboot cv1800b_clk_bypass_fixed_div_ops;
+extern const struct clk_ops_uboot cv1800b_clk_mux_ops;
+extern const struct clk_ops_uboot cv1800b_clk_bypass_mux_ops;
+extern const struct clk_ops_uboot cv1800b_clk_mmux_ops;
+extern const struct clk_ops_uboot cv1800b_clk_audio_ops;
 
 #endif /* __CLK_SOPHGO_IP_H__ */
diff --git a/drivers/clk/sophgo/clk-pll.c b/drivers/clk/sophgo/clk-pll.c
index c99aa0b4e440..6ef50f00171d 100644
--- a/drivers/clk/sophgo/clk-pll.c
+++ b/drivers/clk/sophgo/clk-pll.c
@@ -111,9 +111,9 @@ static ulong cv1800b_ipll_set_rate(struct clk *clk, ulong rate)
 
 	return -EINVAL;
 }
 
-const struct clk_ops cv1800b_ipll_ops = {
+const struct clk_ops_uboot cv1800b_ipll_ops = {
 	.enable = cv1800b_ipll_enable,
 	.disable = cv1800b_ipll_disable,
 	.get_rate = cv1800b_ipll_get_rate,
 	.set_rate = cv1800b_ipll_set_rate,
@@ -258,9 +258,9 @@ static int cv1800b_fpll_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-const struct clk_ops cv1800b_fpll_ops = {
+const struct clk_ops_uboot cv1800b_fpll_ops = {
 	.enable = cv1800b_ipll_enable,
 	.disable = cv1800b_ipll_disable,
 	.get_rate = cv1800b_fpll_get_rate,
 	.set_rate = cv1800b_fpll_set_rate,
diff --git a/drivers/clk/sophgo/clk-pll.h b/drivers/clk/sophgo/clk-pll.h
index bea9bd8a4370..382209fd0e2e 100644
--- a/drivers/clk/sophgo/clk-pll.h
+++ b/drivers/clk/sophgo/clk-pll.h
@@ -67,8 +67,8 @@ struct cv1800b_clk_fpll {
 			.set = _syn_set_offset,					\
 		},								\
 	}
 
-extern const struct clk_ops cv1800b_ipll_ops;
-extern const struct clk_ops cv1800b_fpll_ops;
+extern const struct clk_ops_uboot cv1800b_ipll_ops;
+extern const struct clk_ops_uboot cv1800b_fpll_ops;
 
 #endif /* __clk_SOPHGO_PLL_H__ */
diff --git a/drivers/clk/starfive/clk-jh7110-pll.c b/drivers/clk/starfive/clk-jh7110-pll.c
index f8af17227c50..d12dec9a1f86 100644
--- a/drivers/clk/starfive/clk-jh7110-pll.c
+++ b/drivers/clk/starfive/clk-jh7110-pll.c
@@ -313,9 +313,9 @@ static ulong jh7110_pllx_set_rate(struct clk *clk, ulong drate)
 
 	return jh7110_pllx_recalc_rate(clk);
 }
 
-static const struct clk_ops jh7110_clk_pllx_ops = {
+static const struct clk_ops_uboot jh7110_clk_pllx_ops = {
 	.set_rate	= jh7110_pllx_set_rate,
 	.get_rate	= jh7110_pllx_recalc_rate,
 };
 
diff --git a/drivers/clk/starfive/clk.h b/drivers/clk/starfive/clk.h
index 9d20ed0bbaba..c0bb740f5e13 100644
--- a/drivers/clk/starfive/clk.h
+++ b/drivers/clk/starfive/clk.h
@@ -10,9 +10,9 @@
 /* the number of fixed clocks in DTS */
 #define JH7110_EXTCLK_END	12
 
 #define _JH7110_CLK_OPS(_name)					\
-static const struct clk_ops jh7110_##_name##_clk_ops = {	\
+static const struct clk_ops_uboot jh7110_##_name##_clk_ops = {	\
 	.set_rate = ccf_clk_set_rate,				\
 	.get_rate = ccf_clk_get_rate,				\
 	.set_parent = ccf_clk_set_parent,			\
 	.enable = ccf_clk_enable,				\
diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index cd6bdee5412f..834f0d8379e3 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -120,16 +120,16 @@ ulong clk_stm32_get_rate_by_index(struct udevice *dev, int index)
 
 	return 0;
 }
 
-static const struct clk_ops *clk_dev_ops(struct udevice *dev)
+static const struct clk_ops_uboot *clk_dev_ops(struct udevice *dev)
 {
-	return (const struct clk_ops *)dev->driver->ops;
+	return (const struct clk_ops_uboot *)dev->driver->ops;
 }
 
 static int stm32_clk_endisable(struct clk *clk, bool enable)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *c = NULL;
 
 	if (!clk->id || clk_get_by_id(clk->id, &c))
 		return -ENOENT;
@@ -152,9 +152,9 @@ static int stm32_clk_disable(struct clk *clk)
 }
 
 static ulong stm32_clk_get_rate(struct clk *clk)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *c = NULL;
 
 	if (!clk->id || clk_get_by_id(clk->id, &c))
 		return -ENOENT;
@@ -167,9 +167,9 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 }
 
 static ulong stm32_clk_set_rate(struct clk *clk, unsigned long clk_rate)
 {
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	struct clk *c = NULL;
 
 	if (!clk->id || clk_get_by_id(clk->id, &c))
 		return -ENOENT;
@@ -180,9 +180,9 @@ static ulong stm32_clk_set_rate(struct clk *clk, unsigned long clk_rate)
 
 	return ops->set_rate(c, clk_rate);
 }
 
-const struct clk_ops stm32_clk_ops = {
+const struct clk_ops_uboot stm32_clk_ops = {
 	.enable = stm32_clk_enable,
 	.disable = stm32_clk_disable,
 	.get_rate = stm32_clk_get_rate,
 	.set_rate = stm32_clk_set_rate,
@@ -238,9 +238,9 @@ static int clk_stm32_gate_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops clk_stm32_gate_ops = {
+static const struct clk_ops_uboot clk_stm32_gate_ops = {
 	.enable = clk_stm32_gate_enable,
 	.disable = clk_stm32_gate_disable,
 	.get_rate = clk_generic_get_rate,
 };
@@ -303,13 +303,13 @@ clk_stm32_register_composite(struct udevice *dev,
 	struct clk_mux *mux = NULL;
 	struct clk_stm32_gate *gate = NULL;
 	struct clk_divider *div = NULL;
 	struct clk *mux_clk = NULL;
-	const struct clk_ops *mux_ops = NULL;
+	const struct clk_ops_uboot *mux_ops = NULL;
 	struct clk *gate_clk = NULL;
-	const struct clk_ops *gate_ops = NULL;
+	const struct clk_ops_uboot *gate_ops = NULL;
 	struct clk *div_clk = NULL;
-	const struct clk_ops *div_ops = NULL;
+	const struct clk_ops_uboot *div_ops = NULL;
 	struct stm32mp_rcc_priv *priv = dev_get_priv(dev);
 	const struct clk_stm32_clock_data *data = priv->clock_data;
 	int i, ret;
 
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index 3134e33aa6c3..789420d7844c 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -287,7 +287,7 @@ struct stm32_clk_composite_cfg {
 	}, \
 	.setup		= clk_stm32_register_composite, \
 }
 
-extern const struct clk_ops stm32_clk_ops;
+extern const struct clk_ops_uboot stm32_clk_ops;
 
 ulong clk_stm32_get_rate_by_index(struct udevice *dev, int index);
diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
index fceb3c44b94e..6c3a369797d9 100644
--- a/drivers/clk/stm32/clk-stm32f.c
+++ b/drivers/clk/stm32/clk-stm32f.c
@@ -716,9 +716,9 @@ static int stm32_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 
 	return 0;
 }
 
-static struct clk_ops stm32_clk_ops = {
+static struct clk_ops_uboot stm32_clk_ops = {
 	.of_xlate	= stm32_clk_of_xlate,
 	.enable		= stm32_clk_enable,
 	.get_rate	= stm32_clk_get_rate,
 	.set_rate	= stm32_set_rate,
diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
index df82db69738a..611c7e4fb4af 100644
--- a/drivers/clk/stm32/clk-stm32h7.c
+++ b/drivers/clk/stm32/clk-stm32h7.c
@@ -869,9 +869,9 @@ static int stm32_clk_of_xlate(struct clk *clk,
 
 	return 0;
 }
 
-static struct clk_ops stm32_clk_ops = {
+static struct clk_ops_uboot stm32_clk_ops = {
 	.of_xlate	= stm32_clk_of_xlate,
 	.enable		= stm32_clk_enable,
 	.get_rate	= stm32_clk_get_rate,
 };
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 823ce132d0b0..a7d0b55e060b 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -2309,9 +2309,9 @@ static int stm32mp1_clk_probe(struct udevice *dev)
 
 	return result;
 }
 
-static const struct clk_ops stm32mp1_clk_ops = {
+static const struct clk_ops_uboot stm32mp1_clk_ops = {
 	.enable = stm32mp1_clk_enable,
 	.disable = stm32mp1_clk_disable,
 	.get_rate = stm32mp1_clk_get_rate,
 	.set_rate = stm32mp1_clk_set_rate,
diff --git a/drivers/clk/sunxi/clk_sun6i_rtc.c b/drivers/clk/sunxi/clk_sun6i_rtc.c
index 697b187a8235..a60e88500413 100644
--- a/drivers/clk/sunxi/clk_sun6i_rtc.c
+++ b/drivers/clk/sunxi/clk_sun6i_rtc.c
@@ -11,9 +11,9 @@ static int clk_sun6i_rtc_enable(struct clk *clk)
 {
 	return 0;
 }
 
-static const struct clk_ops clk_sun6i_rtc_ops = {
+static const struct clk_ops_uboot clk_sun6i_rtc_ops = {
 	.enable = clk_sun6i_rtc_enable,
 };
 
 static const struct udevice_id sun6i_rtc_ids[] = {
diff --git a/drivers/clk/sunxi/clk_sunxi.c b/drivers/clk/sunxi/clk_sunxi.c
index 842a0541bd60..315679f63a6a 100644
--- a/drivers/clk/sunxi/clk_sunxi.c
+++ b/drivers/clk/sunxi/clk_sunxi.c
@@ -63,9 +63,9 @@ static int sunxi_clk_disable(struct clk *clk)
 {
 	return sunxi_set_gate(clk, false);
 }
 
-struct clk_ops sunxi_clk_ops = {
+struct clk_ops_uboot sunxi_clk_ops = {
 	.enable = sunxi_clk_enable,
 	.disable = sunxi_clk_disable,
 };
 
diff --git a/drivers/clk/tegra/tegra-car-clk.c b/drivers/clk/tegra/tegra-car-clk.c
index 880dd4f6ece9..6e315f502aa5 100644
--- a/drivers/clk/tegra/tegra-car-clk.c
+++ b/drivers/clk/tegra/tegra-car-clk.c
@@ -99,9 +99,9 @@ static int tegra_car_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops tegra_car_clk_ops = {
+static struct clk_ops_uboot tegra_car_clk_ops = {
 	.request = tegra_car_clk_request,
 	.get_rate = tegra_car_clk_get_rate,
 	.set_rate = tegra_car_clk_set_rate,
 	.enable = tegra_car_clk_enable,
diff --git a/drivers/clk/tegra/tegra186-clk.c b/drivers/clk/tegra/tegra186-clk.c
index ec52326c3b36..99e0a9f28d9c 100644
--- a/drivers/clk/tegra/tegra186-clk.c
+++ b/drivers/clk/tegra/tegra186-clk.c
@@ -80,9 +80,9 @@ static int tegra186_clk_disable(struct clk *clk)
 
 	return tegra186_clk_en_dis(clk, CMD_CLK_DISABLE);
 }
 
-static struct clk_ops tegra186_clk_ops = {
+static struct clk_ops_uboot tegra186_clk_ops = {
 	.get_rate = tegra186_clk_get_rate,
 	.set_rate = tegra186_clk_set_rate,
 	.enable = tegra186_clk_enable,
 	.disable = tegra186_clk_disable,
diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 6899e1b595a7..16188d56f73a 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -223,9 +223,9 @@ static int ccu_div_enable(struct clk *clk)
 
 	return ccu_enable_helper(&cd->common, cd->enable);
 }
 
-static const struct clk_ops ccu_div_ops = {
+static const struct clk_ops_uboot ccu_div_ops = {
 	.disable	= ccu_div_disable,
 	.enable		= ccu_div_enable,
 	.set_parent	= ccu_div_set_parent,
 	.get_rate	= ccu_div_get_rate,
@@ -294,9 +294,9 @@ static unsigned long ccu_pll_get_rate(struct clk *clk)
 
 	return rate;
 }
 
-static const struct clk_ops clk_pll_ops = {
+static const struct clk_ops_uboot clk_pll_ops = {
 	.get_rate	= ccu_pll_get_rate,
 };
 
 U_BOOT_DRIVER(th1520_clk_pll) = {
@@ -1017,9 +1017,9 @@ static int th1520_clk_set_parent(struct clk *clk, struct clk *parent)
 
 	return clk_set_parent(c, p);
 }
 
-static const struct clk_ops th1520_clk_ops = {
+static const struct clk_ops_uboot th1520_clk_ops = {
 	.enable		= th1520_clk_enable,
 	.disable	= th1520_clk_disable,
 	.get_rate	= th1520_clk_get_rate,
 	.set_rate	= th1520_clk_set_rate,
diff --git a/drivers/clk/ti/clk-am3-dpll-x2.c b/drivers/clk/ti/clk-am3-dpll-x2.c
index 1b0b9818cdd4..cd864c47f004 100644
--- a/drivers/clk/ti/clk-am3-dpll-x2.c
+++ b/drivers/clk/ti/clk-am3-dpll-x2.c
@@ -29,9 +29,9 @@ static ulong clk_ti_am3_dpll_x2_get_rate(struct clk *clk)
 	dev_dbg(clk->dev, "rate=%ld\n", rate);
 	return rate;
 }
 
-const struct clk_ops clk_ti_am3_dpll_x2_ops = {
+const struct clk_ops_uboot clk_ti_am3_dpll_x2_ops = {
 	.get_rate = clk_ti_am3_dpll_x2_get_rate,
 };
 
 static int clk_ti_am3_dpll_x2_remove(struct udevice *dev)
diff --git a/drivers/clk/ti/clk-am3-dpll.c b/drivers/clk/ti/clk-am3-dpll.c
index 21ec01f8dd9a..1726233df173 100644
--- a/drivers/clk/ti/clk-am3-dpll.c
+++ b/drivers/clk/ti/clk-am3-dpll.c
@@ -274,9 +274,9 @@ static ulong clk_ti_am3_dpll_get_rate(struct clk *clk)
 	dev_dbg(clk->dev, "rate=%lld\n", rate);
 	return rate;
 }
 
-const struct clk_ops clk_ti_am3_dpll_ops = {
+const struct clk_ops_uboot clk_ti_am3_dpll_ops = {
 	.round_rate = clk_ti_am3_dpll_round_rate,
 	.get_rate = clk_ti_am3_dpll_get_rate,
 	.set_rate = clk_ti_am3_dpll_set_rate,
 };
diff --git a/drivers/clk/ti/clk-ctrl.c b/drivers/clk/ti/clk-ctrl.c
index c5c97dc35c4d..8e8bb60d91bf 100644
--- a/drivers/clk/ti/clk-ctrl.c
+++ b/drivers/clk/ti/clk-ctrl.c
@@ -131,9 +131,9 @@ static int clk_ti_ctrl_of_to_plat(struct udevice *dev)
 
 	return 0;
 }
 
-static struct clk_ops clk_ti_ctrl_ops = {
+static struct clk_ops_uboot clk_ti_ctrl_ops = {
 	.of_xlate = clk_ti_ctrl_of_xlate,
 	.enable = clk_ti_ctrl_enable,
 	.disable = clk_ti_ctrl_disable,
 	.get_rate = clk_ti_ctrl_get_rate,
diff --git a/drivers/clk/ti/clk-divider.c b/drivers/clk/ti/clk-divider.c
index 40a742d7fdc4..f959b5633d64 100644
--- a/drivers/clk/ti/clk-divider.c
+++ b/drivers/clk/ti/clk-divider.c
@@ -242,9 +242,9 @@ static int clk_ti_divider_request(struct clk *clk)
 	clk->flags = priv->flags;
 	return 0;
 }
 
-const struct clk_ops clk_ti_divider_ops = {
+const struct clk_ops_uboot clk_ti_divider_ops = {
 	.request = clk_ti_divider_request,
 	.round_rate = clk_ti_divider_round_rate,
 	.get_rate = clk_ti_divider_get_rate,
 	.set_rate = clk_ti_divider_set_rate
diff --git a/drivers/clk/ti/clk-gate.c b/drivers/clk/ti/clk-gate.c
index 873ceb8a2ab7..fb0ccf480dee 100644
--- a/drivers/clk/ti/clk-gate.c
+++ b/drivers/clk/ti/clk-gate.c
@@ -72,9 +72,9 @@ static int clk_ti_gate_of_to_plat(struct udevice *dev)
 	priv->invert_enable = dev_read_bool(dev, "ti,set-bit-to-disable");
 	return 0;
 }
 
-static struct clk_ops clk_ti_gate_ops = {
+static struct clk_ops_uboot clk_ti_gate_ops = {
 	.enable = clk_ti_gate_enable,
 	.disable = clk_ti_gate_disable,
 };
 
diff --git a/drivers/clk/ti/clk-k3-pll.c b/drivers/clk/ti/clk-k3-pll.c
index b775bd55faab..9766f50a2e4d 100644
--- a/drivers/clk/ti/clk-k3-pll.c
+++ b/drivers/clk/ti/clk-k3-pll.c
@@ -498,9 +498,9 @@ static ulong ti_pll_clk_set_rate(struct clk *clk, ulong rate)
 }
 
 
 
-static const struct clk_ops ti_pll_clk_ops = {
+static const struct clk_ops_uboot ti_pll_clk_ops = {
 	.get_rate = ti_pll_clk_get_rate,
 	.set_rate = ti_pll_clk_set_rate,
 	.enable = ti_pll_clk_enable,
 	.disable = ti_pll_clk_disable,
diff --git a/drivers/clk/ti/clk-k3.c b/drivers/clk/ti/clk-k3.c
index b38e559e45a6..cb7e016c637a 100644
--- a/drivers/clk/ti/clk-k3.c
+++ b/drivers/clk/ti/clk-k3.c
@@ -263,9 +263,9 @@ static ulong ti_clk_set_rate(struct clk *clk, ulong rate)
 	struct ti_clk_data *data = dev_get_priv(clk->dev);
 	struct clk *clkp = data->map[clk->id].clk;
 	int div = 1;
 	ulong child_rate;
-	const struct clk_ops *ops;
+	const struct clk_ops_uboot *ops;
 	ulong new_rate, rem;
 	ulong diff, new_diff;
 	int freq_scale_up = rate >= ti_clk_get_rate(clk) ? 1 : 0;
 
@@ -404,9 +404,9 @@ static const struct udevice_id ti_clk_of_match[] = {
 	{ .compatible = "ti,k2g-sci-clk" },
 	{ /* sentinel */ },
 };
 
-static const struct clk_ops ti_clk_ops = {
+static const struct clk_ops_uboot ti_clk_ops = {
 	.of_xlate = ti_clk_of_xlate,
 	.set_rate = ti_clk_set_rate,
 	.get_rate = ti_clk_get_rate,
 	.enable = ti_clk_enable,
diff --git a/drivers/clk/ti/clk-mux.c b/drivers/clk/ti/clk-mux.c
index db5393414318..60bdde35e510 100644
--- a/drivers/clk/ti/clk-mux.c
+++ b/drivers/clk/ti/clk-mux.c
@@ -170,9 +170,9 @@ static int clk_ti_mux_request(struct clk *clk)
 
 	return clk_ti_mux_set_parent(clk, parent);
 }
 
-static struct clk_ops clk_ti_mux_ops = {
+static struct clk_ops_uboot clk_ti_mux_ops = {
 	.request = clk_ti_mux_request,
 	.round_rate = clk_ti_mux_round_rate,
 	.get_rate = clk_ti_mux_get_rate,
 	.set_rate = clk_ti_mux_set_rate,
diff --git a/drivers/clk/ti/clk-sci.c b/drivers/clk/ti/clk-sci.c
index e374bd3bcc20..fdf49a759983 100644
--- a/drivers/clk/ti/clk-sci.c
+++ b/drivers/clk/ti/clk-sci.c
@@ -195,9 +195,9 @@ static const struct udevice_id ti_sci_clk_of_match[] = {
 	{ .compatible = "ti,k2g-sci-clk" },
 	{ /* sentinel */ },
 };
 
-static struct clk_ops ti_sci_clk_ops = {
+static struct clk_ops_uboot ti_sci_clk_ops = {
 	.of_xlate = ti_sci_clk_of_xlate,
 	.get_rate = ti_sci_clk_get_rate,
 	.set_rate = ti_sci_clk_set_rate,
 	.set_parent = ti_sci_clk_set_parent,
diff --git a/drivers/clk/uccf/clk-composite.c b/drivers/clk/uccf/clk-composite.c
index 207224b13208..0fdc8c2e6fec 100644
--- a/drivers/clk/uccf/clk-composite.c
+++ b/drivers/clk/uccf/clk-composite.c
@@ -35,9 +35,9 @@ static u8 clk_composite_get_parent(struct clk *clk)
 static int clk_composite_set_parent(struct clk *clk, struct clk *parent)
 {
 	struct clk_composite *composite = to_clk_composite(clk_dev_binded(clk) ?
 		(struct clk *)dev_get_clk_ptr(clk->dev) : clk);
-	const struct clk_ops *mux_ops = composite->mux_ops;
+	const struct clk_ops_uboot *mux_ops = composite->mux_ops;
 	struct clk *mux = composite->mux;
 
 	if (!mux || !mux_ops)
 		return -ENOSYS;
@@ -48,9 +48,9 @@ static int clk_composite_set_parent(struct clk *clk, struct clk *parent)
 static unsigned long clk_composite_recalc_rate(struct clk *clk)
 {
 	struct clk_composite *composite = to_clk_composite(clk_dev_binded(clk) ?
 		(struct clk *)dev_get_clk_ptr(clk->dev) : clk);
-	const struct clk_ops *rate_ops = composite->rate_ops;
+	const struct clk_ops_uboot *rate_ops = composite->rate_ops;
 	struct clk *rate = composite->rate;
 
 	if (rate && rate_ops)
 		return rate_ops->get_rate(rate);
@@ -61,9 +61,9 @@ static unsigned long clk_composite_recalc_rate(struct clk *clk)
 static ulong clk_composite_set_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk_composite *composite = to_clk_composite(clk_dev_binded(clk) ?
 		(struct clk *)dev_get_clk_ptr(clk->dev) : clk);
-	const struct clk_ops *rate_ops = composite->rate_ops;
+	const struct clk_ops_uboot *rate_ops = composite->rate_ops;
 	struct clk *clk_rate = composite->rate;
 
 	if (rate && rate_ops && rate_ops->set_rate)
 		return rate_ops->set_rate(clk_rate, rate);
@@ -74,9 +74,9 @@ static ulong clk_composite_set_rate(struct clk *clk, unsigned long rate)
 static int clk_composite_enable(struct clk *clk)
 {
 	struct clk_composite *composite = to_clk_composite(clk_dev_binded(clk) ?
 		(struct clk *)dev_get_clk_ptr(clk->dev) : clk);
-	const struct clk_ops *gate_ops = composite->gate_ops;
+	const struct clk_ops_uboot *gate_ops = composite->gate_ops;
 	struct clk *gate = composite->gate;
 
 	if (gate && gate_ops)
 		return gate_ops->enable(gate);
@@ -87,9 +87,9 @@ static int clk_composite_enable(struct clk *clk)
 static int clk_composite_disable(struct clk *clk)
 {
 	struct clk_composite *composite = to_clk_composite(clk_dev_binded(clk) ?
 		(struct clk *)dev_get_clk_ptr(clk->dev) : clk);
-	const struct clk_ops *gate_ops = composite->gate_ops;
+	const struct clk_ops_uboot *gate_ops = composite->gate_ops;
 	struct clk *gate = composite->gate;
 
 	if (gate && gate_ops)
 		return gate_ops->disable(gate);
@@ -99,13 +99,13 @@ static int clk_composite_disable(struct clk *clk)
 
 struct clk *clk_register_composite(struct udevice *dev, const char *name,
 				   const char * const *parent_names,
 				   int num_parents, struct clk *mux,
-				   const struct clk_ops *mux_ops,
+				   const struct clk_ops_uboot *mux_ops,
 				   struct clk *rate,
-				   const struct clk_ops *rate_ops,
+				   const struct clk_ops_uboot *rate_ops,
 				   struct clk *gate,
-				   const struct clk_ops *gate_ops,
+				   const struct clk_ops_uboot *gate_ops,
 				   unsigned long flags)
 {
 	struct clk *clk;
 	struct clk_composite *composite;
@@ -170,9 +170,9 @@ err:
 	kfree(composite);
 	return clk;
 }
 
-static const struct clk_ops clk_composite_ops = {
+static const struct clk_ops_uboot clk_composite_ops = {
 	.set_parent = clk_composite_set_parent,
 	.get_rate = clk_composite_recalc_rate,
 	.set_rate = clk_composite_set_rate,
 	.enable = clk_composite_enable,
diff --git a/drivers/clk/uccf/clk-divider.c b/drivers/clk/uccf/clk-divider.c
index e692b9c2167d..8d65fd94c176 100644
--- a/drivers/clk/uccf/clk-divider.c
+++ b/drivers/clk/uccf/clk-divider.c
@@ -177,9 +177,9 @@ static ulong clk_divider_set_rate(struct clk *clk, unsigned long rate)
 
 	return clk_get_rate(clk);
 }
 
-const struct clk_ops clk_divider_ops = {
+const struct clk_ops_uboot clk_divider_ops = {
 	.get_rate = clk_divider_recalc_rate,
 	.set_rate = clk_divider_set_rate,
 };
 
diff --git a/drivers/clk/uccf/clk-fixed-factor.c b/drivers/clk/uccf/clk-fixed-factor.c
index 4eb8be728e65..0fdfcdf2f90a 100644
--- a/drivers/clk/uccf/clk-fixed-factor.c
+++ b/drivers/clk/uccf/clk-fixed-factor.c
@@ -32,9 +32,9 @@ static ulong clk_factor_recalc_rate(struct clk *clk)
 	do_div(rate, fix->div);
 	return (ulong)rate;
 }
 
-const struct clk_ops ccf_clk_fixed_factor_ops = {
+const struct clk_ops_uboot ccf_clk_fixed_factor_ops = {
 	.get_rate = clk_factor_recalc_rate,
 };
 
 struct clk *clk_hw_register_fixed_factor(struct udevice *dev,
diff --git a/drivers/clk/uccf/clk-gate.c b/drivers/clk/uccf/clk-gate.c
index 256ff1089917..e5883aec2474 100644
--- a/drivers/clk/uccf/clk-gate.c
+++ b/drivers/clk/uccf/clk-gate.c
@@ -110,9 +110,9 @@ int clk_gate_is_enabled(struct clk *clk)
 
 	return reg ? 1 : 0;
 }
 
-const struct clk_ops clk_gate_ops = {
+const struct clk_ops_uboot clk_gate_ops = {
 	.enable = clk_gate_enable,
 	.disable = clk_gate_disable,
 	.get_rate = clk_generic_get_rate,
 };
diff --git a/drivers/clk/uccf/clk-mux.c b/drivers/clk/uccf/clk-mux.c
index d7411f8f2822..06836369be1d 100644
--- a/drivers/clk/uccf/clk-mux.c
+++ b/drivers/clk/uccf/clk-mux.c
@@ -158,9 +158,9 @@ static int clk_mux_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-const struct clk_ops clk_mux_ops = {
+const struct clk_ops_uboot clk_mux_ops = {
 	.get_rate = clk_generic_get_rate,
 	.set_parent = clk_mux_set_parent,
 };
 
diff --git a/drivers/clk/uccf/clk.c b/drivers/clk/uccf/clk.c
index b8c2e8d531b9..f04b3b23dbd1 100644
--- a/drivers/clk/uccf/clk.c
+++ b/drivers/clk/uccf/clk.c
@@ -132,9 +132,9 @@ int ccf_clk_disable(struct clk *clk)
 {
 	return ccf_clk_endisable(clk, false);
 }
 
-const struct clk_ops ccf_clk_ops = {
+const struct clk_ops_uboot ccf_clk_ops = {
 	.set_rate = ccf_clk_set_rate,
 	.get_rate = ccf_clk_get_rate,
 	.set_parent = ccf_clk_set_parent,
 	.enable = ccf_clk_enable,
diff --git a/drivers/clk/uccf/clk_sandbox_uccf.c b/drivers/clk/uccf/clk_sandbox_uccf.c
index 9c74ed940acd..9c7dc5007134 100644
--- a/drivers/clk/uccf/clk_sandbox_uccf.c
+++ b/drivers/clk/uccf/clk_sandbox_uccf.c
@@ -46,9 +46,9 @@ static ulong clk_pllv3_get_rate(struct clk *clk)
 
 	return parent_rate * 24;
 }
 
-static const struct clk_ops clk_pllv3_generic_ops = {
+static const struct clk_ops_uboot clk_pllv3_generic_ops = {
 	.get_rate       = clk_pllv3_get_rate,
 };
 
 struct clk *sandbox_clk_pllv3(enum sandbox_pllv3_type type, const char *name,
@@ -106,9 +106,9 @@ static int clk_gate2_disable(struct clk *clk)
 	gate->state = 0;
 	return 0;
 }
 
-static const struct clk_ops clk_gate2_ops = {
+static const struct clk_ops_uboot clk_gate2_ops = {
 	.enable = clk_gate2_enable,
 	.disable = clk_gate2_disable,
 	.get_rate = clk_generic_get_rate,
 };
@@ -160,9 +160,9 @@ static unsigned long sandbox_clk_composite_divider_recalc_rate(struct clk *clk)
 	return divider_recalc_rate(clk, parent_rate, val, divider->table,
 				   divider->flags, divider->width);
 }
 
-static const struct clk_ops sandbox_clk_composite_divider_ops = {
+static const struct clk_ops_uboot sandbox_clk_composite_divider_ops = {
 	.get_rate = sandbox_clk_composite_divider_recalc_rate,
 };
 
 struct clk *sandbox_clk_composite(const char *name,
diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 33369c93916b..3a4c9f6687f7 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -240,9 +240,9 @@ static unsigned long uniphier_clk_set_rate(struct clk *clk, ulong rate)
 
 	return __uniphier_clk_set_rate(priv, data, rate, true);
 }
 
-static const struct clk_ops uniphier_clk_ops = {
+static const struct clk_ops_uboot uniphier_clk_ops = {
 	.enable = uniphier_clk_enable,
 	.get_rate = uniphier_clk_get_rate,
 	.set_rate = uniphier_clk_set_rate,
 };
diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index bd7ab9d1b77e..5bc429511a1e 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -554,9 +554,9 @@ static int cdns_sierra_pll_mux_set_parent(struct clk *clk, struct clk *parent)
 
 	return ret;
 }
 
-static const struct clk_ops cdns_sierra_pll_mux_ops = {
+static const struct clk_ops_uboot cdns_sierra_pll_mux_ops = {
 	.set_parent = cdns_sierra_pll_mux_set_parent,
 };
 
 static int cdns_sierra_pll_mux_probe(struct udevice *dev)
diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 933533b2b0b7..9504b01375a1 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -668,9 +668,9 @@ static int cdns_torrent_derived_refclk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops cdns_torrent_derived_refclk_ops = {
+static const struct clk_ops_uboot cdns_torrent_derived_refclk_ops = {
 	.of_xlate = cdns_torrent_derived_refclk_of_xlate,
 	.enable = cdns_torrent_derived_refclk_enable,
 	.disable = cdns_torrent_derived_refclk_disable,
 };
diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index fcf8617ee9b3..d511b7c4285d 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -683,9 +683,9 @@ static int stm32_usbphyc_clk48_disable(struct clk *clk)
 
 	return 0;
 }
 
-const struct clk_ops usbphyc_clk48_ops = {
+const struct clk_ops_uboot usbphyc_clk48_ops = {
 	.get_rate = stm32_usbphyc_clk48_get_rate,
 	.enable = stm32_usbphyc_clk48_enable,
 	.disable = stm32_usbphyc_clk48_disable,
 };
diff --git a/drivers/phy/phy-ti-am654.c b/drivers/phy/phy-ti-am654.c
index c3d9972397aa..98362c59ac59 100644
--- a/drivers/phy/phy-ti-am654.c
+++ b/drivers/phy/phy-ti-am654.c
@@ -176,9 +176,9 @@ static int serdes_am654_mux_clk_set_parent(struct clk *clk, struct clk *parent)
 
 	return 0;
 }
 
-static struct clk_ops serdes_am654_mux_clk_ops = {
+static struct clk_ops_uboot serdes_am654_mux_clk_ops = {
 	.set_parent = serdes_am654_mux_clk_set_parent,
 };
 
 U_BOOT_DRIVER(serdes_am654_mux_clk) = {
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 4ea6600ce7f5..66cc9c69b62d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -246,9 +246,9 @@ int rockchip_usb2phy_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static struct clk_ops rockchip_usb2phy_clk_ops = {
+static struct clk_ops_uboot rockchip_usb2phy_clk_ops = {
 	.enable = rockchip_usb2phy_clk_enable,
 	.disable = rockchip_usb2phy_clk_disable,
 	.round_rate = rockchip_usb2phy_clk_round_rate
 };
diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 466e2a5d0b50..fb158072da0a 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -400,9 +400,9 @@ static ulong wiz_div_clk_set_rate(struct clk *clk, ulong rate)
 
 	return parent_rate >> div;
 }
 
-const struct clk_ops wiz_div_clk_ops = {
+const struct clk_ops_uboot wiz_div_clk_ops = {
 	.get_rate = wiz_div_clk_get_rate,
 	.set_rate = wiz_div_clk_set_rate,
 };
 
@@ -459,9 +459,9 @@ static int wiz_clk_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 
 	return 0;
 }
 
-static const struct clk_ops wiz_clk_mux_ops = {
+static const struct clk_ops_uboot wiz_clk_mux_ops = {
 	.set_parent = wiz_clk_mux_set_parent,
 	.of_xlate = wiz_clk_xlate,
 };
 
@@ -566,9 +566,9 @@ static int wiz_phy_en_refclk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops wiz_clk_ops = {
+static const struct clk_ops_uboot wiz_clk_ops = {
 	.set_parent = wiz_clk_set_parent,
 	.of_xlate = wiz_clk_of_xlate,
 	.enable = wiz_phy_en_refclk_enable,
 	.disable = wiz_phy_en_refclk_disable,
diff --git a/drivers/power/domain/imx8mp-hsiomix.c b/drivers/power/domain/imx8mp-hsiomix.c
index 1ca43880ef56..145e98d122e7 100644
--- a/drivers/power/domain/imx8mp-hsiomix.c
+++ b/drivers/power/domain/imx8mp-hsiomix.c
@@ -173,9 +173,9 @@ static int hsio_pll_clk_disable(struct clk *clk)
 
 	return 0;
 }
 
-static const struct clk_ops hsio_pll_clk_ops = {
+static const struct clk_ops_uboot hsio_pll_clk_ops = {
 	.enable = hsio_pll_clk_enable,
 	.disable = hsio_pll_clk_disable,
 };
 
diff --git a/include/clk-uclass.h b/include/clk-uclass.h
index 8c07e723cff6..a26603bf2f0a 100644
--- a/include/clk-uclass.h
+++ b/include/clk-uclass.h
@@ -14,9 +14,9 @@
 
 struct ofnode_phandle_args;
 
 /**
- * struct clk_ops - The functions that a clock driver must implement.
+ * struct clk_ops_uboot - The functions that a clock driver must implement.
  * @of_xlate: Translate a client's device-tree (OF) clock specifier.
  * @request: Request a translated clock.
  * @round_rate: Adjust a rate to the exact rate a clock can provide.
  * @get_rate: Get current clock rate.
@@ -27,9 +27,9 @@ struct ofnode_phandle_args;
  * @dump: Print clock information.
  *
  * The individual methods are described more fully below.
  */
-struct clk_ops {
+struct clk_ops_uboot {
 	int (*of_xlate)(struct clk *clock,
 			struct ofnode_phandle_args *args);
 	int (*request)(struct clk *clock);
 	ulong (*round_rate)(struct clk *clk, ulong rate);
diff --git a/include/clk/sunxi.h b/include/clk/sunxi.h
index c298195c51e6..3999d4e73ca3 100644
--- a/include/clk/sunxi.h
+++ b/include/clk/sunxi.h
@@ -84,7 +84,7 @@ struct ccu_plat {
 	void *base;
 	const struct ccu_desc *desc;
 };
 
-extern struct clk_ops sunxi_clk_ops;
+extern struct clk_ops_uboot sunxi_clk_ops;
 
 #endif /* _CLK_SUNXI_H */
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2d754fa42871..65f86421aa63 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -78,9 +78,9 @@ struct clk_mux {
 
 };
 
 #define to_clk_mux(_clk) container_of(_clk, struct clk_mux, clk)
-extern const struct clk_ops clk_mux_ops;
+extern const struct clk_ops_uboot clk_mux_ops;
 u8 clk_mux_get_parent(struct clk *clk);
 int clk_mux_fetch_parent_index(struct clk *clk, struct clk *parent);
 
 /**
@@ -110,9 +110,9 @@ struct clk_gate {
 
 #define CLK_GATE_SET_TO_DISABLE		BIT(0)
 #define CLK_GATE_HIWORD_MASK		BIT(1)
 
-extern const struct clk_ops clk_gate_ops;
+extern const struct clk_ops_uboot clk_gate_ops;
 struct clk *clk_register_gate(struct udevice *dev, const char *name,
 			      const char *parent_name, unsigned long flags,
 			      void __iomem *reg, u8 bit_idx,
 			      u8 clk_gate_flags, spinlock_t *lock);
@@ -143,9 +143,9 @@ struct clk_divider {
 #define CLK_DIVIDER_HIWORD_MASK		BIT(3)
 #define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
 #define CLK_DIVIDER_READ_ONLY		BIT(5)
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
-extern const struct clk_ops clk_divider_ops;
+extern const struct clk_ops_uboot clk_divider_ops;
 
 /**
  * clk_divider_get_table_div() - convert the register value to the divider
  *
@@ -199,9 +199,9 @@ struct clk_fixed_factor {
 	unsigned int	mult;
 	unsigned int	div;
 };
 
-extern const struct clk_ops clk_fixed_rate_ops;
+extern const struct clk_ops_uboot clk_fixed_rate_ops;
 
 #define to_clk_fixed_factor(_clk) container_of(_clk, struct clk_fixed_factor,\
 					       clk)
 
@@ -216,28 +216,28 @@ void clk_fixed_rate_ofdata_to_plat_(struct udevice *dev,
 				    struct clk_fixed_rate *plat);
 
 struct clk_composite {
 	struct clk	clk;
-	struct clk_ops	ops;
+	struct clk_ops_uboot	ops;
 
 	struct clk	*mux;
 	struct clk	*rate;
 	struct clk	*gate;
 
-	const struct clk_ops	*mux_ops;
-	const struct clk_ops	*rate_ops;
-	const struct clk_ops	*gate_ops;
+	const struct clk_ops_uboot	*mux_ops;
+	const struct clk_ops_uboot	*rate_ops;
+	const struct clk_ops_uboot	*gate_ops;
 
 	struct udevice *dev;
 };
 
 #define to_clk_composite(_clk) container_of(_clk, struct clk_composite, clk)
 
 struct clk *clk_register_composite(struct udevice *dev, const char *name,
 		const char * const *parent_names, int num_parents,
-		struct clk *mux_clk, const struct clk_ops *mux_ops,
-		struct clk *rate_clk, const struct clk_ops *rate_ops,
-		struct clk *gate_clk, const struct clk_ops *gate_ops,
+		struct clk *mux_clk, const struct clk_ops_uboot *mux_ops,
+		struct clk *rate_clk, const struct clk_ops_uboot *rate_ops,
+		struct clk *gate_clk, const struct clk_ops_uboot *gate_ops,
 		unsigned long flags);
 
 int clk_register(struct clk *clk, const char *drv_name, const char *name,
 		 const char *parent_name);
@@ -269,7 +269,7 @@ ulong ccf_clk_get_rate(struct clk *clk);
 ulong ccf_clk_set_rate(struct clk *clk, unsigned long rate);
 int ccf_clk_set_parent(struct clk *clk, struct clk *parent);
 int ccf_clk_enable(struct clk *clk);
 int ccf_clk_disable(struct clk *clk);
-extern const struct clk_ops ccf_clk_ops;
+extern const struct clk_ops_uboot ccf_clk_ops;
 
 #endif /* __LINUX_CLK_PROVIDER_H */

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
