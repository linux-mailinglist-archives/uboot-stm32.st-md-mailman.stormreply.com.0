Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8129309F
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Oct 2020 23:37:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 731A1C424B8;
	Mon, 19 Oct 2020 21:37:47 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AA1FC424B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 21:37:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CFVV24WX3z1qrg9;
 Mon, 19 Oct 2020 23:37:46 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CFVV21bptz1qrgN;
 Mon, 19 Oct 2020 23:37:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ATRy9BkLkEMh; Mon, 19 Oct 2020 23:37:43 +0200 (CEST)
X-Auth-Info: Hazvf+lWtSjbsZ9XSThYJgoJfD1QLayb4Hm1WQ3LNY0=
Received: from crub (p508b685f.dip0.t-ipconnect.de [80.139.104.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 19 Oct 2020 23:37:43 +0200 (CEST)
Date: Mon, 19 Oct 2020 23:37:43 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201019233743.66ddb694@crub>
In-Reply-To: <20200928093017.19053-3-patrick.delaunay@st.com>
References: <20200928093017.19053-1-patrick.delaunay@st.com>
 <20200928093017.19053-3-patrick.delaunay@st.com>
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Alonso <adrian.alonso@nxp.com>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe
 Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>,
 Stefan Roese <sr@denx.de>, Simon
 Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Vikas Manocha <vikas.manocha@st.com>, Otavio
 Salvador <otavio@ossystems.com.br>, Ashok Reddy
 Soma <ashok.reddy.soma@xilinx.com>, Troy Kisky <troy.kisky@boundarydevices.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] configs: migrate
 CONFIG_BMP_16/24/32BPP to defconfigs
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

On Mon, 28 Sep 2020 11:30:16 +0200
Patrick Delaunay patrick.delaunay@st.com wrote:
...
>  103 files changed, 122 insertions(+), 63 deletions(-)

applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
