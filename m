Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C429D74D8
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 13:23:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EF96C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 11:23:24 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F00AFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 11:23:22 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46stMt2cwzz1rdjF;
 Tue, 15 Oct 2019 13:23:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46stMt1tK7z1qqkM;
 Tue, 15 Oct 2019 13:23:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 0Gj9NobujDuh; Tue, 15 Oct 2019 13:23:21 +0200 (CEST)
X-Auth-Info: YdcG4YKwtdx6OtCuUfKTQrjRcKqhsFfVO1IGMHPnOzU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 15 Oct 2019 13:23:21 +0200 (CEST)
To: Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de
References: <20191015094536.2c5bbb8f@jawa>
From: Marek Vasut <marex@denx.de>
Message-ID: <b17362c5-f4b2-4e5b-360a-0ad026e5ed4d@denx.de>
Date: Tue, 15 Oct 2019 13:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015094536.2c5bbb8f@jawa>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [GIT] Pull request: u-boot-dfu (15.10.2019)
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

On 10/15/19 9:45 AM, Lukasz Majewski wrote:
> Dear Marek,

Hello Lukasz,

> The following changes since commit
> 7a779ed1755c2d5011bd9598da90291f759ae760:
> 
>   travis: Exclude MIPS from the bcm job (2019-10-13 11:21:56 -0400)
> 
> are available in the Git repository at:
> 
>   git@gitlab.denx.de:u-boot/custodians/u-boot-dfu.git 
> 
> for you to fetch changes up to 5d897631065bb2f36bbc1bd7fabb670ce5da3ce8:
> 
>   dfu: add callback for flush and initiated operation (2019-10-14
>   12:26:19 +0200)

Which branch shall I pull ? This information is missing from the PR,
again :-(
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
