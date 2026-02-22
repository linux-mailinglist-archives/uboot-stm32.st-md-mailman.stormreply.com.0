Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOLVEpkinGkZ/wMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Feb 2026 10:49:13 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D21742AF
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 Feb 2026 10:49:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A335CC5A4C0;
	Mon, 23 Feb 2026 09:39:37 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38F32C8F275
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Feb 2026 01:27:54 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c626bd75628so1147496a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Feb 2026 17:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771723672; cv=none;
 d=google.com; s=arc-20240605;
 b=b4W1Kc2NjFXT4yZjpfoJkLN7Xl0x9DYqX/lzI7rir7+eaAavc2R52UfcZJ/si0Mwqq
 A0AkCkEm8wkzFVyMcUFTFnhl1ZMJIL/xC1zJR/fHPBveTTW6eDk3kONORzylptrc4jiM
 gHNbKiPxkGERkW1AZjntphkXhPw3I08l/VhrtyGJjSqIrPyhWNS0SOq6P586oZkV0/9b
 K5SMHmMAp665Zbzy7iIvQToMmC/jGTXxkFAOohoP5SjuyYaMSwIW0EpKJlbt/1VMAHO5
 OCV1XymdXxkzMCwoxSnJrfiez8bw/yAOiranHHXtpVad8OHaiZxym0LTdIy2cCRcvO3Z
 wgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PEMywllvHVaWTMrC2cXvALvhk/OHqB0d7CXepK56xh0=;
 fh=XtWX2nmXKo5qYUkKCJELoxYjOroP/F6PaIQK/uZkQTM=;
 b=NXfTXoXg6KazSsHnNLxsq9zNT5mTmy3+8+X8Niwbc+5s5/jlb6NBcFOUC+a/LLMexL
 UaR0FM33vy/5gNaJc5MRYKUwxTIy2nbea2F/cs7AJ/2wEwmxWgqR1n6lGAieEjvZZwIJ
 jUj5lrftQAH8d5bbJwHh/7duzBTKAK+JjsPlWayvvMmgBL5K8pehCoPP4jLu/23HV56L
 rwqOijX/A0vtYp3xDs2JSrtPDpmTjhpIkjGDxaDvWQ0ltWtAdqT3AXly/Pxn2Zxenyo0
 PrSueE89VjxsY82/3f16JcQ8T7OZlPIj113KZ/o+wIyZKYnhTVXZxjLxp3WqUyKByxUv
 MIfA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771723672; x=1772328472;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PEMywllvHVaWTMrC2cXvALvhk/OHqB0d7CXepK56xh0=;
 b=mmZy9dQFPRlSPSw8mUF4K+7k8NN+iS4pHQFrncYLav/MhjsYqlfkW/GX8c8WkkXqqa
 3h6drbnKgmrQUbw/prDw8L07YV2k7FQaXz1jNiLUesQTqT3zcLEvOLKO9kl4+32iEzp6
 cJObcoZVd3GtYxNg0SYw2e2DxD7+PziAk1s68THmoxZiLGxiyJH3mrdaMidajTtzgl5P
 UulHGks3x1WuCvYLoSwUGomO1napDTreTrzlBNkWzkN1eWG5N1SxBpI0v+9bqEd4NqEk
 2CbnhsWngQwf/3pVf0jq8D5upwXhckxAJUiczzHeMwvs7FCMdebOS/ok3OE460MEnzzx
 mzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771723672; x=1772328472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEMywllvHVaWTMrC2cXvALvhk/OHqB0d7CXepK56xh0=;
 b=ig4VzrnKk+hIN+VUdfedYvdb2kbuwMlmTmKY/D0fn75SBaVMVLbifMWQ6tYhT+Y8WL
 BASarOwLruQKpbWzpE+4R6jAp61Wg3Xswg5Y1+fbr11PduOjUCw0ZKfcMmoXj3BHaWpX
 u5VXDAC0RlKGVUQVX23YFn6IPWBhH1DXI4AUuG23kdPkmxSdikTWDAIpFtwNjG3qsFtq
 F7EDAyQbP+pVpOvQkd3RZ0HK2CN28ISM20yp+aG75shgWNv0IfxStCKWL0pp72+OF1+j
 Dl7ktTDhZKr4DEBAAx+Zd0kZI0Euy+7bYTQ6hZSI17E6KZAREHam5im8W91NQscNH2Ra
 QYRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeNtluCMDho5An8HbpwzhGBOYJnqdjFmA3uNKER9loSjeC9scH+goU4LI4OsVHRSHBUoySewc2hd3Srw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzG7dFapBq9WOcGaseZGzc2gNgvtdMtupsl5zgcT+3t1xdMWNpp
 lY8Qg0wXuBo7LEnBungbDd3FSjW0tRkPtS7IJb/qdYtZSUzz+wMqABnaHOQgqsUYimOJ7zJXkFl
 nTeIBJFsT+PP93JnhKcyV8dmim1lm3SA=
X-Gm-Gg: AZuq6aLFRifcbKGrowj2jkSWjnjseBCHu3GEAy91uaoEBGwKAsfzF3UtHR/0ssXbutu
 cX6YdfpPujJoOg/dwOD69m6EZWj8yEdy99cmNWmFh1Z+5rdgVqJtiGRu8SocQRwI7AgBx8yC1MT
 HUfciakwjBBg7s5z68xdTHt6JA4z7InEYE+zFxioDrzkNA+erl9KUFjKzzk7jMGgXNXjRmRdlWI
 OhExf2N/OBz8P4xuM7cijvKoSArKoA/zF3+hMk1l/2dW5JUQ7Ai50epv/N+wRH1z3intzbCRPlR
 pOo1pUw=
