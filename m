Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGQ8GBGE5mmFxgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D10433769
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B482C57A52;
	Mon, 20 Apr 2026 19:43:16 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAE51C57A51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 19:43:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso544389066b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 12:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776714194; cv=none;
 d=google.com; s=arc-20240605;
 b=R1YiFHgJB6GOPOV9YDWMseOJtAGs0kF60aj9XBUx5deX02B0GOJOsstKZPIGbXo3EO
 Z/dQPr4tRHlbypmPJoYU6f1swWyPMnBBs6YVLhwthA0eC8ZYZTZ+Fd5scXhjUUrCp8VA
 wEIv+9pzukrcsdtRMNNtXpCiUGtD7ZqK2H4bgUctsLwlkmrSO5BxJd+NxkHGtmdJYN0m
 xVG7sPrEoAodIHKpnWAYf1vW7aMxeX6I+IByE/o/dYNlAy76VUD8CEdxCNjQT+E/N4MK
 s6GD/EurT5wEDVQ7Oss5iXaLrOtT+aFa3Sqroca1V199UkkyAbLb87K73KjkeAWOMrbe
 qZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MPQTnKrw7KOMiwluDMN4lXZLBDL2F6s/U3vxClxzFiw=;
 fh=lVVeDd0+uzG/yDCfWhdc3TgEvQ8+vxx5PgUiDf4JU70=;
 b=aWbt1Y/sGMNwhIAtUpDuMY4pQ/YmqY0BTi/6yEDGENKR971i2sX8k7ozj/po/Cd7be
 RrI5kH+oap3iVUtyZhBhowTlp64+fmTrhXKj1sSa4PJibvvuG7liCHsTz+kXYXypNVZh
 HBtGfkjumFMV9l9RnuxYOC3H38bHrGeYK/Tgw883z8tUyKiNp1pIXtBbq6nGw07s4wxs
 vQWHlhxVlW0fNMKbX+R0wIOad7zB7xB6F4yQE0qywuelwuSwueeEPug6X6uPss7dsj9R
 +NJJdWugdSYRGmntTL61J9bjIwRBAVzMMnK6oDkYsY8A13AS+Kaiz0vF40EJbw52Gyzr
 nY7w==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776714194; x=1777318994;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MPQTnKrw7KOMiwluDMN4lXZLBDL2F6s/U3vxClxzFiw=;
 b=jAvAV+ZCAwTzS2rmHtWXhW7MyJwvw2jVUpPfp5MPxpyMerKGdOwcH1t5sMeVa3RESh
 8TPxkusbufTk7UCHHXbj7Hwdr4sIPNEgB0l10OOGQQOZkoROCMBS/UsPujNyxqkR++DK
 AhjdncqpQHH13R5+0XNF65Ns62nrxbqJn+dqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714194; x=1777318994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPQTnKrw7KOMiwluDMN4lXZLBDL2F6s/U3vxClxzFiw=;
 b=Qn9PB8jXEGebFp1dttb9MDs9e1YG/PKT9O4t3dEFUYTzUiWC88GMVuDPXZLhQGWVfD
 xO+RkuI2iY221TFW0CI0RjWw5cLb6s303zs5LCogbLNEn7p1OzyzUXT5jUZFk0WMzkvC
 NinNWfxZuKEFxyBbThLgtKC1NmhgHJF7I2C22YfCvWBb+uxSR7lW31jl3Xee50GjROKi
 MaHtfj9YWCHgL7SvzW7ULW57gzVCS4vq3E8UdemU41AN7abfxTApCH1xJKOH2mnbdGTb
 yUQD2G0Ae2+ytTt4s/m+9iEmYvKEo9N6V3sgQA71zSdl6plz3ttXAWx8qKZWHwhkC1ZE
 fZ3A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0vbiD4czZYGY2uXr2VubP8MJeyEk3qfDodPyWxp5Fx/Y8Cse0lwiEplJ2oZIBg47E5KbTj8/icAf2yQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKKn4a/kK6bWD1sNmFXyPDmlw6783vdn9E8ug7RZ2WVgLb3EPL
 U51GHFcFwZG47GV/gAbD95t31JJD2tGVkEVSek1Yxw9XyIrtITAo9OUT/jEMkJmajQ43helLepP
 U2xmGnUBb74oZvqR7xZv2S8P/m+z8HfjtrfydMmsS
X-Gm-Gg: AeBDies4G6rI5ktQjZDvxun2Aq9V3NIrr6kqr952bvcQaQPnLUKDHAtjcHHlgRG1s3f
 wTq0NWAWe0OSaOvHZzan0rs6s61d99H3nig2AKmRbbTBhfLZCwRF9DI6Fvg/l/iNiLzEjH1anE/
 UD3lArJIlP8LRe5jZP3BUgA8dtS9/IrDHjEaAvLFdity6hTzbYBER9Suu2MsYuSKC9gMxfuqauG
 Mjg68zPIztRllCsh/dthGAR5DIh/bErX6qfHOPj3MZ48obZXnoNRufTrmmDhczwMulsLytkJ488
 WRJx62mpbqLAgGMHa037
X-Received: by 2002:a17:907:74b:b0:b9c:2a5f:41c4 with SMTP id
 a640c23a62f3a-ba41e4fd92fmr726116566b.40.1776714194058; Mon, 20 Apr 2026
 12:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-5-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-5-9900002d8e72@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2026 07:42:58 +1200
X-Gm-Features: AQROBzDc_c4NOu8SWKf8MZOUlBGOK6J3WKsf0IZekifA_j1uSCNB-AAv0nKd-G0
Message-ID: <CAFLszTgaU-UpCdnsF5XSZWxiAr5BwT2M6ZgSoFmqv4ExNmoGwQ@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 5/6] doc: remove mention to non-existing
	TPL_NET
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,
 m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@a
 rm.com,m:root@infi.wang,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[91];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	NEURAL_HAM(-0.00)[-0.132];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cherry.de:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,chromium.org:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: E9D10433769
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
> doc: remove mention to non-existing TPL_NET
>
> TPL_NET symbol never existed in the first place, so let's remove this
> misleading piece of documentation.
>
> Fixes: 143c9a7e9d68 ("doc: describe TPL/VPL/SPL boot")
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> doc/usage/spl_boot.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
