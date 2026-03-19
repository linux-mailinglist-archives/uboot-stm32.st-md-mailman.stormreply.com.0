Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBZKI8QXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB92F03AD
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD7B9C87EC8;
	Mon, 23 Mar 2026 10:36:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D47DC87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:56:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so797130f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953818; x=1774558618;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4ySESJfourxrh2m62qey3M/YF6AEV8fxCE1YjUIBwGs=;
 b=GD7QWOXaYqWPJgzPSuTU/IgT+9p1xuzNtqG1Mm44HdBk1idjIPrjm34/cr3d2bglbB
 H0b/mi1PPOVl2WEeupFHjklclb5YesHHCkY80ufEz08eIcU0a8K7AsGK6ANrbUYEcIk3
 1Rf1BKxlerd0u3079vtMg7DVsI3/vZPhLsa1rOR0a1OfzI048SqCBJ1pEaD0AKwxfAI7
 tfy0ObgtTKw5QN/cJK0kFYa+fmKiP844LVdFYMjHRnMmQT1l/hG6GfLN4kOE+5bKlYl3
 niMKjoBZiRd0Va026EWIL072avsNzhXbOHal/yJjFjOG1Srv6FZWpOPCHlA7IVX+Cr10
 S8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953818; x=1774558618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4ySESJfourxrh2m62qey3M/YF6AEV8fxCE1YjUIBwGs=;
 b=OehXgZYDJuYn0JmQELYz9tojdI02/7RcNipFlSg6/7Dbyz/BM/IaC5D/+WmkxgLy9K
 CScCWyAZV/mDxhHhxlb5OIC+X+N0Qxo0UKU4svZcu/HYia4KoTJ7gMXomw8sstL/rDmZ
 rYr4mdvG2gonmD2f0FI357Ms4bW7xlhECAlkPoD8JeVEzqZfyi90jHxuD1PPymPDGzvo
 T59iTTna2zQV16yjk/cdK72O89bh6QWLAKLAOvO6RKooIuxWbU+8DYlCoXoH7DMtl/XD
 fzRwhc3p7cpna74XmJ08MUUI3sCk/RPussg5TRxcc42m9lUdA651L7o/WPGpgB94y5MR
 nCQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Ld19fxirZ+xIt6tHrORtnh56qwOi+JD9zCGI/PJqHbfppCz2l+MCSAXW3PF0dGgN/2xyc4iUmJDwgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwD2378rKwIbG3hdPRuOa6eByJF73XIX4qjEBkruoeZ8ybPFlmn
 5dm9PIfein+EV4MT3VaPMkZYPr2d8AEMTk3FNRQ+Be0jTQuw1tEItYy9zepAztvCz70=
X-Gm-Gg: ATEYQzy1nS++YuAsZRYoGMJaK6vntJUYLOES28FRt48NplVcMrNJoI+/siOpK5Eblod
 AZaAOljHsVAsWyr1k0lkVYJxcFPekGtGd771g/TnlegY9hOqJxou2Umf7/SNq88ZlQ3+nazmxBM
 UE1ZhGo6AbwFNZLnFFiTM6ZFTr94DYmJDjFhRZrZkqfY9T2eJ8+6Z5EXu3HZTyIJSp6cKAPf/gK
 uL+5iGqxOyrzpZdgSsFYpjflHOh9fE4GE66W766yMqM8qHb5NNXw3o+cxoVNMljHx1KvXG1KScf
 A9y1t5oSmw/QnksGLGCzzBkfT3KUu9Xth12EPkTEz1ermLp32oYTZ5yp6RBeW7P6rA98dWvZS4b
 pL5s625/pPeIrNSDeXf1iMjkg4ZYUujq+6CooKpMzc5gKhnxWW+lf19fhsMDWQBmSwMqh+Nd8zY
 PiYKmy4sobnD7NPP1EyejAoIRNGsfLuyu2Ynr+GnkybKWu2ft+3zO9e30jzCVnmSuJsCU=
X-Received: by 2002:a05:6000:4203:b0:439:d750:42e3 with SMTP id
 ffacd0b85a97d-43b6427576fmr1301743f8f.25.1773953817871; 
 Thu, 19 Mar 2026 13:56:57 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:56:57 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:23 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-1-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=rEJNtXZP5+H5gwqn8qXTXflA9ZA9fkONh6/nGZHH35Y=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9ybyf+o9MPLX7qcBkkZqeKOVH5zuNuUVy7mxfkCHLq
 aksqLK/o5SFQZCDQVZMkUX8xDLLprWX7TW2L7gAM4eVCWQIAxenAEzknB4jw/pH62KlVzw72OBy
 ppHzpZKQaNukswwLpt48M6vh7cfX+T6MDHPYNuwR1ZOyjLJ5dp656cTlRyziG/ffnVTI8J+9yGK
 fvwwA
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
Subject: [Uboot-stm32] [PATCH RFC 01/40] vsprintf: add %pOF
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,linaro.org:email,linaro.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 51AB92F03AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This prints a full ofnode path.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 lib/vsprintf.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index c7340a047b2e..49dc9c38c652 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -25,8 +25,13 @@
 #include <linux/err.h>
 #include <linux/types.h>
 #include <linux/string.h>
 
+/* For %pOF */
+#if CONFIG_IS_ENABLED(OF_CONTROL)
+#include <dm/ofnode.h>
+#endif
+
 /* we use this so that we can do without the ctype library */
 #define is_digit(c)	((c) >= '0' && (c) <= '9')
 
 static int skip_atoi(const char **s)
@@ -437,8 +442,32 @@ static char *uuid_string(char *buf, char *end, u8 *addr, int field_width,
 	return string(buf, end, uuid, field_width, precision, flags);
 }
 #endif
 
+#if CONFIG_IS_ENABLED(OF_CONTROL) && !defined(API_BUILD)
+static char *ofnode_string(char *buf, char *end, ofnode *dp, int field_width,
+				int precision, int flags)
+{
+#define NP_PATH_MAX 64
+	char str[NP_PATH_MAX] = { 0 };
+	const char *err = "...";
+
+	/* If dp == NULL output the string '<NULL>' */
+	if (!dp || !ofnode_valid(*dp))
+		return string(buf, end, NULL, field_width, precision, flags);
+
+	/* Get the path and indicate if it got cut off */
+	if (ofnode_get_path(*dp, str, NP_PATH_MAX)) {
+		str[NP_PATH_MAX - 1] = '\0';
+		char *p = str + min((NP_PATH_MAX - 2) - strlen(err), strlen(str));
+		memcpy(p, err, strlen(err) + 1);
+	}
+
+	return string(buf, end, str, field_width, precision, flags);
+#undef NP_PATH_MAX
+}
+#endif
+
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
  * by an extra set of alphanumeric characters that are extended format
  * specifiers.
@@ -472,8 +501,16 @@ static char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 #if CONFIG_IS_ENABLED(EFI_DEVICE_PATH_TO_TEXT) && !defined(API_BUILD)
 	case 'D':
 		return device_path_string(buf, end, ptr, field_width,
 					  precision, flags);
+#endif
+/* Device paths only exist in the EFI context. */
+#if CONFIG_IS_ENABLED(OF_CONTROL) && !defined(API_BUILD)
+	case 'O':
+		if (fmt[1] == 'F')
+			return ofnode_string(buf, end, ptr, field_width,
+					  precision, flags);
+		break;
 #endif
 	case 'a':
 		flags |= SPECIAL | ZEROPAD;
 

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
