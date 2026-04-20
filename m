Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DleLHRGE5mmPxgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFB43376C
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82633C57B41;
	Mon, 20 Apr 2026 19:43:20 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDBC9C57A51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 19:43:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ba51e69988aso400124666b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 12:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776714198; cv=none;
 d=google.com; s=arc-20240605;
 b=MIHQ9fRtS4+p9R0agWokreJ8z+87s1IzW+4Y3iR4vQJ6+IF/UZOYVKUwnD5GRlcotP
 MSyy+5GImiizZaRRQ81M4PrpD7UR85JrJBYsWlR5Pd6gaGt9sxxU2xTBYWq9lRpkuO9N
 VjOyjXqRYuZYhPiV3XYz7ROw41McOhXgxQg3+C8ei6J4OsGo/jHcKO1Iy/aBYo8woDkp
 ylYFyzd/ozFJybBz9QsTbi7jEn0MP725VToq3pejscBofwzAEMHLXy0NBgCr1XFyCyXo
 3HFDNVC7Bg6No6Fv9xKHfmduTK2wGG/uJjTpkiineA6O5uknm3mgtInsDt4HQ+onGTk2
 rHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0COehEj8osMi6SeSmatnPDaUACn0wAtDxKO5rh4YTV0=;
 fh=FM8wDZTWsGeo/s4aHmAiXBDXczDmSrW/znU94BTsZWo=;
 b=UANIj1XnBlCBiXJKQnOENvfkaafWUHYGrPrVLZUOujO6oRl3/O6V4PoKoUXCKnoWS0
 chO7d7s8dRv5rbNtTJnHe7KXW8DPdd7tqrTrcSxWXwprmOxIckQK9AzFD0aKw+E9Yplr
 0qekpyzlthr5OlQLxJ58fHDQ3R1QtKupfZltZZJzK7vdiJd478z2sE+bYeJDd0ddafnH
 yZ4xD0EN58UIXjSUs2pgffZNhKtiogBVsvCJ5o0tID9DBFWX6x1tD/I5bRZ3o28wiuTs
 JiEc/FT8cykHSdJTmb3WJoSU4Fl4ABalRkSDdchwnRhSSvvf7VExAyOPkCea7ZeOMcst
 9yeg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776714198; x=1777318998;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0COehEj8osMi6SeSmatnPDaUACn0wAtDxKO5rh4YTV0=;
 b=PcBbinbRZbJxRaeokSecCtqCoQQbJL1sN82RIWow6owk+opk9Ca3BNA6OcV13VysCk
 1DvijIxWGdWVPMaCRH6L27kWy2dI1wS1gVePkA5U5d5jQ/hoAK9hb4h5sMyooZaXH+Ic
 qnU4/QVx9XiY1xw3/PoDuVVWb2Za54VV1lilU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714198; x=1777318998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0COehEj8osMi6SeSmatnPDaUACn0wAtDxKO5rh4YTV0=;
 b=LOckGPEGZXXP1Rh4ckzZj+JU1D/bJRfuDYBEqn4USDntJ/lTNvKoTEdeZLNhB+cWhJ
 tPZwSAY2jgn04LE4Y3tGxgLbMyQNWMUtZGdWgVqeA9P9OO3mwfs2CfF7kdqjcly8GHIC
 4+W4Exz2w8mN0TV9DqlpkIPYp1WL3mjg6gtlaSLklHIUm07z3Uhs1km1puj9lWveW27h
 KUGCDuqDE04i9MGTmoGpq+lF0Rmi4egVZOmoDI8mUjRJ7qQQjUxyepi127IbNW/1j7Op
 f0uInr3vReCpsWv/TGLKUaSYJPlFpDTjKyIVn7kRl8pDUAJ4LXP1re4QpIXV93wMDsm1
 6dYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lU186WjMYMbbtv6AWXeuW8ODZiVw/Z+XkessZw9bUcGH3MDFyaI4a5scLZvQiHpteACgcBIgzhfU5wQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+ur2KfjZbEA71KRIMl/1aUZmxL8d21EwBib/+8MEblQvzauKY
 kASq5ZPLcTgP3RJycn9y9b63krI4f0eecLaZcXbgRDHlv4d4Q0Ts0VYqt7SluHJRjAWFqNHMNM8
 lFbBvtTqEoUiVmBjFQVhLbyEJxhIDF06h/IgFEY/c
X-Gm-Gg: AeBDieu/vZ8nBvrHHseGS1jk1NEfIMKkoJwLYhhBOS1Vr2sQZGA2cZygFFuGh+jkYxf
 XWLVXTQpgIEH3B24DgRLSKbqwsG0G0VBEJNF5Vkxo+0fC5mYPvbPGFFjt0x7Yu1YHhVG2mElcwu
 uBiy7GOanmxTiA+7ok6xW8BZro288ijGAH1PAvTEN0XC6Zq03fJCquGedEReB26XwdRCieKBaYm
 e1RCODzAxGOMjIVvVAlPYhFADjXqGcsjk45hD/yhJhpmgcHYkTsjRKIqMBacOMtBWkpOoe03wyY
 or1ir1TZPflJFdvEVeuz
