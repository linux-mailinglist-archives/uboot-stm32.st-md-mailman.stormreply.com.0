Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB138AD4F2
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 21:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E408C7128B;
	Mon, 22 Apr 2024 19:36:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F38CCC6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 19:36:09 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4375ddb9eaeso28731261cf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 12:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1713814569; x=1714419369;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L21Ma6lwh0kQWeK64WUAdv5y8b5n+0KVnewRokhfak8=;
 b=YSXVfsyv0n/2NuizsUSHcqqWowHp9+6RdH+D4ebD68O+aFOYKt+7Ugj3pPDAzTObdc
 2FT2JRWbFNVtnSTyu6KDqcFJEZvqAvcan4ez775bgjgOztZiPOYh7OCUJHXgTYLA1R71
 a7x+B0Rw02oePgpfsFQKLwGuEWizn+NywrMBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713814569; x=1714419369;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L21Ma6lwh0kQWeK64WUAdv5y8b5n+0KVnewRokhfak8=;
 b=cGKWackxsPyAfPWL+ThJ97IGhNTAYXMffuhOv+64C/alg2iFc9Exfy6I91PRGaOZ1N
 ryHucfz14Ps8QJqGhcAmekuw8rP1vVH/nOnG6ut7ip78RSoYw0p7dqHmgwbfAbQuRkRy
 vSlpQET1Yhn6MY6kBqWG3HL15MXY0ymR4omX7ZXJ/dQGf/M8J/uz4FWrdDnDwyFu3oIp
 EChWKVF1nh1v5XI8vqILv93WdgUe2DMd/iTFUdstwUvDMTgdw6nDvJBmA9nmIgTgVZ9r
 16mr7WTnnIiliXB/76XbCGR3Xp9NJuRNLIuv1j6zsTjZ2SmfdEzzProJu26Uk5/9iCft
 XJ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoP0E2ClvecnOBFtkPt91PVuvdS2G8CkErJSI4f1Gwn+d0tN1pgPEIp0LbTzLQYGpbrwH9Fz6U6B1jDHLmCMsd994gPw4PUU92qUic7Ejw8w9D7d1/kUgB
X-Gm-Message-State: AOJu0YzVU23AV0XIfNWR8X2+knsrffMoDBt1AP9Hchgy6U+WPkU5MrN1
 fyoyk8hSab8baVf2Lrkdtagmqu8464+muP5LhyHVFifojYvOV5IWpFoXm4cTtgo=
X-Google-Smtp-Source: AGHT+IGjga4KZKogIyZM1p0irH2LmXlKumpkIhr3LkiiUBMFN9CN5JkF/ZXsUs9LfKSlBuFF6LNkCQ==
X-Received: by 2002:ac8:7d05:0:b0:435:2351:75c6 with SMTP id
 g5-20020ac87d05000000b00435235175c6mr14232949qtb.46.1713814568681; 
 Mon, 22 Apr 2024 12:36:08 -0700 (PDT)
Received: from [127.0.1.1] ([187.144.98.216]) by smtp.gmail.com with ESMTPSA id
 kk3-20020a05622a2c0300b00436b2135b51sm4492448qtb.64.2024.04.22.12.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 12:36:08 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, git@xilinx.com, Michal Simek <michal.simek@amd.com>
In-Reply-To: <cover.1713250508.git.michal.simek@amd.com>
References: <cover.1713250508.git.michal.simek@amd.com>
Message-Id: <171381456119.1909236.8049238331801273262.b4-ty@konsulko.com>
Date: Mon, 22 Apr 2024 13:36:01 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Sean Anderson <seanga2@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Tim Lunn <tim@feathertop.org>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 "moderated list:ST BOARDS" <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Vignesh R <vigneshr@ti.com>, =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Aaron Williams <awilliams@marvell.com>, Viacheslav Bocharov <adeep@lexina.in>,
 Stefan Roese <sr@denx.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Bin Meng <bmeng@tinylab.org>,
 Lukasz Majewski <lukma@denx.de>, Eddie James <eajames@linux.ibm.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Doug Zobel <douglas.zobel@climate.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>, Stefano Babic <sbabic@denx.de>,
 Peter Robinson <pbrobinson@gmail.com>, Sean Edmond <seanedmond@microsoft.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, John Clark <inindev@gmail.com>,
 =?utf-8?q?Pawe=C5=82_Jarosz?= <paweljarosz3691@gmail.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Jonas Karlman <jonas@kwiboo.se>,
 Enrico Leto <enrico.leto@siemens.com>, Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Philip Oberfichtner <pro@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Jagan Teki <jagan@edgeble.ai>,
 Elon Zhang <zhangzj@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Matthias Winker <matthias.winker@de.bosch.com>, Heiko Schocher <hs@denx.de>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Johan Jonker <jbx6244@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Joshua Riek <jjriek@verizon.net>, Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Shiji Yang <yangshiji66@outlook.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "open list:VIM3" <u-boot-amlogic@groups.io>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Manorit Chawdhry <m-chawdhry@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/5] Kconfig: some cleanups
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

On Tue, 16 Apr 2024 08:55:14 +0200, Michal Simek wrote:

> I looked as cleaning up some dependencies and I found that qconfig is
> reporting some issues. This series is fixing some of them. But there are
> still some other pending. That's why please go and fix them if they are
> related to your board.
> 
> UTF-8: I am using uni2ascii -B < file to do conversion. When you run it in
> a loop you will find some other issue with copyright chars or some issues
> in files taken from the Linux kernel like DTs. They should be likely fixed
> in the kernel first.
> Based on discussion I am ignoring names too.
> 
> [...]

Applied to u-boot/master, thanks!

-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
