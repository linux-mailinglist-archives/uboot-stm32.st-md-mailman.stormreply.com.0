Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO/vB8UXwWn5QQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BF2F03CE
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60CB4C8F26A;
	Mon, 23 Mar 2026 10:36:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF994C87ED5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:57:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fe655187so3154805e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953846; x=1774558646;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LclK/WFnKQsMrtdNvHDrf15plVujXWqfACmvsP31Zb4=;
 b=ZRBMgOJIz3zg7RS8V8vurOXwbDgPUeA0tus7RzIRhKd/mV80LzX1o2SmxVd3loamsc
 mOSeRIxf82wTI0ln9P1eUH/c+EX9DQO8B2uYbCamr39OFmnCP9/IbhqjoBZg2B7LGjL6
 2B4YHtPYWtYyanIw09nhJBbjyvE2I00k4jkDCJDqHauDQ46zbZ0s4ERIK6FKS1mEUzJk
 gNJzeoVFsQ7y/On//RPSFCC6PYJiv29eevTLqjFoeyE3zf5dmIAI3x/2/d4NNae4jw7D
 pUFty7bImDLC/5IzClPs6TK714JS6tTN63so+siRSmREjZz9JAgLzr4r0wSnOzwJKA9u
 YnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953846; x=1774558646;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LclK/WFnKQsMrtdNvHDrf15plVujXWqfACmvsP31Zb4=;
 b=Hm77jK/jkmjUQXR2KUHGzCWAnCcMjkjR1b3rkIw2XeHM0UpAQbWzRnq/vSyCAj+BQv
 lyDxh6P6tXKwFy6qZdU/fGmzUQAadcIx7JpJ8CRnkyFzKueQs8wMn+dKPZu15PMzg07R
 Vpz0cLivmnwjydAC33wcris+fzWS61Rx/7Z43PVT557/SJZN3Gp5TKwqOOn5QdYQ294A
 2QDKaAWKXkms2itG5cI1JQ026F01x79xvPR5GS8zU7iblXlxPo6qYidVw8vtqcH4ayt1
 LmRbSBCF89ikeq2j4vR4b4MZj6Tkzj68w+cTMskMDLymIagUqi4vsVjxQv8cYO8qgdwA
 VJ0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGgkyIIxmjgFxx+5nmQub7pBZDzrzgSiAkKI84/yBCTAKvgEGQkfa65NKfCv/9LdguBFkHuEqomZjhow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywwlo8b1c7PiImGt6Spdce+dRj2AWE38QkL+MG+85gzTk6m+6vf
 zNu+f35UrCWv+Kl4cWbRpvJkX/oEdZh0Q3TrSzsOZCGWDkNtqZDr0Fc1rULWMMzIzQ4=
X-Gm-Gg: ATEYQzxXid+FQM9lwEkLZCeTTT/xzpxIIl6E5I58qNb/fEfrymRCBqRXi6g/fDIHuIZ
 xpyOx5UzzBfG7QIF+KZFhv0eyAUPpiPX49UwVvuuVucBYbBauOjvcFAcSUMHoqKDSq58tPYMWnA
 reF4D8tfZDK7khBI6L95tm7IFuVZ0Sqh2sHBm4hqGvZigJ8nZoLz3hl273Zzo6QqzoJtCl5VF+P
 Hr+1n0f2Ec0bv1v3o0W93qsg1x91NPJbNTEyHYaBBgFKCV6G4PCFJZDDQV2JSCKEna30BnZdpTB
 e4+rvhPx1yMjWTqQC1CU3RCgjpHQ144VBFZ+M1O/odKZFcepP4dG+EexG/Trp7KFKLvNgWmQnkw
 MRRloq5oPZ5QSQ4lPZ3IH+AMgiK5Kral6IFy9H0Ga3bqUahbn/lzjgNsevKylKb+zFjQtQvyPRm
 NbvSlu73wL/Ae70B4fj/vBa37tE847F2EGWBU7sd2hvffDDKADgABbTM83FjO1fJKzQ30=
