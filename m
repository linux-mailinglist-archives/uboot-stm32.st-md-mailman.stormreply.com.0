Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAHIC0YI52lV3AEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 07:16:54 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229E4365FF
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 07:16:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28C62C56612;
	Tue, 21 Apr 2026 05:16:53 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144BAC36B3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 05:16:51 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-651b4d09141so5002840d50.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 22:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776748611; cv=none;
 d=google.com; s=arc-20240605;
 b=aXNqLdcRLLwcwg4c4MF7bSCZWaPq1ChYyffMBaqSbZ1V2AKgUkI017OqZlaTtX/CMi
 FvGeMDB/6ALxfa2y1fKDJSvQ+4hpWdh3DNnKaJXThFnu2uCZQbCGI0pKzGBISK5c53Ib
 rQ3RnfPoAWEZkZKC27zGkCCZvCwvDGWur552ObW+/zUUaJ3P9IbUQX7lTqZHmzsagGoo
 Ov9PrRtjnRnvW69agryeA9x1Aj65t9TdXpGe+7djkgTcG2tuNR6+TVF1UkSFnX6tVj7z
 fq6m8RZEEDNeGLHcpTPzptYawLYmtsEEW5FBreInwVhlRO9Wzm8apGnJq2f9U/9FhEkR
 fgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9YM0lSuDcsTuL/p+iqzLwAtpEQpntOG7+xeTv+n7+V0=;
 fh=N6xUTiBa5WpKbzR94jOISfPCGeuA7/RVIohuMiONIVU=;
 b=hpTyE32P8FkHKtBVyfP2tTm4aCZIY9Mkt8nmbarZdCktYda5mAA+Tz+61UsKI/LBjt
 PtWiudYl9cE8+RXdKgnhUGPXF08c6fs9WmHt58DP6IDmdrQ2fLAxq8gwHgFIAXhp9gBv
 +uHXU0AZmwguymbjFtVLGB6+vdgTMuGZbAVeG+Tg8y8BYzXmJzzDLt4J0Z1LqIYGCFAy
 hrBtO+X1pJlVjRqxzKJ6LAGXgdKAiKYJn5Q2j7uCYbzNbpctHUu6cImRKz2IF44MR3oG
 rhna3RwaoFUGsOAuph27BTQJDO6obukxmBk3OiXNUM715uJdO5z5nBdDAdQBjBDjRR1G
 m3+w==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748611; x=1777353411;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9YM0lSuDcsTuL/p+iqzLwAtpEQpntOG7+xeTv+n7+V0=;
 b=y9N1zpDtUUjs4a5Q4BOGdX/ILPwTdyB/RatqMUyudNikyfNL6GVksh9RbhM3k3EnSw
 gdxvs31/LpnAbdxZJ4kWwNio65SrbzgMN/CWXK4c6SCtF/QdlH5KpUwQhduLJe5I671g
 pgnaduXpFeu0vc/ia2hUE3hpC63rOa1g3Xfd6+6CaC+8lrQpavlSRbw/x/r3b+lzflZM
 7Gh0CQ53WbP3W6N+X5KXt5EHktU2Mqiz4vHQFzUUwj47KZp9xDcnADOf3ouAPTaqSYsi
 0SLrowoW7TTfQ3JHsTXxdnD5nNLVDShfxbDaSBXDTFVcso1pIW3QJNJULaTlBikcJp01
 bJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748611; x=1777353411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9YM0lSuDcsTuL/p+iqzLwAtpEQpntOG7+xeTv+n7+V0=;
 b=I8K7IRlNBa/taKxknaszHN//9wZG4UflmEBh5LjjQL7HkVYgbKyxnAf423LXsDGjMy
 SzL6o4W4x/Um1FnbcuVzUSls/C3xHpKzL5Qq7UHQlv4pNnmAeiY22PxT/XTpkKje7A0o
 do1hBZmv4SqtGoaMMqdL9ZIXBejsJ96hKflzy3fM4TvsytqUsh3ixnn6nNVrwRBSgWGN
 ICEzNgWIxIpKzaGTir3L6TSySKcPDuF7MkWLZcivyStJlMBuiYTvtazP67tX54mjIFhz
 +6wpbVTGaz9WNw+72sSpDTkOWl/fobaxtwuWEhMkTN3GuUIRpKdPaVZmgn5P9nHMj4G2
 qo2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1XYBzCFDcDq2VV5EpxTo5GgX57y/9lUlTF/1YffbqyXKmUaWuNa+u6oOCSrPP58mGa4jpdIgNPpQAMA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrnSAUFthg7TJTlsxQZtopveuo8EA7j+PE2yyZD7TJ4rka5YlQ
 6JSlYKS2ffZxGD4fdqHNqcst1bQ5FDrVMmexwXj48zlsKNxMkzPEAkfwHI20wbuaut8UiiLLbFN
 Wm3I1GRgoIgIeVB11DgvLIqZxhUvQ8v1i+/FNMcxKPw==
