Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F778A67F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Apr 2024 12:14:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E21C6B47E;
	Tue, 16 Apr 2024 10:14:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11077C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 10:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 115C0CE01B7;
 Tue, 16 Apr 2024 10:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDAEC32781;
 Tue, 16 Apr 2024 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713262472;
 bh=ujW8DqFcTlwhrOGCXDWncEn2W+NVuTOeHJlK6znXb6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZenL25HEVT9iaJsI4qTvmz9U/fIaylBtb090zrxTR/ifEW9/B+UtXYmXEN7MQOdai
 NxuqHbufqWPAUI/ZD10nVQTbQpbplBxCpFpXQwBv7oEnPwE28BUoN9Z+y5EyfbN0wi
 KS5WCFlSpqpBKolfpVcWV8FcuxycFK9QlHicb0zQOEBC10Gm1Jq9V9LIEPN1OWSKPz
 aNFcUY0z3HJklGcz2nCxfDcdVJ0XwYzlfV8vQHpirf8BuMYY648BhNygsT/Kg2Z6am
 0Ax2qbFjN+TlQkvc0P2h63RmQOzLtyLNUw6otPeu+2PrI6esaU9o6mnQE1+4A0kjED
 FRNpR8Rm5I+yQ==
Date: Tue, 16 Apr 2024 12:14:19 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Message-ID: <20240416121419.58ec6def@dellmb>
In-Reply-To: <abe7e535b9e4ee13cea1e6d1c37c8f1f6e6014e3.1713250508.git.michal.simek@amd.com>
References: <cover.1713250508.git.michal.simek@amd.com>
 <abe7e535b9e4ee13cea1e6d1c37c8f1f6e6014e3.1713250508.git.michal.simek@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 "moderated list:ST BOARDS" <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Aaron Williams <awilliams@marvell.com>, Viacheslav Bocharov <adeep@lexina.in>,
 Stefan Roese <sr@denx.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Lukasz Majewski <lukma@denx.de>,
 Shiji Yang <yangshiji66@outlook.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Doug Zobel <douglas.zobel@climate.com>, Stefano Babic <sbabic@denx.de>,
 Heiko Schocher <hs@denx.de>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 =?UTF-8?B?UGF3ZcWC?= Jarosz <paweljarosz3691@gmail.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Tom Rini <trini@konsulko.com>,
 Enrico Leto <enrico.leto@siemens.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Philip Oberfichtner <pro@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, git@xilinx.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Johan Jonker <jbx6244@gmail.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Anatolij Gustschin <agust@denx.de>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "open list:VIM3" <u-boot-amlogic@groups.io>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Matthias Winker <matthias.winker@de.bosch.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] common: Convert *.c/h from UTF-8
 to ASCII enconfing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

QWNrZWQtYnk6IE1hcmVrIEJlaMO6biA8a2FiZWxAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
