Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGM7M8YXwWmbQgQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C12F0431
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Mar 2026 11:36:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21B48C8F265;
	Mon, 23 Mar 2026 10:36:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00293C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:58:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43b48ac2727so992321f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773953922; x=1774558722;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SQ5hNGwzZKOOoHPheDCQ+BMmkBCQHsp6Shs7hnz6gBo=;
 b=Lf25s9SmSL71uSBYugE04tZJaM880lczOvuIWSQwsh/4yHwdjkLvW+6n3xvdZGSDyi
 AgFAKLCQSTQE6WJedmjwj4UgaFIUekxQpnaPBRjwTxo39OYj5kzW5cOhSjTFkkXFxtw7
 TTMpi8ZKqeyL/y+uDaF85ZOKJsZ36V2ZC0H+9hNNPeGJBYNZXKM4Flyu6CNjIMi6IWSD
 c81/s3XbZZ/aDYGOnBvSzkygAq6Bf8a6SpUkxBnQfSuHOxZ010mMZk8kCKgUQ+eBSV2q
 IPCtwLHby9FvLeq3IKZcmjH0TkHgqLxghu0yGTCD/KOCg7TjWd4Ijkb5L78s4Y6uv+na
 g7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953922; x=1774558722;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SQ5hNGwzZKOOoHPheDCQ+BMmkBCQHsp6Shs7hnz6gBo=;
 b=HcDrPKI4IDcTbN87NU2ApKZ+alSpk3fwMKe/GtSgYZ8TKbf/MxYOQcnUsLEmrja99+
 459QXbOfVF2fzEKihrTB1ABniQWpGQyb9N4cONxhNc1gvOxhVxTm0dMVWznlYJZl7IjS
 vnq+Quj3xqk7XHl3JRb06zG4+3WA9QT5QhPTPkigNnpLAdjipZgIQceoHV4jFLUq9RKS
 ohqBcmyFcxN9LA5Lgjxn6WDz+qPGNEEfDA4zkW+m/OedsLMmb+hyTPYwttB+LGcxRfFP
 O58r1C9echzqLgL2j/WpR2aYUCKCYLZGLxVTvZh+Gg5uasbK7ZQt7Bb1RxlMufCiIpsU
 KMFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUONdcqxZlR0LKIYVLdFLqzo+hSeMnqJtPQ7LPdlcvHg9Opk+jtW9Kj6YXuvuIKlgASthXbhWzJGlzGCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwvVp+Vbge6Ab7/zc7ot823+IkMRxRA6owOnC8FKS7Tl4yh/si5
 Yu0YbIa3RgG0cTKsNjshl6P1nwkFicn2rN1mNyHKdH+O3fCsMCYe43v8hXFryafchZg=
X-Gm-Gg: ATEYQzzxw4vCTLqsTQFa8A/uAaC+ZHtpnKQVwzeGa94qmPMB9syjHjYJBCGAfmZQ6nr
 UYztWRyJgyKKTNrbxKDgbA+JbvOSoN8OX2DiCRTfrLdOHMMu2ThdfeW8emorhL1+zseWICXstEy
 Cr7ikhxhkMVyL8PpydRg+e7EYfqCrLw3rjUwfyThgECUdHtaPhbsIUHNmyMXkRn9xlq+5cbkRbn
 1mtsaEAriwXg1UpCkjejwvnxmLj3Ab8TGbOJs2Xzod5zSEcZvWPOvjJwN+izyP24V/RKDXSiAcX
 c7iTxUkgthm+Ugnf5ze+62O5VoFR51AHkUamtWWo4LgMYL4n9Rn+uRJNxL8AxX+u/ghD92x2TXW
 vdJdWcrmvX3exYgjIBDiOSTKI9O3399uc3Q09dMtVH7ZmYU1JXD0NBfMXz8g9mZMc5R5JsMKp3Z
 j012iNmr2oavv4+/1VZa7kiNUytrd785ZSezCJ+mfFvqLKWdqVEUMteLbspz/5wi2nckQ=
X-Received: by 2002:a05:6000:2086:b0:43b:48e3:fbee with SMTP id
 ffacd0b85a97d-43b64286faemr1463540f8f.37.1773953922222; 
 Thu, 19 Mar 2026 13:58:42 -0700 (PDT)
