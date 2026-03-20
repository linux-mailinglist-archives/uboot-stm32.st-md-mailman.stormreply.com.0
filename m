Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILztDUt7vWmt9wIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Mar 2026 17:52:27 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EF2DE07F
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Mar 2026 17:52:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75DA5C87EBD;
	Fri, 20 Mar 2026 16:52:26 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE1CFC36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 16:52:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b97c44417ffso77195166b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 09:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774025545; cv=none;
 d=google.com; s=arc-20240605;
 b=ai0dmuB7I71balEwa3wzREftpa8iOZx4PCaGVXEVQ6LNwmLxYsO+zBHC1Kvc6BpDo+
 aYvM8kS1haxH/WCfD51RiFW0p2QAhOwujHnDqMuIDaJ6UrDQBchVF2wIsq87/TankbBk
 JMQrLAsaMdbGNOp8J45Y/D7hUKdTAInbSjJUvUARcb5OVhgE5/9Z59wbVo9YecaEa8uO
 /dh/SEODSI4/rM8EUQ1Tsd8pPzYbeONGLyAA7HYRGNa1TtzBw24vbn0Vbd5np95rCBI+
 /Va1U8W0VdjFWfCrulJ8RIC7yvbYsDn1ZHlgxPux63Etrn8vDm9o8tEs+0iW5vE1PKdk
 8WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ogAQHzvDO6Z2mtpWF4WWMAnj55zQVH/abZq6g+QI030=;
 fh=JEEz+lzFIGh2XjeFx2xnItI4M/BNNxnXGe0pZA9szhQ=;
 b=OjgMXpF6pVqUmQbe5ofL+9dXd/5kmMEKEQTgOLGje9lWlLBAQroZ8mgTDK9qjVvWh0
 oSvmhawa4LtzxogZ6P/FHu+Uzadh5h+jHlS49gPEdcpmh10znkpPJkcA0Bme7UFYLIjV
 bbuIlwA+TrJ5Tlm+0hiViA0gVgq+fl4dGjz/51GIxxdGbORcmMTySRL74j3ER4C94Y/c
 cWZkF5mrdOdT8IFw/RWcKuXdiMM5URZH2TfjnRBbuM24YU/hyEJnw/v4y1VtSW2GKRvv
 fUtWXO8KrC8SwjPisdPRIvvyW2jTQWyjp51BSnAbStfczjcm/IrwCYtisBHcV1hNl2m+
 lb8w==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1774025545; x=1774630345;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ogAQHzvDO6Z2mtpWF4WWMAnj55zQVH/abZq6g+QI030=;
 b=km6JEi0XPgQN4H44FZd5yUhm1ZDjzh4g7Q1WTAanpfu+aeX9J2Gy8UpslIVT/Dw4qI
 jRdtSo6nWNqeK+Pa8jjgTQJCZE8A1h/VoQV12PrtLtC+Rz87cAfX4kAT5rQ7WvKsh3p3
 cAtas4TfiwEJN8CPnPCVqnAmfakuUEtjZcxBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774025545; x=1774630345;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ogAQHzvDO6Z2mtpWF4WWMAnj55zQVH/abZq6g+QI030=;
 b=RUZSWsHSLtM+FTAo/lmHB67lsqDjyhH81p832dLLCbFNSdTaRFlqwkuffpyuyqLbkf
 WRCDRkcwIoiN5UKKStSFX8OKaQUoKNRnrfN+H/kYGefF03jr65nKvG+I7x3xk26pV2BE
 4JFGEETSvCz2Ye2Qz30tmN6Tl+R0Ly8hmJpo8oE67pqhLDtEDPF+ii0avsVfCHvEJiVS
 /tf6w2AvbbQ+gJ9/NMcdB3EJPwcQYk6LH25YAcGlUV0YZ0DzM4L2KWFG0WAPt/77zKqm
 R4GFxIIg788hktXGsU4KGRZEUONBnen8GM8Fh0GX0CIpg0pcJsxJDxcNc4SI1QpJhxnK
 WAdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjFPe6LADSYRS5Td4ckrmz+TG1PAgRyHXKslCCu4KbUKzqlluiH7OD3Ufb7o/jPGDOAxq3cCsX+4DNRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0oemPd9I/vLbPtG609mXxC5SzbSCiDjp9vG6U6pvBSsCxLABD
 ztGylIuURBCg7ED+3IDxZsVSMKv+yeMba4h1UDUbCUEGeeTWqdoJTuu3NTgUj9OPQIQ3ULUEZAA
 PsHJcVMfQuMZe475juoih6JdfsySuuj2oA2elB77x
