Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03ED6C19
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 01:36:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD000C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 23:36:12 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAE56C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 23:36:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sZgv3BGmz1qrK3;
 Tue, 15 Oct 2019 01:36:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sZgv32Wyz1qr9B;
 Tue, 15 Oct 2019 01:36:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id maWMab8L5qhJ; Tue, 15 Oct 2019 01:36:10 +0200 (CEST)
X-Auth-Info: w0tQqSLLp65/uZwm4G06IHvdUgXoRu7c18PVWoYOg30=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 15 Oct 2019 01:36:10 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-5-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <02a76e52-e12d-4fe5-6949-17ed2cfb55f3@denx.de>
Date: Tue, 15 Oct 2019 01:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014080025.11245-5-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 4/5] usb: host: dwc2: add usb33d
 supply support for stm32mp1
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

On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> Enable the usb33d-supply on STM32MP1 SoCs (with "st,stm32mp1-hsotg"
> compatible), it is the external VBUS and ID sensing comparators supply
> needed to perform OTG operation.

I suspect we might need some dwc2-stm32p1.c SoC-specific driver here.
Adding SoC-specific stuff into common driver doesn't sound right.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
