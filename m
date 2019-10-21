Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8CDF1DC
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 17:44:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0B1BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 15:44:39 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF130C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 15:44:37 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46xgtW38MNz1rTYt;
 Mon, 21 Oct 2019 17:44:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46xgtW2SS7z1qqkH;
 Mon, 21 Oct 2019 17:44:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Gw5Gthw6Alnn; Mon, 21 Oct 2019 17:44:33 +0200 (CEST)
X-Auth-Info: XXwU1764NERCmS97pTWinyqy9Z70EN44z+M3K53gOAU=
Received: from crub (p54833695.dip0.t-ipconnect.de [84.131.54.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 21 Oct 2019 17:44:33 +0200 (CEST)
Date: Mon, 21 Oct 2019 17:44:27 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>, <u-boot@lists.denx.de>
Message-ID: <20191021174427.712581c7@crub>
In-Reply-To: <20191021130754.32466-1-patrick.delaunay@st.com>
References: <20191021130754.32466-1-patrick.delaunay@st.com>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Chris Packham <judge.packham@gmail.com>,
 David Wu <david.wu@rock-chips.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] pinctrl: Kconfig: remove
	duplicated nodes
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

Hi Patrick,

On Mon, 21 Oct 2019 15:07:54 +0200
Patrick Delaunay patrick.delaunay@st.com wrote:

> Remove the duplicated configs introduced when the same patch is
> applied twice times:

There is already a patch pending http://patchwork.ozlabs.org/patch/1179889

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
