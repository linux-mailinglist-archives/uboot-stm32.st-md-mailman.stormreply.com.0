Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ6PGxGE5mmFxgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C7343376B
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Apr 2026 21:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55766C57A50;
	Mon, 20 Apr 2026 19:42:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABAF0C56600
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 19:42:48 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ba7fd666666so149828866b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 12:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776714168; cv=none;
 d=google.com; s=arc-20240605;
 b=Owe2gLnzfgWSNI007eMOscXUZIt/137ga3r+ggTo/KL5PK7CNVMcS9K0JXogCchzwe
 ecJuK/LwzyO78tMvGe2M83w+UGz/vkZhl1v4GXm5MlxZpE9Lhf1qEWh37t5TdBjT9oDV
 01EK/g5yF174cVanPCOeC94GthCuF1yzXfxUQwCy7RrgrDb/OYhkvqTJqhgdTmXQxMUx
 4W21LZn5JWaPcIH3HczyvGZbnF5IlWj3axuYcmqeqKXMdTesZ6HdOIy9yuoUBu2rRomR
 hachj/FsRSZAU700sgeZwihrkGt2hYzDWcDNnsPUQ1cD4gkoE6LJAPyE4e+VsICnavAL
 Wv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ay8F/BTYwPDSV/SFkypuI/ltVZXRrxcnRaPDPv42+3E=;
 fh=SH7uRgWLWXVd8nH+HU5f7qG2gPE2tILA4dN+Iv+JB1k=;
 b=bbaGKpRYdIsm9jMEZc9e4y9H49FqkqPUr3/LWR7A3EMqeqWP/JfKNBN93u7XOAjtqX
 LZeZMQKw3E6HDyNjJ1dY74Ph/8f26NOnBpFUtlCPZ6zhTu3fJG13sH+Jbt11n/v5BSib
 mEcN3IFlCeblFfvOrjuU8L3PwMcn3PCLM7M05yXnwjbqhwcbM5w/m47NRIJclUcNBr/A
 so/eq9KiVMyKf0ZSIqdi3TSToLzhrmoorYYNttDjICC+E49mvjZ/YDWUX9ScA/P5oBg/
 ZMmNAXF51H0v0o+ZSWqG/AB0pUWJpTbEO9Uo0BLfZY45mL4xy9BzbDyMsdjk1JsazljB
 tyrw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776714168; x=1777318968;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ay8F/BTYwPDSV/SFkypuI/ltVZXRrxcnRaPDPv42+3E=;
 b=XwU8LMNOSjKlRk3rcYFeb052AUhukVhJmtk1CbQncFqdyPohlFnP6odF4XhaM9GDWy
 Hi4/dS8t4xqJN83RLPVEWSpIxMEGWhEUclylg4W1856dKyuYlnwqJvJUy9S/Sr6Po6xj
 REoxCFiqa+xyIuRtEdJDFc6lShGMRVKe1/KGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776714168; x=1777318968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ay8F/BTYwPDSV/SFkypuI/ltVZXRrxcnRaPDPv42+3E=;
 b=j7ionmt+9MryznhoXUqfe454fp32KZHL4Qy02UgYxmkymWa5b/GKlueyQzfeqNZiYw
 o8eEP6IVtDD4E2sMx6sxif1wwCcoAYZ6Z3cCM4rFFORDp3hklPBBfAc1MsnR3NAjRy0g
 5MtTLU+DMTj33aWvamd9yoSnz3f11QDYLJjPlqDvfwMCy3zFG8mgTO6AU2TNNiNT8Og5
 /8mrJJJLM1WMFItkYu2G5VofWf/arV2Wlg6Ok64eCQIykmL1i4cYFh3AAjuxdbjEHxFz
 FBEvIDZdeSaTf2Z0CVgwOgRDsf19LbItFCf+mFmWr3uS1hXm3sIEXOXmsjxS9gc1YlI/
 oWbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5crBeh3FU5GnkZofKsT2arabpiOw4etLaDJJgzfuuOsvnqMCCcXU2krHQc/gAnRCeuyL6Jp2/LH1XJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLlviSok1b2q5O6Pq3iTMEI5gZRS2ehQB48vg0pD1ozZ5PT8Y4
 OHG15MclOuUqm7UeZe8U6vJRxRkuDBD9Tkthm6a6eiDsLIGgJEZ+t862rZWsCJoih1SuZxuzSDU
 twDYy5trvGNRu25Ko3jSJnbv+4iVCzCY66mOOTKG5