X-Gm-Gg: ATEYQzzB8GUbpmRimnfTtyDP4KlyTDXgbXLM6LQaCpEm+BvN7LyQjokoZdxbJILxnZ8
 X5rOnAe++VfE9usDLboZ9ej0FxNZsYmVJSB34pRIPvxXtDpuDfH8RnkPU+S7r0sN49JbHCBKty2
 L4Yk2hh+yFC70fm/i8gjXU4UJrqc6xwxZ/RJw+z6jqFxES97M7QKshCv//S9thvoH9l2L4rX+Vp
 DuaAJcRxc/6EyqDJel2oU5YiGG1GVch5kVUYrJJ9G+GDT/IoCAWTTRTISx/x2ys8mDhCkSqKiOC
 Ur2I7b3UEgU50a2FwEo=
X-Received: by 2002:a17:906:f0d8:b0:b98:4b8:1046 with SMTP id
 a640c23a62f3a-b982f2edce8mr188687866b.31.1774025544622; Fri, 20 Mar 2026
 09:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
In-Reply-To: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Mar 2026 10:52:12 -0600
X-Gm-Features: AaiRm52WedrmCbbdHbA3EK3NH8g7GEWpMQQboV0WG4VAi5OVQf0TPWMTfopz5AU
Message-ID: <CAFLszTimOLhu=n5jrztE9QqbtXRDjutf_WiKLGMVe4ODJOc8wA@mail.gmail.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Hal Feng <hal.feng@starfivetech.com>, u-boot-qcom@groups.io,
 David Lechner <dlechner@baylibre.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Stephen Boyd <swboyd@chromium.org>, Jens Reidel <adrian@mainlining.org>,
 Heiko Schocher <hs@nabladev.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 David Wronek <david.wronek@mainlining.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 u-boot-amlogic@groups.io, Sam Shih <sam.shih@mediatek.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Greg Malysa <malysagreg@gmail.com>,
 linux@analog.com, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, uboot-snps-arc@synopsys.com,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Tom Rini <trini@konsulko.com>, Peter Korsgaard <peter@korsgaard.com>,
 Philip Molloy <philip.molloy@analog.com>, Udit Kumar <u-kumar1@ti.com>,
 Romain Gantois <romain.gantois@bootlin.com>, Joel Stanley <joel@jms.id.au>,
 Dai Okamura <okamura.dai@socionext.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Paul Sajna <sajattack@postmarketos.org>, Paul Barker <paul@pbarker.dev>,
 Raymond Mao <raymondmaoca@gmail.com>, Jonathan Currier <dullfire@yahoo.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Robert Marko <robert.marko@sartura.hr>, Thierry Reding <treding@nvidia.com>,
 Shmuel Leib Melamud <smelamud@redhat.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Nishanth Menon <nm@ti.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Yao Zi <me@ziyao.cc>,
 Sam Day <me@samcday.com>, Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 Naman Trivedi <naman.trivedimanojbhai@amd.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Weijie Gao <weijie.gao@mediatek.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, Andrew Davis <afd@ti.com>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Manorit Chawdhry <m-chawdhry@ti.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 00/40] clk: port full Linux Common
	Clock Framework to U-Boot
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
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:casey.connolly@linaro.org,m:peng.fan@nxp.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:conor.dooley@microchip.com,m:finley.xiao@rock-chips.com,m:miquel.raynal@bootlin.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:hal.feng@starfivetech.com,m:u-boot-qcom@groups.io,m:dlechner@baylibre.com,m:Eugeniy.Paltsev@synopsys.com,m:swboyd@chromium.org,m:adrian@mainlining.org,m:hs@nabladev.com,m:BMC-SW@aspeedtech.com,m:ilias.apalodimas@linaro.org,m:gabriel.fernandez@foss.st.com,m:padmarao.begari@amd.com,m:david.wronek@mainlining.org,m:hayashi.kunihiko@socionext.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:seanga2@gmail.com,m:u-boot@lists.denx.de,m:manivannan.sadhasivam@linaro.org,m:u-boot-amlogic@groups.io,m:sam.shih@mediatek.com,m:michael@amarulasolutions.com,m:ansuelsmth@gmail.com,m:chenjh@rock-chips.com,m:Ryan.Wanner@microchip.com,m:iwamatsu@nigauri.org,m:senthilnathan.thangaraj@amd.com,m:zhangqing@rock-chips.com,m:minda.ch
 en@starfivetech.com,m:philipp.tomsich@vrull.eu,m:msp@baylibre.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:neil.armstrong@linaro.org,m:ryan_chen@aspeedtech.com,m:malysagreg@gmail.com,m:linux@analog.com,m:quic_varada@quicinc.com,m:liviu.dudau@foss.arm.com,m:quentin.schulz@cherry.de,m:uboot-snps-arc@synopsys.com,m:varshini.rajendran@microchip.com,m:luca.weiss@fairphone.com,m:manikandan.m@microchip.com,m:trini@konsulko.com,m:peter@korsgaard.com,m:philip.molloy@analog.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:joel@jms.id.au,m:okamura.dai@socionext.com,m:mikhail.kshevetskiy@iopsys.eu,m:sajattack@postmarketos.org,m:paul@pbarker.dev,m:raymondmaoca@gmail.com,m:dullfire@yahoo.com,m:ycliang@andestech.com,m:robert.marko@sartura.hr,m:treding@nvidia.com,m:smelamud@redhat.com,m:clamor95@gmail.com,m:nm@ti.com,m:valentin.caron@foss.st.com,m:me@ziyao.cc,m:me@samcday.com,m:aswin.murugan@oss.qualcomm.com,m:naman.trivedimanojbhai@amd.com,m:uboot-stm32
 @st-md-mailman.stormreply.com,m:marex@denx.de,m:jorge.ramirez@oss.qualcomm.com,m:ryder.lee@mediatek.com,m:loic.poulain@oss.qualcomm.com,m:jonas@kwiboo.se,m:weijie.gao@mediatek.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:balaji.selvanathan@oss.qualcomm.com,m:chunfeng.yun@mediatek.com,m:arturs.artamonovs@analog.com,m:sumit.garg@kernel.org,m:venkatesh.abbarapu@amd.com,m:vasileios.bimpikas@analog.com,m:GSS_MTK_Uboot_upstream@mediatek.com,m:yannick.fertre@foss.st.com,m:stephan.gerhold@linaro.org,m:afd@ti.com,m:rui.silva@linaro.org,m:patrick.delaunay@foss.st.com,m:m-chawdhry@ti.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,sntech.de,kernel.org,microchip.com,rock-chips.com,bootlin.com,aspeedtech.com,denx.de,starfivetech.com,groups.io,baylibre.com,synopsys.com,chromium.org,mainlining.org,nabladev.com,linaro.org,foss.st.com,amd.com,socionext.com,mailbox.org,gmail.com,lists.denx.de,mediatek.com,amarulasolutions.com,nigauri.org,vrull.eu,altera.com,analog.com,quicinc.com,foss.arm.com,cherry.de,fairphone.com,konsulko.com,korsgaard.com,ti.com,jms.id.au,iopsys.eu,postmarketos.org,pbarker.dev,yahoo.com,andestech.com,sartura.hr,nvidia.com,redhat.com,ziyao.cc,samcday.com,oss.qualcomm.com,st-md-mailman.stormreply.com,kwiboo.se,samsung.com,mentallysanemainliners.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[99];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[chromium.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_SPAM(0.00)[0.693];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,linaro.org:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CB2EF2DE07F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Casey,

On Thu, 19 Mar 2026 at 14:56, Casey Connolly <casey.connolly@linaro.org> wrote:
>
> This RFC provides a proof of concept for using the full Linux CCF in
> U-Boot and consequently porting full Linux clock drivers with extremely
> minimal changes.

As a general question, what is the boot flow for the Qualcomm devices
you are are targeting, i.e. where does U-Boot come in the chain from
reset? Does it use xPL?

>
> == Overview ==
>
> This RFC is pretty long but can be separated into a few chunks. The
> first patches relate to Linux API compatibility and just contain small
> self contained changes, these can go upstream regardless of CCF.
>
> The next group of changes prepare for importing CCF from Linux, the
> standalone fixed clock drivers are moved to clk/basic, the existing
> U-Boot CCF drivers are moved to clk/uccf, and struct clk_ops is renamed
> to clk_ops_uboot.
>
> Additionally, clk_set_rate() is changed so that it returns a signed
> long, since it can return negative values. This is also done to align
> with CCF but it's a standalone improvement nonetheless.

Agreed.

>
> The next changes import CCF from Linux 6.19 and then adjust it to
> compile and work with U-Boot. These commits are split up mostly to
> try and reduce the size. Finally clk-uclass is adjusted for CCF, this
> definitely will need some additional passes to be a bit cleaner.
>
> With CCF done, sandbox clk-ccf driver gets a CCF_FULL port, the clk_ccf
> tests are adjusted to pass.

Minor point - perhaps CLK_LINUX ? CCF_FULL seems cryptic to me and
some would argue that the existing CLK_CCF is already full..

>
> Lastly, a PoC port of Qualcomms Linux clock drivers is done, this
> only has sm8650 clocks but they serve the desired purpose. The changes
> necessary to the Linux drivers are mostly to deal with U-Boots driver
> model, the actual platform specific clock drivers require essentially
> zero changes!
>
> === Feedback ===
>
> I'd like to get feedback on the overall architecture and ideas, feel
> free to point out any dead code or printf's I forgot about, but I'll for
> sure do a more detailed cleanup before the next revision.
>
> I would definitely like to input on how to deal with clk-uclass, since
> it's now supporting 3 different clock frameworks, but I'm now sure how
> best to separate the code out without duplicating code.

Perhaps a justification can be expressed in terms of code size / capabilities:

Small - can boot in xPL from limited SRAM, only simple clocks
Medium - smaller code size but still provides good access to clocks
Large - Linux compatible, full capability but lots of code

>
> In terms of overall architecture, CCF is a departure from the uclass
> model that U-Boot has stuck too for so long. If this is a success then
> I think it could make a lot of sense to make similar changes for power
> domains and resets. I think this change offers a lot of additional
> flexibility which has been sorely missed.

While those are separate, does this mean that there will be a
significant delta from Linux's clock drivers on Qualcomm, or will it
be minor?
>
> == Motivation ==
>
> There were quite a few motivating factors behind this effort which I
> think provide useful context for this series:
>
> 1. Existing UCLASS_CLK support in U-Boot (even with U-Boots minimal CCF)
>    doesn't provide a fully cohesive API nor implement the necessary
>    functionality to support complex modern platforms without a lot of
>    additional effort.
>
> 2. While trying to enable display support on Qualcomm, it became clear
>    that U-Boots clock framework was a severe limiting factor,
>    particularly for more complicated setups like "bonded" dual-DSI.

It seems that 1 and 2 could be merged? The question here is how much
effort would someone want to put in. Providing an easy way to pull in
the Linux clock driver makes sense. Some people may wish to put in
effort to at least support the basic clocks for xPL, etc.

>
> 3. The current state of Qualcomm clock drivers in U-Boot is pretty poor,
>    as the old very basic driver code is being expected to support more
>    and more complicated usecases. Clock support is generally the most
>    complicated part of bringing up any new Qualcomm platform, so being
>    able to properly reuse Linux drivers with the familiar API greatly
>    reduces the amount of friction when working on U-Boot support for
>    complicated peripherals like the display.
>
> Consequently, My aim with this effort was primarily to provide API
> compatibility with Linux as much as possible, minimising the changes
> that have to be made to clock drivers to port them from Linux, and
> reducing the chance of introducing U-Boot specific bugs.
>
> === clk_ops/UCLASS_CLK ===
>
> CCF_FULL drivers should NOT use UCLASS_CLK, since CCF uses a totally
> independent clock API. If the clocks are provided by another device like
> a phy, they can simply be registered with the clk core the same way they
> are in Linux. Standalone clock drivers should use UCLASS_NOP.

Bypassing UCLASS_CLK entirely is a big departure. It means DM can't
track these clock devices properly - no uclass_find_device(), no
sequence numbers, no standard device iteration.

The suggestion to do the same for power domains and resets would
fragment driver model further.

How about having a single UCLASS_CLK_LINUX device?

>
> Clocks must all be registered during driver probe, the CCF will ensure
> that a given clock provider is probed (via a global ofnode -> device
> lookup) before checking the of_providers, thus making sure the clocks
> are registered so that the consumer can use them. There is currently no
> special handling for cyclical dependencies.

Driver model normally registers devices during a bind step, which
helps to remove the problem of cyclic dependencies. Is there any need
to wait until probe()? Also, can we statically declare it, to save
code size? Most of the definitions are static

The global ofnode -> device lookup to force probe ordering is
reinventing what DM already does with uclass probing. This feels like
it should integrate with DM rather than work around it.

>
> === struct clk ===
>
> It's definitely debatable if it makes sense to have 3 different structs
> for each clk (clk_hw, clk_core and clk). I do think clk_hw and clk_core
> are justified, since clk_hw is more tied to the hardware description and
> typically nested in a clk-specific descriptor while clk_core contains
> the internal runtime state of the clk which should remain private to
> CCF core.

Probably we should follow Linux, since we would start to lose the
benefit of your series if we merged two structs.

>
> It could make sense to merge clk and clk_core, but since struct clk is
> public in U-Boot, where it's an opaque pointer in Linux this would be
> a substantial effort. In Linux struct clk objects are allocated inside
> CCF, but in U-Boot they're allocated by the driver, this would need to
> be resolved before we investigate combining these structs.
>
> === Memory/perf overhead ===
>
> The memory and size overhead of CCF is undoubtably bigger than uCCF,
> although I suspect the difference is less than it might seem at
> first glance. In particular: clk_core is only ~50 bytes larger than
> struct udevice on ARM64, and an additional 120 bytes is saved for each
> U_BOOT_DRIVER used by uCCF.
>
> On the other hand, the CPU overhead is probably more significant,
> but not an unreasonable cost to ensure correctness and propagate rate
> changes across the clock tree.

We already struggle with slow pre-relocation performance, something I
have never really dug into.

>
> Just comparing the binary size of sandbox64_defconfig with uCCF vs
> CCF_FULL, CCF_FULL results in a 135k size increase in the binary. I
> haven't done any more detailed analysis here (still haven't got buildman
> to play nice...).

