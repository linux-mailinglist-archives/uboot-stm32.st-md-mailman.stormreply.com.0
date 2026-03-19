Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH0BGcYXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7C2F0416
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A2E9C8F267;
	Mon, 23 Mar 2026 10:36:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09DB8C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso12019175e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953899; x=1774558699;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i7xZM4PBxhnHWoIJ3Hc9wF1rTFSdykejCCJsUMehPqs=;
 b=DyTUJSd/TodwceuTfQDc3GOw+u9ILXJOT8LF9lcItargHgQwlnyI3WFWFdLy+k0eRw
 NNrfIXKkjPDtjdZ4jLFl7mrbBmdmpTI3EnevEVhCTupTFudA0F4ejvDHSYT49KzKGuaS
 Mp8q+83Fd6tf7P4s2ABGqPjd14VaGlvhnHqUOTDbXPEvxREtY1FYUb0qWdnK7i3LJsUS
 NbjyoS22knN5tmMQCmHB+o8KT3WxP4SXc6fL/45LY7b8q8eVNK68Iq87DdIizp+vK2eD
 XL+BMJU9bmAYtZKGBm6mJKjsOXfqRjtxRjdpGtZwF6vlHl4i63X8uPyAGhjb2V2awneP
 vjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953899; x=1774558699;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=i7xZM4PBxhnHWoIJ3Hc9wF1rTFSdykejCCJsUMehPqs=;
 b=Mu+SyR4gKAxwuday/jqGFbvb8X1VEtiiT56GrgLo8avVvZMOE9pzdVYMKmDJaILrY7
 QfDKowqoexlY4He6RHtQW+D6+FDo281BvhN9upfqFTX4sHbvLOOP1rZaJq7iJZmSjw9I
 3ppipa20ncDcHf0qa3VCW8nNOIRfN5l+ULaCrF47Qsdik3pu19oSrkRU9T+UXayNS35S
 VkzmErJ+6Zc8ygxB/mYVzI9AJEKTJOdOZAQuU8f8qFWXt39B8785g+ucO6bx/CsEZ7qv
 0aKTFZQJZ7WLrPCtx7BvrmnOkKjnfptL0TImtwW0QqYG7hf6yV3eDLE4GzdCGvkle1zk
 4JGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpcO9/U2Uppqr9GpA/t519PW8OS/3fUQMRwW/8eMPL+v9qda5Ay+ThEcIU08S0foadgJm2dz15LLKFvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxR3usN2EO7r1MLl0W+6HuYt961WKMxqt4okW/aMl+fqVeGggpo
 GgfE3rtgj0rolzAFacX2kaPJLQmIW2qtt8SARru+F5zXQWX6xG7pusaLQnamOs1Iljo=
X-Gm-Gg: ATEYQzyNxXtT484RF+C0l+wFhJy4y8HdeA4PQ6cP4O8Thsfs8y4hoSBoi7Lt8iK4UgT
 F/3Sqbj13GSV1gPGi8mtFOFGJ2MUCw0ShoD33oZv5Va9mx5QEnCC1WfZl+cWWzKSH3KTLKqGim0
 ns5H3bQIfw/+Qtuvdu8RBicYcVSjsxiwa/PmgW0vOyDcu5br2QQMZ85CXlVRfZwHYc4JrHtPhBc
 FchwrV0hdeYTtjq9l5I86A/W97kwEYyDNswyNmFMkbVlgzDQ6mcLDEKLmSqAIEuJCoMpElp2I9G
 LTQMfw29Jt88Fanscnb7X4SPz3IILCgTWr+MFUoFaj4joXBMdT+hYtnMkQZfOouoqnxeDHdA4fz
 GM8Ex1FRBz/SxghfkVo05Zl3+BIFqL7ks36eBdHvAKMJrbKmLH5gU/0gmKP5GkaPu6ZlWCmdf0z
 leuS8RjGM+9XwpYBoM0HpyeaahuFRF+VcMb3FPBc28Z/aPPOzqfd0aDrsY5sObl34WlIcT+nRVr
 kB32g==
