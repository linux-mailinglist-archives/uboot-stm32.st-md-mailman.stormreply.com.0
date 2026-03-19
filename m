Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMfNCsUXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCC82F03C3
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34F8EC8F266;
	Mon, 23 Mar 2026 10:36:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA7CAC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:57:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso12326605e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953838; x=1774558638;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ygNuSeQGX7Q2b/F+EBUD44n+zE24EFeQxx8wjWtK2jE=;
 b=I/YgaSZYEqnZO70IGxcDgwwyiLSylk0FQGMaTO4JtRQeW49HkG2n1jQEn38RaoLqUm
 vaRk8Z0ilYk4ATPLJhMl9srcVgjESsitzen8kPFBrSHxL7J5iNJ03p4GJWLhRm3+OHrq
 wl/XJMLCQFdrGmFx2MijqWn+6PCn7KH+xWruGwpTHSVQIZXjAVaqOc3/OPT1fy2H3rNy
 G5x9LqSpuZAxkdNYclNJBBFWSlb5HWX7gu7fZbmiuAChxPjnKJISocUKEQjNMK0+NmcY
 F/iPqmu/BY1XpFMMyNF8YKRMm2jDWUCXEfhHtSWsdpwFxKLPI+Sf3KKuY94VjFOsxJeR
 8tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953838; x=1774558638;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ygNuSeQGX7Q2b/F+EBUD44n+zE24EFeQxx8wjWtK2jE=;
 b=SyCXW+JTHNhcH0g8PfjDncAA7gf50Fhf3GSUL9Tvzbi1xdNrVWHNgHDUm9uLqTZbWV
 u1QmUImVtqK7jt477fOr98IS+5nxbvJRMEoH8ca545yC8LZ+RWlX0SptGhAw1CmmcQmi
 sYOw1QYAHkrqlFHiHgeyWKKcdh+ibZnYeDQUN0gfEl63TKH6nZS8fc6Yz4gJda1/1d0g
 E31+J9KgmphoF7dV6TCKI92NOBkh74rsSwcE28VIBB2zmCgcjFdsL2TeG8PMdHAYfwOB
 kVrSWW+u/dkJ2r6SL4IKejCGhyxZlAFhMKvZ7nBjg4Sr8kmW2tVT5P1hfG8K5D1nZ7im
 TkkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyRC4zDdR7uATExHdEJ8dBpJZzcPQAUzB81ygtd0IsyZsyfyprdor/gzthY+iNLBqubKFgBiZD0Phy3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVhR4B3fYVUjffVfJI1zatICHz09OojNPIh9aW07oJ226It+Vw
 6ECYu+1HWX+IEaTUc8djYMFejwInOi0i0Awfkih1XAH92cK52oHMjy8P8z3OvcfAB/o=
X-Gm-Gg: ATEYQzyTgjnO9d1EQ6b71xxipnGm6HpUJxOy1FxvFCY3nKDGIVD07eEzU4cae/yJVgr
 Jdelk27qu9L0NosccYhN+O3iqxdjEYqACNwQ9HaKoSa8mAcT9EtX8QPyEz1kwXE4YXdNB80+Xvx
 aSvUKnSW9WAirnzorY4XwJgApSg9YOko9EgNhLleyfH4+KZc5JSEyYRbvseLUp+ernRt7rBMGKB
 kzEhLNcKG6tI/Y9WBOnCUekzO44qnfCsq3wwZDdyfa9t1MIrP9d8TjaIE8gFaI77y5awXfR8GC4
 mq/iDrgMmKsCO+TXQ2CpPnNODjbBow8Fmkh8nrIWWEqM0KAIg1LSTHI45hrj8MLT5GM7kvaSIMP
 ib89IeEME0EvMEQbe1O3QOqSYPSj56nnBpbqwfYEexzIZunnb9AU1Fi4K+TSlMLqeAGvHQXfdBW
 tXZ6QwGtfOhcyFPnXoCXD2lT0ER4qiyNhJQmXyvEb3gY+TTjZvnftS+0ngI+cKXTq1DwI=
