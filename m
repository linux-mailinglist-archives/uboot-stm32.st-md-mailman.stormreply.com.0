Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U2VyMprm52lbCgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 23:05:30 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FB43F9BE
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 23:05:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5EECC8F27F;
	Tue, 21 Apr 2026 21:05:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17047C8F275
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 21:05:27 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ba3115fe0d5so955946166b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 14:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776805527; cv=none;
 d=google.com; s=arc-20240605;
 b=DNN8YSuSK7qSUxCW3hB7a/yS5T5z5rBBDZGyVGvnA4v/H/L2x/I705+2dxoI7vApJ+
 sItLXi3PQgKACv+W6WZwlHy8351JldVOamMGoxBM8orPMYcaKUQ7/SyQqxT1gKCD866v
 /mdZOJhXESfj385xLJiNU1A4+4L+GIoGcK4EOTYWDnAymt5LajxRJnO8OGwJaqz2j7hN
 rk+cT6Ipln+popPjiPAJIGKGbVCYiHIzoy4e9WH3wwnwujI2Zbk9dXlDK4qaD32Xatn8
 S1HiE0rnwVLvAQqwS+9mvAgFtHILEcJFaBWaBEcSIZnejxkhVnGPkqxwOwNdZFWk5IxJ
 W5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3EYVp13GjMWBcR2CB2algyDuXgfqMzkWFOguUH5K/40=;
 fh=TVajX5kNVh64GGtNPHhe1Di9SX415tzJNa+yMN2eu5Q=;
 b=PFFGsSr+QGWVqOJd4QwiW/zJpESx91mnvMVyIo/V2J3vCCrwWeovyTrG3tDNBZrhY1
 p2JZGgdcVObvp+TbfJLzrs/Pp941ptF5wXfdxOD8NQwQPSNvBuytlRuT0II58nn0TiAc
 Mi6UkJe6S3nARyxKPMeDs6LtOuVagHeJbJ6n6Uf1LMZDQ1XRou7aJIu0/2Qii4xkdGyg
 WCxOlo6GPj8hvVbekzvsJRpqzvSn2NT0hPN1yVqCyhXXsnExx/+i6OAzW+hEgTe7rwhV
 C6kk0CqImYDBxgROoTuphy3mBwbz8LA8ZdzQREDJMVJcQyLkkn79xl5mHlL1hbb2zVAB
 c2oA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776805527; x=1777410327;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3EYVp13GjMWBcR2CB2algyDuXgfqMzkWFOguUH5K/40=;
 b=B9kl5My++mUp73sGaWWNjhuuS06VOTE5gS+/lbj+aHq5AUlK++5MDnJZ+USKydooXp
 ifYrrS+D1W/WL/pem+ftHFXJdWfn+iNw032JWRDifmd0MbRF+4+mwWalzPo41IvfpOC2
 abwmgqKKcsXQNZJ1vAocGGyF8+0xiTlNYjqm/QjzTFbfuYI8bqJroEkRMrKGuCjnA6gy
 lvthLSyIagrpsYXeLYycRp9o2w+gndS+fucryIlqsbrenF/V75zNRcCBz2dzpjsiXMVj
 YO+1qPb17akmKWCy6rM6g/CUiNo3ue5rl+C33lVjS/JmA/o6eTGRYm//0JrhkusNn0+k
 eJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776805527; x=1777410327;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EYVp13GjMWBcR2CB2algyDuXgfqMzkWFOguUH5K/40=;
 b=ji5bN3sHcwn7+PqKEzsmSUqCfziCP0sZGW6TTY0BpC++XklJRHCWVKJ+Bf04jER1Pw
 WWuG9k+QN+VKNYurZSronH4xtXBXsP+DpNrMXbCBl8BldnfcZOl/sa2E/fhfMLmmu+05
 Hg/Z9i2QE2ivXc+St9Qi7tqjYW/BTQnA0aMUsf0DR08j4SWYetHnF2fWNNq6VrmXpTxs
 2zLkUp/gpmS5r7VmC5TazFt8zyIGxeiw+6HrjeqMasatB+Sq0xSXdMMoF3Q+h5EGP6TJ
 YMkV08rvZzo2Qs+8mWDlp8fiI6z61HefznUBrfwiM1UY8uSOo93TA9IxKoEXpdhr1r0T
 pJTA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dD5GegOEwUF/8+UcgnmT9j32icCEEZPhgPh5BQDrI7ulNnJCspjamz0JvACT4syN/cSnyw6cbAOnVIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6zweG/G569hc6fWQrzgA4P8GGXCSZCh2UAfIRwHVTQ5bEptJV
 bAv6PPX4wm/naUj8Tt3Cd2R63smJl+rFtRSteYIAnfvC5535uIVwbm2lEFChaBOI50R9tYalh1I
 RmEt2u4P7/k8k3C+B5uilpOKRYi94HMM=
