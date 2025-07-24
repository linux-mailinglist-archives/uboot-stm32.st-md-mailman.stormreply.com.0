Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A7B11325
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Jul 2025 23:30:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 927E2C36B1F;
	Thu, 24 Jul 2025 21:30:35 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DA68C36B18
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 21:30:33 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-30063371404so564069fac.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1753392632; x=1753997432;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZPxVMYbbKVbjD1LnqDvMp6mdQbbSwvqoiCWolQ08/gE=;
 b=seIf2jwaczC8qVRX6UFADO0rmSf5l86RQ5f+V6sSUfYWBDBa7eBYhA2pv8ilnwPVG/
 +d0DoJEsMmSjjGcUkBzG+y8151xJyJFXEOWM951qeU9+VGoOJlVO7wd5ocl+NxfNPqCf
 hobleT9i0aMkDB94CqR3k5g+DI04Tw5b4Fqa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753392632; x=1753997432;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZPxVMYbbKVbjD1LnqDvMp6mdQbbSwvqoiCWolQ08/gE=;
 b=a9Fx/6gKdPAbJwwvpcxCcXfgIsvH4EGbbAgcpO/rjjR3UrqlDEMZrzN+CtceJpyPpc
 ydG+dZCAB1aDC8P3zFoVZXayUp7CirNBxXyMgu5lTj1iP40bq1iA7LKcd0tkdZ1NVVKG
 UocJxAulKUnJStYy1xeN8mB5i3gWvog1KwkAO0KET/rkRFBDONlWoCsUVgb+524FOC9q
 DESi2YP4ZoOOgP2uBVmSjdCYDnS97gSQb5jL0Z5UGxL2LXutwVWAP/XYdj8Mcimu9cAv
 L0y1nOsX0Nz49exVtmaJ4y7tmgHzmZho+qgJAKrPw9cax+yMUiCQc+gYrkYbe1wI+I0A
 XKRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjEO7Y4u3CA4p79emkmXLabecbIWfUvN3Xafs82aTdysyxUuLw27btKIY6GSYWjheO1tGicLzO6ML5Zg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YziV57MaEWv1APcSXVm2stQF8vqv+A57sTy1Q2edAwwOplNJdIA
 IPweMh8BiTNNHs6/9I225USDDZby50JYFWkvMv3y20n9/zMQuR0V86gxjWUZBbMaa+k=
X-Gm-Gg: ASbGnctxKGKCCAxat6+E9MqRYWKWysegSHBXwCj/vfaEjGMV3NbIPaBqMVMm1tqPHse
 AKhQfUZAqbEcFvQxXHHuJbAMD+7zL9fEL583k4iF4U8z+ektOexOojI8Yv0fqWl65tJJCMA2XiL
 i4/QkfmuXEi/eqQIfTxlW4e52BO59XVz24aR1VxSdEWKy9QWDyaMZ/84knB+wG8q8XxqHC/SPUA
 7M3ROEl/Sugb41c9pvAs0CTPFBVTSPoPoQt7CyVnyp86IZVICmdWEjCgj5JDits472xdkc18L/x
 39dQZVz0drVwjoS1YEE8A35KQE55PaNQ3gxou3vvhsCaVLV3oIiB1GoP8pfKa8ydhnjbVojJ2UM
 5ZefxVmN2Hdez2EB2sPKKU/s3jt6BUivVCFER0UzGFlNnIafbnP90ng0=
X-Google-Smtp-Source: AGHT+IG0FY2EDvYGbb64jrHdiWUQWKS88Y8wn2wbX8Iy1WYMr5QZ7j5xiKwzKDoUxQj8GpweL8iRng==
X-Received: by 2002:a05:6870:6f0c:b0:303:5cb:4296 with SMTP id
 586e51a60fabf-306c728975emr6224526fac.30.1753392632210; 
 Thu, 24 Jul 2025 14:30:32 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-306e1f8a7adsm660520fac.42.2025.07.24.14.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 14:30:31 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Sam Protsenko <semen.protsenko@linaro.org>
In-Reply-To: <20250717024426.26953-1-semen.protsenko@linaro.org>
References: <20250717024426.26953-1-semen.protsenko@linaro.org>
Message-Id: <175339262777.1899261.14751318047956466864.b4-ty@konsulko.com>
Date: Thu, 24 Jul 2025 15:30:27 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Nishanth Menon <nm@ti.com>, Kursad Oney <kursad.oney@broadcom.com>,
 Peng Fan <peng.fan@nxp.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Jim Liu <JJLIU0@nuvoton.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Sean Anderson <seanga2@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 liuhao <liuhao@phytium.com.cn>, Jan Kiszka <jan.kiszka@siemens.com>,
 Garrett Giordano <ggiordano@phytec.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Marek Vasut <marex@denx.de>, weichangzheng <weichangzheng@phytium.com.cn>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 u-boot@lists.denx.de, Adam Ford <aford173@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>,
 Michal Simek <michal.simek@amd.com>, Ben Horgan <ben.horgan@arm.com>,
 Sam Shih <sam.shih@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Julien Masson <jmasson@baylibre.com>,
 Stanley Chu <yschu@nuvoton.com>, Anand Gore <anand.gore@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>, Eric Nelson <eric@nelint.com>,
 Paul Barker <paul@pbarker.dev>, u-boot@dh-electronics.com,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>, lixinde <lixinde@phytium.com.cn>,
 Huan Zhou <pericycle.cc@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 shuyiqi <shuyiqi@phytium.com.cn>, Apurva Nandan <a-nandan@ti.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Wadim Egorov <w.egorov@phytec.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabien Parent <fparent@baylibre.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 Simon Glass <sjg@chromium.org>, Gilles Talis <gilles.talis@gmail.com>,
 u-boot-amlogic@groups.io, Manorit Chawdhry <m-chawdhry@ti.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Bryan Brattlof <bb@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Remove empty board_init()
 function from all boards
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

On Wed, 16 Jul 2025 21:44:26 -0500, Sam Protsenko wrote:

> Commit 86acdce2ba88 ("common: add config for board_init() call")
> introduced CONFIG_BOARD_INIT option. This option can be disabled for the
> boards where board_init() function is not needed. Remove empty
> board_init() calls for all boards where it's possible, and disable
> CONFIG_BOARD_INIT in all related defconfigs.
> 
> This cleanup was made semi-automatically using these scripts: [1].
> 
> [...]

Applied to u-boot/master, thanks!

[1/1] treewide: Remove empty board_init() function from all boards
      commit: 70a4d1fa1ddb2f5f8f9a27442563f182549abbb5
-- 
Tom


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
