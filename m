Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47314B40E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 13:16:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39295C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 12:16:34 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DBF3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 12:16:31 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 486QZj6ckgz1rlwh;
 Tue, 28 Jan 2020 13:16:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 486QZj5rb3z1qqkG;
 Tue, 28 Jan 2020 13:16:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Jrc8K3OEatlS; Tue, 28 Jan 2020 13:16:28 +0100 (CET)
X-Auth-Info: cb3dijNK0c2ZjNl8+Cu3+eEYAC/rwGWad2Mgn1/rjXE=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Jan 2020 13:16:28 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
Date: Tue, 28 Jan 2020 13:15:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
Content-Language: en-US
Cc: Antonio Borneo <antonio.borneo@st.com>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to
	PLL4_R
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

On 1/28/20 10:11 AM, Patrick Delaunay wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> LTDC modifies the clock frequency to adapt it to the display. Such
> frequency change is not detected by the FDCAN driver that instead
> cache the value at probe and pretend to use it later.
> 
> Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.

Now this looks like a grisly workaround. Can you fix the LTDC driver to
do something sane on boards which didn't update bootloader yet ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