X-Received: by 2002:a05:600c:4e02:b0:486:de04:5906 with SMTP id
 5b1f17b1804b1-486ff0271a7mr7424855e9.19.1773953898317; 
 Thu, 19 Mar 2026 13:58:18 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:17 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:43 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-21-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=317506;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=9+4JCE6VF/9wSNLOkPnpeScx0COC3Z7uIc3DTIxkQZg=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yfzbJxw+MrFy3+Z5q6UOVYgFqLUmeQo6qbe+rGo/M
 XGOh+m1jlIWBkEOBlkxRRbxE8ssm9ZettfYvuACzBxWJpAhDFycAjARvxMM/zQTf/TViylrL9Ty
 tTgZV31+evrM3Nr2JBlRrr4G7ktcPxj+cClGqUtxzawNfTaHSXzy8xIXXrELW0LfRTMV6pRObr8
 lBgA=
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
Subject: [Uboot-stm32] [PATCH RFC 21/40] clk: import full CCF from Linux
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
X-Spamd-Result: default: False [2.59 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	DATE_IN_PAST(1.00)[85];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,sntech.de,kernel.org,microchip.com,rock-chips.com,bootlin.com,aspeedtech.com,linaro.org,fairphone.com,baylibre.com,synopsys.com,chromium.org,mainlining.org,nabladev.com,foss.st.com,amd.com,socionext.com,mailbox.org,gmail.com,mediatek.com,amarulasolutions.com,nigauri.org,starfivetech.com,vrull.eu,altera.com,iopsys.eu,quicinc.com,foss.arm.com,cherry.de,konsulko.com,korsgaard.com,analog.com,ti.com,kwiboo.se,postmarketos.org,yahoo.com,andestech.com,sartura.hr,nvidia.com,redhat.com,ziyao.cc,samcday.com,oss.qualcomm.com,denx.de,samsung.com,mentallysanemainliners.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[casey.connolly@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:lukma@denx.de,m:u-boot-qcom@groups.io,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:GSS_MTK_Uboot_upstream@mediatek.com,m:paul@pbarker.dev,m:okamura.dai@socionext.com,m:linux@analog.com,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:sumit.garg@kernel.org,m:peng.fan@nxp.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:conor.dooley@microchip.com,m:finley.xiao@rock-chips.com,m:miquel.raynal@bootlin.com,m:chiawei_wang@aspeedtech.com,m:neil.armstrong@linaro.org,m:luca.weiss@fairphone.com,m:dlechner@baylibre.com,m:Eugeniy.Paltsev@synopsys.com,m:swboyd@chromium.org,m:adrian@mainlining.org,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gabriel.fernandez@foss.st.com,m:padmarao.begari@amd.com,m:david.wronek@mainlining.org,m:hayashi.kunihiko@socionext.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:seanga2@gmail.com,m:manivannan.sadhasivam@linaro.org,m:sam.s
 hih@mediatek.com,m:michael@amarulasolutions.com,m:ansuelsmth@gmail.com,m:chenjh@rock-chips.com,m:Ryan.Wanner@microchip.com,m:iwamatsu@nigauri.org,m:senthilnathan.thangaraj@amd.com,m:zhangqing@rock-chips.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:msp@baylibre.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:ryan_chen@aspeedtech.com,m:malysagreg@gmail.com,m:sjg@chromium.org,m:quic_varada@quicinc.com,m:liviu.dudau@foss.arm.com,m:quentin.schulz@cherry.de,m:varshini.rajendran@microchip.com,m:hal.feng@starfivetech.com,m:manikandan.m@microchip.com,m:trini@konsulko.com,m:peter@korsgaard.com,m:philip.molloy@analog.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:jonas@kwiboo.se,m:sajattack@postmarketos.org,m:raymondmaoca@gmail.com,m:dullfire@yahoo.com,m:ycliang@andestech.com,m:robert.marko@sartura.hr,m:treding@nvidia.com,m:smelamud@redhat.com,m:clamor95@gmail.com,m:nm@ti.com,m:valentin.caron@foss.st.
 com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:me@samcday.com,m:aswin.murugan@oss.qualcomm.com,m:naman.trivedimanojbhai@amd.com,m:marex@denx.de,m:jorge.ramirez@oss.qualcomm.com,m:ryder.lee@mediatek.com,m:loic.poulain@oss.qualcomm.com,m:weijie.gao@mediatek.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:balaji.selvanathan@oss.qualcomm.com,m:chunfeng.yun@mediatek.com,m:arturs.artamonovs@analog.com,m:venkatesh.abbarapu@amd.com,m:vasileios.bimpikas@analog.com,m:yannick.fertre@foss.st.com,m:stephan.gerhold@linaro.org,m:afd@ti.com,m:rui.silva@linaro.org,m:patrick.delaunay@foss.st.com,m:m-chawdhry@ti.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linaro.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[100];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[casey.connolly@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: C4F7C2F0416
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a plain copy/paste with no modifications from Linux 6.19.0, it
will be adapted for U-Boot in future commits.

To continue supporting U-Boot CCF, clk-provider.h becomes a wrapper that
imports either the uccf or ccf_full variant based on the config, since
these are mutually exclusive.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/Kconfig                   |    1 +
 drivers/clk/Makefile                  |    7 +-
 drivers/clk/ccf/Kconfig               |    8 +
 drivers/clk/ccf/Makefile              |   17 +
 drivers/clk/ccf/clk-composite.c       |  492 +++
 drivers/clk/ccf/clk-conf.c            |  183 ++
 drivers/clk/ccf/clk-divider.c         |  674 ++++
 drivers/clk/ccf/clk-fixed-factor.c    |  424 +++
 drivers/clk/ccf/clk-fixed-rate.c      |  238 ++
 drivers/clk/ccf/clk-gate.c            |  259 ++
 drivers/clk/ccf/clk-mux.c             |  285 ++
 drivers/clk/ccf/clk.c                 | 5595 +++++++++++++++++++++++++++++++++
 drivers/clk/ccf/clk.h                 |   38 +
 include/linux/clk-provider-ccf_full.h | 1502 +++++++++
 include/linux/clk-provider-uccf.h     |  275 ++
 include/linux/clk-provider.h          |  265 +-
 include/linux/clk/clk-conf.h          |   24 +
 17 files changed, 10026 insertions(+), 261 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 5cc76cd55cc8..6ae79814ceee 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -11,8 +11,9 @@ config CLK
 	  feed into other clocks in a tree structure, with multiplexers to
 	  choose the source for each clock.
 
 source "drivers/clk/uccf/Kconfig"
+source "drivers/clk/ccf/Kconfig"
 
 config SANDBOX_CLK_CCF
 	bool "Sandbox U-Boot Common Clock Framework [uCCF] support"
 	depends on SANDBOX && (CLK_CCF || CLK_CCF_FULL)
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 23f381eb0d9f..12039e05bb48 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -7,15 +7,18 @@
 obj-$(CONFIG_$(PHASE_)CLK) += clk-uclass.o
 obj-$(CONFIG_$(PHASE_)CLK_GPIO) += clk-gpio.o
 obj-$(CONFIG_$(PHASE_)CLK_STUB) += clk-stub.o
 
-# U-Boot/IMX "micro" CCF port
-obj-$(CONFIG_$(PHASE_)CLK_CCF) += uccf/
+# Full Linux CCF support
+obj-$(CONFIG_$(PHASE_)CLK_CCF_FULL) += ccf/
 
 # U-Boot basic fixed clocks, full CCF has a
 # different and incompatible implementation
 ifndef CONFIG_CLK_CCF_FULL
 obj-y += basic/
+
+# U-Boot/IMX "micro" CCF port
+obj-$(CONFIG_$(PHASE_)CLK_CCF) += uccf/
 endif
 
 obj-y += adi/
 obj-y += airoha/
diff --git a/drivers/clk/ccf/Kconfig b/drivers/clk/ccf/Kconfig
new file mode 100644
index 000000000000..ec5d2d91b870
--- /dev/null
+++ b/drivers/clk/ccf/Kconfig
@@ -0,0 +1,8 @@
+config CLK_CCF_FULL
+	bool "Full Common Clock Framework [CCF] support"
+	depends on CLK && !CLK_CCF
+	help
+	  Enable this option if you want to use the full Linux kernel's Common
+	  Clock Framework [CCF] code in U-Boot. This is a full API compatible
+	  port as opposed to U-Boot "uCCF", drivers must register clocks at
+	  runtime and should not use UCLASS_CLK.
diff --git a/drivers/clk/ccf/Makefile b/drivers/clk/ccf/Makefile
new file mode 100644
index 000000000000..a337b9f29d7a
--- /dev/null
+++ b/drivers/clk/ccf/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (c) 2026 Linaro Ltd.
+#
+# Full Linux CCF support
+#
+
+obj-y += clk.o \
+	clk-conf.o \
+	clk-divider.o \
+	clk-gate.o \
+	clk-mux.o \
+	clk-fixed-factor.o \
+	clk-fixed-rate.o
+
+obj-$(CONFIG_CLK_COMPOSITE_CCF) += clk-composite.o
+
diff --git a/drivers/clk/ccf/clk-composite.c b/drivers/clk/ccf/clk-composite.c
new file mode 100644
index 000000000000..66759fe28fad
--- /dev/null
+++ b/drivers/clk/ccf/clk-composite.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2013 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+
+static u8 clk_composite_get_parent(struct clk_hw *hw)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *mux_ops = composite->mux_ops;
+	struct clk_hw *mux_hw = composite->mux_hw;
+
+	__clk_hw_set_clk(mux_hw, hw);
+
+	return mux_ops->get_parent(mux_hw);
+}
+
+static int clk_composite_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *mux_ops = composite->mux_ops;
+	struct clk_hw *mux_hw = composite->mux_hw;
+
+	__clk_hw_set_clk(mux_hw, hw);
+
+	return mux_ops->set_parent(mux_hw, index);
+}
+
+static unsigned long clk_composite_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *rate_ops = composite->rate_ops;
+	struct clk_hw *rate_hw = composite->rate_hw;
+
+	__clk_hw_set_clk(rate_hw, hw);
+
+	return rate_ops->recalc_rate(rate_hw, parent_rate);
+}
+
+static int clk_composite_determine_rate_for_parent(struct clk_hw *rate_hw,
+						   struct clk_rate_request *req,
+						   struct clk_hw *parent_hw,
+						   const struct clk_ops *rate_ops)
+{
+	long rate;
+
+	req->best_parent_hw = parent_hw;
+	req->best_parent_rate = clk_hw_get_rate(parent_hw);
+
+	if (rate_ops->determine_rate)
+		return rate_ops->determine_rate(rate_hw, req);
+
+	rate = rate_ops->round_rate(rate_hw, req->rate,
+				    &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+
+	return 0;
+}
+
+static int clk_composite_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *rate_ops = composite->rate_ops;
+	const struct clk_ops *mux_ops = composite->mux_ops;
+	struct clk_hw *rate_hw = composite->rate_hw;
+	struct clk_hw *mux_hw = composite->mux_hw;
+	struct clk_hw *parent;
+	unsigned long rate_diff;
+	unsigned long best_rate_diff = ULONG_MAX;
+	unsigned long best_rate = 0;
+	int i, ret;
+
+	if (rate_hw && rate_ops &&
+	    (rate_ops->determine_rate || rate_ops->round_rate) &&
+	    mux_hw && mux_ops && mux_ops->set_parent) {
+		req->best_parent_hw = NULL;
+
+		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
+			struct clk_rate_request tmp_req;
+
+			parent = clk_hw_get_parent(mux_hw);
+
+			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
+			ret = clk_composite_determine_rate_for_parent(rate_hw,
+								      &tmp_req,
+								      parent,
+								      rate_ops);
+			if (ret)
+				return ret;
+
+			req->rate = tmp_req.rate;
+			req->best_parent_hw = tmp_req.best_parent_hw;
+			req->best_parent_rate = tmp_req.best_parent_rate;
+
+			return 0;
+		}
+
+		for (i = 0; i < clk_hw_get_num_parents(mux_hw); i++) {
+			struct clk_rate_request tmp_req;
+
+			parent = clk_hw_get_parent_by_index(mux_hw, i);
+			if (!parent)
+				continue;
+
+			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
+			ret = clk_composite_determine_rate_for_parent(rate_hw,
+								      &tmp_req,
+								      parent,
+								      rate_ops);
+			if (ret)
+				continue;
+
+			if (req->rate >= tmp_req.rate)
+				rate_diff = req->rate - tmp_req.rate;
+			else
+				rate_diff = tmp_req.rate - req->rate;
+
+			if (!rate_diff || !req->best_parent_hw
+				       || best_rate_diff > rate_diff) {
+				req->best_parent_hw = parent;
+				req->best_parent_rate = tmp_req.best_parent_rate;
+				best_rate_diff = rate_diff;
+				best_rate = tmp_req.rate;
+			}
+
+			if (!rate_diff)
+				return 0;
+		}
+
+		req->rate = best_rate;
+		return 0;
+	} else if (rate_hw && rate_ops && rate_ops->determine_rate) {
+		__clk_hw_set_clk(rate_hw, hw);
+		return rate_ops->determine_rate(rate_hw, req);
+	} else if (mux_hw && mux_ops && mux_ops->determine_rate) {
+		__clk_hw_set_clk(mux_hw, hw);
+		return mux_ops->determine_rate(mux_hw, req);
+	} else {
+		pr_err("clk: clk_composite_determine_rate function called, but no mux or rate callback set!\n");
+		return -EINVAL;
+	}
+}
+
+static long clk_composite_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *prate)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *rate_ops = composite->rate_ops;
+	struct clk_hw *rate_hw = composite->rate_hw;
+
+	__clk_hw_set_clk(rate_hw, hw);
+
+	return rate_ops->round_rate(rate_hw, rate, prate);
+}
+
+static int clk_composite_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *rate_ops = composite->rate_ops;
+	struct clk_hw *rate_hw = composite->rate_hw;
+
+	__clk_hw_set_clk(rate_hw, hw);
+
+	return rate_ops->set_rate(rate_hw, rate, parent_rate);
+}
+
+static int clk_composite_set_rate_and_parent(struct clk_hw *hw,
+					     unsigned long rate,
+					     unsigned long parent_rate,
+					     u8 index)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *rate_ops = composite->rate_ops;
+	const struct clk_ops *mux_ops = composite->mux_ops;
+	struct clk_hw *rate_hw = composite->rate_hw;
+	struct clk_hw *mux_hw = composite->mux_hw;
+	unsigned long temp_rate;
+
+	__clk_hw_set_clk(rate_hw, hw);
+	__clk_hw_set_clk(mux_hw, hw);
+
+	temp_rate = rate_ops->recalc_rate(rate_hw, parent_rate);
+	if (temp_rate > rate) {
+		rate_ops->set_rate(rate_hw, rate, parent_rate);
+		mux_ops->set_parent(mux_hw, index);
+	} else {
+		mux_ops->set_parent(mux_hw, index);
+		rate_ops->set_rate(rate_hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
+static int clk_composite_is_enabled(struct clk_hw *hw)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *gate_ops = composite->gate_ops;
+	struct clk_hw *gate_hw = composite->gate_hw;
+
+	__clk_hw_set_clk(gate_hw, hw);
+
+	return gate_ops->is_enabled(gate_hw);
+}
+
+static int clk_composite_enable(struct clk_hw *hw)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *gate_ops = composite->gate_ops;
+	struct clk_hw *gate_hw = composite->gate_hw;
+
+	__clk_hw_set_clk(gate_hw, hw);
+
+	return gate_ops->enable(gate_hw);
+}
+
+static void clk_composite_disable(struct clk_hw *hw)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+	const struct clk_ops *gate_ops = composite->gate_ops;
+	struct clk_hw *gate_hw = composite->gate_hw;
+
+	__clk_hw_set_clk(gate_hw, hw);
+
+	gate_ops->disable(gate_hw);
+}
+
+static struct clk_hw *__clk_hw_register_composite(struct device *dev,
+			const char *name, const char * const *parent_names,
+			const struct clk_parent_data *pdata, int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	struct clk_composite *composite;
+	struct clk_ops *clk_composite_ops;
+	int ret;
+
+	composite = kzalloc(sizeof(*composite), GFP_KERNEL);
+	if (!composite)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.flags = flags;
+	if (parent_names)
+		init.parent_names = parent_names;
+	else
+		init.parent_data = pdata;
+	init.num_parents = num_parents;
+	hw = &composite->hw;
+
+	clk_composite_ops = &composite->ops;
+
+	if (mux_hw && mux_ops) {
+		if (!mux_ops->get_parent) {
+			hw = ERR_PTR(-EINVAL);
+			goto err;
+		}
+
+		composite->mux_hw = mux_hw;
+		composite->mux_ops = mux_ops;
+		clk_composite_ops->get_parent = clk_composite_get_parent;
+		if (mux_ops->set_parent)
+			clk_composite_ops->set_parent = clk_composite_set_parent;
+		if (mux_ops->determine_rate)
+			clk_composite_ops->determine_rate = clk_composite_determine_rate;
+	}
+
+	if (rate_hw && rate_ops) {
+		if (!rate_ops->recalc_rate) {
+			hw = ERR_PTR(-EINVAL);
+			goto err;
+		}
+		clk_composite_ops->recalc_rate = clk_composite_recalc_rate;
+
+		if (rate_ops->determine_rate)
+			clk_composite_ops->determine_rate =
+				clk_composite_determine_rate;
+		else if (rate_ops->round_rate)
+			clk_composite_ops->round_rate =
+				clk_composite_round_rate;
+
+		/* .set_rate requires either .round_rate or .determine_rate */
+		if (rate_ops->set_rate) {
+			if (rate_ops->determine_rate || rate_ops->round_rate)
+				clk_composite_ops->set_rate =
+						clk_composite_set_rate;
+			else
+				WARN(1, "%s: missing round_rate op is required\n",
+						__func__);
+		}
+
+		composite->rate_hw = rate_hw;
+		composite->rate_ops = rate_ops;
+	}
+
+	if (mux_hw && mux_ops && rate_hw && rate_ops) {
+		if (mux_ops->set_parent && rate_ops->set_rate)
+			clk_composite_ops->set_rate_and_parent =
+			clk_composite_set_rate_and_parent;
+	}
+
+	if (gate_hw && gate_ops) {
+		if (!gate_ops->is_enabled || !gate_ops->enable ||
+		    !gate_ops->disable) {
+			hw = ERR_PTR(-EINVAL);
+			goto err;
+		}
+
+		composite->gate_hw = gate_hw;
+		composite->gate_ops = gate_ops;
+		clk_composite_ops->is_enabled = clk_composite_is_enabled;
+		clk_composite_ops->enable = clk_composite_enable;
+		clk_composite_ops->disable = clk_composite_disable;
+	}
+
+	init.ops = clk_composite_ops;
+	composite->hw.init = &init;
+
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		hw = ERR_PTR(ret);
+		goto err;
+	}
+
+	if (composite->mux_hw)
+		composite->mux_hw->clk = hw->clk;
+
+	if (composite->rate_hw)
+		composite->rate_hw->clk = hw->clk;
+
+	if (composite->gate_hw)
+		composite->gate_hw->clk = hw->clk;
+
+	return hw;
+
+err:
+	kfree(composite);
+	return hw;
+}
+
+struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
+			const char * const *parent_names, int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	return __clk_hw_register_composite(dev, name, parent_names, NULL,
+					   num_parents, mux_hw, mux_ops,
+					   rate_hw, rate_ops, gate_hw,
+					   gate_ops, flags);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_composite);
+
+struct clk_hw *clk_hw_register_composite_pdata(struct device *dev,
+			const char *name,
+			const struct clk_parent_data *parent_data,
+			int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	return __clk_hw_register_composite(dev, name, NULL, parent_data,
+					   num_parents, mux_hw, mux_ops,
+					   rate_hw, rate_ops, gate_hw,
+					   gate_ops, flags);
+}
+
+struct clk *clk_register_composite(struct device *dev, const char *name,
+			const char * const *parent_names, int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
+			mux_hw, mux_ops, rate_hw, rate_ops, gate_hw, gate_ops,
+			flags);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_composite);
+
+struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
+			const struct clk_parent_data *parent_data,
+			int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_composite_pdata(dev, name, parent_data,
+			num_parents, mux_hw, mux_ops, rate_hw, rate_ops,
+			gate_hw, gate_ops, flags);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+
+void clk_unregister_composite(struct clk *clk)
+{
+	struct clk_composite *composite;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	composite = to_clk_composite(hw);
+
+	clk_unregister(clk);
+	kfree(composite);
+}
+
+void clk_hw_unregister_composite(struct clk_hw *hw)
+{
+	struct clk_composite *composite;
+
+	composite = to_clk_composite(hw);
+
+	clk_hw_unregister(hw);
+	kfree(composite);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_composite);
+
+static void devm_clk_hw_release_composite(struct device *dev, void *res)
+{
+	clk_hw_unregister_composite(*(struct clk_hw **)res);
+}
+
+static struct clk_hw *__devm_clk_hw_register_composite(struct device *dev,
+			const char *name, const char * const *parent_names,
+			const struct clk_parent_data *pdata, int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_composite, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_composite(dev, name, parent_names, pdata,
+					 num_parents, mux_hw, mux_ops, rate_hw,
+					 rate_ops, gate_hw, gate_ops, flags);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+
+struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
+			const char *name,
+			const struct clk_parent_data *parent_data,
+			int num_parents,
+			struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+			struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+			struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+			unsigned long flags)
+{
+	return __devm_clk_hw_register_composite(dev, name, NULL, parent_data,
+						num_parents, mux_hw, mux_ops,
+						rate_hw, rate_ops, gate_hw,
+						gate_ops, flags);
+}
diff --git a/drivers/clk/ccf/clk-conf.c b/drivers/clk/ccf/clk-conf.c
new file mode 100644
index 000000000000..303a0bb26e54
--- /dev/null
+++ b/drivers/clk/ccf/clk-conf.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2014 Samsung Electronics Co., Ltd.
+ * Sylwester Nawrocki <s.nawrocki@samsung.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clk/clk-conf.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+
+static int __set_clk_parents(struct device_node *node, bool clk_supplier)
+{
+	struct of_phandle_args clkspec;
+	int index, rc, num_parents;
+	struct clk *clk, *pclk;
+
+	num_parents = of_count_phandle_with_args(node, "assigned-clock-parents",
+						 "#clock-cells");
+	if (num_parents == -EINVAL)
+		pr_err("clk: invalid value of clock-parents property at %pOF\n",
+		       node);
+
+	for (index = 0; index < num_parents; index++) {
+		rc = of_parse_phandle_with_args(node, "assigned-clock-parents",
+					"#clock-cells",	index, &clkspec);
+		if (rc < 0) {
+			/* skip empty (null) phandles */
+			if (rc == -ENOENT)
+				continue;
+			else
+				return rc;
+		}
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
+			return 0;
+		}
+		pclk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(pclk)) {
+			if (PTR_ERR(pclk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get parent clock %d for %pOF\n",
+					index, node);
+			return PTR_ERR(pclk);
+		}
+
+		rc = of_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells", index, &clkspec);
+		if (rc < 0)
+			goto err;
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
+			rc = 0;
+			goto err;
+		}
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get assigned clock %d for %pOF\n",
+					index, node);
+			rc = PTR_ERR(clk);
+			goto err;
+		}
+
+		rc = clk_set_parent(clk, pclk);
+		if (rc < 0)
+			pr_err("clk: failed to reparent %s to %s: %d\n",
+			       __clk_get_name(clk), __clk_get_name(pclk), rc);
+		clk_put(clk);
+		clk_put(pclk);
+	}
+	return 0;
+err:
+	clk_put(pclk);
+	return rc;
+}
+
+static int __set_clk_rates(struct device_node *node, bool clk_supplier)
+{
+	struct of_phandle_args clkspec;
+	int rc, count, count_64, index;
+	struct clk *clk;
+	u64 *rates_64 __free(kfree) = NULL;
+	u32 *rates __free(kfree) = NULL;
+
+	count = of_property_count_u32_elems(node, "assigned-clock-rates");
+	count_64 = of_property_count_u64_elems(node, "assigned-clock-rates-u64");
+	if (count_64 > 0) {
+		count = count_64;
+		rates_64 = kcalloc(count, sizeof(*rates_64), GFP_KERNEL);
+		if (!rates_64)
+			return -ENOMEM;
+
+		rc = of_property_read_u64_array(node,
+						"assigned-clock-rates-u64",
+						rates_64, count);
+	} else if (count > 0) {
+		rates = kcalloc(count, sizeof(*rates), GFP_KERNEL);
+		if (!rates)
+			return -ENOMEM;
+
+		rc = of_property_read_u32_array(node, "assigned-clock-rates",
+						rates, count);
+	} else {
+		return 0;
+	}
+
+	if (rc)
+		return rc;
+
+	for (index = 0; index < count; index++) {
+		unsigned long rate;
+
+		if (rates_64)
+			rate = rates_64[index];
+		else
+			rate = rates[index];
+
+		if (rate) {
+			rc = of_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells",	index, &clkspec);
+			if (rc < 0) {
+				/* skip empty (null) phandles */
+				if (rc == -ENOENT)
+					continue;
+				else
+					return rc;
+			}
+			if (clkspec.np == node && !clk_supplier) {
+				of_node_put(clkspec.np);
+				return 0;
+			}
+
+			clk = of_clk_get_from_provider(&clkspec);
+			of_node_put(clkspec.np);
+			if (IS_ERR(clk)) {
+				if (PTR_ERR(clk) != -EPROBE_DEFER)
+					pr_warn("clk: couldn't get clock %d for %pOF\n",
+						index, node);
+				return PTR_ERR(clk);
+			}
+
+			rc = clk_set_rate(clk, rate);
+			if (rc < 0)
+				pr_err("clk: couldn't set %s clk rate to %lu (%d), current rate: %lu\n",
+				       __clk_get_name(clk), rate, rc,
+				       clk_get_rate(clk));
+			clk_put(clk);
+		}
+	}
+	return 0;
+}
+
+/**
+ * of_clk_set_defaults() - parse and set assigned clocks configuration
+ * @node: device node to apply clock settings for
+ * @clk_supplier: true if clocks supplied by @node should also be considered
+ *
+ * This function parses 'assigned-{clocks/clock-parents/clock-rates}' properties
+ * and sets any specified clock parents and rates. The @clk_supplier argument
+ * should be set to true if @node may be also a clock supplier of any clock
+ * listed in its 'assigned-clocks' or 'assigned-clock-parents' properties.
+ * If @clk_supplier is false the function exits returning 0 as soon as it
+ * determines the @node is also a supplier of any of the clocks.
+ */
+int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
+{
+	int rc;
+
+	if (!node)
+		return 0;
+
+	rc = __set_clk_parents(node, clk_supplier);
+	if (rc < 0)
+		return rc;
+
+	return __set_clk_rates(node, clk_supplier);
+}
+EXPORT_SYMBOL_GPL(of_clk_set_defaults);
diff --git a/drivers/clk/ccf/clk-divider.c b/drivers/clk/ccf/clk-divider.c
new file mode 100644
index 000000000000..2601b6155afb
--- /dev/null
+++ b/drivers/clk/ccf/clk-divider.c
@@ -0,0 +1,674 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
+ * Copyright (C) 2011 Richard Zhao, Linaro <richard.zhao@linaro.org>
+ * Copyright (C) 2011-2012 Mike Turquette, Linaro Ltd <mturquette@linaro.org>
+ *
+ * Adjustable divider clock implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/string.h>
+#include <linux/log2.h>
+
+/*
+ * DOC: basic adjustable divider clock that cannot gate
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is adjustable.  clk->rate = ceiling(parent->rate / divisor)
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+static inline u32 clk_div_readl(struct clk_divider *divider)
+{
+	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+		return ioread32be(divider->reg);
+
+	return readl(divider->reg);
+}
+
+static inline void clk_div_writel(struct clk_divider *divider, u32 val)
+{
+	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+		iowrite32be(val, divider->reg);
+	else
+		writel(val, divider->reg);
+}
+
+static unsigned int _get_table_maxdiv(const struct clk_div_table *table,
+				      u8 width)
+{
+	unsigned int maxdiv = 0, mask = clk_div_mask(width);
+	const struct clk_div_table *clkt;
+
+	for (clkt = table; clkt->div; clkt++)
+		if (clkt->div > maxdiv && clkt->val <= mask)
+			maxdiv = clkt->div;
+	return maxdiv;
+}
+
+static unsigned int _get_table_mindiv(const struct clk_div_table *table)
+{
+	unsigned int mindiv = UINT_MAX;
+	const struct clk_div_table *clkt;
+
+	for (clkt = table; clkt->div; clkt++)
+		if (clkt->div < mindiv)
+			mindiv = clkt->div;
+	return mindiv;
+}
+
+static unsigned int _get_maxdiv(const struct clk_div_table *table, u8 width,
+				unsigned long flags)
+{
+	if (flags & CLK_DIVIDER_ONE_BASED)
+		return clk_div_mask(width);
+	if (flags & CLK_DIVIDER_POWER_OF_TWO)
+		return 1 << clk_div_mask(width);
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
+		return 2 * (clk_div_mask(width) + 1);
+	if (table)
+		return _get_table_maxdiv(table, width);
+	return clk_div_mask(width) + 1;
+}
+
+static unsigned int _get_table_div(const struct clk_div_table *table,
+							unsigned int val)
+{
+	const struct clk_div_table *clkt;
+
+	for (clkt = table; clkt->div; clkt++)
+		if (clkt->val == val)
+			return clkt->div;
+	return 0;
+}
+
+static unsigned int _get_div(const struct clk_div_table *table,
+			     unsigned int val, unsigned long flags, u8 width)
+{
+	if (flags & CLK_DIVIDER_ONE_BASED)
+		return val;
+	if (flags & CLK_DIVIDER_POWER_OF_TWO)
+		return 1 << val;
+	if (flags & CLK_DIVIDER_MAX_AT_ZERO)
+		return val ? val : clk_div_mask(width) + 1;
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
+		return 2 * (val + 1);
+	if (table)
+		return _get_table_div(table, val);
+	return val + 1;
+}
+
+static unsigned int _get_table_val(const struct clk_div_table *table,
+							unsigned int div)
+{
+	const struct clk_div_table *clkt;
+
+	for (clkt = table; clkt->div; clkt++)
+		if (clkt->div == div)
+			return clkt->val;
+	return 0;
+}
+
+static unsigned int _get_val(const struct clk_div_table *table,
+			     unsigned int div, unsigned long flags, u8 width)
+{
+	if (flags & CLK_DIVIDER_ONE_BASED)
+		return div;
+	if (flags & CLK_DIVIDER_POWER_OF_TWO)
+		return __ffs(div);
+	if (flags & CLK_DIVIDER_MAX_AT_ZERO)
+		return (div == clk_div_mask(width) + 1) ? 0 : div;
+	if (flags & CLK_DIVIDER_EVEN_INTEGERS)
+		return (div >> 1) - 1;
+	if (table)
+		return  _get_table_val(table, div);
+	return div - 1;
+}
+
+unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
+				  unsigned int val,
+				  const struct clk_div_table *table,
+				  unsigned long flags, unsigned long width)
+{
+	unsigned int div;
+
+	div = _get_div(table, val, flags, width);
+	if (!div) {
+		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
+			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
+			clk_hw_get_name(hw));
+		return parent_rate;
+	}
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
+}
+EXPORT_SYMBOL_GPL(divider_recalc_rate);
+
+static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	unsigned int val;
+
+	val = clk_div_readl(divider) >> divider->shift;
+	val &= clk_div_mask(divider->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, divider->table,
+				   divider->flags, divider->width);
+}
+
+static bool _is_valid_table_div(const struct clk_div_table *table,
+							 unsigned int div)
+{
+	const struct clk_div_table *clkt;
+
+	for (clkt = table; clkt->div; clkt++)
+		if (clkt->div == div)
+			return true;
+	return false;
+}
+
+static bool _is_valid_div(const struct clk_div_table *table, unsigned int div,
+			  unsigned long flags)
+{
+	if (flags & CLK_DIVIDER_POWER_OF_TWO)
+		return is_power_of_2(div);
+	if (table)
+		return _is_valid_table_div(table, div);
+	return true;
+}
+
+static int _round_up_table(const struct clk_div_table *table, int div)
+{
+	const struct clk_div_table *clkt;
+	int up = INT_MAX;
+
+	for (clkt = table; clkt->div; clkt++) {
+		if (clkt->div == div)
+			return clkt->div;
+		else if (clkt->div < div)
+			continue;
+
+		if ((clkt->div - div) < (up - div))
+			up = clkt->div;
+	}
+
+	return up;
+}
+
+static int _round_down_table(const struct clk_div_table *table, int div)
+{
+	const struct clk_div_table *clkt;
+	int down = _get_table_mindiv(table);
+
+	for (clkt = table; clkt->div; clkt++) {
+		if (clkt->div == div)
+			return clkt->div;
+		else if (clkt->div > div)
+			continue;
+
+		if ((div - clkt->div) < (div - down))
+			down = clkt->div;
+	}
+
+	return down;
+}
+
+static int _div_round_up(const struct clk_div_table *table,
+			 unsigned long parent_rate, unsigned long rate,
+			 unsigned long flags)
+{
+	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+
+	if (flags & CLK_DIVIDER_POWER_OF_TWO)
+		div = __roundup_pow_of_two(div);
+	if (table)
+		div = _round_up_table(table, div);
+
+	return div;
+}
+
+static int _div_round_closest(const struct clk_div_table *table,
+			      unsigned long parent_rate, unsigned long rate,
+			      unsigned long flags)
+{
+	int up, down;
+	unsigned long up_rate, down_rate;
+
+	up = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	down = parent_rate / rate;
+
+	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
+		up = __roundup_pow_of_two(up);
+		down = __rounddown_pow_of_two(down);
+	} else if (table) {
+		up = _round_up_table(table, up);
+		down = _round_down_table(table, down);
+	}
+
+	up_rate = DIV_ROUND_UP_ULL((u64)parent_rate, up);
+	down_rate = DIV_ROUND_UP_ULL((u64)parent_rate, down);
+
+	return (rate - up_rate) <= (down_rate - rate) ? up : down;
+}
+
+static int _div_round(const struct clk_div_table *table,
+		      unsigned long parent_rate, unsigned long rate,
+		      unsigned long flags)
+{
+	if (flags & CLK_DIVIDER_ROUND_CLOSEST)
+		return _div_round_closest(table, parent_rate, rate, flags);
+
+	return _div_round_up(table, parent_rate, rate, flags);
+}
+
+static bool _is_best_div(unsigned long rate, unsigned long now,
+			 unsigned long best, unsigned long flags)
+{
+	if (flags & CLK_DIVIDER_ROUND_CLOSEST)
+		return abs(rate - now) < abs(rate - best);
+
+	return now <= rate && now > best;
+}
+
+static int _next_div(const struct clk_div_table *table, int div,
+		     unsigned long flags)
+{
+	div++;
+
+	if (flags & CLK_DIVIDER_POWER_OF_TWO)
+		return __roundup_pow_of_two(div);
+	if (table)
+		return _round_up_table(table, div);
+
+	return div;
+}
+
+static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
+			       unsigned long rate,
+			       unsigned long *best_parent_rate,
+			       const struct clk_div_table *table, u8 width,
+			       unsigned long flags)
+{
+	int i, bestdiv = 0;
+	unsigned long parent_rate, best = 0, now, maxdiv;
+	unsigned long parent_rate_saved = *best_parent_rate;
+
+	if (!rate)
+		rate = 1;
+
+	maxdiv = _get_maxdiv(table, width, flags);
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+		parent_rate = *best_parent_rate;
+		bestdiv = _div_round(table, parent_rate, rate, flags);
+		bestdiv = bestdiv == 0 ? 1 : bestdiv;
+		bestdiv = bestdiv > maxdiv ? maxdiv : bestdiv;
+		return bestdiv;
+	}
+
+	/*
+	 * The maximum divider we can use without overflowing
+	 * unsigned long in rate * i below
+	 */
+	maxdiv = min(ULONG_MAX / rate, maxdiv);
+
+	for (i = _next_div(table, 0, flags); i <= maxdiv;
+					     i = _next_div(table, i, flags)) {
+		if (rate * i == parent_rate_saved) {
+			/*
+			 * It's the most ideal case if the requested rate can be
+			 * divided from parent clock without needing to change
+			 * parent rate, so return the divider immediately.
+			 */
+			*best_parent_rate = parent_rate_saved;
+			return i;
+		}
+		parent_rate = clk_hw_round_rate(parent, rate * i);
+		now = DIV_ROUND_UP_ULL((u64)parent_rate, i);
+		if (_is_best_div(rate, now, best, flags)) {
+			bestdiv = i;
+			best = now;
+			*best_parent_rate = parent_rate;
+		}
+	}
+
+	if (!bestdiv) {
+		bestdiv = _get_maxdiv(table, width, flags);
+		*best_parent_rate = clk_hw_round_rate(parent, 1);
+	}
+
+	return bestdiv;
+}
+
+int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			   const struct clk_div_table *table, u8 width,
+			   unsigned long flags)
+{
+	int div;
+
+	div = clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
+				  &req->best_parent_rate, table, width, flags);
+
+	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(divider_determine_rate);
+
+int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			      const struct clk_div_table *table, u8 width,
+			      unsigned long flags, unsigned int val)
+{
+	int div;
+
+	div = _get_div(table, val, flags, width);
+
+	/* Even a read-only clock can propagate a rate change */
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		if (!req->best_parent_hw)
+			return -EINVAL;
+
+		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+							  req->rate * div);
+	}
+
+	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(divider_ro_determine_rate);
+
+long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
+			       unsigned long rate, unsigned long *prate,
+			       const struct clk_div_table *table,
+			       u8 width, unsigned long flags)
+{
+	struct clk_rate_request req;
+	int ret;
+
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
+	ret = divider_determine_rate(hw, &req, table, width, flags);
+	if (ret)
+		return ret;
+
+	*prate = req.best_parent_rate;
+
+	return req.rate;
+}
+EXPORT_SYMBOL_GPL(divider_round_rate_parent);
+
+long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
+				  unsigned long rate, unsigned long *prate,
+				  const struct clk_div_table *table, u8 width,
+				  unsigned long flags, unsigned int val)
+{
+	struct clk_rate_request req;
+	int ret;
+
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
+	ret = divider_ro_determine_rate(hw, &req, table, width, flags, val);
+	if (ret)
+		return ret;
+
+	*prate = req.best_parent_rate;
+
+	return req.rate;
+}
+EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
+
+static int clk_divider_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+
+	/* if read only, just return current value */
+	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
+		u32 val;
+
+		val = clk_div_readl(divider) >> divider->shift;
+		val &= clk_div_mask(divider->width);
+
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width,
+						 divider->flags, val);
+	}
+
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
+}
+
+int divider_get_val(unsigned long rate, unsigned long parent_rate,
+		    const struct clk_div_table *table, u8 width,
+		    unsigned long flags)
+{
+	unsigned int div, value;
+
+	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+
+	if (!_is_valid_div(table, div, flags))
+		return -EINVAL;
+
+	value = _get_val(table, div, flags, width);
+
+	return min_t(unsigned int, value, clk_div_mask(width));
+}
+EXPORT_SYMBOL_GPL(divider_get_val);
+
+static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	int value;
+	unsigned long flags = 0;
+	u32 val;
+
+	value = divider_get_val(rate, parent_rate, divider->table,
+				divider->width, divider->flags);
+	if (value < 0)
+		return value;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
+		val = clk_div_mask(divider->width) << (divider->shift + 16);
+	} else {
+		val = clk_div_readl(divider);
+		val &= ~(clk_div_mask(divider->width) << divider->shift);
+	}
+	val |= (u32)value << divider->shift;
+	clk_div_writel(divider, val);
+
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return 0;
+}
+
+const struct clk_ops clk_divider_ops = {
+	.recalc_rate = clk_divider_recalc_rate,
+	.determine_rate = clk_divider_determine_rate,
+	.set_rate = clk_divider_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_divider_ops);
+
+const struct clk_ops clk_divider_ro_ops = {
+	.recalc_rate = clk_divider_recalc_rate,
+	.determine_rate = clk_divider_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_divider_ro_ops);
+
+struct clk_hw *__clk_hw_register_divider(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		unsigned long clk_divider_flags,
+		const struct clk_div_table *table, spinlock_t *lock)
+{
+	struct clk_divider *div;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret;
+
+	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
+		if (width + shift > 16) {
+			pr_warn("divider value exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	/* allocate the divider */
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
+		init.ops = &clk_divider_ro_ops;
+	else
+		init.ops = &clk_divider_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_divider assignments */
+	div->reg = reg;
+	div->shift = shift;
+	div->width = width;
+	div->flags = clk_divider_flags;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = table;
+
+	/* register the clock */
+	hw = &div->hw;
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(div);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__clk_hw_register_divider);
+
+/**
+ * clk_register_divider_table - register a table based divider clock with
+ * the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @table: array of divider/value pairs ending with a div set to 0
+ * @lock: shared register lock for this clock
+ */
+struct clk *clk_register_divider_table(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		unsigned long clk_divider_flags,
+		const struct clk_div_table *table, spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	hw =  __clk_hw_register_divider(dev, NULL, name, parent_name, NULL,
+			NULL, flags, reg, shift, width, clk_divider_flags,
+			table, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_divider_table);
+
+void clk_unregister_divider(struct clk *clk)
+{
+	struct clk_divider *div;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	div = to_clk_divider(hw);
+
+	clk_unregister(clk);
+	kfree(div);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_divider);
+
+/**
+ * clk_hw_unregister_divider - unregister a clk divider
+ * @hw: hardware-specific clock data to unregister
+ */
+void clk_hw_unregister_divider(struct clk_hw *hw)
+{
+	struct clk_divider *div;
+
+	div = to_clk_divider(hw);
+
+	clk_hw_unregister(hw);
+	kfree(div);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_divider);
+
+static void devm_clk_hw_release_divider(struct device *dev, void *res)
+{
+	clk_hw_unregister_divider(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		unsigned long clk_divider_flags,
+		const struct clk_div_table *table, spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_divider, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_divider(dev, np, name, parent_name, parent_hw,
+				       parent_data, flags, reg, shift, width,
+				       clk_divider_flags, table, lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_divider);
diff --git a/drivers/clk/ccf/clk-fixed-factor.c b/drivers/clk/ccf/clk-fixed-factor.c
new file mode 100644
index 000000000000..de658c9e4c53
--- /dev/null
+++ b/drivers/clk/ccf/clk-fixed-factor.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
+ */
+#include <linux/module.h>
+#include <linux/clk-provider.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+/*
+ * DOC: basic fixed multiplier and divider clock that cannot gate
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is fixed.  clk->rate = parent->rate / div * mult
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+static unsigned long clk_factor_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+	unsigned long long int rate;
+
+	rate = (unsigned long long int)parent_rate * fix->mult;
+	do_div(rate, fix->div);
+	return (unsigned long)rate;
+}
+
+static int clk_factor_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		unsigned long best_parent;
+
+		best_parent = (req->rate / fix->mult) * fix->div;
+		req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	}
+
+	req->rate = (req->best_parent_rate / fix->div) * fix->mult;
+
+	return 0;
+}
+
+static int clk_factor_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	/*
+	 * We must report success but we can do so unconditionally because
+	 * clk_factor_determine_rate returns values that ensure this call is a
+	 * nop.
+	 */
+
+	return 0;
+}
+
+static unsigned long clk_factor_recalc_accuracy(struct clk_hw *hw,
+						unsigned long parent_accuracy)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (fix->flags & CLK_FIXED_FACTOR_FIXED_ACCURACY)
+		return fix->acc;
+
+	return parent_accuracy;
+}
+
+const struct clk_ops clk_fixed_factor_ops = {
+	.determine_rate = clk_factor_determine_rate,
+	.set_rate = clk_factor_set_rate,
+	.recalc_rate = clk_factor_recalc_rate,
+	.recalc_accuracy = clk_factor_recalc_accuracy,
+};
+EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
+
+static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
+{
+	struct clk_fixed_factor *fix = res;
+
+	/*
+	 * We can not use clk_hw_unregister_fixed_factor, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&fix->hw);
+}
+
+static struct clk_hw *
+__clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
+		const char *name, const char *parent_name,
+		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		unsigned long acc, unsigned int fixflags, bool devm)
+{
+	struct clk_fixed_factor *fix;
+	struct clk_init_data init = { };
+	struct clk_hw *hw;
+	int ret;
+
+	/* You can't use devm without a dev */
+	if (devm && !dev)
+		return ERR_PTR(-EINVAL);
+
+	if (devm)
+		fix = devres_alloc(devm_clk_hw_register_fixed_factor_release,
+				sizeof(*fix), GFP_KERNEL);
+	else
+		fix = kmalloc(sizeof(*fix), GFP_KERNEL);
+	if (!fix)
+		return ERR_PTR(-ENOMEM);
+
+	/* struct clk_fixed_factor assignments */
+	fix->mult = mult;
+	fix->div = div;
+	fix->hw.init = &init;
+	fix->acc = acc;
+	fix->flags = fixflags;
+
+	init.name = name;
+	init.ops = &clk_fixed_factor_ops;
+	init.flags = flags;
+	if (parent_name)
+		init.parent_names = &parent_name;
+	else if (parent_hw)
+		init.parent_hws = &parent_hw;
+	else
+		init.parent_data = pdata;
+	init.num_parents = 1;
+
+	hw = &fix->hw;
+	if (dev)
+		ret = clk_hw_register(dev, hw);
+	else
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		if (devm)
+			devres_free(fix);
+		else
+			kfree(fix);
+		hw = ERR_PTR(ret);
+	} else if (devm)
+		devres_add(dev, fix);
+
+	return hw;
+}
+
+/**
+ * devm_clk_hw_register_fixed_factor_index - Register a fixed factor clock with
+ * parent from DT index
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @index: index of phandle in @dev 'clocks' property
+ * @flags: fixed factor flags
+ * @mult: multiplier
+ * @div: divider
+ *
+ * Return: Pointer to fixed factor clk_hw structure that was registered or
+ * an error pointer.
+ */
+struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = index };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL, &pdata,
+					      flags, mult, div, 0, 0, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
+
+/**
+ * devm_clk_hw_register_fixed_factor_parent_hw - Register a fixed factor clock with
+ * pointer to parent clock
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: fixed factor flags
+ * @mult: multiplier
+ * @div: divider
+ *
+ * Return: Pointer to fixed factor clk_hw structure that was registered or
+ * an error pointer.
+ */
+struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+		const char *name, const struct clk_hw *parent_hw,
+		unsigned long flags, unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = -1 };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
+					      &pdata, flags, mult, div, 0, 0, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
+
+struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+		const char *name, const struct clk_hw *parent_hw,
+		unsigned long flags, unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = -1 };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
+					      &pdata, flags, mult, div, 0, 0, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
+
+struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = -1 };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
+					      &pdata, flags, mult, div, 0, 0, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
+
+struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
+
+	return __clk_hw_register_fixed_factor(dev, np, name, NULL, NULL,
+			&pdata, flags, mult, div, 0, 0, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_fwname);
+
+struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		unsigned long acc)
+{
+	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
+
+	return __clk_hw_register_fixed_factor(dev, np, name, NULL, NULL,
+			&pdata, flags, mult, div, acc,
+			CLK_FIXED_FACTOR_FIXED_ACCURACY, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_with_accuracy_fwname);
+
+struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = index };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL, &pdata,
+					      flags, mult, div, 0, 0, false);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_index);
+
+struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_fixed_factor(dev, name, parent_name, flags, mult,
+					  div);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_fixed_factor);
+
+void clk_unregister_fixed_factor(struct clk *clk)
+{
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	clk_unregister(clk);
+	kfree(to_clk_fixed_factor(hw));
+}
+EXPORT_SYMBOL_GPL(clk_unregister_fixed_factor);
+
+void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
+{
+	struct clk_fixed_factor *fix;
+
+	fix = to_clk_fixed_factor(hw);
+
+	clk_hw_unregister(hw);
+	kfree(fix);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
+
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = -1 };
+
+	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
+			&pdata, flags, mult, div, 0, 0, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
+
+struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div)
+{
+	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
+
+	return __clk_hw_register_fixed_factor(dev, np, name, NULL, NULL,
+			&pdata, flags, mult, div, 0, 0, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_fwname);
+
+struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		unsigned long acc)
+{
+	const struct clk_parent_data pdata = { .index = -1, .fw_name = fw_name };
+
+	return __clk_hw_register_fixed_factor(dev, np, name, NULL, NULL,
+			&pdata, flags, mult, div, acc,
+			CLK_FIXED_FACTOR_FIXED_ACCURACY, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_with_accuracy_fwname);
+
+#ifdef CONFIG_OF
+static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
+{
+	struct clk_hw *hw;
+	const char *clk_name = node->name;
+	const struct clk_parent_data pdata = { .index = 0 };
+	u32 div, mult;
+	int ret;
+
+	if (of_property_read_u32(node, "clock-div", &div)) {
+		pr_err("%s Fixed factor clock <%pOFn> must have a clock-div property\n",
+			__func__, node);
+		return ERR_PTR(-EIO);
+	}
+
+	if (of_property_read_u32(node, "clock-mult", &mult)) {
+		pr_err("%s Fixed factor clock <%pOFn> must have a clock-mult property\n",
+			__func__, node);
+		return ERR_PTR(-EIO);
+	}
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+
+	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, NULL,
+					    &pdata, 0, mult, div, 0, 0, false);
+	if (IS_ERR(hw)) {
+		/*
+		 * Clear OF_POPULATED flag so that clock registration can be
+		 * attempted again from probe function.
+		 */
+		of_node_clear_flag(node, OF_POPULATED);
+		return ERR_CAST(hw);
+	}
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
+	if (ret) {
+		clk_hw_unregister_fixed_factor(hw);
+		return ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+/**
+ * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
+ * @node:	device node for the clock
+ */
+void __init of_fixed_factor_clk_setup(struct device_node *node)
+{
+	_of_fixed_factor_clk_setup(node);
+}
+CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
+		of_fixed_factor_clk_setup);
+
+static void of_fixed_factor_clk_remove(struct platform_device *pdev)
+{
+	struct clk_hw *clk = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_hw_unregister_fixed_factor(clk);
+}
+
+static int of_fixed_factor_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw *clk;
+
+	/*
+	 * This function is not executed when of_fixed_factor_clk_setup
+	 * succeeded.
+	 */
+	clk = _of_fixed_factor_clk_setup(pdev->dev.of_node);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, clk);
+
+	return 0;
+}
+
+static const struct of_device_id of_fixed_factor_clk_ids[] = {
+	{ .compatible = "fixed-factor-clock" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_fixed_factor_clk_ids);
+
+static struct platform_driver of_fixed_factor_clk_driver = {
+	.driver = {
+		.name = "of_fixed_factor_clk",
+		.of_match_table = of_fixed_factor_clk_ids,
+	},
+	.probe = of_fixed_factor_clk_probe,
+	.remove = of_fixed_factor_clk_remove,
+};
+builtin_platform_driver(of_fixed_factor_clk_driver);
+#endif
diff --git a/drivers/clk/ccf/clk-fixed-rate.c b/drivers/clk/ccf/clk-fixed-rate.c
new file mode 100644
index 000000000000..6b4f76b9c4da
--- /dev/null
+++ b/drivers/clk/ccf/clk-fixed-rate.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2010-2011 Canonical Ltd <jeremy.kerr@canonical.com>
+ * Copyright (C) 2011-2012 Mike Turquette, Linaro Ltd <mturquette@linaro.org>
+ *
+ * Fixed rate clock implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+/*
+ * DOC: basic fixed-rate clock that cannot gate
+ *
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parents are prepared
+ * enable - clk_enable only ensures parents are enabled
+ * rate - rate is always a fixed value.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+#define to_clk_fixed_rate(_hw) container_of(_hw, struct clk_fixed_rate, hw)
+
+static unsigned long clk_fixed_rate_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	return to_clk_fixed_rate(hw)->fixed_rate;
+}
+
+static unsigned long clk_fixed_rate_recalc_accuracy(struct clk_hw *hw,
+		unsigned long parent_accuracy)
+{
+	struct clk_fixed_rate *fixed = to_clk_fixed_rate(hw);
+
+	if (fixed->flags & CLK_FIXED_RATE_PARENT_ACCURACY)
+		return parent_accuracy;
+
+	return fixed->fixed_accuracy;
+}
+
+const struct clk_ops clk_fixed_rate_ops = {
+	.recalc_rate = clk_fixed_rate_recalc_rate,
+	.recalc_accuracy = clk_fixed_rate_recalc_accuracy,
+};
+EXPORT_SYMBOL_GPL(clk_fixed_rate_ops);
+
+static void devm_clk_hw_register_fixed_rate_release(struct device *dev, void *res)
+{
+	struct clk_fixed_rate *fix = res;
+
+	/*
+	 * We can not use clk_hw_unregister_fixed_rate, since it will kfree()
+	 * the hw, resulting in double free. Just unregister the hw and let
+	 * devres code kfree() it.
+	 */
+	clk_hw_unregister(&fix->hw);
+}
+
+struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		unsigned long fixed_rate, unsigned long fixed_accuracy,
+		unsigned long clk_fixed_flags, bool devm)
+{
+	struct clk_fixed_rate *fixed;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret = -EINVAL;
+
+	/* allocate fixed-rate clock */
+	if (devm)
+		fixed = devres_alloc(devm_clk_hw_register_fixed_rate_release,
+				     sizeof(*fixed), GFP_KERNEL);
+	else
+		fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_fixed_rate_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_fixed_rate assignments */
+	fixed->flags = clk_fixed_flags;
+	fixed->fixed_rate = fixed_rate;
+	fixed->fixed_accuracy = fixed_accuracy;
+	fixed->hw.init = &init;
+
+	/* register the clock */
+	hw = &fixed->hw;
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		if (devm)
+			devres_free(fixed);
+		else
+			kfree(fixed);
+		hw = ERR_PTR(ret);
+	} else if (devm)
+		devres_add(dev, fixed);
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_rate);
+
+struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		unsigned long fixed_rate)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_fixed_rate_with_accuracy(dev, name, parent_name,
+						      flags, fixed_rate, 0);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_fixed_rate);
+
+void clk_unregister_fixed_rate(struct clk *clk)
+{
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	clk_unregister(clk);
+	kfree(to_clk_fixed_rate(hw));
+}
+EXPORT_SYMBOL_GPL(clk_unregister_fixed_rate);
+
+void clk_hw_unregister_fixed_rate(struct clk_hw *hw)
+{
+	struct clk_fixed_rate *fixed;
+
+	fixed = to_clk_fixed_rate(hw);
+
+	clk_hw_unregister(hw);
+	kfree(fixed);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_rate);
+
+#ifdef CONFIG_OF
+static struct clk_hw *_of_fixed_clk_setup(struct device_node *node)
+{
+	struct clk_hw *hw;
+	const char *clk_name = node->name;
+	u32 rate;
+	u32 accuracy = 0;
+	int ret;
+
+	if (of_property_read_u32(node, "clock-frequency", &rate))
+		return ERR_PTR(-EIO);
+
+	of_property_read_u32(node, "clock-accuracy", &accuracy);
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+
+	hw = clk_hw_register_fixed_rate_with_accuracy(NULL, clk_name, NULL,
+						    0, rate, accuracy);
+	if (IS_ERR(hw))
+		return hw;
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
+	if (ret) {
+		clk_hw_unregister_fixed_rate(hw);
+		return ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+/**
+ * of_fixed_clk_setup() - Setup function for simple fixed rate clock
+ * @node:	device node for the clock
+ */
+void __init of_fixed_clk_setup(struct device_node *node)
+{
+	_of_fixed_clk_setup(node);
+}
+CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
+
+static void of_fixed_clk_remove(struct platform_device *pdev)
+{
+	struct clk_hw *hw = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_hw_unregister_fixed_rate(hw);
+}
+
+static int of_fixed_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw *hw;
+
+	/*
+	 * This function is not executed when of_fixed_clk_setup
+	 * succeeded.
+	 */
+	hw = _of_fixed_clk_setup(pdev->dev.of_node);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	platform_set_drvdata(pdev, hw);
+
+	return 0;
+}
+
+static const struct of_device_id of_fixed_clk_ids[] = {
+	{ .compatible = "fixed-clock" },
+	{ }
+};
+
+static struct platform_driver of_fixed_clk_driver = {
+	.driver = {
+		.name = "of_fixed_clk",
+		.of_match_table = of_fixed_clk_ids,
+	},
+	.probe = of_fixed_clk_probe,
+	.remove = of_fixed_clk_remove,
+};
+builtin_platform_driver(of_fixed_clk_driver);
+#endif
diff --git a/drivers/clk/ccf/clk-gate.c b/drivers/clk/ccf/clk-gate.c
new file mode 100644
index 000000000000..4746f8219132
--- /dev/null
+++ b/drivers/clk/ccf/clk-gate.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2010-2011 Canonical Ltd <jeremy.kerr@canonical.com>
+ * Copyright (C) 2011-2012 Mike Turquette, Linaro Ltd <mturquette@linaro.org>
+ *
+ * Gated clock implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/string.h>
+
+/**
+ * DOC: basic gateable clock which can gate and ungate its output
+ *
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parent is (un)prepared
+ * enable - clk_enable and clk_disable are functional & control gating
+ * rate - inherits rate from parent.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+static inline u32 clk_gate_readl(struct clk_gate *gate)
+{
+	if (gate->flags & CLK_GATE_BIG_ENDIAN)
+		return ioread32be(gate->reg);
+
+	return readl(gate->reg);
+}
+
+static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
+{
+	if (gate->flags & CLK_GATE_BIG_ENDIAN)
+		iowrite32be(val, gate->reg);
+	else
+		writel(val, gate->reg);
+}
+
+/*
+ * It works on following logic:
+ *
+ * For enabling clock, enable = 1
+ *	set2dis = 1	-> clear bit	-> set = 0
+ *	set2dis = 0	-> set bit	-> set = 1
+ *
+ * For disabling clock, enable = 0
+ *	set2dis = 1	-> set bit	-> set = 1
+ *	set2dis = 0	-> clear bit	-> set = 0
+ *
+ * So, result is always: enable xor set2dis.
+ */
+static void clk_gate_endisable(struct clk_hw *hw, int enable)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	int set = gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
+	unsigned long flags;
+	u32 reg;
+
+	set ^= enable;
+
+	if (gate->lock)
+		spin_lock_irqsave(gate->lock, flags);
+	else
+		__acquire(gate->lock);
+
+	if (gate->flags & CLK_GATE_HIWORD_MASK) {
+		reg = BIT(gate->bit_idx + 16);
+		if (set)
+			reg |= BIT(gate->bit_idx);
+	} else {
+		reg = clk_gate_readl(gate);
+
+		if (set)
+			reg |= BIT(gate->bit_idx);
+		else
+			reg &= ~BIT(gate->bit_idx);
+	}
+
+	clk_gate_writel(gate, reg);
+
+	if (gate->lock)
+		spin_unlock_irqrestore(gate->lock, flags);
+	else
+		__release(gate->lock);
+}
+
+static int clk_gate_enable(struct clk_hw *hw)
+{
+	clk_gate_endisable(hw, 1);
+
+	return 0;
+}
+
+static void clk_gate_disable(struct clk_hw *hw)
+{
+	clk_gate_endisable(hw, 0);
+}
+
+int clk_gate_is_enabled(struct clk_hw *hw)
+{
+	u32 reg;
+	struct clk_gate *gate = to_clk_gate(hw);
+
+	reg = clk_gate_readl(gate);
+
+	/* if a set bit disables this clk, flip it before masking */
+	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
+		reg ^= BIT(gate->bit_idx);
+
+	reg &= BIT(gate->bit_idx);
+
+	return reg ? 1 : 0;
+}
+EXPORT_SYMBOL_GPL(clk_gate_is_enabled);
+
+const struct clk_ops clk_gate_ops = {
+	.enable = clk_gate_enable,
+	.disable = clk_gate_disable,
+	.is_enabled = clk_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_gate_ops);
+
+struct clk_hw *__clk_hw_register_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_gate *gate;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret = -EINVAL;
+
+	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
+		if (bit_idx > 15) {
+			pr_err("gate bit exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	/* allocate the gate */
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_gate_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_gate assignments */
+	gate->reg = reg;
+	gate->bit_idx = bit_idx;
+	gate->flags = clk_gate_flags;
+	gate->lock = lock;
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else if (np)
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+
+}
+EXPORT_SYMBOL_GPL(__clk_hw_register_gate);
+
+struct clk *clk_register_gate(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_gate(dev, name, parent_name, flags, reg,
+				  bit_idx, clk_gate_flags, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_gate);
+
+void clk_unregister_gate(struct clk *clk)
+{
+	struct clk_gate *gate;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	gate = to_clk_gate(hw);
+
+	clk_unregister(clk);
+	kfree(gate);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_gate);
+
+void clk_hw_unregister_gate(struct clk_hw *hw)
+{
+	struct clk_gate *gate;
+
+	gate = to_clk_gate(hw);
+
+	clk_hw_unregister(hw);
+	kfree(gate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_gate);
+
+static void devm_clk_hw_release_gate(struct device *dev, void *res)
+{
+	clk_hw_unregister_gate(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_gate, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_gate(dev, np, name, parent_name, parent_hw,
+				    parent_data, flags, reg, bit_idx,
+				    clk_gate_flags, lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_gate);
diff --git a/drivers/clk/ccf/clk-mux.c b/drivers/clk/ccf/clk-mux.c
new file mode 100644
index 000000000000..fa817c317c2a
--- /dev/null
+++ b/drivers/clk/ccf/clk-mux.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
+ * Copyright (C) 2011 Richard Zhao, Linaro <richard.zhao@linaro.org>
+ * Copyright (C) 2011-2012 Mike Turquette, Linaro Ltd <mturquette@linaro.org>
+ *
+ * Simple multiplexer clock implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+
+/*
+ * DOC: basic adjustable multiplexer clock that cannot gate
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is only affected by parent switching.  No clk_set_rate support
+ * parent - parent is adjustable through clk_set_parent
+ */
+
+static inline u32 clk_mux_readl(struct clk_mux *mux)
+{
+	if (mux->flags & CLK_MUX_BIG_ENDIAN)
+		return ioread32be(mux->reg);
+
+	return readl(mux->reg);
+}
+
+static inline void clk_mux_writel(struct clk_mux *mux, u32 val)
+{
+	if (mux->flags & CLK_MUX_BIG_ENDIAN)
+		iowrite32be(val, mux->reg);
+	else
+		writel(val, mux->reg);
+}
+
+int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
+			 unsigned int val)
+{
+	int num_parents = clk_hw_get_num_parents(hw);
+
+	if (table) {
+		int i;
+
+		for (i = 0; i < num_parents; i++)
+			if (table[i] == val)
+				return i;
+		return -EINVAL;
+	}
+
+	if (val && (flags & CLK_MUX_INDEX_BIT))
+		val = ffs(val) - 1;
+
+	if (val && (flags & CLK_MUX_INDEX_ONE))
+		val--;
+
+	if (val >= num_parents)
+		return -EINVAL;
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(clk_mux_val_to_index);
+
+unsigned int clk_mux_index_to_val(const u32 *table, unsigned int flags, u8 index)
+{
+	unsigned int val = index;
+
+	if (table) {
+		val = table[index];
+	} else {
+		if (flags & CLK_MUX_INDEX_BIT)
+			val = 1 << index;
+
+		if (flags & CLK_MUX_INDEX_ONE)
+			val++;
+	}
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(clk_mux_index_to_val);
+
+static u8 clk_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	u32 val;
+
+	val = clk_mux_readl(mux) >> mux->shift;
+	val &= mux->mask;
+
+	return clk_mux_val_to_index(hw, mux->table, mux->flags, val);
+}
+
+static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	u32 val = clk_mux_index_to_val(mux->table, mux->flags, index);
+	unsigned long flags = 0;
+	u32 reg;
+
+	if (mux->lock)
+		spin_lock_irqsave(mux->lock, flags);
+	else
+		__acquire(mux->lock);
+
+	if (mux->flags & CLK_MUX_HIWORD_MASK) {
+		reg = mux->mask << (mux->shift + 16);
+	} else {
+		reg = clk_mux_readl(mux);
+		reg &= ~(mux->mask << mux->shift);
+	}
+	val = val << mux->shift;
+	reg |= val;
+	clk_mux_writel(mux, reg);
+
+	if (mux->lock)
+		spin_unlock_irqrestore(mux->lock, flags);
+	else
+		__release(mux->lock);
+
+	return 0;
+}
+
+static int clk_mux_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+
+	return clk_mux_determine_rate_flags(hw, req, mux->flags);
+}
+
+const struct clk_ops clk_mux_ops = {
+	.get_parent = clk_mux_get_parent,
+	.set_parent = clk_mux_set_parent,
+	.determine_rate = clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_mux_ops);
+
+const struct clk_ops clk_mux_ro_ops = {
+	.get_parent = clk_mux_get_parent,
+};
+EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
+
+struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, const u32 *table, spinlock_t *lock)
+{
+	struct clk_mux *mux;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret = -EINVAL;
+
+	if (clk_mux_flags & CLK_MUX_HIWORD_MASK) {
+		u8 width = fls(mask) - ffs(mask) + 1;
+
+		if (width + shift > 16) {
+			pr_err("mux value exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	/* allocate the mux */
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	if (clk_mux_flags & CLK_MUX_READ_ONLY)
+		init.ops = &clk_mux_ro_ops;
+	else
+		init.ops = &clk_mux_ops;
+	init.flags = flags;
+	init.parent_names = parent_names;
+	init.parent_data = parent_data;
+	init.parent_hws = parent_hws;
+	init.num_parents = num_parents;
+
+	/* struct clk_mux assignments */
+	mux->reg = reg;
+	mux->shift = shift;
+	mux->mask = mask;
+	mux->flags = clk_mux_flags;
+	mux->lock = lock;
+	mux->table = table;
+	mux->hw.init = &init;
+
+	hw = &mux->hw;
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else if (np)
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		kfree(mux);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
+
+static void devm_clk_hw_release_mux(struct device *dev, void *res)
+{
+	clk_hw_unregister_mux(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, const u32 *table, spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_mux, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_mux(dev, np, name, num_parents, parent_names, parent_hws,
+				       parent_data, flags, reg, shift, mask,
+				       clk_mux_flags, table, lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_mux);
+
+struct clk *clk_register_mux_table(struct device *dev, const char *name,
+		const char * const *parent_names, u8 num_parents,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, const u32 *table, spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_mux_table(dev, name, parent_names,
+				       num_parents, flags, reg, shift, mask,
+				       clk_mux_flags, table, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_mux_table);
+
+void clk_unregister_mux(struct clk *clk)
+{
+	struct clk_mux *mux;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	mux = to_clk_mux(hw);
+
+	clk_unregister(clk);
+	kfree(mux);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_mux);
+
+void clk_hw_unregister_mux(struct clk_hw *hw)
+{
+	struct clk_mux *mux;
+
+	mux = to_clk_mux(hw);
+
+	clk_hw_unregister(hw);
+	kfree(mux);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_mux);
diff --git a/drivers/clk/ccf/clk.c b/drivers/clk/ccf/clk.c
new file mode 100644
index 000000000000..73aaa96b3d0e
--- /dev/null
+++ b/drivers/clk/ccf/clk.c
@@ -0,0 +1,5595 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2010-2011 Canonical Ltd <jeremy.kerr@canonical.com>
+ * Copyright (C) 2011-2012 Linaro Ltd <mturquette@linaro.org>
+ *
+ * Standard functionality for the common clock API.  See Documentation/driver-api/clk.rst
+ */
+
+#include <linux/clk/clk-conf.h>
+#include <linux/clkdev.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hashtable.h>
+#include <linux/init.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/stringhash.h>
+
+static DEFINE_SPINLOCK(enable_lock);
+static DEFINE_MUTEX(prepare_lock);
+
+static struct task_struct *prepare_owner;
+static struct task_struct *enable_owner;
+
+static int prepare_refcnt;
+static int enable_refcnt;
+
+#define CLK_HASH_BITS 9
+static DEFINE_HASHTABLE(clk_hashtable, CLK_HASH_BITS);
+
+static HLIST_HEAD(clk_root_list);
+static HLIST_HEAD(clk_orphan_list);
+static LIST_HEAD(clk_notifier_list);
+
+/* List of registered clks that use runtime PM */
+static HLIST_HEAD(clk_rpm_list);
+static DEFINE_MUTEX(clk_rpm_list_lock);
+
+static const struct hlist_head *all_lists[] = {
+	&clk_root_list,
+	&clk_orphan_list,
+	NULL,
+};
+
+/***    private data structures    ***/
+
+struct clk_parent_map {
+	const struct clk_hw	*hw;
+	struct clk_core		*core;
+	const char		*fw_name;
+	const char		*name;
+	int			index;
+};
+
+struct clk_core {
+	const char		*name;
+	const struct clk_ops	*ops;
+	struct clk_hw		*hw;
+	struct module		*owner;
+	struct device		*dev;
+	struct hlist_node	rpm_node;
+	struct device_node	*of_node;
+	struct clk_core		*parent;
+	struct clk_parent_map	*parents;
+	u8			num_parents;
+	u8			new_parent_index;
+	unsigned long		rate;
+	unsigned long		req_rate;
+	unsigned long		new_rate;
+	struct clk_core		*new_parent;
+	struct clk_core		*new_child;
+	unsigned long		flags;
+	bool			orphan;
+	bool			rpm_enabled;
+	unsigned int		enable_count;
+	unsigned int		prepare_count;
+	unsigned int		protect_count;
+	unsigned long		min_rate;
+	unsigned long		max_rate;
+	unsigned long		accuracy;
+	int			phase;
+	struct clk_duty		duty;
+	struct hlist_head	children;
+	struct hlist_node	child_node;
+	struct hlist_node	hashtable_node;
+	struct hlist_head	clks;
+	unsigned int		notifier_count;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry		*dentry;
+	struct hlist_node	debug_node;
+#endif
+	struct kref		ref;
+};
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/clk.h>
+
+struct clk {
+	struct clk_core	*core;
+	struct device *dev;
+	const char *dev_id;
+	const char *con_id;
+	unsigned long min_rate;
+	unsigned long max_rate;
+	unsigned int exclusive_count;
+	struct hlist_node clks_node;
+};
+
+/***           runtime pm          ***/
+static int clk_pm_runtime_get(struct clk_core *core)
+{
+	if (!core->rpm_enabled)
+		return 0;
+
+	return pm_runtime_resume_and_get(core->dev);
+}
+
+static void clk_pm_runtime_put(struct clk_core *core)
+{
+	if (!core->rpm_enabled)
+		return;
+
+	pm_runtime_put_sync(core->dev);
+}
+
+/**
+ * clk_pm_runtime_get_all() - Runtime "get" all clk provider devices
+ *
+ * Call clk_pm_runtime_get() on all runtime PM enabled clks in the clk tree so
+ * that disabling unused clks avoids a deadlock where a device is runtime PM
+ * resuming/suspending and the runtime PM callback is trying to grab the
+ * prepare_lock for something like clk_prepare_enable() while
+ * clk_disable_unused_subtree() holds the prepare_lock and is trying to runtime
+ * PM resume/suspend the device as well.
+ *
+ * Context: Acquires the 'clk_rpm_list_lock' and returns with the lock held on
+ * success. Otherwise the lock is released on failure.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int clk_pm_runtime_get_all(void)
+{
+	int ret;
+	struct clk_core *core, *failed;
+
+	/*
+	 * Grab the list lock to prevent any new clks from being registered
+	 * or unregistered until clk_pm_runtime_put_all().
+	 */
+	mutex_lock(&clk_rpm_list_lock);
+
+	/*
+	 * Runtime PM "get" all the devices that are needed for the clks
+	 * currently registered. Do this without holding the prepare_lock, to
+	 * avoid the deadlock.
+	 */
+	hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
+		ret = clk_pm_runtime_get(core);
+		if (ret) {
+			failed = core;
+			pr_err("clk: Failed to runtime PM get '%s' for clk '%s'\n",
+			       dev_name(failed->dev), failed->name);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
+		if (core == failed)
+			break;
+
+		clk_pm_runtime_put(core);
+	}
+	mutex_unlock(&clk_rpm_list_lock);
+
+	return ret;
+}
+
+/**
+ * clk_pm_runtime_put_all() - Runtime "put" all clk provider devices
+ *
+ * Put the runtime PM references taken in clk_pm_runtime_get_all() and release
+ * the 'clk_rpm_list_lock'.
+ */
+static void clk_pm_runtime_put_all(void)
+{
+	struct clk_core *core;
+
+	hlist_for_each_entry(core, &clk_rpm_list, rpm_node)
+		clk_pm_runtime_put(core);
+	mutex_unlock(&clk_rpm_list_lock);
+}
+
+static void clk_pm_runtime_init(struct clk_core *core)
+{
+	struct device *dev = core->dev;
+
+	if (dev && pm_runtime_enabled(dev)) {
+		core->rpm_enabled = true;
+
+		mutex_lock(&clk_rpm_list_lock);
+		hlist_add_head(&core->rpm_node, &clk_rpm_list);
+		mutex_unlock(&clk_rpm_list_lock);
+	}
+}
+
+/***           locking             ***/
+static void clk_prepare_lock(void)
+{
+	if (!mutex_trylock(&prepare_lock)) {
+		if (prepare_owner == current) {
+			prepare_refcnt++;
+			return;
+		}
+		mutex_lock(&prepare_lock);
+	}
+	WARN_ON_ONCE(prepare_owner != NULL);
+	WARN_ON_ONCE(prepare_refcnt != 0);
+	prepare_owner = current;
+	prepare_refcnt = 1;
+}
+
+static void clk_prepare_unlock(void)
+{
+	WARN_ON_ONCE(prepare_owner != current);
+	WARN_ON_ONCE(prepare_refcnt == 0);
+
+	if (--prepare_refcnt)
+		return;
+	prepare_owner = NULL;
+	mutex_unlock(&prepare_lock);
+}
+
+static unsigned long clk_enable_lock(void)
+	__acquires(enable_lock)
+{
+	unsigned long flags;
+
+	/*
+	 * On UP systems, spin_trylock_irqsave() always returns true, even if
+	 * we already hold the lock. So, in that case, we rely only on
+	 * reference counting.
+	 */
+	if (!IS_ENABLED(CONFIG_SMP) ||
+	    !spin_trylock_irqsave(&enable_lock, flags)) {
+		if (enable_owner == current) {
+			enable_refcnt++;
+			__acquire(enable_lock);
+			if (!IS_ENABLED(CONFIG_SMP))
+				local_save_flags(flags);
+			return flags;
+		}
+		spin_lock_irqsave(&enable_lock, flags);
+	}
+	WARN_ON_ONCE(enable_owner != NULL);
+	WARN_ON_ONCE(enable_refcnt != 0);
+	enable_owner = current;
+	enable_refcnt = 1;
+	return flags;
+}
+
+static void clk_enable_unlock(unsigned long flags)
+	__releases(enable_lock)
+{
+	WARN_ON_ONCE(enable_owner != current);
+	WARN_ON_ONCE(enable_refcnt == 0);
+
+	if (--enable_refcnt) {
+		__release(enable_lock);
+		return;
+	}
+	enable_owner = NULL;
+	spin_unlock_irqrestore(&enable_lock, flags);
+}
+
+static bool clk_core_rate_is_protected(struct clk_core *core)
+{
+	return core->protect_count;
+}
+
+static bool clk_core_is_prepared(struct clk_core *core)
+{
+	bool ret = false;
+
+	/*
+	 * .is_prepared is optional for clocks that can prepare
+	 * fall back to software usage counter if it is missing
+	 */
+	if (!core->ops->is_prepared)
+		return core->prepare_count;
+
+	if (!clk_pm_runtime_get(core)) {
+		ret = core->ops->is_prepared(core->hw);
+		clk_pm_runtime_put(core);
+	}
+
+	return ret;
+}
+
+static bool clk_core_is_enabled(struct clk_core *core)
+{
+	bool ret = false;
+
+	/*
+	 * .is_enabled is only mandatory for clocks that gate
+	 * fall back to software usage counter if .is_enabled is missing
+	 */
+	if (!core->ops->is_enabled)
+		return core->enable_count;
+
+	/*
+	 * Check if clock controller's device is runtime active before
+	 * calling .is_enabled callback. If not, assume that clock is
+	 * disabled, because we might be called from atomic context, from
+	 * which pm_runtime_get() is not allowed.
+	 * This function is called mainly from clk_disable_unused_subtree,
+	 * which ensures proper runtime pm activation of controller before
+	 * taking enable spinlock, but the below check is needed if one tries
+	 * to call it from other places.
+	 */
+	if (core->rpm_enabled) {
+		pm_runtime_get_noresume(core->dev);
+		if (!pm_runtime_active(core->dev)) {
+			ret = false;
+			goto done;
+		}
+	}
+
+	/*
+	 * This could be called with the enable lock held, or from atomic
+	 * context. If the parent isn't enabled already, we can't do
+	 * anything here. We can also assume this clock isn't enabled.
+	 */
+	if ((core->flags & CLK_OPS_PARENT_ENABLE) && core->parent)
+		if (!clk_core_is_enabled(core->parent)) {
+			ret = false;
+			goto done;
+		}
+
+	ret = core->ops->is_enabled(core->hw);
+done:
+	if (core->rpm_enabled)
+		pm_runtime_put(core->dev);
+
+	return ret;
+}
+
+/***    helper functions   ***/
+
+const char *__clk_get_name(const struct clk *clk)
+{
+	return !clk ? NULL : clk->core->name;
+}
+EXPORT_SYMBOL_GPL(__clk_get_name);
+
+const char *clk_hw_get_name(const struct clk_hw *hw)
+{
+	return hw->core->name;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_name);
+
+struct device *clk_hw_get_dev(const struct clk_hw *hw)
+{
+	return hw->core->dev;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_dev);
+
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
+{
+	return hw->core->of_node;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
+
+struct clk_hw *__clk_get_hw(struct clk *clk)
+{
+	return !clk ? NULL : clk->core->hw;
+}
+EXPORT_SYMBOL_GPL(__clk_get_hw);
+
+unsigned int clk_hw_get_num_parents(const struct clk_hw *hw)
+{
+	return hw->core->num_parents;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_num_parents);
+
+struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw)
+{
+	return hw->core->parent ? hw->core->parent->hw : NULL;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_parent);
+
+static struct clk_core *clk_core_lookup(const char *name)
+{
+	struct clk_core *core;
+	u32 hash;
+
+	if (!name)
+		return NULL;
+
+	hash = full_name_hash(NULL, name, strlen(name));
+
+	/* search the hashtable */
+	hash_for_each_possible(clk_hashtable, core, hashtable_node, hash)
+		if (!strcmp(core->name, name))
+			return core;
+
+	return NULL;
+}
+
+#ifdef CONFIG_OF
+static int of_parse_clkspec(const struct device_node *np, int index,
+			    const char *name, struct of_phandle_args *out_args);
+static struct clk_hw *
+of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec);
+#else
+static inline int of_parse_clkspec(const struct device_node *np, int index,
+				   const char *name,
+				   struct of_phandle_args *out_args)
+{
+	return -ENOENT;
+}
+static inline struct clk_hw *
+of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
+
+/**
+ * clk_core_get - Find the clk_core parent of a clk
+ * @core: clk to find parent of
+ * @p_index: parent index to search for
+ *
+ * This is the preferred method for clk providers to find the parent of a
+ * clk when that parent is external to the clk controller. The parent_names
+ * array is indexed and treated as a local name matching a string in the device
+ * node's 'clock-names' property or as the 'con_id' matching the device's
+ * dev_name() in a clk_lookup. This allows clk providers to use their own
+ * namespace instead of looking for a globally unique parent string.
+ *
+ * For example the following DT snippet would allow a clock registered by the
+ * clock-controller@c001 that has a clk_init_data::parent_data array
+ * with 'xtal' in the 'name' member to find the clock provided by the
+ * clock-controller@f00abcd without needing to get the globally unique name of
+ * the xtal clk.
+ *
+ *      parent: clock-controller@f00abcd {
+ *              reg = <0xf00abcd 0xabcd>;
+ *              #clock-cells = <0>;
+ *      };
+ *
+ *      clock-controller@c001 {
+ *              reg = <0xc001 0xf00d>;
+ *              clocks = <&parent>;
+ *              clock-names = "xtal";
+ *              #clock-cells = <1>;
+ *      };
+ *
+ * Returns: -ENOENT when the provider can't be found or the clk doesn't
+ * exist in the provider or the name can't be found in the DT node or
+ * in a clkdev lookup. NULL when the provider knows about the clk but it
+ * isn't provided on this system.
+ * A valid clk_core pointer when the clk can be found in the provider.
+ */
+static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
+{
+	const char *name = core->parents[p_index].fw_name;
+	int index = core->parents[p_index].index;
+	struct clk_hw *hw = ERR_PTR(-ENOENT);
+	struct device *dev = core->dev;
+	const char *dev_id = dev ? dev_name(dev) : NULL;
+	struct device_node *np = core->of_node;
+	struct of_phandle_args clkspec;
+
+	if (np && (name || index >= 0) &&
+	    !of_parse_clkspec(np, index, name, &clkspec)) {
+		hw = of_clk_get_hw_from_clkspec(&clkspec);
+		of_node_put(clkspec.np);
+	} else if (name) {
+		/*
+		 * If the DT search above couldn't find the provider fallback to
+		 * looking up via clkdev based clk_lookups.
+		 */
+		hw = clk_find_hw(dev_id, name);
+	}
+
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+
+	if (!hw)
+		return NULL;
+
+	return hw->core;
+}
+
+static void clk_core_fill_parent_index(struct clk_core *core, u8 index)
+{
+	struct clk_parent_map *entry = &core->parents[index];
+	struct clk_core *parent;
+
+	if (entry->hw) {
+		parent = entry->hw->core;
+	} else {
+		parent = clk_core_get(core, index);
+		if (PTR_ERR(parent) == -ENOENT && entry->name)
+			parent = clk_core_lookup(entry->name);
+	}
+
+	/*
+	 * We have a direct reference but it isn't registered yet?
+	 * Orphan it and let clk_reparent() update the orphan status
+	 * when the parent is registered.
+	 */
+	if (!parent)
+		parent = ERR_PTR(-EPROBE_DEFER);
+
+	/* Only cache it if it's not an error */
+	if (!IS_ERR(parent))
+		entry->core = parent;
+}
+
+static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
+							 u8 index)
+{
+	if (!core || index >= core->num_parents || !core->parents)
+		return NULL;
+
+	if (!core->parents[index].core)
+		clk_core_fill_parent_index(core, index);
+
+	return core->parents[index].core;
+}
+
+struct clk_hw *
+clk_hw_get_parent_by_index(const struct clk_hw *hw, unsigned int index)
+{
+	struct clk_core *parent;
+
+	parent = clk_core_get_parent_by_index(hw->core, index);
+
+	return !parent ? NULL : parent->hw;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_parent_by_index);
+
+unsigned int __clk_get_enable_count(struct clk *clk)
+{
+	return !clk ? 0 : clk->core->enable_count;
+}
+
+static unsigned long clk_core_get_rate_nolock(struct clk_core *core)
+{
+	if (!core)
+		return 0;
+
+	if (!core->num_parents || core->parent)
+		return core->rate;
+
+	/*
+	 * Clk must have a parent because num_parents > 0 but the parent isn't
+	 * known yet. Best to return 0 as the rate of this clk until we can
+	 * properly recalc the rate based on the parent's rate.
+	 */
+	return 0;
+}
+
+unsigned long clk_hw_get_rate(const struct clk_hw *hw)
+{
+	return clk_core_get_rate_nolock(hw->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate);
+
+static unsigned long clk_core_get_accuracy_no_lock(struct clk_core *core)
+{
+	if (!core)
+		return 0;
+
+	return core->accuracy;
+}
+
+unsigned long clk_hw_get_flags(const struct clk_hw *hw)
+{
+	return hw->core->flags;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_flags);
+
+bool clk_hw_is_prepared(const struct clk_hw *hw)
+{
+	return clk_core_is_prepared(hw->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_is_prepared);
+
+bool clk_hw_is_enabled(const struct clk_hw *hw)
+{
+	return clk_core_is_enabled(hw->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_is_enabled);
+
+bool __clk_is_enabled(struct clk *clk)
+{
+	if (!clk)
+		return false;
+
+	return clk_core_is_enabled(clk->core);
+}
+EXPORT_SYMBOL_GPL(__clk_is_enabled);
+
+static bool mux_is_better_rate(unsigned long rate, unsigned long now,
+			   unsigned long best, unsigned long flags)
+{
+	if (flags & CLK_MUX_ROUND_CLOSEST)
+		return abs(now - rate) < abs(best - rate);
+
+	return now <= rate && now > best;
+}
+
+static void clk_core_init_rate_req(struct clk_core * const core,
+				   struct clk_rate_request *req,
+				   unsigned long rate);
+
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req);
+
+static bool clk_core_has_parent(struct clk_core *core, const struct clk_core *parent)
+{
+	struct clk_core *tmp;
+	unsigned int i;
+
+	/* Optimize for the case where the parent is already the parent. */
+	if (core->parent == parent)
+		return true;
+
+	for (i = 0; i < core->num_parents; i++) {
+		tmp = clk_core_get_parent_by_index(core, i);
+		if (!tmp)
+			continue;
+
+		if (tmp == parent)
+			return true;
+	}
+
+	return false;
+}
+
+static void
+clk_core_forward_rate_req(struct clk_core *core,
+			  const struct clk_rate_request *old_req,
+			  struct clk_core *parent,
+			  struct clk_rate_request *req,
+			  unsigned long parent_rate)
+{
+	if (WARN_ON(!clk_core_has_parent(core, parent)))
+		return;
+
+	clk_core_init_rate_req(parent, req, parent_rate);
+
+	if (req->min_rate < old_req->min_rate)
+		req->min_rate = old_req->min_rate;
+
+	if (req->max_rate > old_req->max_rate)
+		req->max_rate = old_req->max_rate;
+}
+
+static int
+clk_core_determine_rate_no_reparent(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct clk_core *core = hw->core;
+	struct clk_core *parent = core->parent;
+	unsigned long best;
+	int ret;
+
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
+
+		if (!parent) {
+			req->rate = 0;
+			return 0;
+		}
+
+		clk_core_forward_rate_req(core, req, parent, &parent_req,
+					  req->rate);
+
+		trace_clk_rate_request_start(&parent_req);
+
+		ret = clk_core_round_rate_nolock(parent, &parent_req);
+		if (ret)
+			return ret;
+
+		trace_clk_rate_request_done(&parent_req);
+
+		best = parent_req.rate;
+	} else if (parent) {
+		best = clk_core_get_rate_nolock(parent);
+	} else {
+		best = clk_core_get_rate_nolock(core);
+	}
+
+	req->best_parent_rate = best;
+	req->rate = best;
+
+	return 0;
+}
+
+int clk_mux_determine_rate_flags(struct clk_hw *hw,
+				 struct clk_rate_request *req,
+				 unsigned long flags)
+{
+	struct clk_core *core = hw->core, *parent, *best_parent = NULL;
+	int i, num_parents, ret;
+	unsigned long best = 0;
+
+	/* if NO_REPARENT flag set, pass through to current parent */
+	if (core->flags & CLK_SET_RATE_NO_REPARENT)
+		return clk_core_determine_rate_no_reparent(hw, req);
+
+	/* find the parent that can provide the fastest rate <= rate */
+	num_parents = core->num_parents;
+	for (i = 0; i < num_parents; i++) {
+		unsigned long parent_rate;
+
+		parent = clk_core_get_parent_by_index(core, i);
+		if (!parent)
+			continue;
+
+		if (core->flags & CLK_SET_RATE_PARENT) {
+			struct clk_rate_request parent_req;
+
+			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
+
+			trace_clk_rate_request_start(&parent_req);
+
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
+			if (ret)
+				continue;
+
+			trace_clk_rate_request_done(&parent_req);
+
+			parent_rate = parent_req.rate;
+		} else {
+			parent_rate = clk_core_get_rate_nolock(parent);
+		}
+
+		if (mux_is_better_rate(req->rate, parent_rate,
+				       best, flags)) {
+			best_parent = parent;
+			best = parent_rate;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
+
+	req->best_parent_hw = best_parent->hw;
+	req->best_parent_rate = best;
+	req->rate = best;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
+
+struct clk *__clk_lookup(const char *name)
+{
+	struct clk_core *core = clk_core_lookup(name);
+
+	return !core ? NULL : core->hw->clk;
+}
+
+static void clk_core_get_boundaries(struct clk_core *core,
+				    unsigned long *min_rate,
+				    unsigned long *max_rate)
+{
+	struct clk *clk_user;
+
+	lockdep_assert_held(&prepare_lock);
+
+	*min_rate = core->min_rate;
+	*max_rate = core->max_rate;
+
+	hlist_for_each_entry(clk_user, &core->clks, clks_node)
+		*min_rate = max(*min_rate, clk_user->min_rate);
+
+	hlist_for_each_entry(clk_user, &core->clks, clks_node)
+		*max_rate = min(*max_rate, clk_user->max_rate);
+}
+
+/*
+ * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
+ * @hw: the hw clk we want to get the range from
+ * @min_rate: pointer to the variable that will hold the minimum
+ * @max_rate: pointer to the variable that will hold the maximum
+ *
+ * Fills the @min_rate and @max_rate variables with the minimum and
+ * maximum that clock can reach.
+ */
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate)
+{
+	clk_core_get_boundaries(hw->core, min_rate, max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
+
+static bool clk_core_check_boundaries(struct clk_core *core,
+				      unsigned long min_rate,
+				      unsigned long max_rate)
+{
+	struct clk *user;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (min_rate > core->max_rate || max_rate < core->min_rate)
+		return false;
+
+	hlist_for_each_entry(user, &core->clks, clks_node)
+		if (min_rate > user->max_rate || max_rate < user->min_rate)
+			return false;
+
+	return true;
+}
+
+void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
+			   unsigned long max_rate)
+{
+	hw->core->min_rate = min_rate;
+	hw->core->max_rate = max_rate;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_rate_range);
+
+/*
+ * __clk_mux_determine_rate - clk_ops::determine_rate implementation for a mux type clk
+ * @hw: mux type clk to determine rate on
+ * @req: rate request, also used to return preferred parent and frequencies
+ *
+ * Helper for finding best parent to provide a given frequency. This can be used
+ * directly as a determine_rate callback (e.g. for a mux), or from a more
+ * complex clock that may combine a mux with other operations.
+ *
+ * Returns: 0 on success, -EERROR value on error
+ */
+int __clk_mux_determine_rate(struct clk_hw *hw,
+			     struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+EXPORT_SYMBOL_GPL(__clk_mux_determine_rate);
+
+int __clk_mux_determine_rate_closest(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, CLK_MUX_ROUND_CLOSEST);
+}
+EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
+
+/*
+ * clk_hw_determine_rate_no_reparent - clk_ops::determine_rate implementation for a clk that doesn't reparent
+ * @hw: mux type clk to determine rate on
+ * @req: rate request, also used to return preferred frequency
+ *
+ * Helper for finding best parent rate to provide a given frequency.
+ * This can be used directly as a determine_rate callback (e.g. for a
+ * mux), or from a more complex clock that may combine a mux with other
+ * operations.
+ *
+ * Returns: 0 on success, -EERROR value on error
+ */
+int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	return clk_core_determine_rate_no_reparent(hw, req);
+}
+EXPORT_SYMBOL_GPL(clk_hw_determine_rate_no_reparent);
+
+/***        clk api        ***/
+
+static void clk_core_rate_unprotect(struct clk_core *core)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (WARN(core->protect_count == 0,
+	    "%s already unprotected\n", core->name))
+		return;
+
+	if (--core->protect_count > 0)
+		return;
+
+	clk_core_rate_unprotect(core->parent);
+}
+
+static int clk_core_rate_nuke_protect(struct clk_core *core)
+{
+	int ret;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return -EINVAL;
+
+	if (core->protect_count == 0)
+		return 0;
+
+	ret = core->protect_count;
+	core->protect_count = 1;
+	clk_core_rate_unprotect(core);
+
+	return ret;
+}
+
+/**
+ * clk_rate_exclusive_put - release exclusivity over clock rate control
+ * @clk: the clk over which the exclusivity is released
+ *
+ * clk_rate_exclusive_put() completes a critical section during which a clock
+ * consumer cannot tolerate any other consumer making any operation on the
+ * clock which could result in a rate change or rate glitch. Exclusive clocks
+ * cannot have their rate changed, either directly or indirectly due to changes
+ * further up the parent chain of clocks. As a result, clocks up parent chain
+ * also get under exclusive control of the calling consumer.
+ *
+ * If exlusivity is claimed more than once on clock, even by the same consumer,
+ * the rate effectively gets locked as exclusivity can't be preempted.
+ *
+ * Calls to clk_rate_exclusive_put() must be balanced with calls to
+ * clk_rate_exclusive_get(). Calls to this function may sleep, and do not return
+ * error status.
+ */
+void clk_rate_exclusive_put(struct clk *clk)
+{
+	if (!clk)
+		return;
+
+	clk_prepare_lock();
+
+	/*
+	 * if there is something wrong with this consumer protect count, stop
+	 * here before messing with the provider
+	 */
+	if (WARN_ON(clk->exclusive_count <= 0))
+		goto out;
+
+	clk_core_rate_unprotect(clk->core);
+	clk->exclusive_count--;
+out:
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_rate_exclusive_put);
+
+static void clk_core_rate_protect(struct clk_core *core)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (core->protect_count == 0)
+		clk_core_rate_protect(core->parent);
+
+	core->protect_count++;
+}
+
+static void clk_core_rate_restore_protect(struct clk_core *core, int count)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (count == 0)
+		return;
+
+	clk_core_rate_protect(core);
+	core->protect_count = count;
+}
+
+/**
+ * clk_rate_exclusive_get - get exclusivity over the clk rate control
+ * @clk: the clk over which the exclusity of rate control is requested
+ *
+ * clk_rate_exclusive_get() begins a critical section during which a clock
+ * consumer cannot tolerate any other consumer making any operation on the
+ * clock which could result in a rate change or rate glitch. Exclusive clocks
+ * cannot have their rate changed, either directly or indirectly due to changes
+ * further up the parent chain of clocks. As a result, clocks up parent chain
+ * also get under exclusive control of the calling consumer.
+ *
+ * If exlusivity is claimed more than once on clock, even by the same consumer,
+ * the rate effectively gets locked as exclusivity can't be preempted.
+ *
+ * Calls to clk_rate_exclusive_get() should be balanced with calls to
+ * clk_rate_exclusive_put(). Calls to this function may sleep.
+ * Returns 0 on success, -EERROR otherwise
+ */
+int clk_rate_exclusive_get(struct clk *clk)
+{
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	clk_core_rate_protect(clk->core);
+	clk->exclusive_count++;
+	clk_prepare_unlock();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
+
+static void devm_clk_rate_exclusive_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_rate_exclusive_put(clk);
+}
+
+int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk)
+{
+	int ret;
+
+	ret = clk_rate_exclusive_get(clk);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_clk_rate_exclusive_put, clk);
+}
+EXPORT_SYMBOL_GPL(devm_clk_rate_exclusive_get);
+
+static void clk_core_unprepare(struct clk_core *core)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (WARN(core->prepare_count == 0,
+	    "%s already unprepared\n", core->name))
+		return;
+
+	if (WARN(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL,
+	    "Unpreparing critical %s\n", core->name))
+		return;
+
+	if (core->flags & CLK_SET_RATE_GATE)
+		clk_core_rate_unprotect(core);
+
+	if (--core->prepare_count > 0)
+		return;
+
+	WARN(core->enable_count > 0, "Unpreparing enabled %s\n", core->name);
+
+	trace_clk_unprepare(core);
+
+	if (core->ops->unprepare)
+		core->ops->unprepare(core->hw);
+
+	trace_clk_unprepare_complete(core);
+	clk_core_unprepare(core->parent);
+	clk_pm_runtime_put(core);
+}
+
+static void clk_core_unprepare_lock(struct clk_core *core)
+{
+	clk_prepare_lock();
+	clk_core_unprepare(core);
+	clk_prepare_unlock();
+}
+
+/**
+ * clk_unprepare - undo preparation of a clock source
+ * @clk: the clk being unprepared
+ *
+ * clk_unprepare may sleep, which differentiates it from clk_disable.  In a
+ * simple case, clk_unprepare can be used instead of clk_disable to gate a clk
+ * if the operation may sleep.  One example is a clk which is accessed over
+ * I2c.  In the complex case a clk gate operation may require a fast and a slow
+ * part.  It is this reason that clk_unprepare and clk_disable are not mutually
+ * exclusive.  In fact clk_disable must be called before clk_unprepare.
+ */
+void clk_unprepare(struct clk *clk)
+{
+	if (IS_ERR_OR_NULL(clk))
+		return;
+
+	clk_core_unprepare_lock(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_unprepare);
+
+static int clk_core_prepare(struct clk_core *core)
+{
+	int ret = 0;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	if (core->prepare_count == 0) {
+		ret = clk_pm_runtime_get(core);
+		if (ret)
+			return ret;
+
+		ret = clk_core_prepare(core->parent);
+		if (ret)
+			goto runtime_put;
+
+		trace_clk_prepare(core);
+
+		if (core->ops->prepare)
+			ret = core->ops->prepare(core->hw);
+
+		trace_clk_prepare_complete(core);
+
+		if (ret)
+			goto unprepare;
+	}
+
+	core->prepare_count++;
+
+	/*
+	 * CLK_SET_RATE_GATE is a special case of clock protection
+	 * Instead of a consumer claiming exclusive rate control, it is
+	 * actually the provider which prevents any consumer from making any
+	 * operation which could result in a rate change or rate glitch while
+	 * the clock is prepared.
+	 */
+	if (core->flags & CLK_SET_RATE_GATE)
+		clk_core_rate_protect(core);
+
+	return 0;
+unprepare:
+	clk_core_unprepare(core->parent);
+runtime_put:
+	clk_pm_runtime_put(core);
+	return ret;
+}
+
+static int clk_core_prepare_lock(struct clk_core *core)
+{
+	int ret;
+
+	clk_prepare_lock();
+	ret = clk_core_prepare(core);
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+/**
+ * clk_prepare - prepare a clock source
+ * @clk: the clk being prepared
+ *
+ * clk_prepare may sleep, which differentiates it from clk_enable.  In a simple
+ * case, clk_prepare can be used instead of clk_enable to ungate a clk if the
+ * operation may sleep.  One example is a clk which is accessed over I2c.  In
+ * the complex case a clk ungate operation may require a fast and a slow part.
+ * It is this reason that clk_prepare and clk_enable are not mutually
+ * exclusive.  In fact clk_prepare must be called before clk_enable.
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_prepare(struct clk *clk)
+{
+	if (!clk)
+		return 0;
+
+	return clk_core_prepare_lock(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_prepare);
+
+static void clk_core_disable(struct clk_core *core)
+{
+	lockdep_assert_held(&enable_lock);
+
+	if (!core)
+		return;
+
+	if (WARN(core->enable_count == 0, "%s already disabled\n", core->name))
+		return;
+
+	if (WARN(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL,
+	    "Disabling critical %s\n", core->name))
+		return;
+
+	if (--core->enable_count > 0)
+		return;
+
+	trace_clk_disable(core);
+
+	if (core->ops->disable)
+		core->ops->disable(core->hw);
+
+	trace_clk_disable_complete(core);
+
+	clk_core_disable(core->parent);
+}
+
+static void clk_core_disable_lock(struct clk_core *core)
+{
+	unsigned long flags;
+
+	flags = clk_enable_lock();
+	clk_core_disable(core);
+	clk_enable_unlock(flags);
+}
+
+/**
+ * clk_disable - gate a clock
+ * @clk: the clk being gated
+ *
+ * clk_disable must not sleep, which differentiates it from clk_unprepare.  In
+ * a simple case, clk_disable can be used instead of clk_unprepare to gate a
+ * clk if the operation is fast and will never sleep.  One example is a
+ * SoC-internal clk which is controlled via simple register writes.  In the
+ * complex case a clk gate operation may require a fast and a slow part.  It is
+ * this reason that clk_unprepare and clk_disable are not mutually exclusive.
+ * In fact clk_disable must be called before clk_unprepare.
+ */
+void clk_disable(struct clk *clk)
+{
+	if (IS_ERR_OR_NULL(clk))
+		return;
+
+	clk_core_disable_lock(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_disable);
+
+static int clk_core_enable(struct clk_core *core)
+{
+	int ret = 0;
+
+	lockdep_assert_held(&enable_lock);
+
+	if (!core)
+		return 0;
+
+	if (WARN(core->prepare_count == 0,
+	    "Enabling unprepared %s\n", core->name))
+		return -ESHUTDOWN;
+
+	if (core->enable_count == 0) {
+		ret = clk_core_enable(core->parent);
+
+		if (ret)
+			return ret;
+
+		trace_clk_enable(core);
+
+		if (core->ops->enable)
+			ret = core->ops->enable(core->hw);
+
+		trace_clk_enable_complete(core);
+
+		if (ret) {
+			clk_core_disable(core->parent);
+			return ret;
+		}
+	}
+
+	core->enable_count++;
+	return 0;
+}
+
+static int clk_core_enable_lock(struct clk_core *core)
+{
+	unsigned long flags;
+	int ret;
+
+	flags = clk_enable_lock();
+	ret = clk_core_enable(core);
+	clk_enable_unlock(flags);
+
+	return ret;
+}
+
+/**
+ * clk_gate_restore_context - restore context for poweroff
+ * @hw: the clk_hw pointer of clock whose state is to be restored
+ *
+ * The clock gate restore context function enables or disables
+ * the gate clocks based on the enable_count. This is done in cases
+ * where the clock context is lost and based on the enable_count
+ * the clock either needs to be enabled/disabled. This
+ * helps restore the state of gate clocks.
+ */
+void clk_gate_restore_context(struct clk_hw *hw)
+{
+	struct clk_core *core = hw->core;
+
+	if (core->enable_count)
+		core->ops->enable(hw);
+	else
+		core->ops->disable(hw);
+}
+EXPORT_SYMBOL_GPL(clk_gate_restore_context);
+
+static int clk_core_save_context(struct clk_core *core)
+{
+	struct clk_core *child;
+	int ret = 0;
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		ret = clk_core_save_context(child);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (core->ops && core->ops->save_context)
+		ret = core->ops->save_context(core->hw);
+
+	return ret;
+}
+
+static void clk_core_restore_context(struct clk_core *core)
+{
+	struct clk_core *child;
+
+	if (core->ops && core->ops->restore_context)
+		core->ops->restore_context(core->hw);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_restore_context(child);
+}
+
+/**
+ * clk_save_context - save clock context for poweroff
+ *
+ * Saves the context of the clock register for powerstates in which the
+ * contents of the registers will be lost. Occurs deep within the suspend
+ * code.  Returns 0 on success.
+ */
+int clk_save_context(void)
+{
+	struct clk_core *clk;
+	int ret;
+
+	hlist_for_each_entry(clk, &clk_root_list, child_node) {
+		ret = clk_core_save_context(clk);
+		if (ret < 0)
+			return ret;
+	}
+
+	hlist_for_each_entry(clk, &clk_orphan_list, child_node) {
+		ret = clk_core_save_context(clk);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_save_context);
+
+/**
+ * clk_restore_context - restore clock context after poweroff
+ *
+ * Restore the saved clock context upon resume.
+ *
+ */
+void clk_restore_context(void)
+{
+	struct clk_core *core;
+
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_core_restore_context(core);
+
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_core_restore_context(core);
+}
+EXPORT_SYMBOL_GPL(clk_restore_context);
+
+/**
+ * clk_enable - ungate a clock
+ * @clk: the clk being ungated
+ *
+ * clk_enable must not sleep, which differentiates it from clk_prepare.  In a
+ * simple case, clk_enable can be used instead of clk_prepare to ungate a clk
+ * if the operation will never sleep.  One example is a SoC-internal clk which
+ * is controlled via simple register writes.  In the complex case a clk ungate
+ * operation may require a fast and a slow part.  It is this reason that
+ * clk_enable and clk_prepare are not mutually exclusive.  In fact clk_prepare
+ * must be called before clk_enable.  Returns 0 on success, -EERROR
+ * otherwise.
+ */
+int clk_enable(struct clk *clk)
+{
+	if (!clk)
+		return 0;
+
+	return clk_core_enable_lock(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_enable);
+
+/**
+ * clk_is_enabled_when_prepared - indicate if preparing a clock also enables it.
+ * @clk: clock source
+ *
+ * Returns true if clk_prepare() implicitly enables the clock, effectively
+ * making clk_enable()/clk_disable() no-ops, false otherwise.
+ *
+ * This is of interest mainly to power management code where actually
+ * disabling the clock also requires unpreparing it to have any material
+ * effect.
+ *
+ * Regardless of the value returned here, the caller must always invoke
+ * clk_enable() or clk_prepare_enable()  and counterparts for usage counts
+ * to be right.
+ */
+bool clk_is_enabled_when_prepared(struct clk *clk)
+{
+	return clk && !(clk->core->ops->enable && clk->core->ops->disable);
+}
+EXPORT_SYMBOL_GPL(clk_is_enabled_when_prepared);
+
+static int clk_core_prepare_enable(struct clk_core *core)
+{
+	int ret;
+
+	ret = clk_core_prepare_lock(core);
+	if (ret)
+		return ret;
+
+	ret = clk_core_enable_lock(core);
+	if (ret)
+		clk_core_unprepare_lock(core);
+
+	return ret;
+}
+
+static void clk_core_disable_unprepare(struct clk_core *core)
+{
+	clk_core_disable_lock(core);
+	clk_core_unprepare_lock(core);
+}
+
+static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+{
+	struct clk_core *child;
+
+	lockdep_assert_held(&prepare_lock);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_unprepare_unused_subtree(child);
+
+	if (core->prepare_count)
+		return;
+
+	if (core->flags & CLK_IGNORE_UNUSED)
+		return;
+
+	if (clk_core_is_prepared(core)) {
+		trace_clk_unprepare(core);
+		if (core->ops->unprepare_unused)
+			core->ops->unprepare_unused(core->hw);
+		else if (core->ops->unprepare)
+			core->ops->unprepare(core->hw);
+		trace_clk_unprepare_complete(core);
+	}
+}
+
+static void __init clk_disable_unused_subtree(struct clk_core *core)
+{
+	struct clk_core *child;
+	unsigned long flags;
+
+	lockdep_assert_held(&prepare_lock);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_disable_unused_subtree(child);
+
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_prepare_enable(core->parent);
+
+	flags = clk_enable_lock();
+
+	if (core->enable_count)
+		goto unlock_out;
+
+	if (core->flags & CLK_IGNORE_UNUSED)
+		goto unlock_out;
+
+	/*
+	 * some gate clocks have special needs during the disable-unused
+	 * sequence.  call .disable_unused if available, otherwise fall
+	 * back to .disable
+	 */
+	if (clk_core_is_enabled(core)) {
+		trace_clk_disable(core);
+		if (core->ops->disable_unused)
+			core->ops->disable_unused(core->hw);
+		else if (core->ops->disable)
+			core->ops->disable(core->hw);
+		trace_clk_disable_complete(core);
+	}
+
+unlock_out:
+	clk_enable_unlock(flags);
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_unprepare(core->parent);
+}
+
+static bool clk_ignore_unused __initdata;
+static int __init clk_ignore_unused_setup(char *__unused)
+{
+	clk_ignore_unused = true;
+	return 1;
+}
+__setup("clk_ignore_unused", clk_ignore_unused_setup);
+
+static int __init clk_disable_unused(void)
+{
+	struct clk_core *core;
+	int ret;
+
+	if (clk_ignore_unused) {
+		pr_warn("clk: Not disabling unused clocks\n");
+		return 0;
+	}
+
+	pr_info("clk: Disabling unused clocks\n");
+
+	ret = clk_pm_runtime_get_all();
+	if (ret)
+		return ret;
+	/*
+	 * Grab the prepare lock to keep the clk topology stable while iterating
+	 * over clks.
+	 */
+	clk_prepare_lock();
+
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_disable_unused_subtree(core);
+
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_disable_unused_subtree(core);
+
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_unprepare_unused_subtree(core);
+
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_unprepare_unused_subtree(core);
+
+	clk_prepare_unlock();
+
+	clk_pm_runtime_put_all();
+
+	return 0;
+}
+late_initcall_sync(clk_disable_unused);
+
+static int clk_core_determine_round_nolock(struct clk_core *core,
+					   struct clk_rate_request *req)
+{
+	long rate;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	/*
+	 * Some clock providers hand-craft their clk_rate_requests and
+	 * might not fill min_rate and max_rate.
+	 *
+	 * If it's the case, clamping the rate is equivalent to setting
+	 * the rate to 0 which is bad. Skip the clamping but complain so
+	 * that it gets fixed, hopefully.
+	 */
+	if (!req->min_rate && !req->max_rate)
+		pr_warn("%s: %s: clk_rate_request has initialized min or max rate.\n",
+			__func__, core->name);
+	else
+		req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
+	/*
+	 * At this point, core protection will be disabled
+	 * - if the provider is not protected at all
+	 * - if the calling consumer is the only one which has exclusivity
+	 *   over the provider
+	 */
+	if (clk_core_rate_is_protected(core)) {
+		req->rate = core->rate;
+	} else if (core->ops->determine_rate) {
+		return core->ops->determine_rate(core->hw, req);
+	} else if (core->ops->round_rate) {
+		rate = core->ops->round_rate(core->hw, req->rate,
+					     &req->best_parent_rate);
+		if (rate < 0)
+			return rate;
+
+		req->rate = rate;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void clk_core_init_rate_req(struct clk_core * const core,
+				   struct clk_rate_request *req,
+				   unsigned long rate)
+{
+	struct clk_core *parent;
+
+	if (WARN_ON(!req))
+		return;
+
+	memset(req, 0, sizeof(*req));
+	req->max_rate = ULONG_MAX;
+
+	if (!core)
+		return;
+
+	req->core = core;
+	req->rate = rate;
+	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
+
+	parent = core->parent;
+	if (parent) {
+		req->best_parent_hw = parent->hw;
+		req->best_parent_rate = parent->rate;
+	} else {
+		req->best_parent_hw = NULL;
+		req->best_parent_rate = 0;
+	}
+}
+
+/**
+ * clk_hw_init_rate_request - Initializes a clk_rate_request
+ * @hw: the clk for which we want to submit a rate request
+ * @req: the clk_rate_request structure we want to initialise
+ * @rate: the rate which is to be requested
+ *
+ * Initializes a clk_rate_request structure to submit to
+ * __clk_determine_rate() or similar functions.
+ */
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate)
+{
+	if (WARN_ON(!hw || !req))
+		return;
+
+	clk_core_init_rate_req(hw->core, req, rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
+
+/**
+ * clk_hw_forward_rate_request - Forwards a clk_rate_request to a clock's parent
+ * @hw: the original clock that got the rate request
+ * @old_req: the original clk_rate_request structure we want to forward
+ * @parent: the clk we want to forward @old_req to
+ * @req: the clk_rate_request structure we want to initialise
+ * @parent_rate: The rate which is to be requested to @parent
+ *
+ * Initializes a clk_rate_request structure to submit to a clock parent
+ * in __clk_determine_rate() or similar functions.
+ */
+void clk_hw_forward_rate_request(const struct clk_hw *hw,
+				 const struct clk_rate_request *old_req,
+				 const struct clk_hw *parent,
+				 struct clk_rate_request *req,
+				 unsigned long parent_rate)
+{
+	if (WARN_ON(!hw || !old_req || !parent || !req))
+		return;
+
+	clk_core_forward_rate_req(hw->core, old_req,
+				  parent->core, req,
+				  parent_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
+
+static bool clk_core_can_round(struct clk_core * const core)
+{
+	return core->ops->determine_rate || core->ops->round_rate;
+}
+
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req)
+{
+	int ret;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core) {
+		req->rate = 0;
+		return 0;
+	}
+
+	if (clk_core_can_round(core))
+		return clk_core_determine_round_nolock(core, req);
+
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
+
+		clk_core_forward_rate_req(core, req, core->parent, &parent_req, req->rate);
+
+		trace_clk_rate_request_start(&parent_req);
+
+		ret = clk_core_round_rate_nolock(core->parent, &parent_req);
+		if (ret)
+			return ret;
+
+		trace_clk_rate_request_done(&parent_req);
+
+		req->best_parent_rate = parent_req.rate;
+		req->rate = parent_req.rate;
+
+		return 0;
+	}
+
+	req->rate = core->rate;
+	return 0;
+}
+
+/**
+ * __clk_determine_rate - get the closest rate actually supported by a clock
+ * @hw: determine the rate of this clock
+ * @req: target rate request
+ *
+ * Useful for clk_ops such as .set_rate and .determine_rate.
+ */
+int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	if (!hw) {
+		req->rate = 0;
+		return 0;
+	}
+
+	return clk_core_round_rate_nolock(hw->core, req);
+}
+EXPORT_SYMBOL_GPL(__clk_determine_rate);
+
+/**
+ * clk_hw_round_rate() - round the given rate for a hw clk
+ * @hw: the hw clk for which we are rounding a rate
+ * @rate: the rate which is to be rounded
+ *
+ * Takes in a rate as input and rounds it to a rate that the clk can actually
+ * use.
+ *
+ * Context: prepare_lock must be held.
+ *          For clk providers to call from within clk_ops such as .round_rate,
+ *          .determine_rate.
+ *
+ * Return: returns rounded rate of hw clk if clk supports round_rate operation
+ *         else returns the parent rate.
+ */
+unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
+{
+	int ret;
+	struct clk_rate_request req;
+
+	clk_core_init_rate_req(hw->core, &req, rate);
+
+	trace_clk_rate_request_start(&req);
+
+	ret = clk_core_round_rate_nolock(hw->core, &req);
+	if (ret)
+		return 0;
+
+	trace_clk_rate_request_done(&req);
+
+	return req.rate;
+}
+EXPORT_SYMBOL_GPL(clk_hw_round_rate);
+
+/**
+ * clk_round_rate - round the given rate for a clk
+ * @clk: the clk for which we are rounding a rate
+ * @rate: the rate which is to be rounded
+ *
+ * Takes in a rate as input and rounds it to a rate that the clk can actually
+ * use which is then returned.  If clk doesn't support round_rate operation
+ * then the parent rate is returned.
+ */
+long clk_round_rate(struct clk *clk, unsigned long rate)
+{
+	struct clk_rate_request req;
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
+	clk_core_init_rate_req(clk->core, &req, rate);
+
+	trace_clk_rate_request_start(&req);
+
+	ret = clk_core_round_rate_nolock(clk->core, &req);
+
+	trace_clk_rate_request_done(&req);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
+	clk_prepare_unlock();
+
+	if (ret)
+		return ret;
+
+	return req.rate;
+}
+EXPORT_SYMBOL_GPL(clk_round_rate);
+
+/**
+ * __clk_notify - call clk notifier chain
+ * @core: clk that is changing rate
+ * @msg: clk notifier type (see include/linux/clk.h)
+ * @old_rate: old clk rate
+ * @new_rate: new clk rate
+ *
+ * Triggers a notifier call chain on the clk rate-change notification
+ * for 'clk'.  Passes a pointer to the struct clk and the previous
+ * and current rates to the notifier callback.  Intended to be called by
+ * internal clock code only.  Returns NOTIFY_DONE from the last driver
+ * called if all went well, or NOTIFY_STOP or NOTIFY_BAD immediately if
+ * a driver returns that.
+ */
+static int __clk_notify(struct clk_core *core, unsigned long msg,
+		unsigned long old_rate, unsigned long new_rate)
+{
+	struct clk_notifier *cn;
+	struct clk_notifier_data cnd;
+	int ret = NOTIFY_DONE;
+
+	cnd.old_rate = old_rate;
+	cnd.new_rate = new_rate;
+
+	list_for_each_entry(cn, &clk_notifier_list, node) {
+		if (cn->clk->core == core) {
+			cnd.clk = cn->clk;
+			ret = srcu_notifier_call_chain(&cn->notifier_head, msg,
+					&cnd);
+			if (ret & NOTIFY_STOP_MASK)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * __clk_recalc_accuracies
+ * @core: first clk in the subtree
+ *
+ * Walks the subtree of clks starting with clk and recalculates accuracies as
+ * it goes.  Note that if a clk does not implement the .recalc_accuracy
+ * callback then it is assumed that the clock will take on the accuracy of its
+ * parent.
+ */
+static void __clk_recalc_accuracies(struct clk_core *core)
+{
+	unsigned long parent_accuracy = 0;
+	struct clk_core *child;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (core->parent)
+		parent_accuracy = core->parent->accuracy;
+
+	if (core->ops->recalc_accuracy)
+		core->accuracy = core->ops->recalc_accuracy(core->hw,
+							  parent_accuracy);
+	else
+		core->accuracy = parent_accuracy;
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		__clk_recalc_accuracies(child);
+}
+
+static long clk_core_get_accuracy_recalc(struct clk_core *core)
+{
+	if (core && (core->flags & CLK_GET_ACCURACY_NOCACHE))
+		__clk_recalc_accuracies(core);
+
+	return clk_core_get_accuracy_no_lock(core);
+}
+
+/**
+ * clk_get_accuracy - return the accuracy of clk
+ * @clk: the clk whose accuracy is being returned
+ *
+ * Simply returns the cached accuracy of the clk, unless
+ * CLK_GET_ACCURACY_NOCACHE flag is set, which means a recalc_rate will be
+ * issued.
+ * If clk is NULL then returns 0.
+ */
+long clk_get_accuracy(struct clk *clk)
+{
+	long accuracy;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	accuracy = clk_core_get_accuracy_recalc(clk->core);
+	clk_prepare_unlock();
+
+	return accuracy;
+}
+EXPORT_SYMBOL_GPL(clk_get_accuracy);
+
+static unsigned long clk_recalc(struct clk_core *core,
+				unsigned long parent_rate)
+{
+	unsigned long rate = parent_rate;
+
+	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
+		rate = core->ops->recalc_rate(core->hw, parent_rate);
+		clk_pm_runtime_put(core);
+	}
+	return rate;
+}
+
+/**
+ * __clk_recalc_rates
+ * @core: first clk in the subtree
+ * @update_req: Whether req_rate should be updated with the new rate
+ * @msg: notification type (see include/linux/clk.h)
+ *
+ * Walks the subtree of clks starting with clk and recalculates rates as it
+ * goes.  Note that if a clk does not implement the .recalc_rate callback then
+ * it is assumed that the clock will take on the rate of its parent.
+ *
+ * clk_recalc_rates also propagates the POST_RATE_CHANGE notification,
+ * if necessary.
+ */
+static void __clk_recalc_rates(struct clk_core *core, bool update_req,
+			       unsigned long msg)
+{
+	unsigned long old_rate;
+	unsigned long parent_rate = 0;
+	struct clk_core *child;
+
+	lockdep_assert_held(&prepare_lock);
+
+	old_rate = core->rate;
+
+	if (core->parent)
+		parent_rate = core->parent->rate;
+
+	core->rate = clk_recalc(core, parent_rate);
+	if (update_req)
+		core->req_rate = core->rate;
+
+	/*
+	 * ignore NOTIFY_STOP and NOTIFY_BAD return values for POST_RATE_CHANGE
+	 * & ABORT_RATE_CHANGE notifiers
+	 */
+	if (core->notifier_count && msg)
+		__clk_notify(core, msg, old_rate, core->rate);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		__clk_recalc_rates(child, update_req, msg);
+}
+
+static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
+{
+	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
+		__clk_recalc_rates(core, false, 0);
+
+	return clk_core_get_rate_nolock(core);
+}
+
+/**
+ * clk_get_rate - return the rate of clk
+ * @clk: the clk whose rate is being returned
+ *
+ * Simply returns the cached rate of the clk, unless CLK_GET_RATE_NOCACHE flag
+ * is set, which means a recalc_rate will be issued. Can be called regardless of
+ * the clock enabledness. If clk is NULL, or if an error occurred, then returns
+ * 0.
+ */
+unsigned long clk_get_rate(struct clk *clk)
+{
+	unsigned long rate;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	rate = clk_core_get_rate_recalc(clk->core);
+	clk_prepare_unlock();
+
+	return rate;
+}
+EXPORT_SYMBOL_GPL(clk_get_rate);
+
+static int clk_fetch_parent_index(struct clk_core *core,
+				  struct clk_core *parent)
+{
+	int i;
+
+	if (!parent)
+		return -EINVAL;
+
+	for (i = 0; i < core->num_parents; i++) {
+		/* Found it first try! */
+		if (core->parents[i].core == parent)
+			return i;
+
+		/* Something else is here, so keep looking */
+		if (core->parents[i].core)
+			continue;
+
+		/* Maybe core hasn't been cached but the hw is all we know? */
+		if (core->parents[i].hw) {
+			if (core->parents[i].hw == parent->hw)
+				break;
+
+			/* Didn't match, but we're expecting a clk_hw */
+			continue;
+		}
+
+		/* Maybe it hasn't been cached (clk_set_parent() path) */
+		if (parent == clk_core_get(core, i))
+			break;
+
+		/* Fallback to comparing globally unique names */
+		if (core->parents[i].name &&
+		    !strcmp(parent->name, core->parents[i].name))
+			break;
+	}
+
+	if (i == core->num_parents)
+		return -EINVAL;
+
+	core->parents[i].core = parent;
+	return i;
+}
+
+/**
+ * clk_hw_get_parent_index - return the index of the parent clock
+ * @hw: clk_hw associated with the clk being consumed
+ *
+ * Fetches and returns the index of parent clock. Returns -EINVAL if the given
+ * clock does not have a current parent.
+ */
+int clk_hw_get_parent_index(struct clk_hw *hw)
+{
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+
+	if (WARN_ON(parent == NULL))
+		return -EINVAL;
+
+	return clk_fetch_parent_index(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_parent_index);
+
+/*
+ * Update the orphan status of @core and all its children.
+ */
+static void clk_core_update_orphan_status(struct clk_core *core, bool is_orphan)
+{
+	struct clk_core *child;
+
+	core->orphan = is_orphan;
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_update_orphan_status(child, is_orphan);
+}
+
+static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
+{
+	bool was_orphan = core->orphan;
+
+	hlist_del(&core->child_node);
+
+	if (new_parent) {
+		bool becomes_orphan = new_parent->orphan;
+
+		/* avoid duplicate POST_RATE_CHANGE notifications */
+		if (new_parent->new_child == core)
+			new_parent->new_child = NULL;
+
+		hlist_add_head(&core->child_node, &new_parent->children);
+
+		if (was_orphan != becomes_orphan)
+			clk_core_update_orphan_status(core, becomes_orphan);
+	} else {
+		hlist_add_head(&core->child_node, &clk_orphan_list);
+		if (!was_orphan)
+			clk_core_update_orphan_status(core, true);
+	}
+
+	core->parent = new_parent;
+}
+
+static struct clk_core *__clk_set_parent_before(struct clk_core *core,
+					   struct clk_core *parent)
+{
+	unsigned long flags;
+	struct clk_core *old_parent = core->parent;
+
+	/*
+	 * 1. enable parents for CLK_OPS_PARENT_ENABLE clock
+	 *
+	 * 2. Migrate prepare state between parents and prevent race with
+	 * clk_enable().
+	 *
+	 * If the clock is not prepared, then a race with
+	 * clk_enable/disable() is impossible since we already have the
+	 * prepare lock (future calls to clk_enable() need to be preceded by
+	 * a clk_prepare()).
+	 *
+	 * If the clock is prepared, migrate the prepared state to the new
+	 * parent and also protect against a race with clk_enable() by
+	 * forcing the clock and the new parent on.  This ensures that all
+	 * future calls to clk_enable() are practically NOPs with respect to
+	 * hardware and software states.
+	 *
+	 * See also: Comment for clk_set_parent() below.
+	 */
+
+	/* enable old_parent & parent if CLK_OPS_PARENT_ENABLE is set */
+	if (core->flags & CLK_OPS_PARENT_ENABLE) {
+		clk_core_prepare_enable(old_parent);
+		clk_core_prepare_enable(parent);
+	}
+
+	/* migrate prepare count if > 0 */
+	if (core->prepare_count) {
+		clk_core_prepare_enable(parent);
+		clk_core_enable_lock(core);
+	}
+
+	/* update the clk tree topology */
+	flags = clk_enable_lock();
+	clk_reparent(core, parent);
+	clk_enable_unlock(flags);
+
+	return old_parent;
+}
+
+static void __clk_set_parent_after(struct clk_core *core,
+				   struct clk_core *parent,
+				   struct clk_core *old_parent)
+{
+	/*
+	 * Finish the migration of prepare state and undo the changes done
+	 * for preventing a race with clk_enable().
+	 */
+	if (core->prepare_count) {
+		clk_core_disable_lock(core);
+		clk_core_disable_unprepare(old_parent);
+	}
+
+	/* re-balance ref counting if CLK_OPS_PARENT_ENABLE is set */
+	if (core->flags & CLK_OPS_PARENT_ENABLE) {
+		clk_core_disable_unprepare(parent);
+		clk_core_disable_unprepare(old_parent);
+	}
+}
+
+static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
+			    u8 p_index)
+{
+	unsigned long flags;
+	int ret = 0;
+	struct clk_core *old_parent;
+
+	old_parent = __clk_set_parent_before(core, parent);
+
+	trace_clk_set_parent(core, parent);
+
+	/* change clock input source */
+	if (parent && core->ops->set_parent)
+		ret = core->ops->set_parent(core->hw, p_index);
+
+	trace_clk_set_parent_complete(core, parent);
+
+	if (ret) {
+		flags = clk_enable_lock();
+		clk_reparent(core, old_parent);
+		clk_enable_unlock(flags);
+
+		__clk_set_parent_after(core, old_parent, parent);
+
+		return ret;
+	}
+
+	__clk_set_parent_after(core, parent, old_parent);
+
+	return 0;
+}
+
+/**
+ * __clk_speculate_rates
+ * @core: first clk in the subtree
+ * @parent_rate: the "future" rate of clk's parent
+ *
+ * Walks the subtree of clks starting with clk, speculating rates as it
+ * goes and firing off PRE_RATE_CHANGE notifications as necessary.
+ *
+ * Unlike clk_recalc_rates, clk_speculate_rates exists only for sending
+ * pre-rate change notifications and returns early if no clks in the
+ * subtree have subscribed to the notifications.  Note that if a clk does not
+ * implement the .recalc_rate callback then it is assumed that the clock will
+ * take on the rate of its parent.
+ */
+static int __clk_speculate_rates(struct clk_core *core,
+				 unsigned long parent_rate)
+{
+	struct clk_core *child;
+	unsigned long new_rate;
+	int ret = NOTIFY_DONE;
+
+	lockdep_assert_held(&prepare_lock);
+
+	new_rate = clk_recalc(core, parent_rate);
+
+	/* abort rate change if a driver returns NOTIFY_BAD or NOTIFY_STOP */
+	if (core->notifier_count)
+		ret = __clk_notify(core, PRE_RATE_CHANGE, core->rate, new_rate);
+
+	if (ret & NOTIFY_STOP_MASK) {
+		pr_debug("%s: clk notifier callback for clock %s aborted with error %d\n",
+				__func__, core->name, ret);
+		goto out;
+	}
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		ret = __clk_speculate_rates(child, new_rate);
+		if (ret & NOTIFY_STOP_MASK)
+			break;
+	}
+
+out:
+	return ret;
+}
+
+static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
+			     struct clk_core *new_parent, u8 p_index)
+{
+	struct clk_core *child;
+
+	core->new_rate = new_rate;
+	core->new_parent = new_parent;
+	core->new_parent_index = p_index;
+	/* include clk in new parent's PRE_RATE_CHANGE notifications */
+	core->new_child = NULL;
+	if (new_parent && new_parent != core->parent)
+		new_parent->new_child = core;
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		child->new_rate = clk_recalc(child, new_rate);
+		clk_calc_subtree(child, child->new_rate, NULL, 0);
+	}
+}
+
+/*
+ * calculate the new rates returning the topmost clock that has to be
+ * changed.
+ */
+static struct clk_core *clk_calc_new_rates(struct clk_core *core,
+					   unsigned long rate)
+{
+	struct clk_core *top = core;
+	struct clk_core *old_parent, *parent;
+	unsigned long best_parent_rate = 0;
+	unsigned long new_rate;
+	unsigned long min_rate;
+	unsigned long max_rate;
+	int p_index = 0;
+	int ret;
+
+	/* sanity */
+	if (IS_ERR_OR_NULL(core))
+		return NULL;
+
+	/* save parent rate, if it exists */
+	parent = old_parent = core->parent;
+	if (parent)
+		best_parent_rate = parent->rate;
+
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+
+	/* find the closest rate and parent clk/rate */
+	if (clk_core_can_round(core)) {
+		struct clk_rate_request req;
+
+		clk_core_init_rate_req(core, &req, rate);
+
+		trace_clk_rate_request_start(&req);
+
+		ret = clk_core_determine_round_nolock(core, &req);
+		if (ret < 0)
+			return NULL;
+
+		trace_clk_rate_request_done(&req);
+
+		best_parent_rate = req.best_parent_rate;
+		new_rate = req.rate;
+		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
+
+		if (new_rate < min_rate || new_rate > max_rate)
+			return NULL;
+	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
+		/* pass-through clock without adjustable parent */
+		core->new_rate = core->rate;
+		return NULL;
+	} else {
+		/* pass-through clock with adjustable parent */
+		top = clk_calc_new_rates(parent, rate);
+		new_rate = parent->new_rate;
+		goto out;
+	}
+
+	/* some clocks must be gated to change parent */
+	if (parent != old_parent &&
+	    (core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
+		pr_debug("%s: %s not gated but wants to reparent\n",
+			 __func__, core->name);
+		return NULL;
+	}
+
+	/* try finding the new parent index */
+	if (parent && core->num_parents > 1) {
+		p_index = clk_fetch_parent_index(core, parent);
+		if (p_index < 0) {
+			pr_debug("%s: clk %s can not be parent of clk %s\n",
+				 __func__, parent->name, core->name);
+			return NULL;
+		}
+	}
+
+	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
+	    best_parent_rate != parent->rate)
+		top = clk_calc_new_rates(parent, best_parent_rate);
+
+out:
+	clk_calc_subtree(core, new_rate, parent, p_index);
+
+	return top;
+}
+
+/*
+ * Notify about rate changes in a subtree. Always walk down the whole tree
+ * so that in case of an error we can walk down the whole tree again and
+ * abort the change.
+ */
+static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
+						  unsigned long event)
+{
+	struct clk_core *child, *tmp_clk, *fail_clk = NULL;
+	int ret = NOTIFY_DONE;
+
+	if (core->rate == core->new_rate)
+		return NULL;
+
+	if (core->notifier_count) {
+		ret = __clk_notify(core, event, core->rate, core->new_rate);
+		if (ret & NOTIFY_STOP_MASK)
+			fail_clk = core;
+	}
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		/* Skip children who will be reparented to another clock */
+		if (child->new_parent && child->new_parent != core)
+			continue;
+		tmp_clk = clk_propagate_rate_change(child, event);
+		if (tmp_clk)
+			fail_clk = tmp_clk;
+	}
+
+	/* handle the new child who might not be in core->children yet */
+	if (core->new_child) {
+		tmp_clk = clk_propagate_rate_change(core->new_child, event);
+		if (tmp_clk)
+			fail_clk = tmp_clk;
+	}
+
+	return fail_clk;
+}
+
+/*
+ * walk down a subtree and set the new rates notifying the rate
+ * change on the way
+ */
+static void clk_change_rate(struct clk_core *core)
+{
+	struct clk_core *child;
+	struct hlist_node *tmp;
+	unsigned long old_rate;
+	unsigned long best_parent_rate = 0;
+	bool skip_set_rate = false;
+	struct clk_core *old_parent;
+	struct clk_core *parent = NULL;
+
+	old_rate = core->rate;
+
+	if (core->new_parent) {
+		parent = core->new_parent;
+		best_parent_rate = core->new_parent->rate;
+	} else if (core->parent) {
+		parent = core->parent;
+		best_parent_rate = core->parent->rate;
+	}
+
+	if (clk_pm_runtime_get(core))
+		return;
+
+	if (core->flags & CLK_SET_RATE_UNGATE) {
+		clk_core_prepare(core);
+		clk_core_enable_lock(core);
+	}
+
+	if (core->new_parent && core->new_parent != core->parent) {
+		old_parent = __clk_set_parent_before(core, core->new_parent);
+		trace_clk_set_parent(core, core->new_parent);
+
+		if (core->ops->set_rate_and_parent) {
+			skip_set_rate = true;
+			core->ops->set_rate_and_parent(core->hw, core->new_rate,
+					best_parent_rate,
+					core->new_parent_index);
+		} else if (core->ops->set_parent) {
+			core->ops->set_parent(core->hw, core->new_parent_index);
+		}
+
+		trace_clk_set_parent_complete(core, core->new_parent);
+		__clk_set_parent_after(core, core->new_parent, old_parent);
+	}
+
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_prepare_enable(parent);
+
+	trace_clk_set_rate(core, core->new_rate);
+
+	if (!skip_set_rate && core->ops->set_rate)
+		core->ops->set_rate(core->hw, core->new_rate, best_parent_rate);
+
+	trace_clk_set_rate_complete(core, core->new_rate);
+
+	core->rate = clk_recalc(core, best_parent_rate);
+
+	if (core->flags & CLK_SET_RATE_UNGATE) {
+		clk_core_disable_lock(core);
+		clk_core_unprepare(core);
+	}
+
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_unprepare(parent);
+
+	if (core->notifier_count && old_rate != core->rate)
+		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
+
+	if (core->flags & CLK_RECALC_NEW_RATES)
+		(void)clk_calc_new_rates(core, core->new_rate);
+
+	/*
+	 * Use safe iteration, as change_rate can actually swap parents
+	 * for certain clock types.
+	 */
+	hlist_for_each_entry_safe(child, tmp, &core->children, child_node) {
+		/* Skip children who will be reparented to another clock */
+		if (child->new_parent && child->new_parent != core)
+			continue;
+		clk_change_rate(child);
+	}
+
+	/* handle the new child who might not be in core->children yet */
+	if (core->new_child)
+		clk_change_rate(core->new_child);
+
+	clk_pm_runtime_put(core);
+}
+
+static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
+						     unsigned long req_rate)
+{
+	int ret, cnt;
+	struct clk_rate_request req;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	/* simulate what the rate would be if it could be freely set */
+	cnt = clk_core_rate_nuke_protect(core);
+	if (cnt < 0)
+		return cnt;
+
+	clk_core_init_rate_req(core, &req, req_rate);
+
+	trace_clk_rate_request_start(&req);
+
+	ret = clk_core_round_rate_nolock(core, &req);
+
+	trace_clk_rate_request_done(&req);
+
+	/* restore the protection */
+	clk_core_rate_restore_protect(core, cnt);
+
+	return ret ? 0 : req.rate;
+}
+
+static int clk_core_set_rate_nolock(struct clk_core *core,
+				    unsigned long req_rate)
+{
+	struct clk_core *top, *fail_clk;
+	unsigned long rate;
+	int ret;
+
+	if (!core)
+		return 0;
+
+	rate = clk_core_req_round_rate_nolock(core, req_rate);
+
+	/* bail early if nothing to do */
+	if (rate == clk_core_get_rate_nolock(core))
+		return 0;
+
+	/* fail on a direct rate set of a protected provider */
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
+	/* calculate new rates and get the topmost changed clock */
+	top = clk_calc_new_rates(core, req_rate);
+	if (!top)
+		return -EINVAL;
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		return ret;
+
+	/* notify that we are about to change rates */
+	fail_clk = clk_propagate_rate_change(top, PRE_RATE_CHANGE);
+	if (fail_clk) {
+		pr_debug("%s: failed to set %s rate\n", __func__,
+				fail_clk->name);
+		clk_propagate_rate_change(top, ABORT_RATE_CHANGE);
+		ret = -EBUSY;
+		goto err;
+	}
+
+	/* change the rates */
+	clk_change_rate(top);
+
+	core->req_rate = req_rate;
+err:
+	clk_pm_runtime_put(core);
+
+	return ret;
+}
+
+/**
+ * clk_set_rate - specify a new rate for clk
+ * @clk: the clk whose rate is being changed
+ * @rate: the new rate for clk
+ *
+ * In the simplest case clk_set_rate will only adjust the rate of clk.
+ *
+ * Setting the CLK_SET_RATE_PARENT flag allows the rate change operation to
+ * propagate up to clk's parent; whether or not this happens depends on the
+ * outcome of clk's .round_rate implementation.  If *parent_rate is unchanged
+ * after calling .round_rate then upstream parent propagation is ignored.  If
+ * *parent_rate comes back with a new rate for clk's parent then we propagate
+ * up to clk's parent and set its rate.  Upward propagation will continue
+ * until either a clk does not support the CLK_SET_RATE_PARENT flag or
+ * .round_rate stops requesting changes to clk's parent_rate.
+ *
+ * Rate changes are accomplished via tree traversal that also recalculates the
+ * rates for the clocks and fires off POST_RATE_CHANGE notifiers.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_set_rate(struct clk *clk, unsigned long rate)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	/* prevent racing with updates to the clock topology */
+	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_rate);
+
+/**
+ * clk_set_rate_exclusive - specify a new rate and get exclusive control
+ * @clk: the clk whose rate is being changed
+ * @rate: the new rate for clk
+ *
+ * This is a combination of clk_set_rate() and clk_rate_exclusive_get()
+ * within a critical section
+ *
+ * This can be used initially to ensure that at least 1 consumer is
+ * satisfied when several consumers are competing for exclusivity over the
+ * same clock provider.
+ *
+ * The exclusivity is not applied if setting the rate failed.
+ *
+ * Calls to clk_rate_exclusive_get() should be balanced with calls to
+ * clk_rate_exclusive_put().
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	/* prevent racing with updates to the clock topology */
+	clk_prepare_lock();
+
+	/*
+	 * The temporary protection removal is not here, on purpose
+	 * This function is meant to be used instead of clk_rate_protect,
+	 * so before the consumer code path protect the clock provider
+	 */
+
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+	if (!ret) {
+		clk_core_rate_protect(clk->core);
+		clk->exclusive_count++;
+	}
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
+
+static int clk_set_rate_range_nolock(struct clk *clk,
+				     unsigned long min,
+				     unsigned long max)
+{
+	int ret = 0;
+	unsigned long old_min, old_max, rate;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!clk)
+		return 0;
+
+	trace_clk_set_rate_range(clk->core, min, max);
+
+	if (min > max) {
+		pr_err("%s: clk %s dev %s con %s: invalid range [%lu, %lu]\n",
+		       __func__, clk->core->name, clk->dev_id, clk->con_id,
+		       min, max);
+		return -EINVAL;
+	}
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
+	/* Save the current values in case we need to rollback the change */
+	old_min = clk->min_rate;
+	old_max = clk->max_rate;
+	clk->min_rate = min;
+	clk->max_rate = max;
+
+	if (!clk_core_check_boundaries(clk->core, min, max)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	rate = clk->core->req_rate;
+	if (clk->core->flags & CLK_GET_RATE_NOCACHE)
+		rate = clk_core_get_rate_recalc(clk->core);
+
+	/*
+	 * Since the boundaries have been changed, let's give the
+	 * opportunity to the provider to adjust the clock rate based on
+	 * the new boundaries.
+	 *
+	 * We also need to handle the case where the clock is currently
+	 * outside of the boundaries. Clamping the last requested rate
+	 * to the current minimum and maximum will also handle this.
+	 *
+	 * FIXME:
+	 * There is a catch. It may fail for the usual reason (clock
+	 * broken, clock protected, etc) but also because:
+	 * - round_rate() was not favorable and fell on the wrong
+	 *   side of the boundary
+	 * - the determine_rate() callback does not really check for
+	 *   this corner case when determining the rate
+	 */
+	rate = clamp(rate, min, max);
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+	if (ret) {
+		/* rollback the changes */
+		clk->min_rate = old_min;
+		clk->max_rate = old_max;
+	}
+
+out:
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
+	return ret;
+}
+
+/**
+ * clk_set_rate_range - set a rate range for a clock source
+ * @clk: clock source
+ * @min: desired minimum clock rate in Hz, inclusive
+ * @max: desired maximum clock rate in Hz, inclusive
+ *
+ * Return: 0 for success or negative errno on failure.
+ */
+int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+
+	ret = clk_set_rate_range_nolock(clk, min, max);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_rate_range);
+
+/**
+ * clk_set_min_rate - set a minimum clock rate for a clock source
+ * @clk: clock source
+ * @rate: desired minimum clock rate in Hz, inclusive
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_min_rate(struct clk *clk, unsigned long rate)
+{
+	if (!clk)
+		return 0;
+
+	trace_clk_set_min_rate(clk->core, rate);
+
+	return clk_set_rate_range(clk, rate, clk->max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_set_min_rate);
+
+/**
+ * clk_set_max_rate - set a maximum clock rate for a clock source
+ * @clk: clock source
+ * @rate: desired maximum clock rate in Hz, inclusive
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_max_rate(struct clk *clk, unsigned long rate)
+{
+	if (!clk)
+		return 0;
+
+	trace_clk_set_max_rate(clk->core, rate);
+
+	return clk_set_rate_range(clk, clk->min_rate, rate);
+}
+EXPORT_SYMBOL_GPL(clk_set_max_rate);
+
+/**
+ * clk_get_parent - return the parent of a clk
+ * @clk: the clk whose parent gets returned
+ *
+ * Simply returns clk->parent.  Returns NULL if clk is NULL.
+ */
+struct clk *clk_get_parent(struct clk *clk)
+{
+	struct clk *parent;
+
+	if (!clk)
+		return NULL;
+
+	clk_prepare_lock();
+	/* TODO: Create a per-user clk and change callers to call clk_put */
+	parent = !clk->core->parent ? NULL : clk->core->parent->hw->clk;
+	clk_prepare_unlock();
+
+	return parent;
+}
+EXPORT_SYMBOL_GPL(clk_get_parent);
+
+static struct clk_core *__clk_init_parent(struct clk_core *core)
+{
+	u8 index = 0;
+
+	if (core->num_parents > 1 && core->ops->get_parent)
+		index = core->ops->get_parent(core->hw);
+
+	return clk_core_get_parent_by_index(core, index);
+}
+
+static void clk_core_reparent(struct clk_core *core,
+				  struct clk_core *new_parent)
+{
+	clk_reparent(core, new_parent);
+	__clk_recalc_accuracies(core);
+	__clk_recalc_rates(core, true, POST_RATE_CHANGE);
+}
+
+void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
+{
+	if (!hw)
+		return;
+
+	clk_core_reparent(hw->core, !new_parent ? NULL : new_parent->core);
+}
+
+/**
+ * clk_has_parent - check if a clock is a possible parent for another
+ * @clk: clock source
+ * @parent: parent clock source
+ *
+ * This function can be used in drivers that need to check that a clock can be
+ * the parent of another without actually changing the parent.
+ *
+ * Returns true if @parent is a possible parent for @clk, false otherwise.
+ */
+bool clk_has_parent(const struct clk *clk, const struct clk *parent)
+{
+	/* NULL clocks should be nops, so return success if either is NULL. */
+	if (!clk || !parent)
+		return true;
+
+	return clk_core_has_parent(clk->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_has_parent);
+
+static int clk_core_set_parent_nolock(struct clk_core *core,
+				      struct clk_core *parent)
+{
+	int ret = 0;
+	int p_index = 0;
+	unsigned long p_rate = 0;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	if (core->parent == parent)
+		return 0;
+
+	/* verify ops for multi-parent clks */
+	if (core->num_parents > 1 && !core->ops->set_parent)
+		return -EPERM;
+
+	/* check that we are allowed to re-parent if the clock is in use */
+	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
+		return -EBUSY;
+
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
+	/* try finding the new parent index */
+	if (parent) {
+		p_index = clk_fetch_parent_index(core, parent);
+		if (p_index < 0) {
+			pr_debug("%s: clk %s can not be parent of clk %s\n",
+					__func__, parent->name, core->name);
+			return p_index;
+		}
+		p_rate = parent->rate;
+	}
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		return ret;
+
+	/* propagate PRE_RATE_CHANGE notifications */
+	ret = __clk_speculate_rates(core, p_rate);
+
+	/* abort if a driver objects */
+	if (ret & NOTIFY_STOP_MASK)
+		goto runtime_put;
+
+	/* do the re-parent */
+	ret = __clk_set_parent(core, parent, p_index);
+
+	/* propagate rate an accuracy recalculation accordingly */
+	if (ret) {
+		__clk_recalc_rates(core, true, ABORT_RATE_CHANGE);
+	} else {
+		__clk_recalc_rates(core, true, POST_RATE_CHANGE);
+		__clk_recalc_accuracies(core);
+	}
+
+runtime_put:
+	clk_pm_runtime_put(core);
+
+	return ret;
+}
+
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
+/**
+ * clk_set_parent - switch the parent of a mux clk
+ * @clk: the mux clk whose input we are switching
+ * @parent: the new input to clk
+ *
+ * Re-parent clk to use parent as its new input source.  If clk is in
+ * prepared state, the clk will get enabled for the duration of this call. If
+ * that's not acceptable for a specific clk (Eg: the consumer can't handle
+ * that, the reparenting is glitchy in hardware, etc), use the
+ * CLK_SET_PARENT_GATE flag to allow reparenting only when clk is unprepared.
+ *
+ * After successfully changing clk's parent clk_set_parent will update the
+ * clk topology, sysfs topology and propagate rate recalculation via
+ * __clk_recalc_rates.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
+	ret = clk_core_set_parent_nolock(clk->core,
+					 parent ? parent->core : NULL);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_parent);
+
+static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
+{
+	int ret = -EINVAL;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
+	trace_clk_set_phase(core, degrees);
+
+	if (core->ops->set_phase) {
+		ret = core->ops->set_phase(core->hw, degrees);
+		if (!ret)
+			core->phase = degrees;
+	}
+
+	trace_clk_set_phase_complete(core, degrees);
+
+	return ret;
+}
+
+/**
+ * clk_set_phase - adjust the phase shift of a clock signal
+ * @clk: clock signal source
+ * @degrees: number of degrees the signal is shifted
+ *
+ * Shifts the phase of a clock signal by the specified
+ * degrees. Returns 0 on success, -EERROR otherwise.
+ *
+ * This function makes no distinction about the input or reference
+ * signal that we adjust the clock signal phase against. For example
+ * phase locked-loop clock signal generators we may shift phase with
+ * respect to feedback clock signal input, but for other cases the
+ * clock phase may be shifted with respect to some other, unspecified
+ * signal.
+ *
+ * Additionally the concept of phase shift does not propagate through
+ * the clock tree hierarchy, which sets it apart from clock rates and
+ * clock accuracy. A parent clock phase attribute does not have an
+ * impact on the phase attribute of a child clock.
+ */
+int clk_set_phase(struct clk *clk, int degrees)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	/* sanity check degrees */
+	degrees %= 360;
+	if (degrees < 0)
+		degrees += 360;
+
+	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
+	ret = clk_core_set_phase_nolock(clk->core, degrees);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_phase);
+
+static int clk_core_get_phase(struct clk_core *core)
+{
+	int ret;
+
+	lockdep_assert_held(&prepare_lock);
+	if (!core->ops->get_phase)
+		return 0;
+
+	/* Always try to update cached phase if possible */
+	ret = core->ops->get_phase(core->hw);
+	if (ret >= 0)
+		core->phase = ret;
+
+	return ret;
+}
+
+/**
+ * clk_get_phase - return the phase shift of a clock signal
+ * @clk: clock signal source
+ *
+ * Returns the phase shift of a clock node in degrees, otherwise returns
+ * -EERROR.
+ */
+int clk_get_phase(struct clk *clk)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	ret = clk_core_get_phase(clk->core);
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_get_phase);
+
+static void clk_core_reset_duty_cycle_nolock(struct clk_core *core)
+{
+	/* Assume a default value of 50% */
+	core->duty.num = 1;
+	core->duty.den = 2;
+}
+
+static int clk_core_update_duty_cycle_parent_nolock(struct clk_core *core);
+
+static int clk_core_update_duty_cycle_nolock(struct clk_core *core)
+{
+	struct clk_duty *duty = &core->duty;
+	int ret = 0;
+
+	if (!core->ops->get_duty_cycle)
+		return clk_core_update_duty_cycle_parent_nolock(core);
+
+	ret = core->ops->get_duty_cycle(core->hw, duty);
+	if (ret)
+		goto reset;
+
+	/* Don't trust the clock provider too much */
+	if (duty->den == 0 || duty->num > duty->den) {
+		ret = -EINVAL;
+		goto reset;
+	}
+
+	return 0;
+
+reset:
+	clk_core_reset_duty_cycle_nolock(core);
+	return ret;
+}
+
+static int clk_core_update_duty_cycle_parent_nolock(struct clk_core *core)
+{
+	int ret = 0;
+
+	if (core->parent &&
+	    core->flags & CLK_DUTY_CYCLE_PARENT) {
+		ret = clk_core_update_duty_cycle_nolock(core->parent);
+		memcpy(&core->duty, &core->parent->duty, sizeof(core->duty));
+	} else {
+		clk_core_reset_duty_cycle_nolock(core);
+	}
+
+	return ret;
+}
+
+static int clk_core_set_duty_cycle_parent_nolock(struct clk_core *core,
+						 struct clk_duty *duty);
+
+static int clk_core_set_duty_cycle_nolock(struct clk_core *core,
+					  struct clk_duty *duty)
+{
+	int ret;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
+	trace_clk_set_duty_cycle(core, duty);
+
+	if (!core->ops->set_duty_cycle)
+		return clk_core_set_duty_cycle_parent_nolock(core, duty);
+
+	ret = core->ops->set_duty_cycle(core->hw, duty);
+	if (!ret)
+		memcpy(&core->duty, duty, sizeof(*duty));
+
+	trace_clk_set_duty_cycle_complete(core, duty);
+
+	return ret;
+}
+
+static int clk_core_set_duty_cycle_parent_nolock(struct clk_core *core,
+						 struct clk_duty *duty)
+{
+	int ret = 0;
+
+	if (core->parent &&
+	    core->flags & (CLK_DUTY_CYCLE_PARENT | CLK_SET_RATE_PARENT)) {
+		ret = clk_core_set_duty_cycle_nolock(core->parent, duty);
+		memcpy(&core->duty, &core->parent->duty, sizeof(core->duty));
+	}
+
+	return ret;
+}
+
+/**
+ * clk_set_duty_cycle - adjust the duty cycle ratio of a clock signal
+ * @clk: clock signal source
+ * @num: numerator of the duty cycle ratio to be applied
+ * @den: denominator of the duty cycle ratio to be applied
+ *
+ * Apply the duty cycle ratio if the ratio is valid and the clock can
+ * perform this operation
+ *
+ * Returns (0) on success, a negative errno otherwise.
+ */
+int clk_set_duty_cycle(struct clk *clk, unsigned int num, unsigned int den)
+{
+	int ret;
+	struct clk_duty duty;
+
+	if (!clk)
+		return 0;
+
+	/* sanity check the ratio */
+	if (den == 0 || num > den)
+		return -EINVAL;
+
+	duty.num = num;
+	duty.den = den;
+
+	clk_prepare_lock();
+
+	if (clk->exclusive_count)
+		clk_core_rate_unprotect(clk->core);
+
+	ret = clk_core_set_duty_cycle_nolock(clk->core, &duty);
+
+	if (clk->exclusive_count)
+		clk_core_rate_protect(clk->core);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_duty_cycle);
+
+static int clk_core_get_scaled_duty_cycle(struct clk_core *core,
+					  unsigned int scale)
+{
+	struct clk_duty *duty = &core->duty;
+	int ret;
+
+	clk_prepare_lock();
+
+	ret = clk_core_update_duty_cycle_nolock(core);
+	if (!ret)
+		ret = mult_frac(scale, duty->num, duty->den);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+/**
+ * clk_get_scaled_duty_cycle - return the duty cycle ratio of a clock signal
+ * @clk: clock signal source
+ * @scale: scaling factor to be applied to represent the ratio as an integer
+ *
+ * Returns the duty cycle ratio of a clock node multiplied by the provided
+ * scaling factor, or negative errno on error.
+ */
+int clk_get_scaled_duty_cycle(struct clk *clk, unsigned int scale)
+{
+	if (!clk)
+		return 0;
+
+	return clk_core_get_scaled_duty_cycle(clk->core, scale);
+}
+EXPORT_SYMBOL_GPL(clk_get_scaled_duty_cycle);
+
+/**
+ * clk_is_match - check if two clk's point to the same hardware clock
+ * @p: clk compared against q
+ * @q: clk compared against p
+ *
+ * Returns true if the two struct clk pointers both point to the same hardware
+ * clock node. Put differently, returns true if struct clk *p and struct clk *q
+ * share the same struct clk_core object.
+ *
+ * Returns false otherwise. Note that two NULL clks are treated as matching.
+ */
+bool clk_is_match(const struct clk *p, const struct clk *q)
+{
+	/* trivial case: identical struct clk's or both NULL */
+	if (p == q)
+		return true;
+
+	/* true if clk->core pointers match. Avoid dereferencing garbage */
+	if (!IS_ERR_OR_NULL(p) && !IS_ERR_OR_NULL(q))
+		if (p->core == q->core)
+			return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(clk_is_match);
+
+/***        debugfs support        ***/
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static struct dentry *rootdir;
+static int inited = 0;
+static DEFINE_MUTEX(clk_debug_lock);
+static HLIST_HEAD(clk_debug_list);
+
+static struct hlist_head *orphan_list[] = {
+	&clk_orphan_list,
+	NULL,
+};
+
+static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
+				 int level)
+{
+	int phase;
+	struct clk *clk_user;
+	int multi_node = 0;
+
+	seq_printf(s, "%*s%-*s %-7d %-8d %-8d %-11lu %-10lu ",
+		   level * 3 + 1, "",
+		   35 - level * 3, c->name,
+		   c->enable_count, c->prepare_count, c->protect_count,
+		   clk_core_get_rate_recalc(c),
+		   clk_core_get_accuracy_recalc(c));
+
+	phase = clk_core_get_phase(c);
+	if (phase >= 0)
+		seq_printf(s, "%-5d", phase);
+	else
+		seq_puts(s, "-----");
+
+	seq_printf(s, " %-6d", clk_core_get_scaled_duty_cycle(c, 100000));
+
+	if (c->ops->is_enabled)
+		seq_printf(s, " %5c ", clk_core_is_enabled(c) ? 'Y' : 'N');
+	else if (!c->ops->enable)
+		seq_printf(s, " %5c ", 'Y');
+	else
+		seq_printf(s, " %5c ", '?');
+
+	hlist_for_each_entry(clk_user, &c->clks, clks_node) {
+		seq_printf(s, "%*s%-*s  %-25s\n",
+			   level * 3 + 2 + 105 * multi_node, "",
+			   30,
+			   clk_user->dev_id ? clk_user->dev_id : "deviceless",
+			   clk_user->con_id ? clk_user->con_id : "no_connection_id");
+
+		multi_node = 1;
+	}
+
+}
+
+static void clk_summary_show_subtree(struct seq_file *s, struct clk_core *c,
+				     int level)
+{
+	struct clk_core *child;
+
+	clk_summary_show_one(s, c, level);
+
+	hlist_for_each_entry(child, &c->children, child_node)
+		clk_summary_show_subtree(s, child, level + 1);
+}
+
+static int clk_summary_show(struct seq_file *s, void *data)
+{
+	struct clk_core *c;
+	struct hlist_head **lists = s->private;
+	int ret;
+
+	seq_puts(s, "                                 enable  prepare  protect                                duty  hardware                            connection\n");
+	seq_puts(s, "   clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id\n");
+	seq_puts(s, "---------------------------------------------------------------------------------------------------------------------------------------------\n");
+
+	ret = clk_pm_runtime_get_all();
+	if (ret)
+		return ret;
+
+	clk_prepare_lock();
+
+	for (; *lists; lists++)
+		hlist_for_each_entry(c, *lists, child_node)
+			clk_summary_show_subtree(s, c, 0);
+
+	clk_prepare_unlock();
+	clk_pm_runtime_put_all();
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_summary);
+
+static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
+{
+	int phase;
+	unsigned long min_rate, max_rate;
+
+	clk_core_get_boundaries(c, &min_rate, &max_rate);
+
+	/* This should be JSON format, i.e. elements separated with a comma */
+	seq_printf(s, "\"%s\": { ", c->name);
+	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
+	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
+	seq_printf(s, "\"protect_count\": %d,", c->protect_count);
+	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate_recalc(c));
+	seq_printf(s, "\"min_rate\": %lu,", min_rate);
+	seq_printf(s, "\"max_rate\": %lu,", max_rate);
+	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy_recalc(c));
+	phase = clk_core_get_phase(c);
+	if (phase >= 0)
+		seq_printf(s, "\"phase\": %d,", phase);
+	seq_printf(s, "\"duty_cycle\": %u",
+		   clk_core_get_scaled_duty_cycle(c, 100000));
+}
+
+static void clk_dump_subtree(struct seq_file *s, struct clk_core *c, int level)
+{
+	struct clk_core *child;
+
+	clk_dump_one(s, c, level);
+
+	hlist_for_each_entry(child, &c->children, child_node) {
+		seq_putc(s, ',');
+		clk_dump_subtree(s, child, level + 1);
+	}
+
+	seq_putc(s, '}');
+}
+
+static int clk_dump_show(struct seq_file *s, void *data)
+{
+	struct clk_core *c;
+	bool first_node = true;
+	struct hlist_head **lists = s->private;
+	int ret;
+
+	ret = clk_pm_runtime_get_all();
+	if (ret)
+		return ret;
+
+	seq_putc(s, '{');
+
+	clk_prepare_lock();
+
+	for (; *lists; lists++) {
+		hlist_for_each_entry(c, *lists, child_node) {
+			if (!first_node)
+				seq_putc(s, ',');
+			first_node = false;
+			clk_dump_subtree(s, c, 0);
+		}
+	}
+
+	clk_prepare_unlock();
+	clk_pm_runtime_put_all();
+
+	seq_puts(s, "}\n");
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_dump);
+
+#undef CLOCK_ALLOW_WRITE_DEBUGFS
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+/*
+ * This can be dangerous, therefore don't provide any real compile time
+ * configuration option for this feature.
+ * People who want to use this will need to modify the source code directly.
+ */
+static int clk_rate_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+	int ret;
+
+	clk_prepare_lock();
+	ret = clk_core_set_rate_nolock(core, val);
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+#define clk_rate_mode	0644
+
+static int clk_phase_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+	int degrees = do_div(val, 360);
+	int ret;
+
+	clk_prepare_lock();
+	ret = clk_core_set_phase_nolock(core, degrees);
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+#define clk_phase_mode	0644
+
+static int clk_prepare_enable_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+	int ret = 0;
+
+	if (val)
+		ret = clk_prepare_enable(core->hw->clk);
+	else
+		clk_disable_unprepare(core->hw->clk);
+
+	return ret;
+}
+
+static int clk_prepare_enable_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->enable_count && core->prepare_count;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(clk_prepare_enable_fops, clk_prepare_enable_get,
+			 clk_prepare_enable_set, "%llu\n");
+
+#else
+#define clk_rate_set	NULL
+#define clk_rate_mode	0444
+
+#define clk_phase_set	NULL
+#define clk_phase_mode	0644
+#endif
+
+static int clk_rate_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	clk_prepare_lock();
+	*val = clk_core_get_rate_recalc(core);
+	clk_prepare_unlock();
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(clk_rate_fops, clk_rate_get, clk_rate_set, "%llu\n");
+
+static int clk_phase_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->phase;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(clk_phase_fops, clk_phase_get, clk_phase_set, "%llu\n");
+
+static const struct {
+	unsigned long flag;
+	const char *name;
+} clk_flags[] = {
+#define ENTRY(f) { f, #f }
+	ENTRY(CLK_SET_RATE_GATE),
+	ENTRY(CLK_SET_PARENT_GATE),
+	ENTRY(CLK_SET_RATE_PARENT),
+	ENTRY(CLK_IGNORE_UNUSED),
+	ENTRY(CLK_GET_RATE_NOCACHE),
+	ENTRY(CLK_SET_RATE_NO_REPARENT),
+	ENTRY(CLK_GET_ACCURACY_NOCACHE),
+	ENTRY(CLK_RECALC_NEW_RATES),
+	ENTRY(CLK_SET_RATE_UNGATE),
+	ENTRY(CLK_IS_CRITICAL),
+	ENTRY(CLK_OPS_PARENT_ENABLE),
+	ENTRY(CLK_DUTY_CYCLE_PARENT),
+#undef ENTRY
+};
+
+static int clk_flags_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long flags = core->flags;
+	unsigned int i;
+
+	for (i = 0; flags && i < ARRAY_SIZE(clk_flags); i++) {
+		if (flags & clk_flags[i].flag) {
+			seq_printf(s, "%s\n", clk_flags[i].name);
+			flags &= ~clk_flags[i].flag;
+		}
+	}
+	if (flags) {
+		/* Unknown flags */
+		seq_printf(s, "0x%lx\n", flags);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_flags);
+
+static void possible_parent_show(struct seq_file *s, struct clk_core *core,
+				 unsigned int i, char terminator)
+{
+	struct clk_core *parent;
+	const char *name = NULL;
+
+	/*
+	 * Go through the following options to fetch a parent's name.
+	 *
+	 * 1. Fetch the registered parent clock and use its name
+	 * 2. Use the global (fallback) name if specified
+	 * 3. Use the local fw_name if provided
+	 * 4. Fetch parent clock's clock-output-name if DT index was set
+	 *
+	 * This may still fail in some cases, such as when the parent is
+	 * specified directly via a struct clk_hw pointer, but it isn't
+	 * registered (yet).
+	 */
+	parent = clk_core_get_parent_by_index(core, i);
+	if (parent) {
+		seq_puts(s, parent->name);
+	} else if (core->parents[i].name) {
+		seq_puts(s, core->parents[i].name);
+	} else if (core->parents[i].fw_name) {
+		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
+	} else {
+		if (core->parents[i].index >= 0)
+			name = of_clk_get_parent_name(core->of_node, core->parents[i].index);
+		if (!name)
+			name = "(missing)";
+
+		seq_puts(s, name);
+	}
+
+	seq_putc(s, terminator);
+}
+
+static int possible_parents_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	int i;
+
+	for (i = 0; i < core->num_parents - 1; i++)
+		possible_parent_show(s, core, i, ' ');
+
+	possible_parent_show(s, core, i, '\n');
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(possible_parents);
+
+static int current_parent_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+
+	if (core->parent)
+		seq_printf(s, "%s\n", core->parent->name);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(current_parent);
+
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+static ssize_t current_parent_write(struct file *file, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct clk_core *core = s->private;
+	struct clk_core *parent;
+	u8 idx;
+	int err;
+
+	err = kstrtou8_from_user(ubuf, count, 0, &idx);
+	if (err < 0)
+		return err;
+
+	parent = clk_core_get_parent_by_index(core, idx);
+	if (!parent)
+		return -ENOENT;
+
+	clk_prepare_lock();
+	err = clk_core_set_parent_nolock(core, parent);
+	clk_prepare_unlock();
+	if (err)
+		return err;
+
+	return count;
+}
+
+static const struct file_operations current_parent_rw_fops = {
+	.open		= current_parent_open,
+	.write		= current_parent_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+#endif
+
+static int clk_duty_cycle_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	struct clk_duty *duty = &core->duty;
+
+	seq_printf(s, "%u/%u\n", duty->num, duty->den);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
+
+static int clk_min_rate_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long min_rate, max_rate;
+
+	clk_prepare_lock();
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	clk_prepare_unlock();
+	seq_printf(s, "%lu\n", min_rate);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_min_rate);
+
+static int clk_max_rate_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long min_rate, max_rate;
+
+	clk_prepare_lock();
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	clk_prepare_unlock();
+	seq_printf(s, "%lu\n", max_rate);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_max_rate);
+
+static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
+{
+	struct dentry *root;
+
+	if (!core || !pdentry)
+		return;
+
+	root = debugfs_create_dir(core->name, pdentry);
+	core->dentry = root;
+
+	debugfs_create_file("clk_rate", clk_rate_mode, root, core,
+			    &clk_rate_fops);
+	debugfs_create_file("clk_min_rate", 0444, root, core, &clk_min_rate_fops);
+	debugfs_create_file("clk_max_rate", 0444, root, core, &clk_max_rate_fops);
+	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
+	debugfs_create_file("clk_phase", clk_phase_mode, root, core,
+			    &clk_phase_fops);
+	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
+	debugfs_create_u32("clk_prepare_count", 0444, root, &core->prepare_count);
+	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
+	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
+	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
+	debugfs_create_file("clk_duty_cycle", 0444, root, core,
+			    &clk_duty_cycle_fops);
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+	debugfs_create_file("clk_prepare_enable", 0644, root, core,
+			    &clk_prepare_enable_fops);
+
+	if (core->num_parents > 1)
+		debugfs_create_file("clk_parent", 0644, root, core,
+				    &current_parent_rw_fops);
+	else
+#endif
+	if (core->num_parents > 0)
+		debugfs_create_file("clk_parent", 0444, root, core,
+				    &current_parent_fops);
+
+	if (core->num_parents > 1)
+		debugfs_create_file("clk_possible_parents", 0444, root, core,
+				    &possible_parents_fops);
+
+	if (core->ops->debug_init)
+		core->ops->debug_init(core->hw, core->dentry);
+}
+
+/**
+ * clk_debug_register - add a clk node to the debugfs clk directory
+ * @core: the clk being added to the debugfs clk directory
+ *
+ * Dynamically adds a clk to the debugfs clk directory if debugfs has been
+ * initialized.  Otherwise it bails out early since the debugfs clk directory
+ * will be created lazily by clk_debug_init as part of a late_initcall.
+ */
+static void clk_debug_register(struct clk_core *core)
+{
+	mutex_lock(&clk_debug_lock);
+	hlist_add_head(&core->debug_node, &clk_debug_list);
+	if (inited)
+		clk_debug_create_one(core, rootdir);
+	mutex_unlock(&clk_debug_lock);
+}
+
+ /**
+ * clk_debug_unregister - remove a clk node from the debugfs clk directory
+ * @core: the clk being removed from the debugfs clk directory
+ *
+ * Dynamically removes a clk and all its child nodes from the
+ * debugfs clk directory if clk->dentry points to debugfs created by
+ * clk_debug_register in __clk_core_init.
+ */
+static void clk_debug_unregister(struct clk_core *core)
+{
+	mutex_lock(&clk_debug_lock);
+	hlist_del_init(&core->debug_node);
+	debugfs_remove_recursive(core->dentry);
+	core->dentry = NULL;
+	mutex_unlock(&clk_debug_lock);
+}
+
+/**
+ * clk_debug_init - lazily populate the debugfs clk directory
+ *
+ * clks are often initialized very early during boot before memory can be
+ * dynamically allocated and well before debugfs is setup. This function
+ * populates the debugfs clk directory once at boot-time when we know that
+ * debugfs is setup. It should only be called once at boot-time, all other clks
+ * added dynamically will be done so with clk_debug_register.
+ */
+static int __init clk_debug_init(void)
+{
+	struct clk_core *core;
+
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+	pr_warn("\n");
+	pr_warn("********************************************************************\n");
+	pr_warn("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE           **\n");
+	pr_warn("**                                                                **\n");
+	pr_warn("**  WRITEABLE clk DebugFS SUPPORT HAS BEEN ENABLED IN THIS KERNEL **\n");
+	pr_warn("**                                                                **\n");
+	pr_warn("** This means that this kernel is built to expose clk operations  **\n");
+	pr_warn("** such as parent or rate setting, enabling, disabling, etc.      **\n");
+	pr_warn("** to userspace, which may compromise security on your system.    **\n");
+	pr_warn("**                                                                **\n");
+	pr_warn("** If you see this message and you are not debugging the          **\n");
+	pr_warn("** kernel, report this immediately to your vendor!                **\n");
+	pr_warn("**                                                                **\n");
+	pr_warn("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE           **\n");
+	pr_warn("********************************************************************\n");
+#endif
+
+	rootdir = debugfs_create_dir("clk", NULL);
+
+	debugfs_create_file("clk_summary", 0444, rootdir, &all_lists,
+			    &clk_summary_fops);
+	debugfs_create_file("clk_dump", 0444, rootdir, &all_lists,
+			    &clk_dump_fops);
+	debugfs_create_file("clk_orphan_summary", 0444, rootdir, &orphan_list,
+			    &clk_summary_fops);
+	debugfs_create_file("clk_orphan_dump", 0444, rootdir, &orphan_list,
+			    &clk_dump_fops);
+
+	mutex_lock(&clk_debug_lock);
+	hlist_for_each_entry(core, &clk_debug_list, debug_node)
+		clk_debug_create_one(core, rootdir);
+
+	inited = 1;
+	mutex_unlock(&clk_debug_lock);
+
+	return 0;
+}
+late_initcall(clk_debug_init);
+#else
+static inline void clk_debug_register(struct clk_core *core) { }
+static inline void clk_debug_unregister(struct clk_core *core)
+{
+}
+#endif
+
+static void clk_core_reparent_orphans_nolock(void)
+{
+	struct clk_core *orphan;
+	struct hlist_node *tmp2;
+
+	/*
+	 * walk the list of orphan clocks and reparent any that newly finds a
+	 * parent.
+	 */
+	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
+		struct clk_core *parent = __clk_init_parent(orphan);
+
+		/*
+		 * We need to use __clk_set_parent_before() and _after() to
+		 * properly migrate any prepare/enable count of the orphan
+		 * clock. This is important for CLK_IS_CRITICAL clocks, which
+		 * are enabled during init but might not have a parent yet.
+		 */
+		if (parent) {
+			/* update the clk tree topology */
+			__clk_set_parent_before(orphan, parent);
+			__clk_set_parent_after(orphan, parent, NULL);
+			__clk_recalc_accuracies(orphan);
+			__clk_recalc_rates(orphan, true, 0);
+
+			/*
+			 * __clk_init_parent() will set the initial req_rate to
+			 * 0 if the clock doesn't have clk_ops::recalc_rate and
+			 * is an orphan when it's registered.
+			 *
+			 * 'req_rate' is used by clk_set_rate_range() and
+			 * clk_put() to trigger a clk_set_rate() call whenever
+			 * the boundaries are modified. Let's make sure
+			 * 'req_rate' is set to something non-zero so that
+			 * clk_set_rate_range() doesn't drop the frequency.
+			 */
+			orphan->req_rate = orphan->rate;
+		}
+	}
+}
+
+/**
+ * __clk_core_init - initialize the data structures in a struct clk_core
+ * @core:	clk_core being initialized
+ *
+ * Initializes the lists in struct clk_core, queries the hardware for the
+ * parent and rate and sets them both.
+ */
+static int __clk_core_init(struct clk_core *core)
+{
+	int ret;
+	struct clk_core *parent;
+	unsigned long rate;
+	int phase;
+
+	clk_prepare_lock();
+
+	/*
+	 * Set hw->core after grabbing the prepare_lock to synchronize with
+	 * callers of clk_core_fill_parent_index() where we treat hw->core
+	 * being NULL as the clk not being registered yet. This is crucial so
+	 * that clks aren't parented until their parent is fully registered.
+	 */
+	core->hw->core = core;
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto unlock;
+
+	/* check to see if a clock with this name is already registered */
+	if (clk_core_lookup(core->name)) {
+		pr_debug("%s: clk %s already initialized\n",
+				__func__, core->name);
+		ret = -EEXIST;
+		goto out;
+	}
+
+	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
+	if (core->ops->set_rate &&
+	    !((core->ops->round_rate || core->ops->determine_rate) &&
+	      core->ops->recalc_rate)) {
+		pr_err("%s: %s must implement .round_rate or .determine_rate in addition to .recalc_rate\n",
+		       __func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (core->ops->set_parent && !core->ops->get_parent) {
+		pr_err("%s: %s must implement .get_parent & .set_parent\n",
+		       __func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (core->ops->set_parent && !core->ops->determine_rate) {
+		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
+			__func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (core->num_parents > 1 && !core->ops->get_parent) {
+		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
+		       __func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (core->ops->set_rate_and_parent &&
+			!(core->ops->set_parent && core->ops->set_rate)) {
+		pr_err("%s: %s must implement .set_parent & .set_rate\n",
+				__func__, core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * optional platform-specific magic
+	 *
+	 * The .init callback is not used by any of the basic clock types, but
+	 * exists for weird hardware that must perform initialization magic for
+	 * CCF to get an accurate view of clock for any other callbacks. It may
+	 * also be used needs to perform dynamic allocations. Such allocation
+	 * must be freed in the terminate() callback.
+	 * This callback shall not be used to initialize the parameters state,
+	 * such as rate, parent, etc ...
+	 *
+	 * If it exist, this callback should called before any other callback of
+	 * the clock
+	 */
+	if (core->ops->init) {
+		ret = core->ops->init(core->hw);
+		if (ret)
+			goto out;
+	}
+
+	parent = core->parent = __clk_init_parent(core);
+
+	/*
+	 * Populate core->parent if parent has already been clk_core_init'd. If
+	 * parent has not yet been clk_core_init'd then place clk in the orphan
+	 * list.  If clk doesn't have any parents then place it in the root
+	 * clk list.
+	 *
+	 * Every time a new clk is clk_init'd then we walk the list of orphan
+	 * clocks and re-parent any that are children of the clock currently
+	 * being clk_init'd.
+	 */
+	if (parent) {
+		hlist_add_head(&core->child_node, &parent->children);
+		core->orphan = parent->orphan;
+	} else if (!core->num_parents) {
+		hlist_add_head(&core->child_node, &clk_root_list);
+		core->orphan = false;
+	} else {
+		hlist_add_head(&core->child_node, &clk_orphan_list);
+		core->orphan = true;
+	}
+	hash_add(clk_hashtable, &core->hashtable_node,
+		 full_name_hash(NULL, core->name, strlen(core->name)));
+
+	/*
+	 * Set clk's accuracy.  The preferred method is to use
+	 * .recalc_accuracy. For simple clocks and lazy developers the default
+	 * fallback is to use the parent's accuracy.  If a clock doesn't have a
+	 * parent (or is orphaned) then accuracy is set to zero (perfect
+	 * clock).
+	 */
+	if (core->ops->recalc_accuracy)
+		core->accuracy = core->ops->recalc_accuracy(core->hw,
+					clk_core_get_accuracy_no_lock(parent));
+	else if (parent)
+		core->accuracy = parent->accuracy;
+	else
+		core->accuracy = 0;
+
+	/*
+	 * Set clk's phase by clk_core_get_phase() caching the phase.
+	 * Since a phase is by definition relative to its parent, just
+	 * query the current clock phase, or just assume it's in phase.
+	 */
+	phase = clk_core_get_phase(core);
+	if (phase < 0) {
+		ret = phase;
+		pr_warn("%s: Failed to get phase for clk '%s'\n", __func__,
+			core->name);
+		goto out;
+	}
+
+	/*
+	 * Set clk's duty cycle.
+	 */
+	clk_core_update_duty_cycle_nolock(core);
+
+	/*
+	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
+	 * simple clocks and lazy developers the default fallback is to use the
+	 * parent's rate.  If a clock doesn't have a parent (or is orphaned)
+	 * then rate is set to zero.
+	 */
+	if (core->ops->recalc_rate)
+		rate = core->ops->recalc_rate(core->hw,
+				clk_core_get_rate_nolock(parent));
+	else if (parent)
+		rate = parent->rate;
+	else
+		rate = 0;
+	core->rate = core->req_rate = rate;
+
+	/*
+	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
+	 * don't get accidentally disabled when walking the orphan tree and
+	 * reparenting clocks
+	 */
+	if (core->flags & CLK_IS_CRITICAL) {
+		ret = clk_core_prepare(core);
+		if (ret) {
+			pr_warn("%s: critical clk '%s' failed to prepare\n",
+			       __func__, core->name);
+			goto out;
+		}
+
+		ret = clk_core_enable_lock(core);
+		if (ret) {
+			pr_warn("%s: critical clk '%s' failed to enable\n",
+			       __func__, core->name);
+			clk_core_unprepare(core);
+			goto out;
+		}
+	}
+
+	clk_core_reparent_orphans_nolock();
+out:
+	clk_pm_runtime_put(core);
+unlock:
+	if (ret) {
+		hash_del(&core->hashtable_node);
+		hlist_del_init(&core->child_node);
+		core->hw->core = NULL;
+	}
+
+	clk_prepare_unlock();
+
+	if (!ret)
+		clk_debug_register(core);
+
+	return ret;
+}
+
+/**
+ * clk_core_link_consumer - Add a clk consumer to the list of consumers in a clk_core
+ * @core: clk to add consumer to
+ * @clk: consumer to link to a clk
+ */
+static void clk_core_link_consumer(struct clk_core *core, struct clk *clk)
+{
+	clk_prepare_lock();
+	hlist_add_head(&clk->clks_node, &core->clks);
+	clk_prepare_unlock();
+}
+
+/**
+ * clk_core_unlink_consumer - Remove a clk consumer from the list of consumers in a clk_core
+ * @clk: consumer to unlink
+ */
+static void clk_core_unlink_consumer(struct clk *clk)
+{
+	lockdep_assert_held(&prepare_lock);
+	hlist_del(&clk->clks_node);
+}
+
+/**
+ * alloc_clk - Allocate a clk consumer, but leave it unlinked to the clk_core
+ * @core: clk to allocate a consumer for
+ * @dev_id: string describing device name
+ * @con_id: connection ID string on device
+ *
+ * Returns: clk consumer left unlinked from the consumer list
+ */
+static struct clk *alloc_clk(struct clk_core *core, const char *dev_id,
+			     const char *con_id)
+{
+	struct clk *clk;
+
+	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	clk->core = core;
+	clk->dev_id = dev_id;
+	clk->con_id = kstrdup_const(con_id, GFP_KERNEL);
+	clk->max_rate = ULONG_MAX;
+
+	return clk;
+}
+
+/**
+ * free_clk - Free a clk consumer
+ * @clk: clk consumer to free
+ *
+ * Note, this assumes the clk has been unlinked from the clk_core consumer
+ * list.
+ */
+static void free_clk(struct clk *clk)
+{
+	kfree_const(clk->con_id);
+	kfree(clk);
+}
+
+/**
+ * clk_hw_create_clk: Allocate and link a clk consumer to a clk_core given
+ * a clk_hw
+ * @dev: clk consumer device
+ * @hw: clk_hw associated with the clk being consumed
+ * @dev_id: string describing device name
+ * @con_id: connection ID string on device
+ *
+ * This is the main function used to create a clk pointer for use by clk
+ * consumers. It connects a consumer to the clk_core and clk_hw structures
+ * used by the framework and clk provider respectively.
+ */
+struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
+			      const char *dev_id, const char *con_id)
+{
+	struct clk *clk;
+	struct clk_core *core;
+
+	/* This is to allow this function to be chained to others */
+	if (IS_ERR_OR_NULL(hw))
+		return ERR_CAST(hw);
+
+	core = hw->core;
+	clk = alloc_clk(core, dev_id, con_id);
+	if (IS_ERR(clk))
+		return clk;
+	clk->dev = dev;
+
+	if (!try_module_get(core->owner)) {
+		free_clk(clk);
+		return ERR_PTR(-ENOENT);
+	}
+
+	kref_get(&core->ref);
+	clk_core_link_consumer(core, clk);
+
+	return clk;
+}
+
+/**
+ * clk_hw_get_clk - get clk consumer given an clk_hw
+ * @hw: clk_hw associated with the clk being consumed
+ * @con_id: connection ID string on device
+ *
+ * Returns: new clk consumer
+ * This is the function to be used by providers which need
+ * to get a consumer clk and act on the clock element
+ * Calls to this function must be balanced with calls clk_put()
+ */
+struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
+{
+	struct device *dev = hw->core->dev;
+	const char *name = dev ? dev_name(dev) : NULL;
+
+	return clk_hw_create_clk(dev, hw, name, con_id);
+}
+EXPORT_SYMBOL(clk_hw_get_clk);
+
+static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
+{
+	const char *dst;
+
+	if (!src) {
+		if (must_exist)
+			return -EINVAL;
+		return 0;
+	}
+
+	*dst_p = dst = kstrdup_const(src, GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int clk_core_populate_parent_map(struct clk_core *core,
+					const struct clk_init_data *init)
+{
+	u8 num_parents = init->num_parents;
+	const char * const *parent_names = init->parent_names;
+	const struct clk_hw **parent_hws = init->parent_hws;
+	const struct clk_parent_data *parent_data = init->parent_data;
+	int i, ret = 0;
+	struct clk_parent_map *parents, *parent;
+
+	if (!num_parents)
+		return 0;
+
+	/*
+	 * Avoid unnecessary string look-ups of clk_core's possible parents by
+	 * having a cache of names/clk_hw pointers to clk_core pointers.
+	 */
+	parents = kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
+	core->parents = parents;
+	if (!parents)
+		return -ENOMEM;
+
+	/* Copy everything over because it might be __initdata */
+	for (i = 0, parent = parents; i < num_parents; i++, parent++) {
+		parent->index = -1;
+		if (parent_names) {
+			/* throw a WARN if any entries are NULL */
+			WARN(!parent_names[i],
+				"%s: invalid NULL in %s's .parent_names\n",
+				__func__, core->name);
+			ret = clk_cpy_name(&parent->name, parent_names[i],
+					   true);
+		} else if (parent_data) {
+			parent->hw = parent_data[i].hw;
+			parent->index = parent_data[i].index;
+			ret = clk_cpy_name(&parent->fw_name,
+					   parent_data[i].fw_name, false);
+			if (!ret)
+				ret = clk_cpy_name(&parent->name,
+						   parent_data[i].name,
+						   false);
+		} else if (parent_hws) {
+			parent->hw = parent_hws[i];
+		} else {
+			ret = -EINVAL;
+			WARN(1, "Must specify parents if num_parents > 0\n");
+		}
+
+		if (ret) {
+			do {
+				kfree_const(parents[i].name);
+				kfree_const(parents[i].fw_name);
+			} while (--i >= 0);
+			kfree(parents);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void clk_core_free_parent_map(struct clk_core *core)
+{
+	int i = core->num_parents;
+
+	if (!core->num_parents)
+		return;
+
+	while (--i >= 0) {
+		kfree_const(core->parents[i].name);
+		kfree_const(core->parents[i].fw_name);
+	}
+
+	kfree(core->parents);
+}
+
+/* Free memory allocated for a struct clk_core */
+static void __clk_release(struct kref *ref)
+{
+	struct clk_core *core = container_of(ref, struct clk_core, ref);
+
+	if (core->rpm_enabled) {
+		mutex_lock(&clk_rpm_list_lock);
+		hlist_del(&core->rpm_node);
+		mutex_unlock(&clk_rpm_list_lock);
+	}
+
+	clk_core_free_parent_map(core);
+	kfree_const(core->name);
+	kfree(core);
+}
+
+static struct clk *
+__clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
+{
+	int ret;
+	struct clk_core *core;
+	const struct clk_init_data *init = hw->init;
+
+	/*
+	 * The init data is not supposed to be used outside of registration path.
+	 * Set it to NULL so that provider drivers can't use it either and so that
+	 * we catch use of hw->init early on in the core.
+	 */
+	hw->init = NULL;
+
+	core = kzalloc(sizeof(*core), GFP_KERNEL);
+	if (!core) {
+		ret = -ENOMEM;
+		goto fail_out;
+	}
+
+	kref_init(&core->ref);
+
+	core->name = kstrdup_const(init->name, GFP_KERNEL);
+	if (!core->name) {
+		ret = -ENOMEM;
+		goto fail_name;
+	}
+
+	if (WARN_ON(!init->ops)) {
+		ret = -EINVAL;
+		goto fail_ops;
+	}
+	core->ops = init->ops;
+
+	core->dev = dev;
+	clk_pm_runtime_init(core);
+	core->of_node = np;
+	if (dev && dev->driver)
+		core->owner = dev->driver->owner;
+	core->hw = hw;
+	core->flags = init->flags;
+	core->num_parents = init->num_parents;
+	core->min_rate = 0;
+	core->max_rate = ULONG_MAX;
+
+	ret = clk_core_populate_parent_map(core, init);
+	if (ret)
+		goto fail_parents;
+
+	INIT_HLIST_HEAD(&core->clks);
+
+	/*
+	 * Don't call clk_hw_create_clk() here because that would pin the
+	 * provider module to itself and prevent it from ever being removed.
+	 */
+	hw->clk = alloc_clk(core, NULL, NULL);
+	if (IS_ERR(hw->clk)) {
+		ret = PTR_ERR(hw->clk);
+		goto fail_create_clk;
+	}
+
+	clk_core_link_consumer(core, hw->clk);
+
+	ret = __clk_core_init(core);
+	if (!ret)
+		return hw->clk;
+
+	clk_prepare_lock();
+	clk_core_unlink_consumer(hw->clk);
+	clk_prepare_unlock();
+
+	free_clk(hw->clk);
+	hw->clk = NULL;
+
+fail_create_clk:
+fail_parents:
+fail_ops:
+fail_name:
+	kref_put(&core->ref, __clk_release);
+fail_out:
+	if (dev) {
+		dev_err_probe(dev, ret, "failed to register clk '%s' (%pS)\n",
+			      init->name, hw);
+	} else {
+		pr_err("%pOF: error %pe: failed to register clk '%s' (%pS)\n",
+		       np, ERR_PTR(ret), init->name, hw);
+	}
+	return ERR_PTR(ret);
+}
+
+/**
+ * dev_or_parent_of_node() - Get device node of @dev or @dev's parent
+ * @dev: Device to get device node of
+ *
+ * Return: device node pointer of @dev, or the device node pointer of
+ * @dev->parent if dev doesn't have a device node, or NULL if neither
+ * @dev or @dev->parent have a device node.
+ */
+static struct device_node *dev_or_parent_of_node(struct device *dev)
+{
+	struct device_node *np;
+
+	if (!dev)
+		return NULL;
+
+	np = dev_of_node(dev);
+	if (!np)
+		np = dev_of_node(dev->parent);
+
+	return np;
+}
+
+/**
+ * clk_register - allocate a new clock, register it and return an opaque cookie
+ * @dev: device that is registering this clock
+ * @hw: link to hardware-specific clock data
+ *
+ * clk_register is the *deprecated* interface for populating the clock tree with
+ * new clock nodes. Use clk_hw_register() instead.
+ *
+ * Returns: a pointer to the newly allocated struct clk which
+ * cannot be dereferenced by driver code but may be used in conjunction with the
+ * rest of the clock API.  In the event of an error clk_register will return an
+ * error code; drivers must test for an error code after calling clk_register.
+ */
+struct clk *clk_register(struct device *dev, struct clk_hw *hw)
+{
+	return __clk_register(dev, dev_or_parent_of_node(dev), hw);
+}
+EXPORT_SYMBOL_GPL(clk_register);
+
+/**
+ * clk_hw_register - register a clk_hw and return an error code
+ * @dev: device that is registering this clock
+ * @hw: link to hardware-specific clock data
+ *
+ * clk_hw_register is the primary interface for populating the clock tree with
+ * new clock nodes. It returns an integer equal to zero indicating success or
+ * less than zero indicating failure. Drivers must test for an error code after
+ * calling clk_hw_register().
+ */
+int clk_hw_register(struct device *dev, struct clk_hw *hw)
+{
+	return PTR_ERR_OR_ZERO(__clk_register(dev, dev_or_parent_of_node(dev),
+			       hw));
+}
+EXPORT_SYMBOL_GPL(clk_hw_register);
+
+/*
+ * of_clk_hw_register - register a clk_hw and return an error code
+ * @node: device_node of device that is registering this clock
+ * @hw: link to hardware-specific clock data
+ *
+ * of_clk_hw_register() is the primary interface for populating the clock tree
+ * with new clock nodes when a struct device is not available, but a struct
+ * device_node is. It returns an integer equal to zero indicating success or
+ * less than zero indicating failure. Drivers must test for an error code after
+ * calling of_clk_hw_register().
+ */
+int of_clk_hw_register(struct device_node *node, struct clk_hw *hw)
+{
+	return PTR_ERR_OR_ZERO(__clk_register(NULL, node, hw));
+}
+EXPORT_SYMBOL_GPL(of_clk_hw_register);
+
+/*
+ * Empty clk_ops for unregistered clocks. These are used temporarily
+ * after clk_unregister() was called on a clock and until last clock
+ * consumer calls clk_put() and the struct clk object is freed.
+ */
+static int clk_nodrv_prepare_enable(struct clk_hw *hw)
+{
+	return -ENXIO;
+}
+
+static void clk_nodrv_disable_unprepare(struct clk_hw *hw)
+{
+	WARN_ON_ONCE(1);
+}
+
+static int clk_nodrv_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	return -ENXIO;
+}
+
+static int clk_nodrv_set_parent(struct clk_hw *hw, u8 index)
+{
+	return -ENXIO;
+}
+
+static int clk_nodrv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	return -ENXIO;
+}
+
+static const struct clk_ops clk_nodrv_ops = {
+	.enable		= clk_nodrv_prepare_enable,
+	.disable	= clk_nodrv_disable_unprepare,
+	.prepare	= clk_nodrv_prepare_enable,
+	.unprepare	= clk_nodrv_disable_unprepare,
+	.determine_rate	= clk_nodrv_determine_rate,
+	.set_rate	= clk_nodrv_set_rate,
+	.set_parent	= clk_nodrv_set_parent,
+};
+
+static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
+						const struct clk_core *target)
+{
+	int i;
+	struct clk_core *child;
+
+	for (i = 0; i < root->num_parents; i++)
+		if (root->parents[i].core == target)
+			root->parents[i].core = NULL;
+
+	hlist_for_each_entry(child, &root->children, child_node)
+		clk_core_evict_parent_cache_subtree(child, target);
+}
+
+/* Remove this clk from all parent caches */
+static void clk_core_evict_parent_cache(struct clk_core *core)
+{
+	const struct hlist_head **lists;
+	struct clk_core *root;
+
+	lockdep_assert_held(&prepare_lock);
+
+	for (lists = all_lists; *lists; lists++)
+		hlist_for_each_entry(root, *lists, child_node)
+			clk_core_evict_parent_cache_subtree(root, core);
+
+}
+
+/**
+ * clk_unregister - unregister a currently registered clock
+ * @clk: clock to unregister
+ */
+void clk_unregister(struct clk *clk)
+{
+	unsigned long flags;
+	const struct clk_ops *ops;
+
+	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
+		return;
+
+	clk_debug_unregister(clk->core);
+
+	clk_prepare_lock();
+
+	ops = clk->core->ops;
+	if (ops == &clk_nodrv_ops) {
+		pr_err("%s: unregistered clock: %s\n", __func__,
+		       clk->core->name);
+		clk_prepare_unlock();
+		return;
+	}
+	/*
+	 * Assign empty clock ops for consumers that might still hold
+	 * a reference to this clock.
+	 */
+	flags = clk_enable_lock();
+	clk->core->ops = &clk_nodrv_ops;
+	clk_enable_unlock(flags);
+
+	if (ops->terminate)
+		ops->terminate(clk->core->hw);
+
+	if (!hlist_empty(&clk->core->children)) {
+		struct clk_core *child;
+		struct hlist_node *t;
+
+		/* Reparent all children to the orphan list. */
+		hlist_for_each_entry_safe(child, t, &clk->core->children,
+					  child_node)
+			clk_core_set_parent_nolock(child, NULL);
+	}
+
+	clk_core_evict_parent_cache(clk->core);
+
+	hash_del(&clk->core->hashtable_node);
+	hlist_del_init(&clk->core->child_node);
+
+	if (clk->core->prepare_count)
+		pr_warn("%s: unregistering prepared clock: %s\n",
+					__func__, clk->core->name);
+
+	if (clk->core->protect_count)
+		pr_warn("%s: unregistering protected clock: %s\n",
+					__func__, clk->core->name);
+	clk_prepare_unlock();
+
+	kref_put(&clk->core->ref, __clk_release);
+	free_clk(clk);
+}
+EXPORT_SYMBOL_GPL(clk_unregister);
+
+/**
+ * clk_hw_unregister - unregister a currently registered clk_hw
+ * @hw: hardware-specific clock data to unregister
+ */
+void clk_hw_unregister(struct clk_hw *hw)
+{
+	clk_unregister(hw->clk);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister);
+
+static void devm_clk_unregister_cb(struct device *dev, void *res)
+{
+	clk_unregister(*(struct clk **)res);
+}
+
+static void devm_clk_hw_unregister_cb(struct device *dev, void *res)
+{
+	clk_hw_unregister(*(struct clk_hw **)res);
+}
+
+/**
+ * devm_clk_register - resource managed clk_register()
+ * @dev: device that is registering this clock
+ * @hw: link to hardware-specific clock data
+ *
+ * Managed clk_register(). This function is *deprecated*, use devm_clk_hw_register() instead.
+ *
+ * Clocks returned from this function are automatically clk_unregister()ed on
+ * driver detach. See clk_register() for more information.
+ */
+struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw)
+{
+	struct clk *clk;
+	struct clk **clkp;
+
+	clkp = devres_alloc(devm_clk_unregister_cb, sizeof(*clkp), GFP_KERNEL);
+	if (!clkp)
+		return ERR_PTR(-ENOMEM);
+
+	clk = clk_register(dev, hw);
+	if (!IS_ERR(clk)) {
+		*clkp = clk;
+		devres_add(dev, clkp);
+	} else {
+		devres_free(clkp);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL_GPL(devm_clk_register);
+
+/**
+ * devm_clk_hw_register - resource managed clk_hw_register()
+ * @dev: device that is registering this clock
+ * @hw: link to hardware-specific clock data
+ *
+ * Managed clk_hw_register(). Clocks registered by this function are
+ * automatically clk_hw_unregister()ed on driver detach. See clk_hw_register()
+ * for more information.
+ */
+int devm_clk_hw_register(struct device *dev, struct clk_hw *hw)
+{
+	struct clk_hw **hwp;
+	int ret;
+
+	hwp = devres_alloc(devm_clk_hw_unregister_cb, sizeof(*hwp), GFP_KERNEL);
+	if (!hwp)
+		return -ENOMEM;
+
+	ret = clk_hw_register(dev, hw);
+	if (!ret) {
+		*hwp = hw;
+		devres_add(dev, hwp);
+	} else {
+		devres_free(hwp);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register);
+
+static void devm_clk_release(struct device *dev, void *res)
+{
+	clk_put(*(struct clk **)res);
+}
+
+/**
+ * devm_clk_hw_get_clk - resource managed clk_hw_get_clk()
+ * @dev: device that is registering this clock
+ * @hw: clk_hw associated with the clk being consumed
+ * @con_id: connection ID string on device
+ *
+ * Managed clk_hw_get_clk(). Clocks got with this function are
+ * automatically clk_put() on driver detach. See clk_put()
+ * for more information.
+ */
+struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
+				const char *con_id)
+{
+	struct clk *clk;
+	struct clk **clkp;
+
+	/* This should not happen because it would mean we have drivers
+	 * passing around clk_hw pointers instead of having the caller use
+	 * proper clk_get() style APIs
+	 */
+	WARN_ON_ONCE(dev != hw->core->dev);
+
+	clkp = devres_alloc(devm_clk_release, sizeof(*clkp), GFP_KERNEL);
+	if (!clkp)
+		return ERR_PTR(-ENOMEM);
+
+	clk = clk_hw_get_clk(hw, con_id);
+	if (!IS_ERR(clk)) {
+		*clkp = clk;
+		devres_add(dev, clkp);
+	} else {
+		devres_free(clkp);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_get_clk);
+
+/*
+ * clkdev helpers
+ */
+
+void __clk_put(struct clk *clk)
+{
+	struct module *owner;
+
+	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
+		return;
+
+	clk_prepare_lock();
+
+	/*
+	 * Before calling clk_put, all calls to clk_rate_exclusive_get() from a
+	 * given user should be balanced with calls to clk_rate_exclusive_put()
+	 * and by that same consumer
+	 */
+	if (WARN_ON(clk->exclusive_count)) {
+		/* We voiced our concern, let's sanitize the situation */
+		clk->core->protect_count -= (clk->exclusive_count - 1);
+		clk_core_rate_unprotect(clk->core);
+		clk->exclusive_count = 0;
+	}
+
+	clk_core_unlink_consumer(clk);
+
+	/* If we had any boundaries on that clock, let's drop them. */
+	if (clk->min_rate > 0 || clk->max_rate < ULONG_MAX)
+		clk_set_rate_range_nolock(clk, 0, ULONG_MAX);
+
+	clk_prepare_unlock();
+
+	owner = clk->core->owner;
+	kref_put(&clk->core->ref, __clk_release);
+	module_put(owner);
+	free_clk(clk);
+}
+
+/***        clk rate change notifiers        ***/
+
+/**
+ * clk_notifier_register - add a clk rate change notifier
+ * @clk: struct clk * to watch
+ * @nb: struct notifier_block * with callback info
+ *
+ * Request notification when clk's rate changes.  This uses an SRCU
+ * notifier because we want it to block and notifier unregistrations are
+ * uncommon.  The callbacks associated with the notifier must not
+ * re-enter into the clk framework by calling any top-level clk APIs;
+ * this will cause a nested prepare_lock mutex.
+ *
+ * In all notification cases (pre, post and abort rate change) the original
+ * clock rate is passed to the callback via struct clk_notifier_data.old_rate
+ * and the new frequency is passed via struct clk_notifier_data.new_rate.
+ *
+ * clk_notifier_register() must be called from non-atomic context.
+ * Returns -EINVAL if called with null arguments, -ENOMEM upon
+ * allocation failure; otherwise, passes along the return value of
+ * srcu_notifier_chain_register().
+ */
+int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
+{
+	struct clk_notifier *cn;
+	int ret = -ENOMEM;
+
+	if (!clk || !nb)
+		return -EINVAL;
+
+	clk_prepare_lock();
+
+	/* search the list of notifiers for this clk */
+	list_for_each_entry(cn, &clk_notifier_list, node)
+		if (cn->clk == clk)
+			goto found;
+
+	/* if clk wasn't in the notifier list, allocate new clk_notifier */
+	cn = kzalloc(sizeof(*cn), GFP_KERNEL);
+	if (!cn)
+		goto out;
+
+	cn->clk = clk;
+	srcu_init_notifier_head(&cn->notifier_head);
+
+	list_add(&cn->node, &clk_notifier_list);
+
+found:
+	ret = srcu_notifier_chain_register(&cn->notifier_head, nb);
+
+	clk->core->notifier_count++;
+
+out:
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_notifier_register);
+
+/**
+ * clk_notifier_unregister - remove a clk rate change notifier
+ * @clk: struct clk *
+ * @nb: struct notifier_block * with callback info
+ *
+ * Request no further notification for changes to 'clk' and frees memory
+ * allocated in clk_notifier_register.
+ *
+ * Returns -EINVAL if called with null arguments; otherwise, passes
+ * along the return value of srcu_notifier_chain_unregister().
+ */
+int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
+{
+	struct clk_notifier *cn;
+	int ret = -ENOENT;
+
+	if (!clk || !nb)
+		return -EINVAL;
+
+	clk_prepare_lock();
+
+	list_for_each_entry(cn, &clk_notifier_list, node) {
+		if (cn->clk == clk) {
+			ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
+
+			clk->core->notifier_count--;
+
+			/* XXX the notifier code should handle this better */
+			if (!cn->notifier_head.head) {
+				srcu_cleanup_notifier_head(&cn->notifier_head);
+				list_del(&cn->node);
+				kfree(cn);
+			}
+			break;
+		}
+	}
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_notifier_unregister);
+
+struct clk_notifier_devres {
+	struct clk *clk;
+	struct notifier_block *nb;
+};
+
+static void devm_clk_notifier_release(struct device *dev, void *res)
+{
+	struct clk_notifier_devres *devres = res;
+
+	clk_notifier_unregister(devres->clk, devres->nb);
+}
+
+int devm_clk_notifier_register(struct device *dev, struct clk *clk,
+			       struct notifier_block *nb)
+{
+	struct clk_notifier_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_clk_notifier_release,
+			      sizeof(*devres), GFP_KERNEL);
+
+	if (!devres)
+		return -ENOMEM;
+
+	ret = clk_notifier_register(clk, nb);
+	if (!ret) {
+		devres->clk = clk;
+		devres->nb = nb;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_clk_notifier_register);
+
+static void clk_core_reparent_orphans(void)
+{
+	clk_prepare_lock();
+	clk_core_reparent_orphans_nolock();
+	clk_prepare_unlock();
+}
+
+/**
+ * struct of_clk_provider - Clock provider registration structure
+ * @link: Entry in global list of clock providers
+ * @node: Pointer to device tree node of clock provider
+ * @get: Get clock callback.  Returns NULL or a struct clk for the
+ *       given clock specifier
+ * @get_hw: Get clk_hw callback.  Returns NULL, ERR_PTR or a
+ *       struct clk_hw for the given clock specifier
+ * @data: context pointer to be passed into @get callback
+ */
+struct of_clk_provider {
+	struct list_head link;
+
+	struct device_node *node;
+	struct clk *(*get)(struct of_phandle_args *clkspec, void *data);
+	struct clk_hw *(*get_hw)(struct of_phandle_args *clkspec, void *data);
+	void *data;
+};
+
+extern struct of_device_id __clk_of_table;
+static const struct of_device_id __clk_of_table_sentinel
+	__used __section("__clk_of_table_end");
+
+static LIST_HEAD(of_clk_providers);
+static DEFINE_MUTEX(of_clk_mutex);
+
+struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
+				     void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(of_clk_src_simple_get);
+
+struct clk_hw *of_clk_hw_simple_get(struct of_phandle_args *clkspec, void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(of_clk_hw_simple_get);
+
+struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct clk_onecell_data *clk_data = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= clk_data->clk_num) {
+		pr_err("%s: invalid clock index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return clk_data->clks[idx];
+}
+EXPORT_SYMBOL_GPL(of_clk_src_onecell_get);
+
+struct clk_hw *
+of_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct clk_hw_onecell_data *hw_data = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= hw_data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return hw_data->hws[idx];
+}
+EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
+
+/**
+ * of_clk_add_provider() - Register a clock provider for a node
+ * @np: Device node pointer associated with clock provider
+ * @clk_src_get: callback for decoding clock
+ * @data: context pointer for @clk_src_get callback.
+ *
+ * This function is *deprecated*. Use of_clk_add_hw_provider() instead.
+ */
+int of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(struct of_phandle_args *clkspec,
+						   void *data),
+			void *data)
+{
+	struct of_clk_provider *cp;
+	int ret;
+
+	if (!np)
+		return 0;
+
+	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
+	if (!cp)
+		return -ENOMEM;
+
+	cp->node = of_node_get(np);
+	cp->data = data;
+	cp->get = clk_src_get;
+
+	mutex_lock(&of_clk_mutex);
+	list_add(&cp->link, &of_clk_providers);
+	mutex_unlock(&of_clk_mutex);
+	pr_debug("Added clock from %pOF\n", np);
+
+	clk_core_reparent_orphans();
+
+	ret = of_clk_set_defaults(np, true);
+	if (ret < 0)
+		of_clk_del_provider(np);
+
+	fwnode_dev_initialized(&np->fwnode, true);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_clk_add_provider);
+
+/**
+ * of_clk_add_hw_provider() - Register a clock provider for a node
+ * @np: Device node pointer associated with clock provider
+ * @get: callback for decoding clk_hw
+ * @data: context pointer for @get callback.
+ */
+int of_clk_add_hw_provider(struct device_node *np,
+			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+						 void *data),
+			   void *data)
+{
+	struct of_clk_provider *cp;
+	int ret;
+
+	if (!np)
+		return 0;
+
+	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
+	if (!cp)
+		return -ENOMEM;
+
+	cp->node = of_node_get(np);
+	cp->data = data;
+	cp->get_hw = get;
+
+	mutex_lock(&of_clk_mutex);
+	list_add(&cp->link, &of_clk_providers);
+	mutex_unlock(&of_clk_mutex);
+	pr_debug("Added clk_hw provider from %pOF\n", np);
+
+	clk_core_reparent_orphans();
+
+	ret = of_clk_set_defaults(np, true);
+	if (ret < 0)
+		of_clk_del_provider(np);
+
+	fwnode_dev_initialized(&np->fwnode, true);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);
+
+static void devm_of_clk_release_provider(struct device *dev, void *res)
+{
+	of_clk_del_provider(*(struct device_node **)res);
+}
+
+/*
+ * We allow a child device to use its parent device as the clock provider node
+ * for cases like MFD sub-devices where the child device driver wants to use
+ * devm_*() APIs but not list the device in DT as a sub-node.
+ */
+static struct device_node *get_clk_provider_node(struct device *dev)
+{
+	struct device_node *np, *parent_np;
+
+	np = dev->of_node;
+	parent_np = dev->parent ? dev->parent->of_node : NULL;
+
+	if (!of_property_present(np, "#clock-cells"))
+		if (of_property_present(parent_np, "#clock-cells"))
+			np = parent_np;
+
+	return np;
+}
+
+/**
+ * devm_of_clk_add_hw_provider() - Managed clk provider node registration
+ * @dev: Device acting as the clock provider (used for DT node and lifetime)
+ * @get: callback for decoding clk_hw
+ * @data: context pointer for @get callback
+ *
+ * Registers clock provider for given device's node. If the device has no DT
+ * node or if the device node lacks of clock provider information (#clock-cells)
+ * then the parent device's node is scanned for this information. If parent node
+ * has the #clock-cells then it is used in registration. Provider is
+ * automatically released at device exit.
+ *
+ * Return: 0 on success or an errno on failure.
+ */
+int devm_of_clk_add_hw_provider(struct device *dev,
+			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+					      void *data),
+			void *data)
+{
+	struct device_node **ptr, *np;
+	int ret;
+
+	ptr = devres_alloc(devm_of_clk_release_provider, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	np = get_clk_provider_node(dev);
+	ret = of_clk_add_hw_provider(np, get, data);
+	if (!ret) {
+		*ptr = np;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider);
+
+/**
+ * of_clk_del_provider() - Remove a previously registered clock provider
+ * @np: Device node pointer associated with clock provider
+ */
+void of_clk_del_provider(struct device_node *np)
+{
+	struct of_clk_provider *cp;
+
+	if (!np)
+		return;
+
+	mutex_lock(&of_clk_mutex);
+	list_for_each_entry(cp, &of_clk_providers, link) {
+		if (cp->node == np) {
+			list_del(&cp->link);
+			fwnode_dev_initialized(&np->fwnode, false);
+			of_node_put(cp->node);
+			kfree(cp);
+			break;
+		}
+	}
+	mutex_unlock(&of_clk_mutex);
+}
+EXPORT_SYMBOL_GPL(of_clk_del_provider);
+
+/**
+ * of_parse_clkspec() - Parse a DT clock specifier for a given device node
+ * @np: device node to parse clock specifier from
+ * @index: index of phandle to parse clock out of. If index < 0, @name is used
+ * @name: clock name to find and parse. If name is NULL, the index is used
+ * @out_args: Result of parsing the clock specifier
+ *
+ * Parses a device node's "clocks" and "clock-names" properties to find the
+ * phandle and cells for the index or name that is desired. The resulting clock
+ * specifier is placed into @out_args, or an errno is returned when there's a
+ * parsing error. The @index argument is ignored if @name is non-NULL.
+ *
+ * Example:
+ *
+ * phandle1: clock-controller@1 {
+ *	#clock-cells = <2>;
+ * }
+ *
+ * phandle2: clock-controller@2 {
+ *	#clock-cells = <1>;
+ * }
+ *
+ * clock-consumer@3 {
+ *	clocks = <&phandle1 1 2 &phandle2 3>;
+ *	clock-names = "name1", "name2";
+ * }
+ *
+ * To get a device_node for `clock-controller@2' node you may call this
+ * function a few different ways:
+ *
+ *   of_parse_clkspec(clock-consumer@3, -1, "name2", &args);
+ *   of_parse_clkspec(clock-consumer@3, 1, NULL, &args);
+ *   of_parse_clkspec(clock-consumer@3, 1, "name2", &args);
+ *
+ * Return: 0 upon successfully parsing the clock specifier. Otherwise, -ENOENT
+ * if @name is NULL or -EINVAL if @name is non-NULL and it can't be found in
+ * the "clock-names" property of @np.
+ */
+static int of_parse_clkspec(const struct device_node *np, int index,
+			    const char *name, struct of_phandle_args *out_args)
+{
+	int ret = -ENOENT;
+
+	/* Walk up the tree of devices looking for a clock property that matches */
+	while (np) {
+		/*
+		 * For named clocks, first look up the name in the
+		 * "clock-names" property.  If it cannot be found, then index
+		 * will be an error code and of_parse_phandle_with_args() will
+		 * return -EINVAL.
+		 */
+		if (name)
+			index = of_property_match_string(np, "clock-names", name);
+		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
+						 index, out_args);
+		if (!ret)
+			break;
+		if (name && index >= 0)
+			break;
+
+		/*
+		 * No matching clock found on this node.  If the parent node
+		 * has a "clock-ranges" property, then we can try one of its
+		 * clocks.
+		 */
+		np = np->parent;
+		if (np && !of_property_present(np, "clock-ranges"))
+			break;
+		index = 0;
+	}
+
+	return ret;
+}
+
+static struct clk_hw *
+__of_clk_get_hw_from_provider(struct of_clk_provider *provider,
+			      struct of_phandle_args *clkspec)
+{
+	struct clk *clk;
+
+	if (provider->get_hw)
+		return provider->get_hw(clkspec, provider->data);
+
+	clk = provider->get(clkspec, provider->data);
+	if (IS_ERR(clk))
+		return ERR_CAST(clk);
+	return __clk_get_hw(clk);
+}
+
+static struct clk_hw *
+of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
+{
+	struct of_clk_provider *provider;
+	struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
+
+	if (!clkspec)
+		return ERR_PTR(-EINVAL);
+
+	/* Check if node in clkspec is in disabled/fail state */
+	if (!of_device_is_available(clkspec->np))
+		return ERR_PTR(-ENOENT);
+
+	mutex_lock(&of_clk_mutex);
+	list_for_each_entry(provider, &of_clk_providers, link) {
+		if (provider->node == clkspec->np) {
+			hw = __of_clk_get_hw_from_provider(provider, clkspec);
+			if (!IS_ERR(hw))
+				break;
+		}
+	}
+	mutex_unlock(&of_clk_mutex);
+
+	return hw;
+}
+
+/**
+ * of_clk_get_from_provider() - Lookup a clock from a clock provider
+ * @clkspec: pointer to a clock specifier data structure
+ *
+ * This function looks up a struct clk from the registered list of clock
+ * providers, an input is a clock specifier data structure as returned
+ * from the of_parse_phandle_with_args() function call.
+ */
+struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
+{
+	struct clk_hw *hw = of_clk_get_hw_from_clkspec(clkspec);
+
+	return clk_hw_create_clk(NULL, hw, NULL, __func__);
+}
+EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
+
+struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
+			     const char *con_id)
+{
+	int ret;
+	struct clk_hw *hw;
+	struct of_phandle_args clkspec;
+
+	ret = of_parse_clkspec(np, index, con_id, &clkspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	hw = of_clk_get_hw_from_clkspec(&clkspec);
+	of_node_put(clkspec.np);
+
+	return hw;
+}
+
+static struct clk *__of_clk_get(struct device_node *np,
+				int index, const char *dev_id,
+				const char *con_id)
+{
+	struct clk_hw *hw = of_clk_get_hw(np, index, con_id);
+
+	return clk_hw_create_clk(NULL, hw, dev_id, con_id);
+}
+
+struct clk *of_clk_get(struct device_node *np, int index)
+{
+	return __of_clk_get(np, index, np->full_name, NULL);
+}
+EXPORT_SYMBOL(of_clk_get);
+
+/**
+ * of_clk_get_by_name() - Parse and lookup a clock referenced by a device node
+ * @np: pointer to clock consumer node
+ * @name: name of consumer's clock input, or NULL for the first clock reference
+ *
+ * This function parses the clocks and clock-names properties,
+ * and uses them to look up the struct clk from the registered list of clock
+ * providers.
+ */
+struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
+{
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	return __of_clk_get(np, 0, np->full_name, name);
+}
+EXPORT_SYMBOL(of_clk_get_by_name);
+
+/**
+ * of_clk_get_parent_count() - Count the number of clocks a device node has
+ * @np: device node to count
+ *
+ * Returns: The number of clocks that are possible parents of this node
+ */
+unsigned int of_clk_get_parent_count(const struct device_node *np)
+{
+	int count;
+
+	count = of_count_phandle_with_args(np, "clocks", "#clock-cells");
+	if (count < 0)
+		return 0;
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_clk_get_parent_count);
+
+const char *of_clk_get_parent_name(const struct device_node *np, int index)
+{
+	struct of_phandle_args clkspec;
+	const char *clk_name;
+	bool found = false;
+	u32 pv;
+	int rc;
+	int count;
+	struct clk *clk;
+
+	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
+					&clkspec);
+	if (rc)
+		return NULL;
+
+	index = clkspec.args_count ? clkspec.args[0] : 0;
+	count = 0;
+
+	/* if there is an indices property, use it to transfer the index
+	 * specified into an array offset for the clock-output-names property.
+	 */
+	of_property_for_each_u32(clkspec.np, "clock-indices", pv) {
+		if (index == pv) {
+			index = count;
+			found = true;
+			break;
+		}
+		count++;
+	}
+	/* We went off the end of 'clock-indices' without finding it */
+	if (of_property_present(clkspec.np, "clock-indices") && !found) {
+		of_node_put(clkspec.np);
+		return NULL;
+	}
+
+	if (of_property_read_string_index(clkspec.np, "clock-output-names",
+					  index,
+					  &clk_name) < 0) {
+		/*
+		 * Best effort to get the name if the clock has been
+		 * registered with the framework. If the clock isn't
+		 * registered, we return the node name as the name of
+		 * the clock as long as #clock-cells = 0.
+		 */
+		clk = of_clk_get_from_provider(&clkspec);
+		if (IS_ERR(clk)) {
+			if (clkspec.args_count == 0)
+				clk_name = clkspec.np->name;
+			else
+				clk_name = NULL;
+		} else {
+			clk_name = __clk_get_name(clk);
+			clk_put(clk);
+		}
+	}
+
+
+	of_node_put(clkspec.np);
+	return clk_name;
+}
+EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
+
+/**
+ * of_clk_parent_fill() - Fill @parents with names of @np's parents and return
+ * number of parents
+ * @np: Device node pointer associated with clock provider
+ * @parents: pointer to char array that hold the parents' names
+ * @size: size of the @parents array
+ *
+ * Return: number of parents for the clock node.
+ */
+int of_clk_parent_fill(struct device_node *np, const char **parents,
+		       unsigned int size)
+{
+	unsigned int i = 0;
+
+	while (i < size && (parents[i] = of_clk_get_parent_name(np, i)) != NULL)
+		i++;
+
+	return i;
+}
+EXPORT_SYMBOL_GPL(of_clk_parent_fill);
+
+struct clock_provider {
+	void (*clk_init_cb)(struct device_node *);
+	struct device_node *np;
+	struct list_head node;
+};
+
+/*
+ * This function looks for a parent clock. If there is one, then it
+ * checks that the provider for this parent clock was initialized, in
+ * this case the parent clock will be ready.
+ */
+static int parent_ready(struct device_node *np)
+{
+	int i = 0;
+
+	while (true) {
+		struct clk *clk = of_clk_get(np, i);
+
+		/* this parent is ready we can check the next one */
+		if (!IS_ERR(clk)) {
+			clk_put(clk);
+			i++;
+			continue;
+		}
+
+		/* at least one parent is not ready, we exit now */
+		if (PTR_ERR(clk) == -EPROBE_DEFER)
+			return 0;
+
+		/*
+		 * Here we make assumption that the device tree is
+		 * written correctly. So an error means that there is
+		 * no more parent. As we didn't exit yet, then the
+		 * previous parent are ready. If there is no clock
+		 * parent, no need to wait for them, then we can
+		 * consider their absence as being ready
+		 */
+		return 1;
+	}
+}
+
+/**
+ * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
+ * @np: Device node pointer associated with clock provider
+ * @index: clock index
+ * @flags: pointer to top-level framework flags
+ *
+ * Detects if the clock-critical property exists and, if so, sets the
+ * corresponding CLK_IS_CRITICAL flag.
+ *
+ * Do not use this function. It exists only for legacy Device Tree
+ * bindings, such as the one-clock-per-node style that are outdated.
+ * Those bindings typically put all clock data into .dts and the Linux
+ * driver has no clock data, thus making it impossible to set this flag
+ * correctly from the driver. Only those drivers may call
+ * of_clk_detect_critical from their setup functions.
+ *
+ * Return: error code or zero on success
+ */
+int of_clk_detect_critical(struct device_node *np, int index,
+			   unsigned long *flags)
+{
+	uint32_t idx;
+
+	if (!np || !flags)
+		return -EINVAL;
+
+	of_property_for_each_u32(np, "clock-critical", idx)
+		if (index == idx)
+			*flags |= CLK_IS_CRITICAL;
+
+	return 0;
+}
+
+/**
+ * of_clk_init() - Scan and init clock providers from the DT
+ * @matches: array of compatible values and init functions for providers.
+ *
+ * This function scans the device tree for matching clock providers
+ * and calls their initialization functions. It also does it by trying
+ * to follow the dependencies.
+ */
+void __init of_clk_init(const struct of_device_id *matches)
+{
+	const struct of_device_id *match;
+	struct device_node *np;
+	struct clock_provider *clk_provider, *next;
+	bool is_init_done;
+	bool force = false;
+	LIST_HEAD(clk_provider_list);
+
+	if (!matches)
+		matches = &__clk_of_table;
+
+	/* First prepare the list of the clocks providers */
+	for_each_matching_node_and_match(np, matches, &match) {
+		struct clock_provider *parent;
+
+		if (!of_device_is_available(np))
+			continue;
+
+		parent = kzalloc(sizeof(*parent), GFP_KERNEL);
+		if (!parent) {
+			list_for_each_entry_safe(clk_provider, next,
+						 &clk_provider_list, node) {
+				list_del(&clk_provider->node);
+				of_node_put(clk_provider->np);
+				kfree(clk_provider);
+			}
+			of_node_put(np);
+			return;
+		}
+
+		parent->clk_init_cb = match->data;
+		parent->np = of_node_get(np);
+		list_add_tail(&parent->node, &clk_provider_list);
+	}
+
+	while (!list_empty(&clk_provider_list)) {
+		is_init_done = false;
+		list_for_each_entry_safe(clk_provider, next,
+					&clk_provider_list, node) {
+			if (force || parent_ready(clk_provider->np)) {
+
+				/* Don't populate platform devices */
+				of_node_set_flag(clk_provider->np,
+						 OF_POPULATED);
+
+				clk_provider->clk_init_cb(clk_provider->np);
+				of_clk_set_defaults(clk_provider->np, true);
+
+				list_del(&clk_provider->node);
+				of_node_put(clk_provider->np);
+				kfree(clk_provider);
+				is_init_done = true;
+			}
+		}
+
+		/*
+		 * We didn't manage to initialize any of the
+		 * remaining providers during the last loop, so now we
+		 * initialize all the remaining ones unconditionally
+		 * in case the clock parent was not mandatory
+		 */
+		if (!is_init_done)
+			force = true;
+	}
+}
+
diff --git a/drivers/clk/ccf/clk.h b/drivers/clk/ccf/clk.h
new file mode 100644
index 000000000000..2d801900cad5
--- /dev/null
+++ b/drivers/clk/ccf/clk.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2013 Samsung Electronics Co., Ltd.
+ * Sylwester Nawrocki <s.nawrocki@samsung.com>
+ */
+
+struct clk_hw;
+struct device;
+struct of_phandle_args;
+
+#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
+struct clk_hw *of_clk_get_hw(struct device_node *np,
+				    int index, const char *con_id);
+#else /* !CONFIG_COMMON_CLK || !CONFIG_OF */
+static inline struct clk_hw *of_clk_get_hw(struct device_node *np,
+				    int index, const char *con_id)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
+
+struct clk_hw *clk_find_hw(const char *dev_id, const char *con_id);
+
+#ifdef CONFIG_COMMON_CLK
+struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
+			      const char *dev_id, const char *con_id);
+void __clk_put(struct clk *clk);
+#else
+/* All these casts to avoid ifdefs in clkdev... */
+static inline struct clk *
+clk_hw_create_clk(struct device *dev, struct clk_hw *hw, const char *dev_id,
+		  const char *con_id)
+{
+	return (struct clk *)hw;
+}
+static inline void __clk_put(struct clk *clk) { }
+
+#endif
diff --git a/include/linux/clk-provider-ccf_full.h b/include/linux/clk-provider-ccf_full.h
new file mode 100644
index 000000000000..dfc2049feee5
--- /dev/null
+++ b/include/linux/clk-provider-ccf_full.h
@@ -0,0 +1,1502 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (c) 2010-2011 Jeremy Kerr <jeremy.kerr@canonical.com>
+ *  Copyright (C) 2011-2012 Linaro Ltd <mturquette@linaro.org>
+ */
+#ifndef __LINUX_CLK_PROVIDER_CCF_FULL_H
+#define __LINUX_CLK_PROVIDER_CCF_FULL_H
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <clk-uclass.h>
+
+/*
+ * flags used across common struct clk.  these flags should only affect the
+ * top-level framework.  custom flags for dealing with hardware specifics
+ * belong in struct clk_foo
+ *
+ * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
+ */
+#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
+#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
+#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
+#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
+				/* unused */
+				/* unused */
+#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
+#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
+#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
+#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
+#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
+#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
+/* parents need enable during gate/ungate, set rate and re-parent */
+#define CLK_OPS_PARENT_ENABLE	BIT(12)
+/* duty cycle call may be forwarded to the parent clock */
+#define CLK_DUTY_CYCLE_PARENT	BIT(13)
+
+struct clk;
+struct clk_hw;
+struct clk_core;
+struct dentry;
+
+/**
+ * struct clk_rate_request - Structure encoding the clk constraints that
+ * a clock user might require.
+ *
+ * Should be initialized by calling clk_hw_init_rate_request().
+ *
+ * @core: 		Pointer to the struct clk_core affected by this request
+ * @rate:		Requested clock rate. This field will be adjusted by
+ *			clock drivers according to hardware capabilities.
+ * @min_rate:		Minimum rate imposed by clk users.
+ * @max_rate:		Maximum rate imposed by clk users.
+ * @best_parent_rate:	The best parent rate a parent can provide to fulfill the
+ *			requested constraints.
+ * @best_parent_hw:	The most appropriate parent clock that fulfills the
+ *			requested constraints.
+ *
+ */
+struct clk_rate_request {
+	struct clk_core *core;
+	unsigned long rate;
+	unsigned long min_rate;
+	unsigned long max_rate;
+	unsigned long best_parent_rate;
+	struct clk_hw *best_parent_hw;
+};
+
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate);
+void clk_hw_forward_rate_request(const struct clk_hw *core,
+				 const struct clk_rate_request *old_req,
+				 const struct clk_hw *parent,
+				 struct clk_rate_request *req,
+				 unsigned long parent_rate);
+
+/**
+ * struct clk_duty - Structure encoding the duty cycle ratio of a clock
+ *
+ * @num:	Numerator of the duty cycle ratio
+ * @den:	Denominator of the duty cycle ratio
+ */
+struct clk_duty {
+	unsigned int num;
+	unsigned int den;
+};
+
+/**
+ * struct clk_ops -  Callback operations for hardware clocks; these are to
+ * be provided by the clock implementation, and will be called by drivers
+ * through the clk_* api.
+ *
+ * @prepare:	Prepare the clock for enabling. This must not return until
+ *		the clock is fully prepared, and it's safe to call clk_enable.
+ *		This callback is intended to allow clock implementations to
+ *		do any initialisation that may sleep. Called with
+ *		prepare_lock held.
+ *
+ * @unprepare:	Release the clock from its prepared state. This will typically
+ *		undo any work done in the @prepare callback. Called with
+ *		prepare_lock held.
+ *
+ * @is_prepared: Queries the hardware to determine if the clock is prepared.
+ *		This function is allowed to sleep. Optional, if this op is not
+ *		set then the prepare count will be used.
+ *
+ * @unprepare_unused: Unprepare the clock atomically.  Only called from
+ *		clk_disable_unused for prepare clocks with special needs.
+ *		Called with prepare mutex held. This function may sleep.
+ *
+ * @enable:	Enable the clock atomically. This must not return until the
+ *		clock is generating a valid clock signal, usable by consumer
+ *		devices. Called with enable_lock held. This function must not
+ *		sleep.
+ *
+ * @disable:	Disable the clock atomically. Called with enable_lock held.
+ *		This function must not sleep.
+ *
+ * @is_enabled:	Queries the hardware to determine if the clock is enabled.
+ *		This function must not sleep. Optional, if this op is not
+ *		set then the enable count will be used.
+ *
+ * @disable_unused: Disable the clock atomically.  Only called from
+ *		clk_disable_unused for gate clocks with special needs.
+ *		Called with enable_lock held.  This function must not
+ *		sleep.
+ *
+ * @save_context: Save the context of the clock in prepration for poweroff.
+ *
+ * @restore_context: Restore the context of the clock after a restoration
+ *		of power.
+ *
+ * @recalc_rate: Recalculate the rate of this clock, by querying hardware. The
+ *		parent rate is an input parameter.  It is up to the caller to
+ *		ensure that the prepare_mutex is held across this call. If the
+ *		driver cannot figure out a rate for this clock, it must return
+ *		0. Returns the calculated rate. Optional, but recommended - if
+ *		this op is not set then clock rate will be initialized to 0.
+ *
+ * @round_rate:	Given a target rate as input, returns the closest rate actually
+ *		supported by the clock. The parent rate is an input/output
+ *		parameter.
+ *
+ * @determine_rate: Given a target rate as input, returns the closest rate
+ *		actually supported by the clock, and optionally the parent clock
+ *		that should be used to provide the clock rate.
+ *
+ * @set_parent:	Change the input source of this clock; for clocks with multiple
+ *		possible parents specify a new parent by passing in the index
+ *		as a u8 corresponding to the parent in either the .parent_names
+ *		or .parents arrays.  This function in affect translates an
+ *		array index into the value programmed into the hardware.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
+ * @get_parent:	Queries the hardware to determine the parent of a clock.  The
+ *		return value is a u8 which specifies the index corresponding to
+ *		the parent clock.  This index can be applied to either the
+ *		.parent_names or .parents arrays.  In short, this function
+ *		translates the parent value read from hardware into an array
+ *		index.  Currently only called when the clock is initialized by
+ *		__clk_init.  This callback is mandatory for clocks with
+ *		multiple parents.  It is optional (and unnecessary) for clocks
+ *		with 0 or 1 parents.
+ *
+ * @set_rate:	Change the rate of this clock. The requested rate is specified
+ *		by the second argument, which should typically be the return
+ *		of .round_rate call.  The third argument gives the parent rate
+ *		which is likely helpful for most .set_rate implementation.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
+ * @set_rate_and_parent: Change the rate and the parent of this clock. The
+ *		requested rate is specified by the second argument, which
+ *		should typically be the return of .round_rate call.  The
+ *		third argument gives the parent rate which is likely helpful
+ *		for most .set_rate_and_parent implementation. The fourth
+ *		argument gives the parent index. This callback is optional (and
+ *		unnecessary) for clocks with 0 or 1 parents as well as
+ *		for clocks that can tolerate switching the rate and the parent
+ *		separately via calls to .set_parent and .set_rate.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
+ * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
+ *		is expressed in ppb (parts per billion). The parent accuracy is
+ *		an input parameter.
+ *		Returns the calculated accuracy.  Optional - if	this op is not
+ *		set then clock accuracy will be initialized to parent accuracy
+ *		or 0 (perfect clock) if clock has no parent.
+ *
+ * @get_phase:	Queries the hardware to get the current phase of a clock.
+ *		Returned values are 0-359 degrees on success, negative
+ *		error codes on failure.
+ *
+ * @set_phase:	Shift the phase this clock signal in degrees specified
+ *		by the second argument. Valid values for degrees are
+ *		0-359. Return 0 on success, otherwise -EERROR.
+ *
+ * @get_duty_cycle: Queries the hardware to get the current duty cycle ratio
+ *              of a clock. Returned values denominator cannot be 0 and must be
+ *              superior or equal to the numerator.
+ *
+ * @set_duty_cycle: Apply the duty cycle ratio to this clock signal specified by
+ *              the numerator (2nd argurment) and denominator (3rd  argument).
+ *              Argument must be a valid ratio (denominator > 0
+ *              and >= numerator) Return 0 on success, otherwise -EERROR.
+ *
+ * @init:	Perform platform-specific initialization magic.
+ *		This is not used by any of the basic clock types.
+ *		This callback exist for HW which needs to perform some
+ *		initialisation magic for CCF to get an accurate view of the
+ *		clock. It may also be used dynamic resource allocation is
+ *		required. It shall not used to deal with clock parameters,
+ *		such as rate or parents.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
+ * @terminate:  Free any resource allocated by init.
+ *
+ * @debug_init:	Set up type-specific debugfs entries for this clock.  This
+ *		is called once, after the debugfs directory entry for this
+ *		clock has been created.  The dentry pointer representing that
+ *		directory is provided as an argument.  Called with
+ *		prepare_lock held.  Returns 0 on success, -EERROR otherwise.
+ *
+ *
+ * The clk_enable/clk_disable and clk_prepare/clk_unprepare pairs allow
+ * implementations to split any work between atomic (enable) and sleepable
+ * (prepare) contexts.  If enabling a clock requires code that might sleep,
+ * this must be done in clk_prepare.  Clock enable code that will never be
+ * called in a sleepable context may be implemented in clk_enable.
+ *
+ * Typically, drivers will call clk_prepare when a clock may be needed later
+ * (eg. when a device is opened), and clk_enable when the clock is actually
+ * required (eg. from an interrupt). Note that clk_prepare MUST have been
+ * called before clk_enable.
+ */
+struct clk_ops {
+	int		(*prepare)(struct clk_hw *hw);
+	void		(*unprepare)(struct clk_hw *hw);
+	int		(*is_prepared)(struct clk_hw *hw);
+	void		(*unprepare_unused)(struct clk_hw *hw);
+	int		(*enable)(struct clk_hw *hw);
+	void		(*disable)(struct clk_hw *hw);
+	int		(*is_enabled)(struct clk_hw *hw);
+	void		(*disable_unused)(struct clk_hw *hw);
+	int		(*save_context)(struct clk_hw *hw);
+	void		(*restore_context)(struct clk_hw *hw);
+	unsigned long	(*recalc_rate)(struct clk_hw *hw,
+					unsigned long parent_rate);
+	long		(*round_rate)(struct clk_hw *hw, unsigned long rate,
+					unsigned long *parent_rate);
+	int		(*determine_rate)(struct clk_hw *hw,
+					  struct clk_rate_request *req);
+	int		(*set_parent)(struct clk_hw *hw, u8 index);
+	u8		(*get_parent)(struct clk_hw *hw);
+	int		(*set_rate)(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate);
+	int		(*set_rate_and_parent)(struct clk_hw *hw,
+				    unsigned long rate,
+				    unsigned long parent_rate, u8 index);
+	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
+					   unsigned long parent_accuracy);
+	int		(*get_phase)(struct clk_hw *hw);
+	int		(*set_phase)(struct clk_hw *hw, int degrees);
+	int		(*get_duty_cycle)(struct clk_hw *hw,
+					  struct clk_duty *duty);
+	int		(*set_duty_cycle)(struct clk_hw *hw,
+					  struct clk_duty *duty);
+	int		(*init)(struct clk_hw *hw);
+	void		(*terminate)(struct clk_hw *hw);
+	void		(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
+};
+
+/**
+ * struct clk_parent_data - clk parent information
+ * @hw: parent clk_hw pointer (used for clk providers with internal clks)
+ * @fw_name: parent name local to provider registering clk
+ * @name: globally unique parent name (used as a fallback)
+ * @index: parent index local to provider registering clk (if @fw_name absent)
+ */
+struct clk_parent_data {
+	const struct clk_hw	*hw;
+	const char		*fw_name;
+	const char		*name;
+	int			index;
+};
+
+/**
+ * struct clk_init_data - holds init data that's common to all clocks and is
+ * shared between the clock provider and the common clock framework.
+ *
+ * @name: clock name
+ * @ops: operations this clock supports
+ * @parent_names: array of string names for all possible parents
+ * @parent_data: array of parent data for all possible parents (when some
+ *               parents are external to the clk controller)
+ * @parent_hws: array of pointers to all possible parents (when all parents
+ *              are internal to the clk controller)
+ * @num_parents: number of possible parents
+ * @flags: framework-level hints and quirks
+ */
+struct clk_init_data {
+	const char		*name;
+	const struct clk_ops	*ops;
+	/* Only one of the following three should be assigned */
+	const char		* const *parent_names;
+	const struct clk_parent_data	*parent_data;
+	const struct clk_hw		**parent_hws;
+	u8			num_parents;
+	unsigned long		flags;
+};
+
+/**
+ * struct clk_hw - handle for traversing from a struct clk to its corresponding
+ * hardware-specific structure.  struct clk_hw should be declared within struct
+ * clk_foo and then referenced by the struct clk instance that uses struct
+ * clk_foo's clk_ops
+ *
+ * @core: pointer to the struct clk_core instance that points back to this
+ * struct clk_hw instance
+ *
+ * @clk: pointer to the per-user struct clk instance that can be used to call
+ * into the clk API
+ *
+ * @init: pointer to struct clk_init_data that contains the init data shared
+ * with the common clock framework. This pointer will be set to NULL once
+ * a clk_register() variant is called on this clk_hw pointer.
+ */
+struct clk_hw {
+	struct clk_core *core;
+	struct clk *clk;
+	const struct clk_init_data *init;
+};
+
+/*
+ * DOC: Basic clock implementations common to many platforms
+ *
+ * Each basic clock hardware type is comprised of a structure describing the
+ * clock hardware, implementations of the relevant callbacks in struct clk_ops,
+ * unique flags for that hardware type, a registration function and an
+ * alternative macro for static initialization
+ */
+
+/**
+ * struct clk_fixed_rate - fixed-rate clock
+ * @hw:		handle between common and hardware-specific interfaces
+ * @fixed_rate:	constant frequency of clock
+ * @fixed_accuracy: constant accuracy of clock in ppb (parts per billion)
+ * @flags:	hardware specific flags
+ *
+ * Flags:
+ * * CLK_FIXED_RATE_PARENT_ACCURACY - Use the accuracy of the parent clk
+ *                                    instead of what's set in @fixed_accuracy.
+ */
+struct clk_fixed_rate {
+	struct		clk_hw hw;
+	unsigned long	fixed_rate;
+	unsigned long	fixed_accuracy;
+	unsigned long	flags;
+};
+
+#define CLK_FIXED_RATE_PARENT_ACCURACY	BIT(0)
+
+extern const struct clk_ops clk_fixed_rate_ops;
+struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		unsigned long fixed_rate, unsigned long fixed_accuracy,
+		unsigned long clk_fixed_flags, bool devm);
+struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		unsigned long fixed_rate);
+/**
+ * clk_hw_register_fixed_rate - register fixed-rate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate(dev, name, parent_name, flags, fixed_rate)  \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name), NULL, \
+				     NULL, (flags), (fixed_rate), 0, 0, false)
+
+/**
+ * devm_clk_hw_register_fixed_rate - register fixed-rate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate(dev, name, parent_name, flags, fixed_rate)  \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name), NULL, \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
+/**
+ * devm_clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate_parent_data(dev, name, parent_data, flags, \
+						    fixed_rate)			   \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,		   \
+				     (parent_data), (flags), (fixed_rate), 0,	   \
+				     0, true)
+/**
+ * clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags,     \
+					     fixed_rate)		      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
+				     NULL, (flags), (fixed_rate), 0, 0, false)
+/**
+ * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate_parent_data(dev, name, parent_data, flags, \
+					     fixed_rate)		      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
+				     (parent_data), (flags), (fixed_rate), 0, \
+				     0, false)
+/**
+ * clk_hw_register_fixed_rate_with_accuracy - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ * @fixed_accuracy: non-adjustable clock accuracy
+ */
+#define clk_hw_register_fixed_rate_with_accuracy(dev, name, parent_name,      \
+						 flags, fixed_rate,	      \
+						 fixed_accuracy)	      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), (parent_name),      \
+				     NULL, NULL, (flags), (fixed_rate),       \
+				     (fixed_accuracy), 0, false)
+/**
+ * clk_hw_register_fixed_rate_with_accuracy_parent_hw - register fixed-rate
+ * clock with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ * @fixed_accuracy: non-adjustable clock accuracy
+ */
+#define clk_hw_register_fixed_rate_with_accuracy_parent_hw(dev, name,	      \
+		parent_hw, flags, fixed_rate, fixed_accuracy)		      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
+				     NULL, (flags), (fixed_rate),	      \
+				     (fixed_accuracy), 0, false)
+/**
+ * clk_hw_register_fixed_rate_with_accuracy_parent_data - register fixed-rate
+ * clock with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ * @fixed_accuracy: non-adjustable clock accuracy
+ */
+#define clk_hw_register_fixed_rate_with_accuracy_parent_data(dev, name,	      \
+		parent_data, flags, fixed_rate, fixed_accuracy)		      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,	      \
+				     (parent_data), NULL, (flags),	      \
+				     (fixed_rate), (fixed_accuracy), 0, false)
+/**
+ * clk_hw_register_fixed_rate_parent_accuracy - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define clk_hw_register_fixed_rate_parent_accuracy(dev, name, parent_data,    \
+						   flags, fixed_rate)	      \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, NULL,      \
+				     (parent_data), (flags), (fixed_rate), 0,    \
+				     CLK_FIXED_RATE_PARENT_ACCURACY, false)
+
+void clk_unregister_fixed_rate(struct clk *clk);
+void clk_hw_unregister_fixed_rate(struct clk_hw *hw);
+
+void of_fixed_clk_setup(struct device_node *np);
+
+/**
+ * struct clk_gate - gating clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register controlling gate
+ * @bit_idx:	single bit controlling gate
+ * @flags:	hardware-specific flags
+ * @lock:	register lock
+ *
+ * Clock which can gate its output.  Implements .enable & .disable
+ *
+ * Flags:
+ * CLK_GATE_SET_TO_DISABLE - by default this clock sets the bit at bit_idx to
+ *	enable the clock.  Setting this flag does the opposite: setting the bit
+ *	disable the clock and clearing it enables the clock
+ * CLK_GATE_HIWORD_MASK - The gate settings are only in lower 16-bit
+ *	of this register, and mask of gate bits are in higher 16-bit of this
+ *	register.  While setting the gate bits, higher 16-bit should also be
+ *	updated to indicate changing gate bits.
+ * CLK_GATE_BIG_ENDIAN - by default little endian register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses big
+ *	endian.
+ */
+struct clk_gate {
+	struct clk_hw hw;
+	void __iomem	*reg;
+	u8		bit_idx;
+	u8		flags;
+	spinlock_t	*lock;
+};
+
+#define to_clk_gate(_hw) container_of(_hw, struct clk_gate, hw)
+
+#define CLK_GATE_SET_TO_DISABLE		BIT(0)
+#define CLK_GATE_HIWORD_MASK		BIT(1)
+#define CLK_GATE_BIG_ENDIAN		BIT(2)
+
+extern const struct clk_ops clk_gate_ops;
+struct clk_hw *__clk_hw_register_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+struct clk_hw *__devm_clk_hw_register_gate(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+struct clk *clk_register_gate(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+/**
+ * clk_hw_register_gate - register a gate clock with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of this clock's parent
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_gate(dev, name, parent_name, flags, reg, bit_idx,     \
+			     clk_gate_flags, lock)			      \
+	__clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL,      \
+			       NULL, (flags), (reg), (bit_idx),		      \
+			       (clk_gate_flags), (lock))
+/**
+ * clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags, reg,      \
+				       bit_idx, clk_gate_flags, lock)	      \
+	__clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),        \
+			       NULL, (flags), (reg), (bit_idx),		      \
+			       (clk_gate_flags), (lock))
+/**
+ * clk_hw_register_gate_parent_data - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_gate_parent_data(dev, name, parent_data, flags, reg,  \
+				       bit_idx, clk_gate_flags, lock)	      \
+	__clk_hw_register_gate((dev), NULL, (name), NULL, NULL, (parent_data), \
+			       (flags), (reg), (bit_idx),		      \
+			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate - register a gate clock with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of this clock's parent
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate(dev, name, parent_name, flags, reg, bit_idx,\
+				  clk_gate_flags, lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
+			       NULL, (flags), (reg), (bit_idx),		      \
+			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
+					    reg, bit_idx, clk_gate_flags,     \
+					    lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+				    NULL, (flags), (reg), (bit_idx),	      \
+				    (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_data - register a gate clock with the
+ * clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
+					      reg, bit_idx, clk_gate_flags,   \
+					      lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
+				    (parent_data), (flags), (reg), (bit_idx), \
+				    (clk_gate_flags), (lock))
+
+void clk_unregister_gate(struct clk *clk);
+void clk_hw_unregister_gate(struct clk_hw *hw);
+int clk_gate_is_enabled(struct clk_hw *hw);
+
+struct clk_div_table {
+	unsigned int	val;
+	unsigned int	div;
+};
+
+/**
+ * struct clk_divider - adjustable divider clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register containing the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ * @lock:	register lock
+ *
+ * Clock with an adjustable divider affecting its output frequency.  Implements
+ * .recalc_rate, .set_rate and .round_rate
+ *
+ * @flags:
+ * CLK_DIVIDER_ONE_BASED - by default the divisor is the value read from the
+ *	register plus one.  If CLK_DIVIDER_ONE_BASED is set then the divider is
+ *	the raw value read from the register, with the value of zero considered
+ *	invalid, unless CLK_DIVIDER_ALLOW_ZERO is set.
+ * CLK_DIVIDER_POWER_OF_TWO - clock divisor is 2 raised to the value read from
+ *	the hardware register
+ * CLK_DIVIDER_ALLOW_ZERO - Allow zero divisors.  For dividers which have
+ *	CLK_DIVIDER_ONE_BASED set, it is possible to end up with a zero divisor.
+ *	Some hardware implementations gracefully handle this case and allow a
+ *	zero divisor by not modifying their input clock
+ *	(divide by one / bypass).
+ * CLK_DIVIDER_HIWORD_MASK - The divider settings are only in lower 16-bit
+ *	of this register, and mask of divider bits are in higher 16-bit of this
+ *	register.  While setting the divider bits, higher 16-bit should also be
+ *	updated to indicate changing divider bits.
+ * CLK_DIVIDER_ROUND_CLOSEST - Makes the best calculated divider to be rounded
+ *	to the closest integer instead of the up one.
+ * CLK_DIVIDER_READ_ONLY - The divider settings are preconfigured and should
+ *	not be changed by the clock framework.
+ * CLK_DIVIDER_MAX_AT_ZERO - For dividers which are like CLK_DIVIDER_ONE_BASED
+ *	except when the value read from the register is zero, the divisor is
+ *	2^width of the field.
+ * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses are used
+ *	for the divider register.  Setting this flag makes the register accesses
+ *	big endian.
+ * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
+ *	Formula is 2 * (value read from hardware + 1).
+ */
+struct clk_divider {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8		shift;
+	u8		width;
+	u16		flags;
+	const struct clk_div_table	*table;
+	spinlock_t	*lock;
+};
+
+#define clk_div_mask(width)	((1 << (width)) - 1)
+#define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
+
+#define CLK_DIVIDER_ONE_BASED		BIT(0)
+#define CLK_DIVIDER_POWER_OF_TWO	BIT(1)
+#define CLK_DIVIDER_ALLOW_ZERO		BIT(2)
+#define CLK_DIVIDER_HIWORD_MASK		BIT(3)
+#define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
+#define CLK_DIVIDER_READ_ONLY		BIT(5)
+#define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
+#define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
+#define CLK_DIVIDER_EVEN_INTEGERS	BIT(8)
+
+extern const struct clk_ops clk_divider_ops;
+extern const struct clk_ops clk_divider_ro_ops;
+
+unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
+		unsigned int val, const struct clk_div_table *table,
+		unsigned long flags, unsigned long width);
+long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
+			       unsigned long rate, unsigned long *prate,
+			       const struct clk_div_table *table,
+			       u8 width, unsigned long flags);
+long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
+				  unsigned long rate, unsigned long *prate,
+				  const struct clk_div_table *table, u8 width,
+				  unsigned long flags, unsigned int val);
+int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			   const struct clk_div_table *table, u8 width,
+			   unsigned long flags);
+int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
+			      const struct clk_div_table *table, u8 width,
+			      unsigned long flags, unsigned int val);
+int divider_get_val(unsigned long rate, unsigned long parent_rate,
+		const struct clk_div_table *table, u8 width,
+		unsigned long flags);
+
+struct clk_hw *__clk_hw_register_divider(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		unsigned long clk_divider_flags,
+		const struct clk_div_table *table, spinlock_t *lock);
+struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		unsigned long clk_divider_flags,
+		const struct clk_div_table *table, spinlock_t *lock);
+struct clk *clk_register_divider_table(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		unsigned long clk_divider_flags,
+		const struct clk_div_table *table, spinlock_t *lock);
+/**
+ * clk_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_register_divider(dev, name, parent_name, flags, reg, shift, width, \
+			     clk_divider_flags, lock)			       \
+	clk_register_divider_table((dev), (name), (parent_name), (flags),      \
+				   (reg), (shift), (width),		       \
+				   (clk_divider_flags), NULL, (lock))
+/**
+ * clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
+/**
+ * clk_hw_register_divider_parent_hw - register a divider clock with the clock
+ * framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags, reg,   \
+					  shift, width, clk_divider_flags,    \
+					  lock)				      \
+	__clk_hw_register_divider((dev), NULL, (name), NULL, (parent_hw),     \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
+/**
+ * clk_hw_register_divider_parent_data - register a divider clock with the clock
+ * framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_divider_parent_data(dev, name, parent_data, flags,    \
+					    reg, shift, width,		      \
+					    clk_divider_flags, lock)	      \
+	__clk_hw_register_divider((dev), NULL, (name), NULL, NULL,	      \
+				  (parent_data), (flags), (reg), (shift),     \
+				  (width), (clk_divider_flags), NULL, (lock))
+/**
+ * clk_hw_register_divider_table - register a table based divider clock with
+ * the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @table: array of divider/value pairs ending with a div set to 0
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_divider_table(dev, name, parent_name, flags, reg,     \
+				      shift, width, clk_divider_flags, table, \
+				      lock)				      \
+	__clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), (table), (lock))
+/**
+ * clk_hw_register_divider_table_parent_hw - register a table based divider
+ * clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @table: array of divider/value pairs ending with a div set to 0
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_divider_table_parent_hw(dev, name, parent_hw, flags,  \
+						reg, shift, width,	      \
+						clk_divider_flags, table,     \
+						lock)			      \
+	__clk_hw_register_divider((dev), NULL, (name), NULL, (parent_hw),     \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), (table), (lock))
+/**
+ * clk_hw_register_divider_table_parent_data - register a table based divider
+ * clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @table: array of divider/value pairs ending with a div set to 0
+ * @lock: shared register lock for this clock
+ */
+#define clk_hw_register_divider_table_parent_data(dev, name, parent_data,     \
+						  flags, reg, shift, width,   \
+						  clk_divider_flags, table,   \
+						  lock)			      \
+	__clk_hw_register_divider((dev), NULL, (name), NULL, NULL,	      \
+				  (parent_data), (flags), (reg), (shift),     \
+				  (width), (clk_divider_flags), (table),      \
+				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
+/**
+ * devm_clk_hw_register_divider_parent_hw - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags,   \
+					       reg, shift, width,	      \
+					       clk_divider_flags, lock)       \
+	__devm_clk_hw_register_divider((dev), NULL, (name), NULL,	      \
+				       (parent_hw), NULL, (flags), (reg),     \
+				       (shift), (width), (clk_divider_flags), \
+				       NULL, (lock))
+/**
+ * devm_clk_hw_register_divider_table - register a table based divider clock
+ * with the clock framework (devres variant)
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @table: array of divider/value pairs ending with a div set to 0
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider_table(dev, name, parent_name, flags,     \
+					   reg, shift, width,		      \
+					   clk_divider_flags, table, lock)    \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name),    \
+				       NULL, NULL, (flags), (reg), (shift),   \
+				       (width), (clk_divider_flags), (table), \
+				       (lock))
+
+void clk_unregister_divider(struct clk *clk);
+void clk_hw_unregister_divider(struct clk_hw *hw);
+
+/**
+ * struct clk_mux - multiplexer clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register controlling multiplexer
+ * @table:	array of register values corresponding to the parent index
+ * @shift:	shift to multiplexer bit field
+ * @mask:	mask of mutliplexer bit field
+ * @flags:	hardware-specific flags
+ * @lock:	register lock
+ *
+ * Clock with multiple selectable parents.  Implements .get_parent, .set_parent
+ * and .recalc_rate
+ *
+ * Flags:
+ * CLK_MUX_INDEX_ONE - register index starts at 1, not 0
+ * CLK_MUX_INDEX_BIT - register index is a single bit (power of two)
+ * CLK_MUX_HIWORD_MASK - The mux settings are only in lower 16-bit of this
+ *	register, and mask of mux bits are in higher 16-bit of this register.
+ *	While setting the mux bits, higher 16-bit should also be updated to
+ *	indicate changing mux bits.
+ * CLK_MUX_READ_ONLY - The mux registers can't be written, only read in the
+ * 	.get_parent clk_op.
+ * CLK_MUX_ROUND_CLOSEST - Use the parent rate that is closest to the desired
+ *	frequency.
+ * CLK_MUX_BIG_ENDIAN - By default little endian register accesses are used for
+ *	the mux register.  Setting this flag makes the register accesses big
+ *	endian.
+ */
+struct clk_mux {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	const u32	*table;
+	u32		mask;
+	u8		shift;
+	u8		flags;
+	spinlock_t	*lock;
+};
+
+#define to_clk_mux(_hw) container_of(_hw, struct clk_mux, hw)
+
+#define CLK_MUX_INDEX_ONE		BIT(0)
+#define CLK_MUX_INDEX_BIT		BIT(1)
+#define CLK_MUX_HIWORD_MASK		BIT(2)
+#define CLK_MUX_READ_ONLY		BIT(3) /* mux can't be changed */
+#define CLK_MUX_ROUND_CLOSEST		BIT(4)
+#define CLK_MUX_BIG_ENDIAN		BIT(5)
+
+extern const struct clk_ops clk_mux_ops;
+extern const struct clk_ops clk_mux_ro_ops;
+
+struct clk_hw *__clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, const u32 *table, spinlock_t *lock);
+struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct device_node *np,
+		const char *name, u8 num_parents,
+		const char * const *parent_names,
+		const struct clk_hw **parent_hws,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, const u32 *table, spinlock_t *lock);
+struct clk *clk_register_mux_table(struct device *dev, const char *name,
+		const char * const *parent_names, u8 num_parents,
+		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
+		u8 clk_mux_flags, const u32 *table, spinlock_t *lock);
+
+#define clk_register_mux(dev, name, parent_names, num_parents, flags, reg,    \
+			 shift, width, clk_mux_flags, lock)		      \
+	clk_register_mux_table((dev), (name), (parent_names), (num_parents),  \
+			       (flags), (reg), (shift), BIT((width)) - 1,     \
+			       (clk_mux_flags), NULL, (lock))
+#define clk_hw_register_mux_table(dev, name, parent_names, num_parents,	      \
+				  flags, reg, shift, mask, clk_mux_flags,     \
+				  table, lock)				      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), (mask), (clk_mux_flags), (table),      \
+			      (lock))
+#define clk_hw_register_mux_table_parent_data(dev, name, parent_data,	      \
+				  num_parents, flags, reg, shift, mask,	      \
+				  clk_mux_flags, table, lock)		      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      NULL, NULL, (parent_data), (flags), (reg),      \
+			      (shift), (mask), (clk_mux_flags), (table),      \
+			      (lock))
+#define clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
+			    shift, width, clk_mux_flags, lock)		      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
+			      NULL, (lock))
+#define clk_hw_register_mux_hws(dev, name, parent_hws, num_parents, flags,    \
+				reg, shift, width, clk_mux_flags, lock)	      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,	      \
+			      (parent_hws), NULL, (flags), (reg), (shift),    \
+			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+#define clk_hw_register_mux_parent_data(dev, name, parent_data, num_parents,  \
+					flags, reg, shift, width,	      \
+					clk_mux_flags, lock)		      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
+			      (parent_data), (flags), (reg), (shift),	      \
+			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
+#define clk_hw_register_mux_parent_data_table(dev, name, parent_data,	      \
+					      num_parents, flags, reg, shift, \
+					      width, clk_mux_flags, table,    \
+					      lock)			      \
+	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, \
+			      (parent_data), (flags), (reg), (shift),	      \
+			      BIT((width)) - 1, (clk_mux_flags), table, (lock))
+#define devm_clk_hw_register_mux(dev, name, parent_names, num_parents, flags, reg, \
+			    shift, width, clk_mux_flags, lock)		      \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      \
+			      (parent_names), NULL, NULL, (flags), (reg),     \
+			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
+			      NULL, (lock))
+#define devm_clk_hw_register_mux_parent_hws(dev, name, parent_hws,	      \
+					    num_parents, flags, reg, shift,   \
+					    width, clk_mux_flags, lock)       \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,  \
+				   (parent_hws), NULL, (flags), (reg),        \
+				   (shift), BIT((width)) - 1,		      \
+				   (clk_mux_flags), NULL, (lock))
+#define devm_clk_hw_register_mux_parent_data_table(dev, name, parent_data,    \
+					      num_parents, flags, reg, shift, \
+					      width, clk_mux_flags, table,    \
+					      lock)			      \
+	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL,  \
+			      NULL, (parent_data), (flags), (reg), (shift),   \
+			      BIT((width)) - 1, (clk_mux_flags), table, (lock))
+
+int clk_mux_val_to_index(struct clk_hw *hw, const u32 *table, unsigned int flags,
+			 unsigned int val);
+unsigned int clk_mux_index_to_val(const u32 *table, unsigned int flags, u8 index);
+
+void clk_unregister_mux(struct clk *clk);
+void clk_hw_unregister_mux(struct clk_hw *hw);
+
+void of_fixed_factor_clk_setup(struct device_node *node);
+
+/**
+ * struct clk_fixed_factor - fixed multiplier and divider clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @mult:	multiplier
+ * @div:	divider
+ * @acc:	fixed accuracy in ppb
+ * @flags:	behavior modifying flags
+ *
+ * Clock with a fixed multiplier and divider. The output frequency is the
+ * parent clock rate divided by div and multiplied by mult.
+ * Implements .recalc_rate, .set_rate, .round_rate and .recalc_accuracy
+ *
+ * Flags:
+ * * CLK_FIXED_FACTOR_FIXED_ACCURACY - Use the value in @acc instead of the
+ *                                     parent clk accuracy.
+ */
+
+struct clk_fixed_factor {
+	struct clk_hw	hw;
+	unsigned int	mult;
+	unsigned int	div;
+	unsigned long	acc;
+	unsigned int	flags;
+};
+
+#define CLK_FIXED_FACTOR_FIXED_ACCURACY	BIT(0)
+
+#define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor, hw)
+
+extern const struct clk_ops clk_fixed_factor_ops;
+struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
+void clk_unregister_fixed_factor(struct clk *clk);
+struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
+struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div);
+struct clk_hw *clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		unsigned long acc);
+struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div);
+void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
+struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div);
+struct clk_hw *devm_clk_hw_register_fixed_factor_with_accuracy_fwname(struct device *dev,
+		struct device_node *np, const char *name, const char *fw_name,
+		unsigned long flags, unsigned int mult, unsigned int div,
+		unsigned long acc);
+struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
+		const char *name, unsigned int index, unsigned long flags,
+		unsigned int mult, unsigned int div);
+
+struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+		const char *name, const struct clk_hw *parent_hw,
+		unsigned long flags, unsigned int mult, unsigned int div);
+
+struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
+		const char *name, const struct clk_hw *parent_hw,
+		unsigned long flags, unsigned int mult, unsigned int div);
+/**
+ * struct clk_fractional_divider - adjustable fractional divider clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register containing the divider
+ * @mshift:	shift to the numerator bit field
+ * @mwidth:	width of the numerator bit field
+ * @nshift:	shift to the denominator bit field
+ * @nwidth:	width of the denominator bit field
+ * @approximation: clk driver's callback for calculating the divider clock
+ * @lock:	register lock
+ *
+ * Clock with adjustable fractional divider affecting its output frequency.
+ *
+ * @flags:
+ * CLK_FRAC_DIVIDER_ZERO_BASED - by default the numerator and denominator
+ *	is the value read from the register. If CLK_FRAC_DIVIDER_ZERO_BASED
+ *	is set then the numerator and denominator are both the value read
+ *	plus one.
+ * CLK_FRAC_DIVIDER_BIG_ENDIAN - By default little endian register accesses are
+ *	used for the divider register.  Setting this flag makes the register
+ *	accesses big endian.
+ * CLK_FRAC_DIVIDER_POWER_OF_TWO_PS - By default the resulting fraction might
+ *	be saturated and the caller will get quite far from the good enough
+ *	approximation. Instead the caller may require, by setting this flag,
+ *	to shift left by a few bits in case, when the asked one is quite small
+ *	to satisfy the desired range of denominator. It assumes that on the
+ *	caller's side the power-of-two capable prescaler exists.
+ */
+struct clk_fractional_divider {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8		mshift;
+	u8		mwidth;
+	u8		nshift;
+	u8		nwidth;
+	u8		flags;
+	void		(*approximation)(struct clk_hw *hw,
+				unsigned long rate, unsigned long *parent_rate,
+				unsigned long *m, unsigned long *n);
+	spinlock_t	*lock;
+};
+
+#define to_clk_fd(_hw) container_of(_hw, struct clk_fractional_divider, hw)
+
+#define CLK_FRAC_DIVIDER_ZERO_BASED		BIT(0)
+#define CLK_FRAC_DIVIDER_BIG_ENDIAN		BIT(1)
+#define CLK_FRAC_DIVIDER_POWER_OF_TWO_PS	BIT(2)
+
+struct clk *clk_register_fractional_divider(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 mshift, u8 mwidth, u8 nshift, u8 nwidth,
+		u8 clk_divider_flags, spinlock_t *lock);
+struct clk_hw *clk_hw_register_fractional_divider(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 mshift, u8 mwidth, u8 nshift, u8 nwidth,
+		u8 clk_divider_flags, spinlock_t *lock);
+void clk_hw_unregister_fractional_divider(struct clk_hw *hw);
+
+/**
+ * struct clk_multiplier - adjustable multiplier clock
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @reg:	register containing the multiplier
+ * @shift:	shift to the multiplier bit field
+ * @width:	width of the multiplier bit field
+ * @lock:	register lock
+ *
+ * Clock with an adjustable multiplier affecting its output frequency.
+ * Implements .recalc_rate, .set_rate and .round_rate
+ *
+ * @flags:
+ * CLK_MULTIPLIER_ZERO_BYPASS - By default, the multiplier is the value read
+ *	from the register, with 0 being a valid value effectively
+ *	zeroing the output clock rate. If CLK_MULTIPLIER_ZERO_BYPASS is
+ *	set, then a null multiplier will be considered as a bypass,
+ *	leaving the parent rate unmodified.
+ * CLK_MULTIPLIER_ROUND_CLOSEST - Makes the best calculated divider to be
+ *	rounded to the closest integer instead of the down one.
+ * CLK_MULTIPLIER_BIG_ENDIAN - By default little endian register accesses are
+ *	used for the multiplier register.  Setting this flag makes the register
+ *	accesses big endian.
+ */
+struct clk_multiplier {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8		shift;
+	u8		width;
+	u8		flags;
+	spinlock_t	*lock;
+};
+
+#define to_clk_multiplier(_hw) container_of(_hw, struct clk_multiplier, hw)
+
+#define CLK_MULTIPLIER_ZERO_BYPASS	BIT(0)
+#define CLK_MULTIPLIER_ROUND_CLOSEST	BIT(1)
+#define CLK_MULTIPLIER_BIG_ENDIAN	BIT(2)
+
+extern const struct clk_ops clk_multiplier_ops;
+
+/***
+ * struct clk_composite - aggregate clock of mux, divider and gate clocks
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @mux_hw:	handle between composite and hardware-specific mux clock
+ * @rate_hw:	handle between composite and hardware-specific rate clock
+ * @gate_hw:	handle between composite and hardware-specific gate clock
+ * @mux_ops:	clock ops for mux
+ * @rate_ops:	clock ops for rate
+ * @gate_ops:	clock ops for gate
+ */
+struct clk_composite {
+	struct clk_hw	hw;
+	struct clk_ops	ops;
+
+	struct clk_hw	*mux_hw;
+	struct clk_hw	*rate_hw;
+	struct clk_hw	*gate_hw;
+
+	const struct clk_ops	*mux_ops;
+	const struct clk_ops	*rate_ops;
+	const struct clk_ops	*gate_ops;
+};
+
+#define to_clk_composite(_hw) container_of(_hw, struct clk_composite, hw)
+
+struct clk *clk_register_composite(struct device *dev, const char *name,
+		const char * const *parent_names, int num_parents,
+		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+		unsigned long flags);
+struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
+		const struct clk_parent_data *parent_data, int num_parents,
+		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+		unsigned long flags);
+void clk_unregister_composite(struct clk *clk);
+struct clk_hw *clk_hw_register_composite(struct device *dev, const char *name,
+		const char * const *parent_names, int num_parents,
+		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+		unsigned long flags);
+struct clk_hw *clk_hw_register_composite_pdata(struct device *dev,
+		const char *name,
+		const struct clk_parent_data *parent_data, int num_parents,
+		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+		unsigned long flags);
+struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
+		const char *name, const struct clk_parent_data *parent_data,
+		int num_parents,
+		struct clk_hw *mux_hw, const struct clk_ops *mux_ops,
+		struct clk_hw *rate_hw, const struct clk_ops *rate_ops,
+		struct clk_hw *gate_hw, const struct clk_ops *gate_ops,
+		unsigned long flags);
+void clk_hw_unregister_composite(struct clk_hw *hw);
+
+struct clk *clk_register(struct device *dev, struct clk_hw *hw);
+struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw);
+
+int __must_check clk_hw_register(struct device *dev, struct clk_hw *hw);
+int __must_check devm_clk_hw_register(struct device *dev, struct clk_hw *hw);
+int __must_check of_clk_hw_register(struct device_node *node, struct clk_hw *hw);
+
+void clk_unregister(struct clk *clk);
+
+void clk_hw_unregister(struct clk_hw *hw);
+
+/* helper functions */
+const char *__clk_get_name(const struct clk *clk);
+const char *clk_hw_get_name(const struct clk_hw *hw);
+
+/**
+ * clk_hw_get_dev() - get device from an hardware clock.
+ * @hw: the clk_hw pointer to get the struct device from
+ *
+ * This is a helper to get the struct device associated with a hardware
+ * clock. Some clock controllers, such as the one registered with
+ * CLK_OF_DECLARE(), may have not provided a device pointer while
+ * registering the clock.
+ *
+ * Return: the struct device associated with the clock, or NULL if there
+ * is none.
+ */
+struct device *clk_hw_get_dev(const struct clk_hw *hw);
+
+/**
+ * clk_hw_get_of_node() - get device_node from a hardware clock.
+ * @hw: the clk_hw pointer to get the struct device_node from
+ *
+ * This is a helper to get the struct device_node associated with a
+ * hardware clock.
+ *
+ * Return: the struct device_node associated with the clock, or NULL
+ * if there is none.
+ */
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
+#ifdef CONFIG_COMMON_CLK
+struct clk_hw *__clk_get_hw(struct clk *clk);
+#else
+static inline struct clk_hw *__clk_get_hw(struct clk *clk)
+{
+	return (struct clk_hw *)clk;
+}
+#endif
+
+struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id);
+struct clk *devm_clk_hw_get_clk(struct device *dev, struct clk_hw *hw,
+				const char *con_id);
+
+unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
+struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
+struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
+					  unsigned int index);
+int clk_hw_get_parent_index(struct clk_hw *hw);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
+unsigned int __clk_get_enable_count(struct clk *clk);
+unsigned long clk_hw_get_rate(const struct clk_hw *hw);
+unsigned long clk_hw_get_flags(const struct clk_hw *hw);
+#define clk_hw_can_set_rate_parent(hw) \
+	(clk_hw_get_flags((hw)) & CLK_SET_RATE_PARENT)
+
+bool clk_hw_is_prepared(const struct clk_hw *hw);
+bool clk_hw_is_enabled(const struct clk_hw *hw);
+bool __clk_is_enabled(struct clk *clk);
+struct clk *__clk_lookup(const char *name);
+int __clk_mux_determine_rate(struct clk_hw *hw,
+			     struct clk_rate_request *req);
+int __clk_determine_rate(struct clk_hw *core, struct clk_rate_request *req);
+int __clk_mux_determine_rate_closest(struct clk_hw *hw,
+				     struct clk_rate_request *req);
+int clk_mux_determine_rate_flags(struct clk_hw *hw,
+				 struct clk_rate_request *req,
+				 unsigned long flags);
+int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
+				      struct clk_rate_request *req);
+void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
+void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
+			   unsigned long max_rate);
+
+static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
+{
+	dst->clk = src->clk;
+	dst->core = src->core;
+}
+
+static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long *prate,
+				      const struct clk_div_table *table,
+				      u8 width, unsigned long flags)
+{
+	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
+					 rate, prate, table, width, flags);
+}
+
+static inline long divider_ro_round_rate(struct clk_hw *hw, unsigned long rate,
+					 unsigned long *prate,
+					 const struct clk_div_table *table,
+					 u8 width, unsigned long flags,
+					 unsigned int val)
+{
+	return divider_ro_round_rate_parent(hw, clk_hw_get_parent(hw),
+					    rate, prate, table, width, flags,
+					    val);
+}
+
+/*
+ * FIXME clock api without lock protection
+ */
+unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
+
+struct clk_onecell_data {
+	struct clk **clks;
+	unsigned int clk_num;
+};
+
+struct clk_hw_onecell_data {
+	unsigned int num;
+	struct clk_hw *hws[] __counted_by(num);
+};
+
+int of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+						   void *data),
+			void *data);
+int of_clk_add_hw_provider(struct device_node *np,
+			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+						 void *data),
+			   void *data);
+int devm_of_clk_add_hw_provider(struct device *dev,
+			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+						 void *data),
+			   void *data);
+void of_clk_del_provider(struct device_node *np);
+
+struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
+				  void *data);
+struct clk_hw *of_clk_hw_simple_get(struct of_phandle_args *clkspec,
+				    void *data);
+struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
+struct clk_hw *of_clk_hw_onecell_get(struct of_phandle_args *clkspec,
+				     void *data);
+int of_clk_parent_fill(struct device_node *np, const char **parents,
+		       unsigned int size);
+int of_clk_detect_critical(struct device_node *np, int index,
+			    unsigned long *flags);
+
+#endif /* __LINUX_CLK_PROVIDER_CCF_FULL_H */
diff --git a/include/linux/clk-provider-uccf.h b/include/linux/clk-provider-uccf.h
new file mode 100644
index 000000000000..bfd16fbdfc67
--- /dev/null
+++ b/include/linux/clk-provider-uccf.h
@@ -0,0 +1,275 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 DENX Software Engineering
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ *
+ * Copyright (c) 2010-2011 Jeremy Kerr <jeremy.kerr@canonical.com>
+ * Copyright (C) 2011-2012 Linaro Ltd <mturquette@linaro.org>
+ */
+#ifndef __LINUX_CLK_PROVIDER_UCCF_H
+#define __LINUX_CLK_PROVIDER_UCCF_H
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <clk-uclass.h>
+
+struct udevice;
+
+/* update clock ID for the dev = clock provider, compatible with CLK_AUTO_ID */
+static inline void dev_clk_dm(const struct udevice *dev, ulong id, struct clk *clk)
+{
+	if (!IS_ERR(clk))
+		clk->id = CLK_ID(dev, id);
+}
+
+static inline void clk_dm(ulong id, struct clk *clk)
+{
+	if (!IS_ERR(clk))
+		clk->id = CLK_ID(clk->dev, id);
+}
+
+/*
+ * flags used across common struct clk.  these flags should only affect the
+ * top-level framework.  custom flags for dealing with hardware specifics
+ * belong in struct clk_foo
+ *
+ * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
+ */
+#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
+#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
+#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
+#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
+				/* unused */
+#define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() */
+#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
+#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
+#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
+#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
+#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
+#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
+/* parents need enable during gate/ungate, set rate and re-parent */
+#define CLK_OPS_PARENT_ENABLE	BIT(12)
+/* duty cycle call may be forwarded to the parent clock */
+#define CLK_DUTY_CYCLE_PARENT	BIT(13)
+
+#define CLK_MUX_INDEX_ONE		BIT(0)
+#define CLK_MUX_INDEX_BIT		BIT(1)
+#define CLK_MUX_HIWORD_MASK		BIT(2)
+#define CLK_MUX_READ_ONLY		BIT(3) /* mux can't be changed */
+#define CLK_MUX_ROUND_CLOSEST		BIT(4)
+
+struct clk_mux {
+	struct clk	clk;
+	void __iomem	*reg;
+	u32		*table;
+	u32		mask;
+	u8		shift;
+	u8		flags;
+
+	/*
+	 * Fields from struct clk_init_data - this struct has been
+	 * omitted to avoid too deep level of CCF for bootloader
+	 */
+	const char	* const *parent_names;
+	u8		num_parents;
+#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
+	u32             io_mux_val;
+#endif
+
+};
+
+#define to_clk_mux(_clk) container_of(_clk, struct clk_mux, clk)
+extern const struct clk_ops_uboot clk_mux_ops;
+u8 clk_mux_get_parent(struct clk *clk);
+int clk_mux_fetch_parent_index(struct clk *clk, struct clk *parent);
+
+/**
+ * clk_mux_index_to_val() - Convert the parent index to the register value
+ *
+ * It returns the value to write in the hardware register to output the selected
+ * input clock parent.
+ *
+ * @table: array of register values corresponding to the parent index (optional)
+ * @flags: hardware-specific flags
+ * @index: parent clock index
+ * Return: the register value
+ */
+unsigned int clk_mux_index_to_val(u32 *table, unsigned int flags, u8 index);
+
+struct clk_gate {
+	struct clk	clk;
+	void __iomem	*reg;
+	u8		bit_idx;
+	u8		flags;
+#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
+	u32		io_gate_val;
+#endif
+};
+
+#define to_clk_gate(_clk) container_of(_clk, struct clk_gate, clk)
+
+#define CLK_GATE_SET_TO_DISABLE		BIT(0)
+#define CLK_GATE_HIWORD_MASK		BIT(1)
+
+extern const struct clk_ops_uboot clk_gate_ops;
+struct clk *clk_register_gate(struct udevice *dev, const char *name,
+			      const char *parent_name, unsigned long flags,
+			      void __iomem *reg, u8 bit_idx,
+			      u8 clk_gate_flags, spinlock_t *lock);
+
+struct clk_div_table {
+	unsigned int	val;
+	unsigned int	div;
+};
+
+struct clk_divider {
+	struct clk	clk;
+	void __iomem	*reg;
+	u8		shift;
+	u8		width;
+	u8		flags;
+	const struct clk_div_table	*table;
+#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
+	u32             io_divider_val;
+#endif
+};
+
+#define clk_div_mask(width)	((1 << (width)) - 1)
+#define to_clk_divider(_clk) container_of(_clk, struct clk_divider, clk)
+
+#define CLK_DIVIDER_ONE_BASED		BIT(0)
+#define CLK_DIVIDER_POWER_OF_TWO	BIT(1)
+#define CLK_DIVIDER_ALLOW_ZERO		BIT(2)
+#define CLK_DIVIDER_HIWORD_MASK		BIT(3)
+#define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
+#define CLK_DIVIDER_READ_ONLY		BIT(5)
+#define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
+extern const struct clk_ops_uboot clk_divider_ops;
+
+/**
+ * clk_divider_get_table_div() - convert the register value to the divider
+ *
+ * @table:  array of register values corresponding to valid dividers
+ * @val: value to convert
+ * Return: the divider
+ */
+unsigned int clk_divider_get_table_div(const struct clk_div_table *table,
+				       unsigned int val);
+
+/**
+ * clk_divider_get_table_val() - convert the divider to the register value
+ *
+ * It returns the value to write in the hardware register to divide the input
+ * clock rate by @div.
+ *
+ * @table: array of register values corresponding to valid dividers
+ * @div: requested divider
+ * Return: the register value
+ */
+unsigned int clk_divider_get_table_val(const struct clk_div_table *table,
+				       unsigned int div);
+
+/**
+ * clk_divider_is_valid_div() - check if the divider is valid
+ *
+ * @table: array of valid dividers (optional)
+ * @div: divider to check
+ * @flags: hardware-specific flags
+ * Return: true if the divider is valid, false otherwise
+ */
+bool clk_divider_is_valid_div(const struct clk_div_table *table,
+			      unsigned int div, unsigned long flags);
+
+/**
+ * clk_divider_is_valid_table_div - check if the divider is in the @table array
+ *
+ * @table: array of valid dividers
+ * @div: divider to check
+ * Return: true if the divider is found in the @table array, false otherwise
+ */
+bool clk_divider_is_valid_table_div(const struct clk_div_table *table,
+				    unsigned int div);
+unsigned long divider_recalc_rate(struct clk *hw, unsigned long parent_rate,
+				  unsigned int val,
+				  const struct clk_div_table *table,
+				  unsigned long flags, unsigned long width);
+
+struct clk_fixed_factor {
+	struct clk	clk;
+	unsigned int	mult;
+	unsigned int	div;
+};
+
+extern const struct clk_ops_uboot clk_fixed_rate_ops;
+
+#define to_clk_fixed_factor(_clk) container_of(_clk, struct clk_fixed_factor,\
+					       clk)
+
+struct clk_fixed_rate {
+	struct clk clk;
+	unsigned long fixed_rate;
+};
+
+#define to_clk_fixed_rate(dev)	((struct clk_fixed_rate *)dev_get_plat(dev))
+
+void clk_fixed_rate_ofdata_to_plat_(struct udevice *dev,
+				    struct clk_fixed_rate *plat);
+
+struct clk_composite {
+	struct clk	clk;
+	struct clk_ops_uboot	ops;
+
+	struct clk	*mux;
+	struct clk	*rate;
+	struct clk	*gate;
+
+	const struct clk_ops_uboot	*mux_ops;
+	const struct clk_ops_uboot	*rate_ops;
+	const struct clk_ops_uboot	*gate_ops;
+
+	struct udevice *dev;
+};
+
+#define to_clk_composite(_clk) container_of(_clk, struct clk_composite, clk)
+
+struct clk *clk_register_composite(struct udevice *dev, const char *name,
+		const char * const *parent_names, int num_parents,
+		struct clk *mux_clk, const struct clk_ops_uboot *mux_ops,
+		struct clk *rate_clk, const struct clk_ops_uboot *rate_ops,
+		struct clk *gate_clk, const struct clk_ops_uboot *gate_ops,
+		unsigned long flags);
+
+int clk_register(struct clk *clk, const char *drv_name, const char *name,
+		 const char *parent_name);
+
+struct clk *clk_register_fixed_factor(struct udevice *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
+
+struct clk *clk_register_divider(struct udevice *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		u8 clk_divider_flags);
+
+struct clk *clk_register_mux(struct udevice *dev, const char *name,
+		const char * const *parent_names, u8 num_parents,
+		unsigned long flags,
+		void __iomem *reg, u8 shift, u8 width,
+		u8 clk_mux_flags);
+
+struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
+				    ulong rate);
+
+const char *clk_hw_get_name(const struct clk *hw);
+ulong clk_generic_get_rate(struct clk *clk);
+
+struct clk *dev_get_clk_ptr(struct udevice *dev);
+
+long ccf_clk_get_rate(struct clk *clk);
+long ccf_clk_set_rate(struct clk *clk, unsigned long rate);
+int ccf_clk_set_parent(struct clk *clk, struct clk *parent);
+int ccf_clk_enable(struct clk *clk);
+int ccf_clk_disable(struct clk *clk);
+extern const struct clk_ops_uboot ccf_clk_ops;
+
+#endif /* __LINUX_CLK_PROVIDER_UCCF_H */
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 65f86421aa63..1140c2b10ac2 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -8,268 +8,15 @@
  */
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
-#include <linux/bitops.h>
-#include <linux/err.h>
-#include <clk-uclass.h>
-
-struct udevice;
-
-/* update clock ID for the dev = clock provider, compatible with CLK_AUTO_ID */
-static inline void dev_clk_dm(const struct udevice *dev, ulong id, struct clk *clk)
-{
-	if (!IS_ERR(clk))
-		clk->id = CLK_ID(dev, id);
-}
-
-static inline void clk_dm(ulong id, struct clk *clk)
-{
-	if (!IS_ERR(clk))
-		clk->id = CLK_ID(clk->dev, id);
-}
-
 /*
- * flags used across common struct clk.  these flags should only affect the
- * top-level framework.  custom flags for dealing with hardware specifics
- * belong in struct clk_foo
- *
- * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
+ * U-Boot: for compatibility include the correct clk-provider.h
+ * for either uccf (U-Boot CCF) or ccf_full (Linux CCF)
  */