X-Received: by 2002:a05:600c:810c:b0:485:3e00:9440 with SMTP id
 5b1f17b1804b1-486fee1af0bmr6999785e9.24.1773953846113; 
 Thu, 19 Mar 2026 13:57:26 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:57:25 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:30 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-8-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=IsUyr94uAbhBQSS9jsTFSHJPICURKHi5YxAKX4Vf8eI=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yXy5y5tOcrYem5L3KWG3osXTpDXskYqipYIBGazNl
 66J/o/oKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABPxuMnIsJjNYE1YT8rRht/B
 iaabPVzeHzxb8nBHy5roHxz3ItauPsbwV+QhZ1PalOcfmM99MD7zIHuKzKrIe+LcoT92tka6xfm
 0JgAA
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
Subject: [Uboot-stm32] [PATCH RFC 08/40] compat: add kref implementation
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,linaro.org:email,linaro.org:mid,kroah.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,osdl.org:email]
X-Rspamd-Queue-Id: D44BF2F03CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a very basic port of Linux' kref, we don't actually need atomics
so we just use a simple counter. This is used by CCF to free unused
clocks.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 include/linux/kref.h | 124 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/include/linux/kref.h b/include/linux/kref.h
new file mode 100644
index 000000000000..30927047d549
--- /dev/null
+++ b/include/linux/kref.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * kref.h - library routines for handling generic reference counted objects
+ *
+ * Copyright (C) 2004 Greg Kroah-Hartman <greg@kroah.com>
+ * Copyright (C) 2004 IBM Corp.
+ *
+ * based on kobject.h which was:
+ * Copyright (C) 2002-2003 Patrick Mochel <mochel@osdl.org>
+ * Copyright (C) 2002-2003 Open Source Development Labs
+ */
+
+#ifndef _KREF_H_
+#define _KREF_H_
+
+#include <linux/compat.h>
+
+struct kref {
+	long refcount;
+};
+
+#define KREF_INIT(n)	{ .refcount = REFCOUNT_INIT(n), }
+
+/**
+ * kref_init - initialize object.
+ * @kref: object in question.
+ */
+static inline void kref_init(struct kref *kref)
+{
+	kref->refcount = 1;
+}
+
+static inline unsigned int kref_read(const struct kref *kref)
+{
+	return kref->refcount;
+}
+
+/**
+ * kref_get - increment refcount for object.
+ * @kref: object.
+ */
+static inline void kref_get(struct kref *kref)
+{
+	kref->refcount++;
+}
+
+/**
+ * kref_put - Decrement refcount for object
+ * @kref: Object
+ * @release: Pointer to the function that will clean up the object when the
+ *	     last reference to the object is released.
+ *
+ * Decrement the refcount, and if 0, call @release.  The caller may not
+ * pass NULL or kfree() as the release function.
+ *
+ * Return: 1 if this call removed the object, otherwise return 0.  Beware,
+ * if this function returns 0, another caller may have removed the object
+ * by the time this function returns.  The return value is only certain
+ * if you want to see if the object is definitely released.
+ */
+static inline int kref_put(struct kref *kref, void (*release)(struct kref *kref))
+{
+	if (--kref->refcount == 0) {
+		release(kref);
+		return 1;
+	}
+	return 0;
+}
+
+/**
+ * kref_put_mutex - Decrement refcount for object
+ * @kref: Object
+ * @release: Pointer to the function that will clean up the object when the
+ *	     last reference to the object is released.
+ * @mutex: Mutex which protects the release function.
+ *
+ * This variant of kref_lock() calls the @release function with the @mutex
+ * held.  The @release function will release the mutex.
+ */
+static inline int kref_put_mutex(struct kref *kref,
+				 void (*release)(struct kref *kref),
+				 struct mutex *mutex)
+{
+	return kref_put(kref, release);
+}
+
+/**
+ * kref_put_lock - Decrement refcount for object
+ * @kref: Object
+ * @release: Pointer to the function that will clean up the object when the
+ *	     last reference to the object is released.
+ * @lock: Spinlock which protects the release function.
+ *
+ * This variant of kref_lock() calls the @release function with the @lock
+ * held.  The @release function will release the lock.
+ */
+static inline int kref_put_lock(struct kref *kref,
+				void (*release)(struct kref *kref),
+				spinlock_t *lock)
+{
+	return kref_put(kref, release);
+}
+
+/**
+ * kref_get_unless_zero - Increment refcount for object unless it is zero.
+ * @kref: object.
+ *
+ * This function is intended to simplify locking around refcounting for
+ * objects that can be looked up from a lookup structure, and which are
+ * removed from that lookup structure in the object destructor.
+ * Operations on such objects require at least a read lock around
+ * lookup + kref_get, and a write lock around kref_put + remove from lookup
+ * structure. Furthermore, RCU implementations become extremely tricky.
+ * With a lookup followed by a kref_get_unless_zero *with return value check*
+ * locking in the kref_put path can be deferred to the actual removal from
+ * the lookup structure and RCU lookups become trivial.
+ *
+ * Return: non-zero if the increment succeeded. Otherwise return 0.
+ */
+static inline int kref_get_unless_zero(struct kref *kref)
+{
+	return kref->refcount ? kref->refcount++ : 0;
+}
+#endif /* _KREF_H_ */

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