X-Gm-Gg: AeBDiesrRmJ7WQJZQZyHhr2nmLwigb/mcQvBajqkGibVK07VDv7G1UF+HsR0j/fAaOq
 00z4CIbHLOrGG7p9UtRyf2+cb52eOBpBKdOGbm4jzZw0XAtsln+6K+X72YGRRgcfJmwrvKlTnCH
 JLaYPRgcC+/Cu+18sbpNClFAz+4KbU7QhIAAEDBQvWmgxpzTrAIm+SPXjO0Ow1JKpoDvyrXJ3ds
 VOyjs15Zv62tWVhR2t5Q7Y+5l4+/3UPbFoVR8KlneVLZi1sZv4TV2RBKzaIIZrmpwS6ItCBRKph
 R3fRfDZjoMIcC4HeBuh5iV/9XNkjKtz4bTlCRfgqykd9K5CezPhHujS/43XocjS4fLQXHBrynkM
 wfG8DDKSZc1gbGdYdih3xV6/C2unsCkgcpk8XXJ9A6w412utPMSlEz19VEtkvtP1p1095HVxA5E
 SLxddRY5iZC3K1+TqhvOnUjxUaPzq6n2Bec4tl+orRXO+in2OUYbA0i5/3w567vISl1Qli7wTvZ
 d2xIeJPGVUyx4WigBmgODwGoF2U04V3jUXKlZKEk6ccBggu9SI8szIPVFLSbPI3AtpT+WAlGyKj
 ZSqmgW53IV5CFbIWlnZFbGW+vNjmo4tJIbvUrXPlsaBjSdhUK9rn3Jg=
X-Received: by 2002:a05:690e:43db:b0:650:77c7:ae81 with SMTP id
 956f58d0204a3-65311b3180cmr8155989d50.22.1776748610676; Mon, 20 Apr 2026
 22:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-6-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-6-9900002d8e72@cherry.de>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 21 Apr 2026 08:16:14 +0300
X-Gm-Features: AQROBzBFYblociOblAsqbs44QPUtzOksoHvm5GP2Bn_EKJmmo6kbIAU-ZgzJVv4
Message-ID: <CAC_iWjLYYYHRV=1YfXLUL7Tbkms-EjOkv7UBLexQ-4YNPwowpA@mail.gmail.com>
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
 Heiko Schocher <hs@nabladev.com>, Gilles Talis <gilles.talis@gmail.com>,
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
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.e
 u,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@arm.com,m:root@infi.wang,m:jste
 phan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[90];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	NEURAL_SPAM(0.00)[0.108];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 9229E4365FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 at 14:37, Quentin Schulz <foss+uboot@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> NO_NET is now a transitional symbol which may eventually be removed. Its
> meaning is the opposite of the new meaning of NET (that is, any
> networking stack).
>
> Update the symbol dependency by using NET instead of !NO_NET.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

> ---
>  boot/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/boot/Kconfig b/boot/Kconfig
> index be6bb6d4535..ae6f09a6ede 100644
> --- a/boot/Kconfig
> +++ b/boot/Kconfig
> @@ -431,12 +431,12 @@ config BOOT_DEFAULTS_CMDS
>         select CMD_FAT
>         select CMD_FS_GENERIC
>         select CMD_PART if PARTITIONS
> -       select CMD_DHCP if CMD_NET && !NO_NET
> -       select CMD_PING if CMD_NET && !NO_NET
> -       select CMD_PXE if CMD_NET && !NO_NET
> +       select CMD_DHCP if CMD_NET && NET
> +       select CMD_PING if CMD_NET && NET
> +       select CMD_PXE if CMD_NET && NET
>         select CMD_BOOTI if ARM64 && LMB
>         select CMD_BOOTZ if ARM && !ARM64 && LMB
> -       imply CMD_MII if CMD_NET && !NO_NET
> +       imply CMD_MII if CMD_NET && NET
>
>  config BOOT_DEFAULTS
>         bool  # Common defaults for standard boot and distroboot
>
> --
> 2.53.0
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