-#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
-#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
-#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
-#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
-				/* unused */
-#define CLK_IS_BASIC		BIT(5) /* Basic clk, can't do a to_clk_foo() */
-#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
-#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
-#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
-#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
-#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
-#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
-/* parents need enable during gate/ungate, set rate and re-parent */
-#define CLK_OPS_PARENT_ENABLE	BIT(12)
-/* duty cycle call may be forwarded to the parent clock */
-#define CLK_DUTY_CYCLE_PARENT	BIT(13)
-
-#define CLK_MUX_INDEX_ONE		BIT(0)
-#define CLK_MUX_INDEX_BIT		BIT(1)
-#define CLK_MUX_HIWORD_MASK		BIT(2)
-#define CLK_MUX_READ_ONLY		BIT(3) /* mux can't be changed */
-#define CLK_MUX_ROUND_CLOSEST		BIT(4)
-
-struct clk_mux {
-	struct clk	clk;
-	void __iomem	*reg;
-	u32		*table;
-	u32		mask;
-	u8		shift;
-	u8		flags;
-
-	/*
-	 * Fields from struct clk_init_data - this struct has been
-	 * omitted to avoid too deep level of CCF for bootloader
-	 */
-	const char	* const *parent_names;
-	u8		num_parents;
-#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
-	u32             io_mux_val;
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL)
+#include "clk-provider-ccf_full.h"
+#else
+#include "clk-provider-uccf.h"
 #endif
 