X-Received: by 2002:a17:907:c9a2:b0:ba2:3f1b:1314 with SMTP id
 a640c23a62f3a-ba41ac0279cmr452040966b.33.1776714198180; Mon, 20 Apr 2026
 12:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-4-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-4-9900002d8e72@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2026 07:42:47 +1200
X-Gm-Features: AQROBzBYvgPmnQbd5S_FDsDhIFwEmbBXHNgkjUcnROJW46_PSae9JRvSy3giUNc
Message-ID: <CAFLszTgnOb+QYAu4bgVC8pQJq6po-noDnrxNVxLX1126m-D=oQ@mail.gmail.com>
To: foss+uboot@0leil.net
Cc: Peng Fan <peng.fan@nxp.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 David Lechner <dlechner@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Shantur Rathore <i@shantur.com>, Chintan Vankar <c-vankar@ti.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Anshul Dalal <anshuld@ti.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Heiko Schocher <hs@nabladev.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>,
 Padmarao Begari <padmarao.begari@amd.com>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Kever Yang <kever.yang@rock-chips.com>,
 Benjamin ROBIN <dev@benjarobin.fr>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 u-boot@lists.denx.de, "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>, Adriano Cordova <adrianox@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Sean Edmond <seanedmond@microsoft.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Markus Schneider-Pargmann \(TI.com\)" <msp@baylibre.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Brian Sune <briansune@gmail.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Martin Schwan <m.schwan@phytec.de>, Dmitrii Merkurev <dimorinny@google.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini <trini@konsulko.com>,
 Udit Kumar <u-kumar1@ti.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Le Jin <le.jin@siemens.com>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Harvey <tharvey@gateworks.com>,
 Maarten Brock <Maarten.Brock@sttls.nl>, Matthias Brugger <mbrugger@suse.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>, George Chan <gchan9527@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 uboot-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>,
 Weijie Gao <weijie.gao@mediatek.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, Benjamin Hahn <B.Hahn@phytec.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Andre Przywara <andre.przywara@arm.com>,
 Beiyan Yun <root@infi.wang>, Julien Stephan <jstephan@baylibre.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>,
 Alexey Charkov <alchark@gmail.com>, Pramod Kumar <pramod.kumar_1@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Hrushikesh Salunke <h-salunke@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 4/6] simplify NET_LEGACY || NET_LWIP
	condition with NET condition
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,
 m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@a
 rm.com,m:root@infi.wang,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[91];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	NEURAL_SPAM(0.00)[0.676];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,cherry.de:email,stormreply.com:url,stormreply.com:email,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 17EFB43376C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
> simplify NET_LEGACY || NET_LWIP condition with NET condition
>
> Since the move to make NET a menuconfig and NO_NET a synonym of NET=n,
> when NET is enabled, NET_LEGACY || NET_LWIP is necessarily true, so
> let's simplify the various checks across the codebase.
>
> SPL_NET_LWIP doesn't exist but SPL_NET_LEGACY is an alias for SPL_NET so
> the proper symbol is still defined in SPL whenever needed.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Makefile                                                  |  2 +-
>  board/engicam/imx8mp/icore_mx8mp.c                        |  2 +-
>  board/polyhex/imx8mp_debix_model_a/imx8mp_debix_model_a.c |  2 +-
>  board/ti/am335x/board.c                                   |  2 +-
>  board/xilinx/common/board.c                               |  3 +--
>  cmd/Kconfig                                               |  4 ++--
>  cmd/bdinfo.c                                              |  7 +++----
>  common/Kconfig                                            |  2 +-
>  common/board_r.c                                          |  4 ++--
>  doc/usage/cmd/bdinfo.rst                                  |  7 +++----
>  drivers/net/Kconfig                                       |  2 +-
>  drivers/net/phy/Kconfig                                   |  2 +-
>  drivers/usb/gadget/Kconfig                                |  2 +-
>  env/flags.c                                               | 10 +++++-----
>  include/env_callback.h                                    |  2 +-
>  include/env_flags.h                                       |  6 +++---
>  include/net-common.h                                      |  2 +-
>  lib/efi_loader/Kconfig                                    |  4 ++--
>  net/Makefile                                              |  2 +-
>  test/cmd/bdinfo.c                                         |  6 +++---
>  test/py/tests/test_efi_loader.py                          |  2 +-
>  test/py/tests/test_fpga.py                                |  4 ++--
>  test/py/tests/test_net.py                                 |  2 +-
>  23 files changed, 39 insertions(+), 42 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