X-Gm-Gg: AeBDiev7xV3JMsEVc6+QVSntxmFrEfFmq3zTF1VLvwwvjQQbBBKe19PKDJzbZIDkwOr
 lgd2OtXLep/gA5YMNs4HWZVytLKIv+5DI/T+NwZIGExIIL99Hlurf7v4Qw4rMPIDkOg5YfF2UZc
 LhVLyFFRSR3uP3fHcxjXq6UuBA1uJKEk+MS8VHU8v4JUa0ju3ff2aHIO+wd/lgCe/Jte3pOkgf2
 2AlPEVzQn+Qg0SreeSqpCptrR2DdfE1PBaknaSeN7AayM6h/Pbv/rX4JbIwfBbPXeINi1twdmcQ
 k39XQUfq3VuqZ9JXIWdY
X-Received: by 2002:a17:907:3f9d:b0:ba5:20b1:c13b with SMTP id
 a640c23a62f3a-ba520b1c177mr549344266b.28.1776714168006; Mon, 20 Apr 2026
 12:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-3-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-3-9900002d8e72@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2026 07:42:33 +1200
X-Gm-Features: AQROBzBBD6QWXgHXqsAjqUBUSofUJnydf3AlVzyEs0FPNUlgYAhIX3iqwKpVkiY
Message-ID: <CAFLszTh3hYDBX1LbegMCGqOE4JPyNr2yBTkX87Av_qptXqLLZg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 3/6] net: make NET a menuconfig (and
 downgrade NO_NET to a simple config)
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
	NEURAL_SPAM(0.00)[0.041];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,cherry.de:email,chromium.org:email]
X-Rspamd-Queue-Id: 03C7343376B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-20T11:36:06, Quentin Schulz <foss+uboot@0leil.net> wrote:
> net: make NET a menuconfig (and downgrade NO_NET to a simple config)
>
> This will allow a bunch of simplifications across the code base.
> Disabling NET is the equivalent of today's NO_NET choice. This means
> that if NET is enabled, either the legacy or lwIP stack is necessarily
> selected, which allows us to simplify if NET_LEGACY || NET_LWIP into
> if NET in a later commit.
>
> Config fragments - or defconfigs including other defconfigs - setting
> the network stack (NET_LEGACY or NET_LWIP) must also set NET (or unset
> NO_NET) if the config they apply to - or the included defconfigs -
> unsets NET (or selects NO_NET) as otherwise the NET_LEGACY and NET_LWIP
> symbols are unreachable. This is the case for the two defconfig modified
> in this commit.
>
> NO_NET is now a convenience symbol which hides NET entirely to avoid
> modifying many defconfigs. If one selected NO_NET to disable the
> networking stack in the past, this will still work for now. Technically,
> we should be using the 'transitional' Kconfig attribute but that is only
> available since Kconfig from Linux kernel v6.18 and we're on 6.1 right
> now.
>
> Note that this moves CONFIG_SYS_RX_ETH_BUFFER from under the Network
> menu back into the main menu as it seems like it needs to be defined
> even when there's no need for NET support at all and menuconfig option
> doesn't work the same way as a menu.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> configs/am62px_evm_r5_ethboot_defconfig |  2 +-
>  configs/j722s_evm_r5_ethboot_defconfig  |  2 +-
>  net/Kconfig                             | 23 ++++++++++++-----------
>  3 files changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
