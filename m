Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBqjEnQI52lP3AEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 07:17:40 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C22436633
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2026 07:17:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429C0C56612;
	Tue, 21 Apr 2026 05:17:39 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EFB9C36B3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 05:17:38 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-651b4d09141so5003317d50.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 22:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776748657; cv=none;
 d=google.com; s=arc-20240605;
 b=M64t5VKK/2v83J5euoeUJZ+m4OvlcoPC8LMoj6elTCM/3iMm1mJ0EhLuwNnVUuXBgA
 f1EtSD0m0IhBrL13UrBtN1hVF1ffBGz2gKqwEI9FJDCVBG75ddDZNMpHnaIxcw+EA9lY
 VBIJIy8uTDM0QGNrpSX4iFVY0S5/Koh20eEP0rxTJbKTBkTjpyTwv2YKrm1QveDvPHli
 uIK52RcdFwsHHLVEL1tfXfhOKe5yZ9QLE56VjGg5863PLWv1a2bFv95NMilKEJkaOqi9
 I0OFFaa58OIxuDNCcPzcsAU8sijC6KZLnCGJNAydSFA0NUkjkFyQ629ad9gYWz3tZBMI
 p67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Yk5h6Gzf8QWvSKXTZlPvozGVtAG7c+Aw9YYTpIqN23E=;
 fh=JKiYG/Rv3jmZLj26yIhd6NjdqlCPbFMqewbxe9m6+JQ=;
 b=KTzLjFkKyylaydV2m9Fa2nNHEoFC2h4j5J5z2bogCMyuhA5aRTD2gAIzxCf/fw1YPK
 CLtJ3vXuR0BbIqyEPHyVAydrCySxn79/bF7QzVqINjwxLlHsU5ZEBZDkf1nAk7JkzNkH
 Xg/Ne1RkXjln2usPriWYkN6m43IWsKNDoePh+uGEEPT2EU69PU+jZqqCHpaAhfC22Tbf
 WzR5iOXDnu6a9DMFbesbBudmxLdFxqDhM2Bm2piYPGcyG9w5vH8+rf+ILv/8WQ/UTOqH
 zT6Z+A9tY36qjqoYzx5DDFRL3OltEyn7OM53yU1/7Yes71UkjNcmom0E9NKyiOCmKzfl
 1neg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748657; x=1777353457;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yk5h6Gzf8QWvSKXTZlPvozGVtAG7c+Aw9YYTpIqN23E=;
 b=i0pd+bd2SnUwIiFCZTWGNzuZVHR6v8BKIo6L244O9komxcZJ9mTwBdP1ZfGAinbe2u
 2j+7O8n6RusPNCZfvQRIHxHIJ1VCBOCKKN9zuo2aZ3vDm7ChFaGfaI46Lv/Ams+UMIX+
 I2+NkVTNoom795qdhPCw3BPM5dlmV7c98JNsJ4pTFvluWWC4O2vCwnEdWnmaWCBBqeYh
 NPBgmNwI1fWCyqGhPEGmdk70uwKSf4dOfdz/ZvhWZdoM1Njk1LK9U/JS87GVSqGZWuzH
 dXxGoElqClgB8e2eBL5VZiEn+G6hV7Ux6bBycAH2vuNLI9GFV3Dmtx7YUDDUDLbs+Eo9
 sbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748657; x=1777353457;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yk5h6Gzf8QWvSKXTZlPvozGVtAG7c+Aw9YYTpIqN23E=;
 b=m9P4XfkdHlmqHZgDwWJy/T9k111kO8YpRm9vbq0+edLTyIfV3wgxhErsFcqLmJGDey
 cuWM22nICCSI22uaZOu7jythfIA/aRN1V/00h+S/Oh7+3Eo4S8rOSlZIbDanzDjs5kN7
 hFwouLTS+TBDkpI4yrIFDsnhoqk5G9RUhSh5dzwuYKIVj92G2Nd+eP98lRn2CwuTZzom
 QYJzWQDWvn1aJGxqbWt/NXUJl6Mha5JnovkdtJtbO43vEa5gY3uLtepwIeECnEwO7cE/
 mev0mCMotQgCAQpmB052Yqik1DKOQPD1d03eUsGGUbECp8dA1swuN9znwIPRcrBLLYES
 nTJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+6zIlXh60GOl5jQ2qiylYywD0Q+JkUdJKmlFi+UKhAo/52H+icq30fvAd1G5VB0fyVkOxNpSl154t7BA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/qberagk96Q0f9YJ6GK+GgA59eFnZk6LTViExRddJRitDea27
 /DTe/nR7cn+VXRnbdP1tzfjjVkhP5cScF1hjpJ+ZZot1qjrlBLK2XuUa1PWysqlKbDpBE0/12FR
 OFUpWLExlod0vxkKdPE3fGUdAPWoydERwkSydghqDyA==
