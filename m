Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56787EAEF9
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 12:32:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F30FCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 11:32:48 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C135C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 11:32:47 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 473jqD4Ns9z1rbLm;
 Thu, 31 Oct 2019 12:32:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 473jqD3gt7z1qqkB;
 Thu, 31 Oct 2019 12:32:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ZM8J8vasTjA6; Thu, 31 Oct 2019 12:32:38 +0100 (CET)
X-Auth-Info: r337Wa9d+Rlpyss3xX7tfMhSDe0pWis1yikFPEi/IwQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 31 Oct 2019 12:32:38 +0100 (CET)
To: Lukasz Majewski <lukma@denx.de>
References: <20191015094536.2c5bbb8f@jawa>
 <b17362c5-f4b2-4e5b-360a-0ad026e5ed4d@denx.de> <20191015140307.3940831d@jawa>
 <20191028175144.5718cd05@jawa> <96c77fb2-95dc-f76d-9f77-4576fc1a658f@denx.de>
 <20191029001654.3166065a@jawa> <20191030175216.02c05835@jawa>
From: Marek Vasut <marex@denx.de>
Message-ID: <0dd4e19d-4fb7-14f4-7ec5-aad3ec6ae2e5@denx.de>
Date: Thu, 31 Oct 2019 12:16:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030175216.02c05835@jawa>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [GIT] Pull request: u-boot-dfu (30.10.2019)
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

On 10/30/19 5:52 PM, Lukasz Majewski wrote:
> Hi Marek,
> 
> The following changes since commit
> 7f0d5fa97074690dcbfcbc902f99c8dab0bff24d:
> 
>   dwc3-generic: Don't fail probe if clk/reset entries are absent
>   (2019-10-28 23:47:45 +0100)
> 
> are available in the Git repository at:
> 
>   git@gitlab.denx.de:u-boot/custodians/u-boot-dfu.git 
> 
> BRANCH: master
> https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/commits/master

Pulled, thanks.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