-};
-
-#define to_clk_mux(_clk) container_of(_clk, struct clk_mux, clk)
-extern const struct clk_ops_uboot clk_mux_ops;
-u8 clk_mux_get_parent(struct clk *clk);
-int clk_mux_fetch_parent_index(struct clk *clk, struct clk *parent);
-
-/**
- * clk_mux_index_to_val() - Convert the parent index to the register value
- *
- * It returns the value to write in the hardware register to output the selected
- * input clock parent.
- *
- * @table: array of register values corresponding to the parent index (optional)
- * @flags: hardware-specific flags
- * @index: parent clock index
- * Return: the register value
- */
-unsigned int clk_mux_index_to_val(u32 *table, unsigned int flags, u8 index);
-
-struct clk_gate {
-	struct clk	clk;
-	void __iomem	*reg;
-	u8		bit_idx;
-	u8		flags;
-#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
-	u32		io_gate_val;
-#endif
-};
-
-#define to_clk_gate(_clk) container_of(_clk, struct clk_gate, clk)
-
-#define CLK_GATE_SET_TO_DISABLE		BIT(0)
-#define CLK_GATE_HIWORD_MASK		BIT(1)
-
-extern const struct clk_ops_uboot clk_gate_ops;
-struct clk *clk_register_gate(struct udevice *dev, const char *name,
-			      const char *parent_name, unsigned long flags,
-			      void __iomem *reg, u8 bit_idx,
-			      u8 clk_gate_flags, spinlock_t *lock);
-
-struct clk_div_table {
-	unsigned int	val;
-	unsigned int	div;
-};
-
-struct clk_divider {
-	struct clk	clk;
-	void __iomem	*reg;
-	u8		shift;
-	u8		width;
-	u8		flags;
-	const struct clk_div_table	*table;
-#if IS_ENABLED(CONFIG_SANDBOX_CLK_CCF)
-	u32             io_divider_val;
-#endif
-};
-
-#define clk_div_mask(width)	((1 << (width)) - 1)
-#define to_clk_divider(_clk) container_of(_clk, struct clk_divider, clk)
-
-#define CLK_DIVIDER_ONE_BASED		BIT(0)
-#define CLK_DIVIDER_POWER_OF_TWO	BIT(1)
-#define CLK_DIVIDER_ALLOW_ZERO		BIT(2)
-#define CLK_DIVIDER_HIWORD_MASK		BIT(3)
-#define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
-#define CLK_DIVIDER_READ_ONLY		BIT(5)
-#define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
-extern const struct clk_ops_uboot clk_divider_ops;
-
-/**
- * clk_divider_get_table_div() - convert the register value to the divider
- *
- * @table:  array of register values corresponding to valid dividers
- * @val: value to convert
- * Return: the divider
- */
-unsigned int clk_divider_get_table_div(const struct clk_div_table *table,
-				       unsigned int val);
-
-/**
- * clk_divider_get_table_val() - convert the divider to the register value
- *
- * It returns the value to write in the hardware register to divide the input
- * clock rate by @div.
- *
- * @table: array of register values corresponding to valid dividers
- * @div: requested divider
- * Return: the register value
- */
-unsigned int clk_divider_get_table_val(const struct clk_div_table *table,
-				       unsigned int div);
-
-/**
- * clk_divider_is_valid_div() - check if the divider is valid
- *
- * @table: array of valid dividers (optional)
- * @div: divider to check
- * @flags: hardware-specific flags
- * Return: true if the divider is valid, false otherwise
- */
-bool clk_divider_is_valid_div(const struct clk_div_table *table,
-			      unsigned int div, unsigned long flags);
-
-/**
- * clk_divider_is_valid_table_div - check if the divider is in the @table array
- *
- * @table: array of valid dividers
- * @div: divider to check
- * Return: true if the divider is found in the @table array, false otherwise
- */
-bool clk_divider_is_valid_table_div(const struct clk_div_table *table,
-				    unsigned int div);
-unsigned long divider_recalc_rate(struct clk *hw, unsigned long parent_rate,
-				  unsigned int val,
-				  const struct clk_div_table *table,
-				  unsigned long flags, unsigned long width);
-
-struct clk_fixed_factor {
-	struct clk	clk;
-	unsigned int	mult;
-	unsigned int	div;
-};
-
-extern const struct clk_ops_uboot clk_fixed_rate_ops;
-
-#define to_clk_fixed_factor(_clk) container_of(_clk, struct clk_fixed_factor,\
-					       clk)
-
-struct clk_fixed_rate {
-	struct clk clk;
-	unsigned long fixed_rate;
-};
-
-#define to_clk_fixed_rate(dev)	((struct clk_fixed_rate *)dev_get_plat(dev))
-
-void clk_fixed_rate_ofdata_to_plat_(struct udevice *dev,
-				    struct clk_fixed_rate *plat);
-
-struct clk_composite {
-	struct clk	clk;
-	struct clk_ops_uboot	ops;
-
-	struct clk	*mux;
-	struct clk	*rate;
-	struct clk	*gate;
-
-	const struct clk_ops_uboot	*mux_ops;
-	const struct clk_ops_uboot	*rate_ops;
-	const struct clk_ops_uboot	*gate_ops;
-
-	struct udevice *dev;
-};
-
-#define to_clk_composite(_clk) container_of(_clk, struct clk_composite, clk)
-
-struct clk *clk_register_composite(struct udevice *dev, const char *name,
-		const char * const *parent_names, int num_parents,
-		struct clk *mux_clk, const struct clk_ops_uboot *mux_ops,
-		struct clk *rate_clk, const struct clk_ops_uboot *rate_ops,
-		struct clk *gate_clk, const struct clk_ops_uboot *gate_ops,
-		unsigned long flags);
-
-int clk_register(struct clk *clk, const char *drv_name, const char *name,
-		 const char *parent_name);
-
-struct clk *clk_register_fixed_factor(struct udevice *dev, const char *name,
-		const char *parent_name, unsigned long flags,
-		unsigned int mult, unsigned int div);
-
-struct clk *clk_register_divider(struct udevice *dev, const char *name,
-		const char *parent_name, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_divider_flags);
-
-struct clk *clk_register_mux(struct udevice *dev, const char *name,
-		const char * const *parent_names, u8 num_parents,
-		unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_mux_flags);
-
-struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
-				    ulong rate);
-
-const char *clk_hw_get_name(const struct clk *hw);
-ulong clk_generic_get_rate(struct clk *clk);
-
-struct clk *dev_get_clk_ptr(struct udevice *dev);
-
-ulong ccf_clk_get_rate(struct clk *clk);
-ulong ccf_clk_set_rate(struct clk *clk, unsigned long rate);
-int ccf_clk_set_parent(struct clk *clk, struct clk *parent);
-int ccf_clk_enable(struct clk *clk);
-int ccf_clk_disable(struct clk *clk);
-extern const struct clk_ops_uboot ccf_clk_ops;
-
 #endif /* __LINUX_CLK_PROVIDER_H */
diff --git a/include/linux/clk/clk-conf.h b/include/linux/clk/clk-conf.h
new file mode 100644
index 000000000000..eae9652c70cd
--- /dev/null
+++ b/include/linux/clk/clk-conf.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2014 Samsung Electronics Co., Ltd.
+ * Sylwester Nawrocki <s.nawrocki@samsung.com>
+ */
+
+#ifndef __CLK_CONF_H
+#define __CLK_CONF_H
+
+#include <linux/types.h>
+
+struct device_node;
+
+#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
+int of_clk_set_defaults(struct device_node *node, bool clk_supplier);
+#else
+static inline int of_clk_set_defaults(struct device_node *node,
+				      bool clk_supplier)
+{
+	return 0;
+}
+#endif
+
+#endif /* __CLK_CONF_H */

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