X-Gm-Gg: AeBDiesyWHDJR87Dma64s2x4KO7W5i1/igBPyaU3gBbGZjnINn16jnkP2tAIv73aAKt
 xpbVmZGgQZiS4W/iidJyJcFnoAPiCa82qP5W5zb7M6dy0uEL/D0/vM9Hxxn+5E2UhNxVngI8Y4J
 wpzuOG+6Xp44hoBuUHc8Kj4Gf8lOwTwYSksjBAHTPzmIDONO8ystj3ccuHtmyz7y/qiIGqFP7ic
 8eRXA0hlaNBwdtCkwFNyO2sTFi1P1OpPYLiuCH6PUL3XmthKMSRmNXk/YsfZagB7ZBLHWFyGAlP
 78bUfUQG0eJMXmlDb5MHTSbdrprF5O1wnkBOcSYP+y9Z7qJXmf7dLuWeXZk8LovTl7syybayVMr
 O9dInAMhntkNu6ZLg1ymkkwbB0fuvmYVYavJKHo1YAdSszTFxePCPBLF6nPC9szNJkqItjg7lEd
 4WPzfhXGxaXqg=
X-Received: by 2002:a17:907:1c09:b0:ba5:120d:64b0 with SMTP id
 a640c23a62f3a-ba5120d6ac7mr764264766b.7.1776805526860; Tue, 21 Apr 2026
 14:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 21 Apr 2026 22:05:15 +0100