X-Gm-Gg: AeBDieuGs1wXVsRaEPMNxc+WdPctOuAvaLv4l90/x+PiLxCPacgM2KJWDxUttRepKwC
 zHngkq2EDe7TI+jUCN3VRUV09xJV/l2tOIhzTAHVP9HakTvpvQu7V4yKEX3loWQVcmW6IDqlv6t
 E4GhQjFqRopdYeZlkt8P4Jy4Kpo9zpY11sLDlSWL6JF9LJifd7R+LVKVWpIcrr1RkyYVhBt0QKO
 LWQhVcq5LylVlQtUPZl5/o0OqrpYmJMr6AvXqeQ9udijkjnknuLejJ8UMtTtF6dJJ9QRjRuctr8
 RcfxIKFzX/t7gQcHq41jOV4D53IR2GQKr0TQjkFSRa8LekXPkJwx5shDgiJcID2IF6UrrTwaNh2
 0C6jiMG8irJoZdt1xCclaKntfIG0lItm4f2iHP+CgSmGVfr3Yk8jglpliYAdSZLwH98W5Zk8QPG
 PtUEfIpbqgawqqf8aKr6g/O+P2I2JLo6V1Q2f73o3xIkjJS5GuHQRXkcIKLob/BepZ9Fyp5xsDg
 BxF1om8JwqK9MEIOIMsRUHsRureTlwNNQjbEt4do6AShQek3xm41uBgbtuygJk/DYBvsv20VJiU
 uFB/i/ZAIAAazcCOuGjujQ+fMB9KFNobiRCf2OBwSjT6YWwfMSwNvQw=
X-Received: by 2002:a05:690e:1914:b0:651:c41c:80ce with SMTP id
 956f58d0204a3-653119894a8mr13072501d50.16.1776748656972; Mon, 20 Apr 2026
 22:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-net-kconfig-v1-0-9900002d8e72@cherry.de>
 <20260420-net-kconfig-v1-1-9900002d8e72@cherry.de>
In-Reply-To: <20260420-net-kconfig-v1-1-9900002d8e72@cherry.de>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 21 Apr 2026 08:17:00 +0300
X-Gm-Features: AQROBzD8z4Gz2E8G-xiaDkBkb90xxLB-LL5yMQJ0MwU3EgkDyA26WX0jrIPaW8U
Message-ID: <CAC_iWjKaVsyxCuKmO8LqR-sS4DN4DsEnfhf1mNEswT2PtVJhHg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 1/6] move networking menu in net/Kconfig
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:foss+uboot@0leil.net,m:peng.fan@nxp.com,m:mkorpershoek@kernel.org,m:jan.kiszka@siemens.com,m:alvin@pqrs.dk,m:jerome.forissier@arm.com,m:neil.armstrong@linaro.org,m:lukma@denx.de,m:s-vadapalli@ti.com,m:dlechner@baylibre.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:i@shantur.com,m:c-vankar@ti.com,m:semen.protsenko@linaro.org,m:anshuld@ti.com,m:mingkai.hu@nxp.com,m:dannenberg@ti.com,m:hs@nabladev.com,m:gilles.talis@gmail.com,m:padmarao.begari@amd.com,m:bb@ti.com,m:alice.guo@nxp.com,m:kever.yang@rock-chips.com,m:dev@benjarobin.fr,m:lucienzx159@gmail.com,m:u-boot@lists.denx.de,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:SkyLake.Huang@mediatek.com,m:adrianox@gmail.com,m:ansuelsmth@gmail.com,m:cniedermaier@dh-electronics.com,m:seanedmond@microsoft.com,m:tien.fong.chee@altera.com,m:msp@baylibre.com,m:Max.Merchel@ew.tq-group.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:mikhail.kshevetskiy@iopsys.e
 u,m:briansune@gmail.com,m:ycliang@andestech.com,m:m.schwan@phytec.de,m:dimorinny@google.com,m:sughosh.ganu@arm.com,m:quentin.schulz@cherry.de,m:sr@denx.de,m:festevam@gmail.com,m:vigneshr@ti.com,m:trini@konsulko.com,m:u-kumar1@ti.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:le.jin@siemens.com,m:abbaraju.manojsai@amarulasolutions.com,m:jonas@kwiboo.se,m:tharvey@gateworks.com,m:Maarten.Brock@sttls.nl,m:mbrugger@suse.com,m:francesco.dolcini@toradex.com,m:robert.marko@sartura.hr,m:aford173@gmail.com,m:j-choudhary@ti.com,m:vaishnav.a@ti.com,m:paul.barker.ct@bp.renesas.com,m:gchan9527@gmail.com,m:sjg@chromium.org,m:ariel.dalessandro@collabora.com,m:seashell11234455@gmail.com,m:casey.connolly@linaro.org,m:me@ziyao.cc,m:uboot-stm32@st-md-mailman.stormreply.com,m:marex@denx.de,m:weijie.gao@mediatek.com,m:ben.dooks@codethink.co.uk,m:balaji.selvanathan@oss.qualcomm.com,m:pbrobinson@gmail.com,m:B.Hahn@phytec.de,m:matteo.lisi@engicam.com,m:andre.przywara@arm.com,m:root@infi.wang,m:jste
 phan@baylibre.com,m:kory.maincent@bootlin.com,m:martyn.welch@collabora.com,m:afd@ti.com,m:alchark@gmail.com,m:pramod.kumar_1@nxp.com,m:patrick.delaunay@foss.st.com,m:h-salunke@ti.com,m:foss@0leil.net,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[90];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilias.apalodimas@linaro.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,siemens.com,pqrs.dk,arm.com,linaro.org,denx.de,ti.com,baylibre.com,mailbox.org,shantur.com,nabladev.com,gmail.com,amd.com,rock-chips.com,benjarobin.fr,lists.denx.de,amarulasolutions.com,mediatek.com,dh-electronics.com,microsoft.com,altera.com,ew.tq-group.com,iopsys.eu,andestech.com,phytec.de,google.com,cherry.de,konsulko.com,bootlin.com,gmx.de,kwiboo.se,gateworks.com,sttls.nl,suse.com,toradex.com,sartura.hr,bp.renesas.com,chromium.org,collabora.com,ziyao.cc,st-md-mailman.stormreply.com,codethink.co.uk,oss.qualcomm.com,engicam.com,infi.wang,foss.st.com];
	NEURAL_HAM(-0.00)[-0.607];
	TAGGED_RCPT(0.00)[uboot-stm32,uboot,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,cherry.de:email,nongnu.org:url,st-md-mailman.stormreply.com:rdns,0leil.net:email]
