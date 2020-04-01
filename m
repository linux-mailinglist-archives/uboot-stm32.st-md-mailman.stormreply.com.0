Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A219AB00
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:43:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B28FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 11:43:32 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47F74C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:43:31 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48skq654wjz1qrLt;
 Wed,  1 Apr 2020 13:43:30 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48skq64lChz1r0cS;
 Wed,  1 Apr 2020 13:43:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id TmxdpH-UTCp3; Wed,  1 Apr 2020 13:43:29 +0200 (CEST)
X-Auth-Info: phEImCJec77kw/TSLw2TlWKF4WbIN3uoKjNcdixNGdA=
Received: from crub (pD95F11D0.dip0.t-ipconnect.de [217.95.17.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 13:43:29 +0200 (CEST)
Date: Wed, 1 Apr 2020 13:43:28 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200401134328.06324355@crub>
In-Reply-To: <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/16] board: stm32mp1: update management
	of boot-led
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

On Tue, 31 Mar 2020 18:04:25 +0200
Patrick Delaunay patrick.delaunay@st.com wrote:
...
> @@ -648,8 +652,10 @@ int board_init(void)
>  
>  	sysconf_init();
>  
> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
> +	if (CONFIG_IS_ENABLED(CONFIG_LED)) {
>  		led_default_state();

Did you verify that this works like expected? We either use
	if (CONFIG_IS_ENABLED(LED))
or
	if (IS_ENABLED(CONFIG_LED))

Please check.

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