X-Gm-Features: AQROBzAqG7cfv3oMhDO44cc6eUv177Ut5eXixQP4snOUKc5UfjYCAMktQuKhrFI
Message-ID: <CALeDE9P9on-i4LPUZDnvLm5-b_n+pSg7jKbmVQ2NH_C-tUPixQ@mail.gmail.com>
To: Quentin Schulz <foss+uboot@0leil.net>
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
 Benjamin Hahn <B.Hahn@phytec.de>, Matteo Lisi <matteo.lisi@engicam.com>,
 Andre Przywara <andre.przywara@arm.com>, Beiyan Yun <root@infi.wang>,
 Julien Stephan <jstephan@baylibre.com>,
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[pbrobinson@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,
 m:mikhail.kshevetskiy@iopsys.eu,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@arm.com,m:root@infi.wang
 ,m:jstephan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_GT_50(0.00)[90];
	NEURAL_HAM(-0.00)[-0.603];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[pbrobinson@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,0leil.net:email,denx.de:url,cherry.de:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 517FB43F9BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is something I've been meaning to do for ages, thanks for ticking
it off for me :)

Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

On Mon, 20 Apr 2026 at 12:36, Quentin Schulz <foss+uboot@0leil.net> wrote:
>
> This migrates the net options away from the main Kconfig to net/Kconfig,
> rename the current NET option to NET_LEGACY to really highlight what it
> is and hopefully encourage more people to use lwIP, add a new NET
> menuconfig (but keep NO_NET as an alias to NET=n for now) which then
> allows us to replace all the "if legacy_stack || lwip_stack" checks with
> "if net_support" which is easier to read and maintain.
>
> The only doubt I have is wrt SYS_RX_ETH_BUFFER which seems to be needed
> for now even when no network is configured? Likely due to
> include/net-common.h with PKTBUFSRX?
>
> No change in behavior is intended. Only change in defconfig including
> other defconfigs where NO_NET=y or NET is not set, in which case NO_NET
> is not set or NET=y should be set in the top defconfig. Similar change
> required for config fragments. See commit log in patch adding NET
> menuconfig for details.
>
> This was tested based on 70fd0c3bb7c2 ("x86: there is no
> CONFIG_UBOOT_ROMSIZE_KB_12288"), from within the GitLab CI container
> trini/u-boot-gitlab-ci-runner:noble-20251013-23Jan2026 and set up
> similarly as in "build all platforms in a single job" GitLab CI job.
>
>  #!/usr/bin/env bash
>  set -o pipefail
>  set -eux
>
>  ARGS="-BvelPEWM --reproducible-builds --step 0"
>  ./tools/buildman/buildman -o ${O} --force-build $ARGS -CE $*
>  ./tools/buildman/buildman -o ${O} $ARGS -Ssd $*
>
> O=../build/u-boot/ ../u-boot.sh -b master^..b4/net-kconfig |& tee ../log.txt
>
> I can't really decipher the log.txt, but there's no line starting with
> + which would be an error according to tools/buildman/builder.py help
> text. Additionally, because I started the script with set -e set and
> because buildman has an exit code != 0 when it fails to build a board,
> and I have the summary printed (which is the second buildman call), I
> believe it means all builds passed.
>
> The summary is the following:
>    aarch64: (for 537/537 boards) all +0.0 rodata +0.0
>             uniphier_v8    : all +1 rodata +1
>                u-boot: add: 0/0, grow: 1/0 bytes: 1/0 (1)
>                  function                                   old     new   delta
>                  data_gz                                  10640   10641      +1
>        arm: (for 733/733 boards) all -0.0 rodata -0.0
>             uniphier_v7    : all -1 rodata -1
>                u-boot: add: 0/0, grow: 0/-1 bytes: 0/-1 (-1)
>                  function                                   old     new   delta
>                  data_gz                                  11919   11918      -1
>             opos6uldev     : all -3 rodata -3
>                u-boot: add: 0/0, grow: 0/-1 bytes: 0/-3 (-3)
>                  function                                   old     new   delta
>                  data_gz                                  18778   18775      -3
>             uniphier_ld4_sld8: all -3 rodata -3
>                u-boot: add: 0/0, grow: 0/-1 bytes: 0/-3 (-3)
>                  function                                   old     new   delta
>                  data_gz                                  11276   11273      -3
>             stemmy         : all -20 rodata -20
>                u-boot: add: 0/0, grow: 0/-1 bytes: 0/-20 (-20)
>                  function                                   old     new   delta
>                  data_gz                                  15783   15763     -20
>
> As far as I could tell this data_gz is an automatically generated array
> when CONFIG_CMD_CONFIG is enabled. It is the compressed .config stored
> in binary form. Because I'm changing the name of symbols, replacing a
> menu with a menuconfig, additional text makes it to .config and the
> "# Networking" section in .config disappears.
>
> Here is the diff for the 5 defconfigs listed above, generated with:
>
> for f in build/*-m; do
>         diff --unified=0 $f/.config $(dirname $f)/$(basename -a -s '-m' $f)/.config
> done
>
> (-m is the build directory for master, and without the suffix, it's the
> top commit of this series)
>
> """
>  --- build/opos6uldev-m/.config 2026-04-20 10:53:49.804528526 +0200
>  +++ build/opos6uldev/.config   2026-04-20 11:03:37.430242767 +0200
>  @@ -970,4 +969,0 @@
>  -
>  -#
>  -# Networking
>  -#
>  @@ -975,0 +972 @@
>  +CONFIG_NET_LEGACY=y
>  --- build/stemmy-m/.config     2026-04-20 11:01:33.653698123 +0200
>  +++ build/stemmy/.config       2026-04-20 11:04:53.452577311 +0200
>  @@ -733,4 +732,0 @@
>  -
>  -#
>  -# Networking
>  -#
>  @@ -738,2 +733,0 @@
>  -# CONFIG_NET is not set
>  -# CONFIG_NET_LWIP is not set
>  --- build/uniphier_ld4_sld8-m/.config  2026-04-20 11:00:41.605469071 +0200
>  +++ build/uniphier_ld4_sld8/.config    2026-04-20 11:04:22.226439899 +0200
>  @@ -997,4 +996,0 @@
>  -
>  -#
>  -# Networking
>  -#
>  @@ -1002,0 +999 @@
>  +CONFIG_NET_LEGACY=y
>  --- build/uniphier_v7-m/.config        2026-04-20 10:53:04.019307319 +0200
>  +++ build/uniphier_v7/.config  2026-04-20 11:03:01.688085486 +0200
>  @@ -1004,4 +1003,0 @@
>  -
>  -#
>  -# Networking
>  -#
>  @@ -1009,0 +1006 @@
>  +CONFIG_NET_LEGACY=y
>  --- build/uniphier_v8-m/.config        2026-04-20 10:43:05.614441175 +0200
>  +++ build/uniphier_v8/.config  2026-04-20 10:41:03.214852130 +0200
>  @@ -875,4 +874,0 @@
>  -
>  -#
>  -# Networking
>  -#
>  @@ -880,0 +877 @@
>  +CONFIG_NET_LEGACY=y
> """
>
> This is fine:
> - Networking menu doesn't exist anymore so "#\n# Networking\n#\n" won't
>   be in .config anymore.
> - opos6uldev, uniphier_ld4_sld8, uniphier_v7 and uniphier_v8 all have
>   (old) CONFIG_NET enabled, (new) CONFIG_NET will still be set but
>   CONFIG_NET_LEGACY also needs to be defined now to reflect the stack
>   choice (even if default),
> - stemmy has CONFIG_NO_NET set, which means CONFIG_NET and
>   CONFIG_NET_LWIP are not reachable anymore hence why they don't need to
>   be part of .config,
>
> GitLab CI was run on this series (well, not exactly, but it's only
> changes to the git logs that were made):
> https://source.denx.de/u-boot/contributors/qschulz/u-boot/-/pipelines/29849
>
> It passes.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (6):
>       move networking menu in net/Kconfig
>       rename NET to NET_LEGACY
>       net: make NET a menuconfig (and downgrade NO_NET to a simple config)
>       simplify NET_LEGACY || NET_LWIP condition with NET condition
>       doc: remove mention to non-existing TPL_NET
>       boot: remove NO_NET use
>
>  Kconfig                                            | 34 ----------------
>  Makefile                                           |  4 +-
>  arch/arm/mach-stm32mp/soc.c                        |  2 +-
>  board/beacon/imx8mp/imx8mp_beacon.c                |  2 +-
>  board/engicam/imx8mp/icore_mx8mp.c                 |  2 +-
>  board/gateworks/venice/venice.c                    |  4 +-
>  board/nxp/ls1043ardb/Makefile                      |  2 +-
>  board/nxp/ls1046afrwy/Makefile                     |  2 +-
>  board/nxp/ls1046ardb/Makefile                      |  2 +-
>  .../imx8mp_debix_model_a/imx8mp_debix_model_a.c    |  2 +-
>  board/siemens/iot2050/board.c                      |  2 +-
>  board/sophgo/milkv_duo/Makefile                    |  2 +-
>  board/sophgo/milkv_duo/board.c                     |  2 +-
>  board/theadorable/theadorable.c                    |  4 +-
>  board/ti/am335x/board.c                            |  2 +-
>  board/toradex/verdin-imx8mp/verdin-imx8mp.c        |  2 +-
>  board/xilinx/common/board.c                        |  3 +-
>  boot/Kconfig                                       |  8 ++--
>  cmd/Kconfig                                        | 12 +++---
>  cmd/Makefile                                       |  2 +-
>  cmd/bdinfo.c                                       |  7 ++--
>  cmd/fastboot.c                                     |  4 +-
>  cmd/ufetch.c                                       |  2 +-
>  common/Kconfig                                     |  2 +-
>  common/board_r.c                                   |  4 +-
>  common/spl/Kconfig                                 |  5 ++-
>  configs/am62px_evm_r5_ethboot_defconfig            |  2 +-
>  configs/j722s_evm_r5_ethboot_defconfig             |  2 +-
>  doc/develop/bootstd/overview.rst                   |  2 +-
>  doc/develop/pytest/usage.rst                       |  4 +-
>  doc/usage/cmd/bdinfo.rst                           |  7 ++--
>  doc/usage/cmd/sntp.rst                             |  2 +-
>  doc/usage/cmd/wget.rst                             |  2 +-
>  doc/usage/spl_boot.rst                             |  2 +-
>  drivers/dfu/Kconfig                                |  2 +-
>  drivers/fastboot/Kconfig                           |  4 +-
>  drivers/fastboot/fb_common.c                       |  4 +-
>  drivers/net/Kconfig                                |  6 +--
>  drivers/net/phy/Kconfig                            |  4 +-
>  drivers/net/sandbox.c                              |  2 +-
>  drivers/usb/gadget/Kconfig                         |  2 +-
>  env/flags.c                                        | 10 ++---
>  include/configs/stm32mp15_common.h                 |  2 +-
>  include/configs/stm32mp23_common.h                 |  2 +-
>  include/configs/stm32mp25_common.h                 |  2 +-
>  include/env_callback.h                             |  2 +-
>  include/env_flags.h                                |  6 +--
>  include/net-common.h                               |  4 +-
>  include/net-legacy.h                               |  2 +-
>  lib/Kconfig                                        |  2 +-
>  lib/efi_loader/Kconfig                             |  4 +-
>  net/Kconfig                                        | 45 +++++++++++++++++++---
>  net/Makefile                                       |  6 +--
>  test/cmd/Makefile                                  |  2 +-
>  test/cmd/bdinfo.c                                  |  6 +--
>  test/dm/eth.c                                      |  6 +--
>  test/py/tests/test_efi_fit.py                      |  2 +-
>  test/py/tests/test_efi_loader.py                   |  2 +-
>  test/py/tests/test_fpga.py                         |  4 +-
>  test/py/tests/test_net.py                          |  2 +-
>  60 files changed, 139 insertions(+), 138 deletions(-)
> ---
> base-commit: 70fd0c3bb7c26d42f24d10145dd5f3168ac92eac
> change-id: 20251216-net-kconfig-0f63d9de716b
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
