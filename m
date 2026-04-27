Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJRiEC+872mLFQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2026 21:42:39 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F247970D
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2026 21:42:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A80CC57A51;
	Mon, 27 Apr 2026 19:42:38 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F997CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2026 19:42:37 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-688a8e5fe5eso5273629eaf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2026 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1777318956; x=1777923756;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tT2hp8+uLmbn2kwycSlwuPUUgNkBNqsvJj4q903zslk=;
 b=P2nY2JkMFv4AIdFi/NgSgFoJYXjJ7+YB3EdS25FGqwigy5jWuw0nnqxomUgrSQpFbU
 uUsDEokMY15slFO+3BGiQFOsII8KjllCRuLxkbpsUfjkRMx1IcprC5TROc4zQivr+/Ym
 e6MxdwWhEt6cP/eZhpP+DBIGdW2c942cfhJdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777318956; x=1777923756;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tT2hp8+uLmbn2kwycSlwuPUUgNkBNqsvJj4q903zslk=;
 b=dLnhHHlON6zexmO8rDskmgetrHTPLYVuMcNBsifyUAtVbVJ4QS/ZeWUTIGb3bcvSNj
 LqZ3UZEbdqp2U4LGeGBJu9C2nyp39neXl629LGs+2umfXf7YRyf3A280241PaYBuGBOD
 5z72NDLRX0zvNMNtAotiVB3/1ecO15W+aJB3F/rYRn7eeAg6gdG7umzKg2aFxibYg2ip
 EoO/XqIo7fotWgCtSHQYtjnn8nulLfEgUzpxrUOL/oBxvQpoI2DvCED3RN3ScWQhZnjN
 8RMY3VDjlE32Zq4k5ophrpR/sS6SFtlorvSTs73iHsfddg/MpL1OZgBebKv4/x+4o90p
 Ojfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/26/JejUaBiw1XNS+b61eqp11qEB6TFA+roEvOt8+Jx6XodBBUBpcw69z2J28xJrA4yEVMhWs1dNYNTQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzoajVEKGmAbgjRB48wW6QMSKTpknu2E0QUk2Ug15RUuTHwdSLX
 bi3n9B3OjO184Rb6+xZpHZMpXk31rGS+49CZAkAPj2mdBgBFzsO/TAUenw4YPxOF7no=
X-Gm-Gg: AeBDieuWag3+xzq31N9UIg5iVE9OBTJ27FTh2kC1Fq5OR0OK37EZQV9sCBun/q+/z2l
 LP1S7XuSyCCJLLLRrNRd6BZL1OMEBmBy6y43rFoEGxjpQcYWutyJE/3UwMO0WNjIlJK0YfOUGk7
 7qivym3EEpH4Ksz9iDYvqflBZptzWg56WGtiEP1nEQ2dnstOWM1HTpWP6xIlttsmwT8gFp4QbJB
 1fJKuJXAZjmsV6/Rqd42/wx8kusZKY4Ii9V1+tZgVMkljTIDOAVx0B6JS8pJrt0ba2P49wVDTTx
 38D7ffob5zI3iMJ+b7QThPNp0dN/DIsseT2S6H7kQk54QIz88k7oPQV9XY9sO1EKJKkOo+Zh839
 f7wmRCDYYcNu4buw3U19gk4TpLWOOP2StwWjuCjfbb79lcl3GTprK7UYnGAVnI+mYfAGAzFdtLF
 l2iT0oGQRHcAdNFItHFbBhJBMiARlHoTgwVdNXWzrVslf3Jl+vBTkqpaJssLyRFdpNhdqR34py3
 wwwY0nzom17UZsIwvsnlHiXO0EO5excjQmSa9W6w5zVlligcjMFVhWsVNsg
