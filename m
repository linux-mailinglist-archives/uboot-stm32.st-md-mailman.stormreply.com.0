Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD629309D
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Oct 2020 23:37:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 675BDC424B8;
	Mon, 19 Oct 2020 21:37:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C20F6C424B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 21:37:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CFVTM6YD6z1qsjl;
 Mon, 19 Oct 2020 23:37:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CFVTC6tBQz1qrgN;
 Mon, 19 Oct 2020 23:37:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 48dCa3laGkDP; Mon, 19 Oct 2020 23:37:01 +0200 (CEST)
X-Auth-Info: kNJnC078tqECz6E57F/IZlbCDWUmDt3TT864V2eSj+I=
Received: from crub (p508b685f.dip0.t-ipconnect.de [80.139.104.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 19 Oct 2020 23:37:01 +0200 (CEST)
Date: Mon, 19 Oct 2020 23:37:00 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201019233700.59882265@crub>
In-Reply-To: <20200928093017.19053-2-patrick.delaunay@st.com>
References: <20200928093017.19053-1-patrick.delaunay@st.com>
 <20200928093017.19053-2-patrick.delaunay@st.com>
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Nikita Kiryanov <nikita@compulab.co.il>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Soeren Moch <smoch@web.de>,
 Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, u-boot-amlogic@groups.io,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Ashok Reddy
 Soma <ashok.reddy.soma@xilinx.com>, Troy Kisky <troy.kisky@boundarydevices.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>, Fabio Estevam <fabio.estevam@nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] configs: migrate
 CONFIG_VIDEO_BMP_RLE8 to defconfigs
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

On Mon, 28 Sep 2020 11:30:15 +0200
Patrick Delaunay patrick.delaunay@st.com wrote:
...
>  119 files changed, 88 insertions(+), 43 deletions(-)

applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