Sandbox may overestimate the size here, not sure. Ping on irc if you
need update with the buildman setup.

>
> === SPL ===
>
> This RFC doesn't have any SPL specific support, I think this role is
> better fulfilled by UCLASS_CLK.
>
> === U-Boot's old CCF port ===
>
> The original CCF port done for IMX platforms is vastly different in API,
> scope, and function to CCF_FULL, to differentiate I refer to it
> as "uCCF".
>
> I have kept support for this in and made it mutually exclusive with
> CCF_FULL. uCCF drivers have been moved to drivers/clk/uccf, with the new
> CCF port in drivers/clk/ccf.
>
> Included near the end of this series is a port of Sandbox's clk-ccf
> driver from uCCF over to CCF_FULL, this might be a useful reference for
> other drivers (although it's probably better to just adapt the Linux
> drivers).
>
> === Compat shim ===
>
> Lastly, this series includes a compat shim which allows UCLASS_CLK
> drivers to somewhat work with CCF, I would imagine this being useful
> if some generic peripheral device provides a clock for example, but in
> almost all cases I think it's better to implement a proper CCF clock
> device. Unless there is a particular usecase for this I would probably
> not include it in the next revision.
>
> == TODO/Outstanding issues ==
>
> * Clean up clk-uclass.c, does it make sense to somewhow split it in two?
> * Assess test coverage, have basic sandbox tests, would like to mostly
>   use integration tests (i.e. diff the clk summary) once more platforms
>   are supported.
> * pre-relocation support is currently missing, on Qualcomm at least I
>   would prefer to completely skip FDT scanning pre-reloc, there is a
>   patch in this series which does that. It is very non-trivial to try
>   and handle clocks pre-reloc.

Does this mean that only serial is needed and the clock for it is
already set up by some pre-U-Boot phase?

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