X-Received: by 2002:a05:600c:3b07:b0:485:3aa1:a7f1 with SMTP id
 5b1f17b1804b1-486fedab4bdmr8055315e9.7.1773953838012; 
 Thu, 19 Mar 2026 13:57:18 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:57:17 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:28 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-6-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11186;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=4U4486dk/kYnPVEPw0EBh1G48lAL739YPPX7748xid0=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yXw8Qh9ERZdlZ/wUX8sWa3zppmptxa5fHxuczKx41
 x+rDzbvKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABM5d4fhf4lG/6fcBe/yLt67
 tDt/vrZNTcOhG3JsWxReZqs9ePLMIZbhr8RcMS9tt70pfIx9utNa3C065L0cNs9yf2b9vihqGce
 SjwA=
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
Subject: [Uboot-stm32] [PATCH RFC 06/40] ofnode: add read_u64_array and
 count_elems_of_size
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: BFCC82F03C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These are similar to their Linux counterparts, adding helpers
for reading arrays of 64-bit values with of_access and fdtdec
implementations.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/core/of_access.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/core/ofnode.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++
 include/dm/of_access.h   | 20 +++++++++++++++++++
 include/dm/ofnode.h      | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 include/fdtdec.h         | 16 +++++++++++++++
 lib/fdtdec.c             | 18 +++++++++++++++++
 6 files changed, 204 insertions(+)

diff --git a/drivers/core/of_access.c b/drivers/core/of_access.c
index b11e36202c15..969492aae37c 100644
--- a/drivers/core/of_access.c
+++ b/drivers/core/of_access.c
@@ -597,8 +597,27 @@ int of_read_u64(const struct device_node *np, const char *propname, u64 *outp)
 {
 	return of_read_u64_index(np, propname, 0, outp);
 }
 
+int of_read_u64_array(const struct device_node *np, const char *propname,
+		      u64 *out_values, size_t sz)
+{
+	const __be64 *val;
+
+	log_debug("%s: %s: ", __func__, propname);
+	val = of_find_property_value_of_size(np, propname,
+					     sz * sizeof(*out_values));
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	log_debug("size %zd\n", sz);
+	while (sz--)
+		*out_values++ = be64_to_cpup(val++);
+
+	return 0;
+}
+
 int of_property_match_string(const struct device_node *np, const char *propname,
 			     const char *string)
 {
 	int len = 0;
@@ -844,8 +863,41 @@ int of_count_phandle_with_args(const struct device_node *np,
 	return of_root_count_phandle_with_args(NULL, np, list_name, cells_name,
 					       cell_count);
 }
 
+/**
+ * of_property_count_elems_of_size - Count the number of elements in a property
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @elem_size:	size of the individual element
+ *
+ * Search for a property in a device node and count the number of elements of
+ * size elem_size in it.
+ *
+ * Return: The number of elements on sucess, -EINVAL if the property does not
+ * exist or its length does not match a multiple of elem_size and -ENODATA if
+ * the property does not have a value.
+ */
+int of_property_count_elems_of_size(const struct device_node *np,
+				const char *propname, int elem_size)
+{
+	const struct property *prop = of_find_property(np, propname, NULL);
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+
+	if (prop->length % elem_size != 0) {
+		pr_err("size of %s in node %pOF is not a multiple of %d\n",
+		       propname, np, elem_size);
+		return -EINVAL;
+	}
+
+	return prop->length / elem_size;
+}
+
 static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 			 int id, const char *stem, int stem_len)
 {
 	ap->np = np;
diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index 3a36b6fdd031..d605c0f7b7c7 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -663,8 +663,56 @@ int ofnode_read_u32_array(ofnode node, const char *propname,
 		return ret;
 	}
 }
 
