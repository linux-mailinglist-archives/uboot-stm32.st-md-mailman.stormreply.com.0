Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C65C4293099
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Oct 2020 23:36:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E980C424B7;
	Mon, 19 Oct 2020 21:36:23 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC747C3FAE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 21:36:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CFVSM6b3nz1qsjl;
 Mon, 19 Oct 2020 23:36:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CFVSM4lC2z1qrgN;
 Mon, 19 Oct 2020 23:36:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nGYZwR7GI6TZ; Mon, 19 Oct 2020 23:36:18 +0200 (CEST)
X-Auth-Info: 7bgvtiQaoChvDjOzAZa/Qy8l/aHZ2gmrAYW55IEq1gU=
Received: from crub (p508b685f.dip0.t-ipconnect.de [80.139.104.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 19 Oct 2020 23:36:18 +0200 (CEST)
Date: Mon, 19 Oct 2020 23:36:17 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201019233617.5a2c767d@crub>
In-Reply-To: <20200928093017.19053-1-patrick.delaunay@st.com>
References: <20200928093017.19053-1-patrick.delaunay@st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Stefan Roese <sr@denx.de>,
 Adam Ford <aford173@gmail.com>, Olaf Mandel <o.mandel@menlosystems.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] configs: migrate
 CONFIG_VIDEO_BMP_GZIP to defconfigs
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

On Mon, 28 Sep 2020 11:30:14 +0200
Patrick Delaunay patrick.delaunay@st.com wrote:
...
>  23 files changed, 21 insertions(+), 14 deletions(-)

applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