X-Rspamd-Queue-Id: D7C22436633
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 at 14:36, Quentin Schulz <foss+uboot@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> In the main Kconfig, there are only two more menus, General Setup and
> Expert, in addition to the net menu. Since the part in the main Kconfig
> is mostly about selecting the network stack (legacy or lwIP), and that
> we already have a net/Kconfig, let's move those to net/Kconfig to have
> everything in the same place.
>
> No intended change in behavior.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

> ---
>  Kconfig     | 34 ----------------------------------
>  net/Kconfig | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/Kconfig b/Kconfig
> index 7f00e76ba78..1fa31a4f5a8 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -791,42 +791,8 @@ source "dts/Kconfig"
>
>  source "env/Kconfig"
>
> -menu "Networking"
> -
> -choice
> -       prompt "Networking stack"
> -       default NET
> -
> -config NO_NET
> -       bool "No networking support"
> -       help
> -         Do not include networking support
> -
> -config NET
> -       bool "Legacy U-Boot networking stack"
> -       select NETDEVICES
> -       help
> -         Include networking support with U-Boot's internal implementation of
> -         the TCP/IP protocol stack.
> -
> -config NET_LWIP
> -       bool "Use lwIP for networking stack"
> -       select NETDEVICES
> -       help
> -         Include networking support based on the lwIP (lightweight IP)
> -         TCP/IP stack (https://nongnu.org/lwip). This is a replacement for
> -         the default U-Boot network stack and applications located in net/
> -         and enabled via CONFIG_NET as well as other pieces of code that
> -         depend on CONFIG_NET (such as cmd/net.c enabled via CONFIG_CMD_NET).
> -         Therefore the two symbols CONFIG_NET and CONFIG_NET_LWIP are mutually
> -         exclusive.
> -
> -endchoice
> -
>  source "net/Kconfig"
>
> -endmenu
> -
>  source "drivers/Kconfig"
>
>  source "fs/Kconfig"
> diff --git a/net/Kconfig b/net/Kconfig
> index e45ceb25106..249c27c115d 100644
> --- a/net/Kconfig
> +++ b/net/Kconfig
> @@ -2,6 +2,38 @@
>  # Network configuration
>  #
>
> +menu "Networking"
> +
> +choice
> +       prompt "Networking stack"
> +       default NET
> +
> +config NO_NET
> +       bool "No networking support"
> +       help
> +         Do not include networking support
> +
> +config NET
> +       bool "Legacy U-Boot networking stack"
> +       select NETDEVICES
> +       help
> +         Include networking support with U-Boot's internal implementation of
> +         the TCP/IP protocol stack.
> +
> +config NET_LWIP
> +       bool "Use lwIP for networking stack"
> +       select NETDEVICES
> +       help
> +         Include networking support based on the lwIP (lightweight IP)
> +         TCP/IP stack (https://nongnu.org/lwip). This is a replacement for
> +         the default U-Boot network stack and applications located in net/
> +         and enabled via CONFIG_NET as well as other pieces of code that
> +         depend on CONFIG_NET (such as cmd/net.c enabled via CONFIG_CMD_NET).
> +         Therefore the two symbols CONFIG_NET and CONFIG_NET_LWIP are mutually
> +         exclusive.
> +
> +endchoice
> +
>  if NET
>
>  config ARP_TIMEOUT
> @@ -254,3 +286,5 @@ config SYS_RX_ETH_BUFFER
>            controllers it is recommended to set this value to 8 or even higher,
>            since all buffers can be full shortly after enabling the interface on
>            high Ethernet traffic.
> +
> +endmenu
>
> --
> 2.53.0
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