+int ofnode_read_u64_array(ofnode node, const char *propname,
+			  u64 *out_values, size_t sz)
+{
+	assert(ofnode_valid(node));
+	log_debug("%s: %s: ", __func__, propname);
+
+	if (ofnode_is_np(node)) {
+		return of_read_u64_array(ofnode_to_np(node), propname,
+					 out_values, sz);
+	} else {
+		int ret;
+
+		ret = fdtdec_get_long_array(ofnode_to_fdt(node),
+					   ofnode_to_offset(node), propname,
+					   out_values, sz);
+
+		/* get the error right, but space is more important in SPL */
+		if (!IS_ENABLED(CONFIG_XPL_BUILD)) {
+			if (ret == -FDT_ERR_NOTFOUND)
+				return -EINVAL;
+			else if (ret == -FDT_ERR_BADLAYOUT)
+				return -EOVERFLOW;
+		}
+		return ret;
+	}
+}
+
+int ofnode_count_elems_of_size(ofnode node, const char *propname, int elem_size)
+{
+	const char *prop;
+	int len;
+	assert(ofnode_valid(node));
+
+	if (ofnode_is_np(node)) {
+		return of_property_count_elems_of_size(node.np, propname, elem_size);
+	} else {
+		prop = fdt_getprop(ofnode_to_fdt(node), ofnode_to_offset(node), propname, &len);
+		if (!prop)
+			return -ENOENT;
+		if (len % elem_size != 0) {
+			log_debug("size of %s in node %pOF is not a multiple of %d\n",
+			       propname, &node, elem_size);
+			return -EINVAL;
+		}
+		return len / elem_size;
+	}
+}
+
 #if !CONFIG_IS_ENABLED(DM_INLINE_OFNODE)
 bool ofnode_is_enabled(ofnode node)
 {
 	if (ofnode_is_np(node)) {
diff --git a/include/dm/of_access.h b/include/dm/of_access.h
index 44143a5a3917..fe0de73d7e25 100644
--- a/include/dm/of_access.h
+++ b/include/dm/of_access.h
@@ -384,8 +384,25 @@ int of_read_u64(const struct device_node *np, const char *propname, u64 *outp);
  */
 int of_read_u32_array(const struct device_node *np, const char *propname,
 		      u32 *out_values, size_t sz);
 
+/**
+ * of_read_u64_array() - Find and read an array of 64 bit integers
+ *
+ * Search for a property in a device node and read 64-bit value(s) from
+ * it.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_values:	pointer to return value, modified only if return value is 0.
+ * @sz:		number of array elements to read
+ * Return:
+ *   0 on success, -EINVAL if the property does not exist, or -EOVERFLOW if
+ *   longer than sz.
+ */
+int of_read_u64_array(const struct device_node *np, const char *propname,
+		      u64 *out_values, size_t sz);
+
 /**
  * of_property_match_string() - Find string in a list and return index
  *
  * This function searches a string list property and returns the index
@@ -615,8 +632,11 @@ int of_parse_phandle_with_args(const struct device_node *np,
 int of_count_phandle_with_args(const struct device_node *np,
 			       const char *list_name, const char *cells_name,
 			       int cells_count);
 
+int of_property_count_elems_of_size(const struct device_node *np,
+				const char *propname, int elem_size);
+
 /**
  * of_alias_scan() - Scan all properties of the 'aliases' node
  *
  * The function scans all the properties of the 'aliases' node and populates
diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index 120393426dbf..c905e86b2835 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -374,8 +374,15 @@ static inline oftree oftree_from_np(struct device_node *root)
 
 	return tree;
 }
 
+/* Dummy put for Linux compat */
+static inline void ofnode_put(ofnode node)
+{
+	if (ofnode_is_np(node))
+		of_node_put(node.np);
+}
+
 /**
  * oftree_dispose() - Dispose of an oftree
  *
  * This can be used to dispose of a tree that has been created (other than
@@ -587,8 +594,27 @@ const char *ofnode_read_string(ofnode node, const char *propname);
  */
 int ofnode_read_u32_array(ofnode node, const char *propname,
 			  u32 *out_values, size_t sz);
 
+/**
+ * ofnode_read_u64_array() - Find and read an array of 64 bit integers
+ *
+ * @node:	valid node reference to read property from
+ * @propname:	name of the property to read
+ * @out_values:	pointer to return value, modified only if return value is 0
+ * @sz:		number of array elements to read
+ * Return: 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough
+ *
+ * Search for a property in a device node and read 64-bit value(s) from
+ * it.
+ *
+ * The out_values is modified only if a valid u64 value can be decoded.
+ */
+int ofnode_read_u64_array(ofnode node, const char *propname,
+			  u64 *out_values, size_t sz);
+
 /**
  * ofnode_read_bool() - read a boolean value from a property
  *
  * @node:	valid node reference to read property from
@@ -651,8 +677,32 @@ static inline ofnode ofnode_next_subnode(ofnode node)
 	return offset_to_ofnode(
 		fdt_next_subnode(gd->fdt_blob, ofnode_to_offset(node)));
 }
 #else
+
+/**
+ * ofnode_count_elems_of_size() - count the number of elements of size @elem_size
+ * in the property @propname.
+ *
+ * @node: ofnode to check
+ * @propname: the name of the property to count
+ * @elem_size: the size of each element
+ *
+ * Returns: the number of elements or -EINVAL if the property size is not a
+ * multiple of elem_size.
+ */
+int ofnode_count_elems_of_size(ofnode node, const char *propname, int elem_size);
+
+static inline int ofnode_count_u32_elems(ofnode node, const char *propname)
+{
+	return ofnode_count_elems_of_size(node, propname, 4);
+}
+
+static inline int ofnode_count_u64_elems(ofnode node, const char *propname)
+{
+	return ofnode_count_elems_of_size(node, propname, 8);
+}
+
 /**
  * ofnode_is_enabled() - Checks whether a node is enabled.
  * This looks for a 'status' property. If this exists, then returns true if
  * the status is 'okay' and false otherwise. If there is no status property,
diff --git a/include/fdtdec.h b/include/fdtdec.h
index d9fcd037ed26..3d199e56b031 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -699,8 +699,24 @@ int fdtdec_lookup_phandle(const void *blob, int node, const char *prop_name);
  */
 int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
 		u32 *array, int count);
 
+/**
+ * Look up a property in a node and return its contents in a u64
+ * array of given length. The property must have at least enough data for
+ * the array (8*count bytes). It may have more, but this will be ignored.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param array		array to fill with data
+ * @param count		number of array elements
+ * Return: 0 if ok, or -FDT_ERR_NOTFOUND if the property is not found,
+ *		or -FDT_ERR_BADLAYOUT if not enough data
+ */
+int fdtdec_get_long_array(const void *blob, int node, const char *prop_name,
+		u64 *array, int count);
+
 /**
  * Look up a property in a node and return its contents in an integer
  * array of given length. The property must exist but may have less data that
  * expected (4*count bytes). It may have more, but this will be ignored.
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index c38738b48c79..e23e53f58f24 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -713,8 +713,26 @@ int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
 	}
 	return err;
 }
 
+int fdtdec_get_long_array(const void *blob, int node, const char *prop_name,
+			 u64 *array, int count)
+{
+	const u64 *cell;
+	int err = 0;
+
+	debug("%s: %s\n", __func__, prop_name);
+	cell = get_prop_check_min_len(blob, node, prop_name,
+				      sizeof(u64) * count, &err);
+	if (!err) {
+		int i;
+
+		for (i = 0; i < count; i++)
+			array[i] = fdt64_to_cpu(cell[i]);
+	}
+	return err;
+}
+
 int fdtdec_get_int_array_count(const void *blob, int node,
 			       const char *prop_name, u32 *array, int count)
 {
 	const u32 *cell;

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