X-Received: by 2002:a05:6820:987:b0:68c:373f:1835 with SMTP id
 006d021491bc7-6965b9ed9a7mr244412eaf.36.1777318955890; 
 Mon, 27 Apr 2026 12:42:35 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-106-235.totalplay.net.
 [189.203.106.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6965b94aa0esm187247eaf.6.2026.04.27.12.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 12:42:35 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 Quentin Schulz <foss+uboot@0leil.net>
In-Reply-To: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
Message-Id: <177731895134.3526444.5826356040065208578.b4-ty@konsulko.com>
Date: Mon, 27 Apr 2026 13:42:31 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.3
Cc: Peng Fan <peng.fan@nxp.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Jerome Forissier <jerome.forissier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Michal Simek <michal.simek@amd.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 David Lechner <dlechner@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Shantur Rathore <i@shantur.com>, Chintan Vankar <c-vankar@ti.com>,
 Anshul Dalal <anshuld@ti.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Heiko Schocher <hs@nabladev.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>,
 Padmarao Begari <padmarao.begari@amd.com>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Kever Yang <kever.yang@rock-chips.com>,
 Benjamin ROBIN <dev@benjarobin.fr>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Sean Edmond <seanedmond@microsoft.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 "Markus Schneider-Pargmann \(TI.com\)" <msp@baylibre.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Brian Sune <briansune@gmail.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Martin Schwan <m.schwan@phytec.de>, Dmitrii Merkurev <dimorinny@google.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Le Jin <le.jin@siemens.com>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Harvey <tharvey@gateworks.com>,
 Maarten Brock <Maarten.Brock@sttls.nl>, Matthias Brugger <mbrugger@suse.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 George Chan <gchan9527@gmail.com>, Simon Glass <sjg@chromium.org>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Marek Vasut <marex@denx.de>, Weijie Gao <weijie.gao@mediatek.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, Benjamin Hahn <B.Hahn@phytec.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adriano Cordova <adrianox@gmail.com>,
 Beiyan Yun <root@infi.wang>, Julien Stephan <jstephan@baylibre.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Martyn Welch <martyn.welch@collabora.com>, Andrew Davis <afd@ti.com>,
 Alexey Charkov <alchark@gmail.com>, Pramod Kumar <pramod.kumar_1@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Hrushikesh Salunke <h-salunke@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] net: migrate NO_NET out of the
 networking stack choice
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
X-Rspamd-Queue-Id: C97F247970D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:paul.barker.ct@bp.renesas.com,m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:michal.simek@amd.com,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:andre.przywara@arm.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:semen
 .protsenko@linaro.org,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:adrianox@gmail.com,m:root@infi.wa
 ng,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[konsulko.com:-];
	RCPT_COUNT_GT_50(0.00)[90];
	NEURAL_HAM(-0.00)[-0.826];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,amd.com,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,rock-chips.com,benjarobin.fr,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,chromium.org,collabora.com,ziyao.cc,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]

On Mon, 20 Apr 2026 13:36:06 +0200, Quentin Schulz wrote:

> This migrates the net options away from the main Kconfig to net/Kconfig,
> rename the current NET option to NET_LEGACY to really highlight what it
> is and hopefully encourage more people to use lwIP, add a new NET
> menuconfig (but keep NO_NET as an alias to NET=n for now) which then
> allows us to replace all the "if legacy_stack || lwip_stack" checks with
> "if net_support" which is easier to read and maintain.
> 
> [...]

Applied to u-boot/master, thanks!

[1/6] move networking menu in net/Kconfig
      commit: 8080ab6c2843d3899a8ce941b5f6ae82b05b9e38
[2/6] rename NET to NET_LEGACY
      commit: b8cd4442257af4ec754838ea179568e0e7360b8f
[3/6] net: make NET a menuconfig (and downgrade NO_NET to a simple config)
      commit: bd275172a84bf32a3f392b852801dee08a94956a
[4/6] simplify NET_LEGACY || NET_LWIP condition with NET condition
      commit: 95d66d2eb02a4677c63d04c84ca21750a04c49f1
[5/6] doc: remove mention to non-existing TPL_NET
      commit: 0d98f68579b4d32b8593dae35695e8c7f8d7e120
[6/6] boot: remove NO_NET use
      commit: b06c5ef4ddf051b0da8276d2a00ee3df037cbf2f
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
