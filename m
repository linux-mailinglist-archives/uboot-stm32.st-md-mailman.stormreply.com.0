Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C970F5019
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 16:46:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C767DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 15:46:17 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0ED9C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 15:46:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 478l484rnQz1qqxp;
 Fri,  8 Nov 2019 16:46:16 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 478l483zHMz1qqkJ;
 Fri,  8 Nov 2019 16:46:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bC9cpigokQG6; Fri,  8 Nov 2019 16:46:15 +0100 (CET)
X-Auth-Info: J3PEZhwQEr/XBtv34a5LZTPbe2geycuBLalgcp6KmjY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  8 Nov 2019 16:46:15 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20191108144716.23829-1-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
Date: Fri, 8 Nov 2019 16:43:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108144716.23829-1-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Bin Meng <bmeng.cn@gmail.com>, simon.k.r.goldschmidt@gmail.com, "Tan,
 Ley Foon" <ley.foon.tan@intel.com>, b.galvani@gmail.com,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v2 0/4] usb: host: dwc2: use driver model
 for PHY and CLOCK
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

On 11/8/19 3:47 PM, Patrick Delaunay wrote:
> 
> In this serie I update the DWC2 host driver to use the device tree
> information and the associated PHY and CLOCK drivers when they are
> available.

I'm kinda on the fence whether to add it into current release or not.
The patches look generally OK to me.

Ley, Simon, can you check this on SoCFPGA ?
Bin, can you give it a once-over ?

If this looks OK to you, I will add it.

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