Received: from lion.localdomain (p4fc3dd39.dip0.t-ipconnect.de.
 [79.195.221.57]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm1191396f8f.32.2026.03.19.13.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:58:41 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Mar 2026 21:56:49 +0100
MIME-Version: 1.0
Message-Id: <20260319-casey-ccf-upstream-v1-27-4df2ee2226da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9183;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=6OFVGLUuDBpI47iCgfFJPpTCiQFHLj/akAdomSUFFRk=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhsw9yQKKN2+zTsjmTdzru/1c3Zf9BXlXeZv5NzEzrFJla
 /kecOF8RykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIKhlGhj7hd8GzLdRVz27u
 unH9SQR3qXf/qoV66wq5F5isil/hp8Hw32m1pvqd0Gncn/fExs1Yr760c2bFRYEbSty7ppw/sOR
 G9E0A
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
Subject: [Uboot-stm32] [PATCH RFC 27/40] RFC: clk/ccf: add UCLASS_CLK compat
	shim
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email,linaro.org:mid,stormreply.com:email,stormreply.com:url,clk.id:url]
X-Rspamd-Queue-Id: 792C12F0431
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When CCF_FULL is enabled, UCLASS_CLK drivers no longer work normally
since they're entirely invisible to CCF.

This compat shim attempts to bridge the gap by registering a clock
provider with CCF and register clk_hw's on-demand, mapping them
to individual clk IDs of the underlying UCLASS_CLK device. It then
translates between clk_ops and clk_ops_uboot so that clk functions work
as expected.

It's not clear if there is a need for this shim, or if platforms would
instead adjust all of their clock drivers at once. It hasn't been
extensively tested but is provided as-is in case it's useful.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 drivers/clk/ccf/Kconfig  |   7 ++
 drivers/clk/ccf/Makefile |   1 +
 drivers/clk/ccf/clk.h    |   6 ++
 drivers/clk/ccf/compat.c | 227 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-uclass.c |   3 +
 5 files changed, 244 insertions(+)

diff --git a/drivers/clk/ccf/Kconfig b/drivers/clk/ccf/Kconfig
index ec5d2d91b870..4ae131c843a9 100644
--- a/drivers/clk/ccf/Kconfig
+++ b/drivers/clk/ccf/Kconfig
@@ -5,4 +5,11 @@ config CLK_CCF_FULL
 	  Enable this option if you want to use the full Linux kernel's Common
 	  Clock Framework [CCF] code in U-Boot. This is a full API compatible
 	  port as opposed to U-Boot "uCCF", drivers must register clocks at
 	  runtime and should not use UCLASS_CLK.
+
+config CLK_CCF_FULL_COMPAT
+	bool "U-Boot clk compat shim for Common Clock Framework [CCF] clocks"
+	depends on CLK_CCF_FULL
+	help
+	  Enable this option if you want to use U-Boot UCLASS_CLK clocks together
+	  with Linux CCF clocks
diff --git a/drivers/clk/ccf/Makefile b/drivers/clk/ccf/Makefile
index a337b9f29d7a..39879b34e645 100644
--- a/drivers/clk/ccf/Makefile
+++ b/drivers/clk/ccf/Makefile
@@ -14,4 +14,5 @@ obj-y += clk.o \
 	clk-fixed-rate.o
 
 obj-$(CONFIG_CLK_COMPOSITE_CCF) += clk-composite.o
 
+obj-$(CONFIG_CLK_CCF_FULL_COMPAT) += compat.o
diff --git a/drivers/clk/ccf/clk.h b/drivers/clk/ccf/clk.h
index 72607020ed8e..f4cdc51459b5 100644
--- a/drivers/clk/ccf/clk.h
+++ b/drivers/clk/ccf/clk.h
@@ -38,8 +38,14 @@ int clk_hw_create_clk_uboot(struct clk *clk, struct clk_hw *hw)
 }
 void __clk_put(struct clk *clk) { }
 #endif
 
+#if CONFIG_IS_ENABLED(CLK_CCF_FULL_COMPAT)
+void clk_ccf_full_setup_compat(struct udevice *dev);
+#else
+static inline void clk_ccf_full_setup_compat(struct udevice *dev) { }
+#endif
+
 // Linux compat
 
 #define clk_prepare_lock()
 #define clk_prepare_unlock()
