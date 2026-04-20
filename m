Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CACKGhGE5mmNxgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B043376A
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90698C57B72;
	Mon, 20 Apr 2026 19:43:23 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3452EC57B68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 19:43:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-671ff4b716cso5846825a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 12:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776714201; cv=none;
 d=google.com; s=arc-20240605;
 b=fDXwIDPIXgLlrElu4A668KOJVn8mbQDXmIzvzEOW6PaJVAqGIn9Y5d4wSf1W7cu2pi
 SICqzRxsnFP8sYFJeF2ZRoUowZ2FIG52uKHNCdKhI8wsJ8ie3BonvHX3WExqEV8HA6kg
 8R6aFjzGOUqXmqopbEihrDj8f/AYlI11lzempR9umGPpfP8illUBrfkq4sysxT1AqgFI
 HABU4WaQpOZrRiysPYET4tL8dmWpJv/QEhPTElYukp6vwZvcEpL+gy0l7gULqEiZYuXb
 mQzLdJ0hyNV8t8yTxTJjPnUu4XAjM1HDkIDPpcBtZOHfF/ACKQsLw4j5AGzeAllaFaXS
 g9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TvsSZ2iDnrBEthugXTCOcDsVcM/2V40TqAQGMo39+ps=;
 fh=DgDOfyhUFA7bYtrtXqoIkJ9xcoXQm/QORQTaDBcW4s0=;
 b=a+Ra/e3WASqqkSlp9v3WLthv2rvD7aijbfm1MhqOUdHOfE7/JkPjaLI+vYpio/cw9h
 RcwDQL8KqIQvJAYtj0679k35ITel5oz+n/4Wwfnj2TqRR7AUjCtkU81CO/1YEEttfvuY
 jDXFAXfq+wOWnC5OrGqtVYqREX9pdB1KrD3A8XI2nDTnxgnkkInRevpB/pNWyjNBqTAj
 IJvpQLlOaOpO1/7fdktHRNkogihLYvVWqJH0zszRqX+rWV9oo0n2TxNaejvCkvj4VweD
 QQhTv2HVWhMTdMyZQB9qcpfv0zsUGpUrojrzsJIRsR1zQnGX5aI7Gnpl/4vBjN7USWzi
 44Hg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776714201; x=1777319001;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TvsSZ2iDnrBEthugXTCOcDsVcM/2V40TqAQGMo39+ps=;
 b=gEAJxvQbgFLmFDrHsn/Cx6ybxmTndr0sE9KxeDqWzYEu4ckQp1uodRe+1pzixlxbEC
 MhfRvDw2TrnVbvzLT/++u6j+EiQ8cXKf4D6PElyHE1wwqwFiJ6okln/KXYLUAqZCwsAb
 HcaVRHPF3c1gBgQKbttKFRG6JXCfJbXbPH+04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714201; x=1777319001;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvsSZ2iDnrBEthugXTCOcDsVcM/2V40TqAQGMo39+ps=;
 b=FgEmwF5Jf8wJm/75VPVtf5R1uWxLk9mcvIMT5bg1rQpCOzNpMQjaT9pHCT7qkhMhGx
 iyjNDIv6FHqWy1U//WBybk+kcGhO6w4EnTMrRmQ6W60Z3HjteDnax3EpBChDjD/vSctM
 iP8k9Lc224TqS+632BjJja8gaS2ZDYWg2ul79vYsmpVmvoBf8dYucYAx/S/3odJPEexT
 UWGbpejRfJC91LUJ5ypMFqlUMnFh1xRA6PvGP1GZYuBS0/qsVcQS//U66qcN5gkR1+PH
 pZZ5ZVWkTN2Jzn5sqPBxxdKz9pY1318iVkAvO+KfUjGtbkx4eprYpTKEjoUz7GjBZCUR
 7YRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8N52p+8AHnp+TQxDtV+DAjKOcyfdAnqF8lzv6XNZtuTFEL9ifwVMie5/+uGZnYca93tEX9BG8txFKy6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyu/9WGSTm/gOAA9zymYTBG7SzRU/oQ/pIELjfZrt16oOlpOVXY
 xUsV1bg7JO4evoVdC7eiTSWqsuOHjruhx9HWpWbmRabsru6+q+JVAImCAVZHOTl5LwzMA6qoSWQ
 7drb+dww45nzVHV2b+00KiR7yhYFsQyHwZn+PJc5V
X-Gm-Gg: AeBDiesjAAlCCAcgg01npNicz84vElMjWrAlTgJ/B9zfpx2t/29HjetyZnaE+CLt5EW
 0WPlzXDVz91dMZ6F+6bVQXSizqkdC3n7edjkM6V/OmziIekOf51gKha/xGAlCkoiNoyvSUVR+9c
 nG+vfa7zcqw5f7G2jWSFPoap+XbbLtx3rYCvo3nRdj/TDB6pa7xsz1Or1R7OeRg/pyTn97XaQHC
 RY4nzOEIa7yKpSGEHmbms0xVt3V/XSY/RVXODRR1/3AMGLpMmdktRPI8dhkg21sIri2YcsulWp5
 fh7inM/SWdj2HqouSvJm
X-Received: by 2002:a17:907:2d92:b0:ba7:52f3:4645 with SMTP id
 a640c23a62f3a-ba752f34e9dmr303322966b.33.1776714201422; Mon, 20 Apr 2026
 12:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-6-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-6-9900002d8e72@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2026 07:43:03 +1200
X-Gm-Features: AQROBzDRUPTTTr2QItTk6SnoJN7GgO8RiWKG7B5Qfn4quL70I8iLuflwAnbnGfM
Message-ID: <CAFLszThvRZ-OQyx-JS3jOHBT3k3auB3TgdP=g_eyfj1EXqbcCg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 6/6] boot: remove NO_NET use
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
	NEURAL_HAM(-0.00)[-0.264];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,cherry.de:email,chromium.org:email]
X-Rspamd-Queue-Id: EC7B043376A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
> boot: remove NO_NET use
>
> NO_NET is now a transitional symbol which may eventually be removed. Its
> meaning is the opposite of the new meaning of NET (that is, any
> networking stack).
>
> Update the symbol dependency by using NET instead of !NO_NET.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> boot/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