X-Received: by 2002:a05:6a20:d527:b0:393:74ed:7dd5 with SMTP id
 adf61e73a8af0-39545f49d08mr3731480637.43.1771723672402; Sat, 21 Feb 2026
 17:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
 <20260203-cleanup-v1-5-4221c13e7558@nxp.com>
In-Reply-To: <20260203-cleanup-v1-5-4221c13e7558@nxp.com>
From: David Zang <davidzangcs@gmail.com>
Date: Sat, 21 Feb 2026 19:27:40 -0600
X-Gm-Features: AaiRm52fDpyyR2JBtvDrL4e_nxNMA9cikGT6QKNd5bMGIHNmFzL5II4XhCoiKzM
Message-ID: <CACwB3C9qsVasyMAq2Fw5Ly8RSuFL-k5xTAAEMP0+EdwWbC7=Zw@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
X-Mailman-Approved-At: Mon, 23 Feb 2026 09:39:36 +0000
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Peng Fan <peng.fan@nxp.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Dillon Min <dillon.minfei@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, u-boot-qcom@groups.io,
 Marco Franchi <marcofrk@gmail.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>, Michal Simek <michal.simek@amd.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Patrick Wildt <patrick@blueri.se>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 =?UTF-8?Q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 adsp-linux@analog.com, David Feng <fenghua@phytium.com.cn>,
 Bryan Brattlof <bb@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, upstream@lists.phytec.de,
 Frieder Schrempf <frieder.schrempf@kontron.de>, u-boot-amlogic@groups.io,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 Ian Roberts <ian.roberts@timesys.com>, Simon Glass <sjg@chromium.org>,
 Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Apurva Nandan <a-nandan@ti.com>, Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>, uboot-snps-arc@synopsys.com,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Joel Stanley <joel@jms.id.au>, Ramon Fried <rfried.dev@gmail.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Francesco Valla <francesco@valla.it>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Sam Day <me@samcday.com>, Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 "Guillaume La Roque \(TI.com\)" <glaroque@baylibre.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Christoph Stoidner <c.stoidner@phytec.de>, Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>, u-boot@dh-electronics.com,
 kernel@puri.sm, Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 05/14] test: log_filter: Include vsprintf.h
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
Content-Type: multipart/mixed; boundary="===============5304808671527182974=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[32];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:francesco.dolcini@toradex.com,m:peng.fan@nxp.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:dillon.minfei@gmail.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:u-boot-qcom@groups.io,m:marcofrk@gmail.com,m:tudor.ambarus@linaro.org,m:n-francis@ti.com,m:michal.simek@amd.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:patrick@blueri.se,m:luka
 s@mntre.com,m:hs@nabladev.com,m:BMC-SW@aspeedtech.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:joe.hershberger@ni.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:adsp-linux@analog.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:u-boot@lists.denx.de,m:uboot-imx@nxp.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:upstream@lists.phytec.de,m:frieder.schrempf@kontron.de,m:u-boot-amlogic@groups.io,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com
 ,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,m:semen.protsenko@linaro.org,m:andrew.goodbody@linaro.org,m:alifer.wsdm@gmail.com,m:utsav.agarwal@analog.com,m:neil.armstrong@linaro.org,m:briansune@gmail.com,m:ycliang@andestech.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[davidzangcs@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_GT_50(0.00)[199];
	NEURAL_HAM(-0.00)[-0.767];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[davidzangcs@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,nxp.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,groups.io,linaro.org,amd.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,socionext.com,phytec.de,blueri.se,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,ni.com,proton.me,googlemail.com,analog.com,phytium.com.cn,posteo.net,lists.denx.de,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,lists.phytec.de,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,foss.arm.com,ew.tq-group.com,cherry.de,konsulko.com,jms.id.au,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,quicinc.com,marvell.com,valla.it,intel.com,ziyao.cc,samcday.com,siemens.com,oss.qualcomm.com,baylibre.com,st-md-mailman.stormreply.com,collabora.com,renesas
 .com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,dh-electronics.com,puri.sm,postmarketos.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,nxp.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: CA8D21742AF
X-Rspamd-Action: no action

--===============5304808671527182974==
Content-Type: multipart/alternative; boundary="000000000000223db9064b5f90d2"

--000000000000223db9064b5f90d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 4:44=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> snprintf is used, need to include vsprintf.h. Otherwise there will
> be build error after asm/global_data.h is removed.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  test/log/log_filter.c | 1 +
>  1 file changed, 1 insertion(+)
>
> Reviewed-by: David Zang <davidzangcs@gmail.com>

David

--000000000000223db9064b5f90d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 3, =
2026 at 4:44=E2=80=AFAM Peng Fan (OSS) &lt;<a href=3D"mailto:peng.fan@oss.n=
xp.com">peng.fan@oss.nxp.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Peng Fan &lt;<a href=3D"mailto:peng.fan@n=
xp.com" target=3D"_blank">peng.fan@nxp.com</a>&gt;<br>
<br>
snprintf is used, need to include vsprintf.h. Otherwise there will<br>
be build error after asm/global_data.h is removed.<br>
<br>
Signed-off-by: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_=
blank">peng.fan@nxp.com</a>&gt;<br>
---<br>
=C2=A0test/log/log_filter.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br><br></blockquote><div><span style=
=3D"color:rgb(85,85,85)">Reviewed-by: David Zang &lt;<a href=3D"mailto:davi=
dzangcs@gmail.com">davidzangcs@gmail.com</a>&gt;</span></div><div><br></div=
><div>David=C2=A0</div></div></div>

--000000000000223db9064b5f90d2--

--===============5304808671527182974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5304808671527182974==--