diff --git a/drivers/clk/ccf/compat.c b/drivers/clk/ccf/compat.c
new file mode 100644
index 000000000000..3059de04f6ef
--- /dev/null
+++ b/drivers/clk/ccf/compat.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Linaro Ltd.
+ *
+ * CCF compat for U-Boot UCLASS_CLK type clocks
+ */
+
+#define pr_fmt(fmt) "[CCF Compat] "fmt
+
+#include <dm/devres.h>
+#include <dm/ofnode.h>
+#include <linux/clk-provider.h>
+#include <linux/clk/clk-conf.h>
+#include <linux/compat.h>
+#include <linux/device.h>
+#include <linux/printk.h>
+
+#include "clk.h"
+
+struct ccf_compat_hw {
+	struct clk_hw hw;
+	ulong id;
+	ulong data;
+};
+
+struct ccf_compat_data {
+	struct udevice *dev;
+	int num_clks;
+	struct ccf_compat_hw hws[];
+};
+
+static inline struct clk hw_to_clk(struct clk_hw *hw)
+{
+	struct clk clk;
+	struct ccf_compat_hw *ccf_hw = container_of(hw, struct ccf_compat_hw, hw);
+
+	clk.dev = hw->clk->dev;
+	clk.id = ccf_hw->id;
+	clk.data = ccf_hw->data;
+
+	return clk;
+}
+
+static inline const struct clk_ops_uboot *clk_dev_ops(struct udevice *dev)
+{
+	return (const struct clk_ops_uboot *)dev->driver->ops;
+}
+
+
+static int ccf_compat_clk_enable(struct clk_hw *hw)
+{
+	struct clk clk = hw_to_clk(hw);
+	const struct clk_ops_uboot *ops = clk_dev_ops(clk.dev);
+
+	return ops->enable(&clk);
+}
+
+static void ccf_compat_clk_disable(struct clk_hw *hw)
+{
+	struct clk clk = hw_to_clk(hw);
+	const struct clk_ops_uboot *ops = clk_dev_ops(clk.dev);
+	int ret;
+
+	ret = ops->disable(&clk);
+	if (ret < 0)
+		pr_err("Couldn't disable clk %s: %d\n", clk_hw_get_name(hw), ret);
+}
+
+static long ccf_compat_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	struct clk clk = hw_to_clk(hw);
+	const struct clk_ops_uboot *ops = clk_dev_ops(clk.dev);
+	long _rate;
+
+	if (!rate && *parent_rate)
+		rate = *parent_rate;
+
+	_rate = ops->round_rate(&clk, rate);
+	if (rate > 0)
+		*parent_rate = _rate;
+
+	return _rate;
+}
+
+static int ccf_compat_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct clk clk = hw_to_clk(hw);
+	const struct clk_ops_uboot *ops = clk_dev_ops(clk.dev);
+
+	req->rate = ops->get_rate(&clk);
+
+	return 0;
+}
+
+static int ccf_compat_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct clk clk = hw_to_clk(hw);
+	const struct clk_ops_uboot *ops = clk_dev_ops(clk.dev);
+	long _rate;
+
+	_rate = ops->set_rate(&clk, rate);
+
+	return _rate < 0 ? _rate : 0;
+}
+
+static int ccf_compat_clk_init(struct clk_hw *hw)
+{
+	struct clk clk = hw_to_clk(hw);
+	const struct clk_ops_uboot *ops = clk_dev_ops(clk.dev);
+
+	return ops->request(&clk);
+}
+
+static struct clk_ops ccf_compat_ops = {
+	.enable = ccf_compat_clk_enable,
+	.disable = ccf_compat_clk_disable,
+	.round_rate = ccf_compat_clk_round_rate,
+	.determine_rate = ccf_compat_clk_determine_rate,
+	.set_rate = ccf_compat_clk_set_rate,
+	.init = ccf_compat_clk_init,
+};
+
+/* Find or allocate a new ccf_compat_hw */
+static struct ccf_compat_hw *ccf_compat_find_hw(struct ccf_compat_data *compat, ulong id,
+						ulong data)
+{
+	struct ccf_compat_hw *ccf_hw;
+	struct clk_init_data *init;
+	int ret;
+
+	for (int i = 0; i < compat->num_clks; i++) {
+		ccf_hw = &compat->hws[i];
+		if (ccf_hw->id == id && ccf_hw->data == data)
+			return ccf_hw;
+	}
+
+	/* We haven't been requested this clock before so we need to allocate it */
+
+	compat->num_clks += 1;
+	compat = devm_krealloc(compat->dev, compat->hws,
+			       sizeof(struct ccf_compat_data) +
+			       sizeof(struct ccf_compat_hw) * compat->num_clks, GFP_KERNEL);
+
+	ccf_hw = &compat->hws[compat->num_clks - 1];
+	ccf_hw->id = id;
+	ccf_hw->data = data;
+
+	/* Allocate init data for this clock */
+	init = devm_kzalloc(compat->dev, sizeof(struct clk_init_data) + 64, GFP_KERNEL);
+	init->ops = &ccf_compat_ops;
+	init->name = (char *)init + sizeof(struct clk_init_data);
+	snprintf((char *)init->name, 64, "compat-%s.%lu.%lu", compat->dev->name, id, data);
+
+	ccf_hw->hw.init = init;
+
+	/*
+	 * Register the new clock we just created so CCF will be able to find the clk_core for the
+	 * clk_hw we just created.
+	 */
+	ret = devm_clk_hw_register(compat->dev, &ccf_hw->hw);
+	if (ret) {
+		printf("Failed to register hw clock %s, err=%d\n", init->name, ret);
+		ccf_hw = NULL;
+	}
+
+	devm_kfree(compat->dev, init);
+	return ccf_hw;
+}
+
+static struct clk_hw *ccf_compat_get_hw(struct ofnode_phandle_args *clkspec, void *_data)
+{
+	struct ccf_compat_data *compat = _data;
+	struct ccf_compat_hw *ccf_hw;
+	struct udevice *dev = compat->dev, *consumer;
+	const struct clk_ops_uboot *uboot_ops = dev->driver->ops;
+	struct clk clk = { 0 };
+	ulong id, data = 0;
+	int ret;
+
+	/* Determine the clk ID and extra data */
+	if (uboot_ops->of_xlate) {
+		ret = device_get_global_by_ofnode(clkspec->node, &consumer);
+		if (ret) {
+			pr_err("%s: couldn't find consumer device, err %d\n",
+			       dev->name, ret);
+			return ERR_PTR(ret);
+		}
+		clk.dev = consumer;
+
+		ret = uboot_ops->of_xlate(&clk, clkspec);
+		if (ret) {
+			pr_err("%s: of_xlate() failed err %d\n", dev->name, ret);
+			return ERR_PTR(ret);
+		}
+
+		id = clk.id;
+		data = clk.data;
+	} else {
+		id = clkspec->args[0];
+	}
+
+	/* Find or create a new ccf_compat_hw for this specific clk */
+	ccf_hw = ccf_compat_find_hw(compat, id, data);
+	if (!ccf_hw)
+		return ERR_PTR(-ENOENT);
+
+	return &ccf_hw->hw;
+}
+
+/**
+ * Shim UCLASS_CLK providers into CCF_FULL so that CCF clocks
+ * can work alongside non-CCF clocks.
+ *
+ * This is ONLY compatible with CONFIG_CLK_CCF_FULL!
+ */
+void clk_ccf_full_setup_compat(struct udevice *dev)
+{
+	struct ccf_compat_data *compat;
+
+	compat = devm_kzalloc(dev, sizeof(*compat), GFP_KERNEL);
+	compat->dev = dev;
+
+	/* Register a clock provider with CCF */
+	devm_of_clk_add_hw_provider(dev, ccf_compat_get_hw, compat);
+}
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index d54d76745560..065c80e8c2b4 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -894,8 +894,11 @@ int clk_uclass_post_probe(struct udevice *dev)
 	 * using assigned-clocks
 	 */
 	clk_set_defaults(dev, CLK_DEFAULTS_POST);
 
+	if (CONFIG_IS_ENABLED(CLK_CCF_FULL))
+		clk_ccf_full_setup_compat(dev);
+
 	return 0;
 }
 
 UCLASS_DRIVER(clk) = {

-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
